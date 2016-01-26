Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNxIA-0003KI-9I
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 06:39:55 +0000
Date: Tue, 26 Jan 2016 07:39:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Huang Shijie
 <shijie.huang@arm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: mtd: gpmi: issue with raw access support
Message-ID: <20160126073929.3f370c46@bbrezillon>
In-Reply-To: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
References: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
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

Hi,

On Mon, 25 Jan 2016 15:53:23 -0600
Han Xu <xhnjupt@gmail.com> wrote:

> Hi Boris,
> 
> There is an issue on Kernel 4.1 with your gpmi raw access support
> patch. I can understand with your implementation all data are stored
> in BCH layout, even without HW ECC. But for NAND boot function on i.MX
> family, it requires to write BOOT CONFIGURATION DATA at the beginning
> of NAND chip, so ROM code could understand how to configure BCH
> register to read data with proper ECC handling.
> 
> All these BOOT CONFIURATION DATA must be written with proper ROM
> defined format, including data layout, parity checking algorithm( NOT
> BCH ECC for some platforms). A user-space tool, named kobs-ng was
> provided to generate all necessary data, and it called the mtd raw
> functions to write the UNFORMATTED data to NAND chip.

Yes, I had the same problem, actually I made 2 patches for kobs-ng
(I'll send them in reply to this email), but since the project seemed to
be unmaintained, I didn't submit it.

> 
> With the new patch, all NAND boot function on kernel 4.1 failed since
> ROM couldn't read the proper configuration. To solve the issue, I am
> planning to export a switch in debugfs to let the user applications to
> choose raw access mode, unformatted mode or BCH layout one, while I
> got stuck.

Hm, providing two different set of raw access functions is a bad idea
IMO. If we had a per-partition configuration infrastructure that could
be done, but so far we don't have that.

> 
> The problem is how could I dynamically change the raw functions from
> the new ones you provided to the default ones in nand_base. It more or
> less a hacking either getting the pointer of functions
> nand_read_page_raw /nand_write_page_raw or copy-pasting the implement
> of these two functions to gpmi layer. So I was wondering if you have
> any better idea for this issue? Thanks.

I recommend to patch kobs-ng, and let him reorganize the data to make
the ROM firmware happy. That's what I did in my patches, but IIRC, I
only took the "aligned ECC bytes" case into consideration, and this is
not necessarily true depending on the ECC config, so you'll have to
rework my patches to address that.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
