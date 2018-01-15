Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eb1fD-0007WN-ET
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 10:06:49 +0000
Date: Mon, 15 Jan 2018 11:06:26 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 richard@nod.at, bpringle@sympatico.ca, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v2] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180115110626.512ade88@bbrezillon>
In-Reply-To: <20180114220012.30039-1-stefan@agner.ch>
References: <20180114220012.30039-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

On Sun, 14 Jan 2018 23:00:12 +0100
Stefan Agner <stefan@agner.ch> wrote:

> This reworks the driver to make use of ->exec_op() callback. The
> command sequencer of the VF610 NFC aligns well with the new ops
> interface.
> 
> The ops are translated to a NFC command code while filling the
> necessary registers. Instead of using the special status and
> read id command codes (which require the status/id form special
> registers) the driver now uses the main data buffer for all
> commands. This simplifies the driver as no special casing is
> needed.
> 
> For control data (status byte, id bytes and parameter page) the
> driver needs to reverse byte order for little endian CPUs since
> the controller seems to store the bytes in big endian order in
> the data buffer.
> 
> The current state seems to pass MTD tests on a Colibri VF61.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Hi,
> 
> In this second version I was able to remove all special command
> handling. As Boris suggested, the special READID/STATUS handling
> is really not needed and all return values can be read from the
> regular data buffer. This simplified code even more and allowed
> to get rid of the hack in the MTD core. The driver is now able
> to handle all commands in a single function. Therefor I also got
> rid of the command parser, since everything is handled in a single
> function anyway.

Hm, I'm not sure getting rid of the generic command parser is a good
move. AFAICT, your controller has constraints of the command order and
you'll have to add tests that are already handled by the generic parser
(example, CMD+ADDR+CMD+WAITRB+DATA_OUT is not supported).

Another reason is the internal buffer SIZE limitation (2k IIUC), which
means, if the core requests more than 2k in one go, you'll have to
split the request in several operations. The generic operation parser
can do that for you.

> 
> The only thing which is somewhat unfortunate is the byte ordering
> which needs to be reversed for commands which read flash data (id,
> status and parameter page). All those request 8-bit handling, so
> I used this as an indicator to fix byte order.

Actually, I think the faulty part is the write/read page handling which
is doing things in the wrong endianness, but that's not something you
can change. I have one solution for this problem: don't use the generic
helpers for the read/write page hooks, and always swap bytes in the
->exec_op() path.

Note that "8-bit vs non-8-bit" approach is not such a good idea,
because the core might want to read OTP area of the NAND (programmed by
the vendor) using non-8-bit mode.

> 
> I did meassured a slight performance drop (before vs. now):
> - write speed is 4036 KiB/s vs 3495 KiB/s
> - read speed is 13741 KiB/s vs 13490 KiB/s

I still need to take a closer look at the code, but it might be a good
idea to bypass the ->exec_op() logic in your
ecc->[read,write]_page[_raw] handlers and optimize this path.

I'll try to have a look at the diff, but it's a bit hard to review
because of the unrelated interleaved removed/added lines.

Thanks,

Boris
