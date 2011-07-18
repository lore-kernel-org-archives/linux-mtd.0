Date: Mon, 18 Jul 2011 16:56:44 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
Message-ID: <20110718145635.GA24419@parrot.com>
References: <20004.12663.29494.339601@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20004.12663.29494.339601@ipc1.ka-ro>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shawn Guo <shawn.guo@freescale.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 18, 2011 at 02:13:27PM +0100, Lothar Waßmann wrote:
> Hi,
> 
> with the gpmi-nfc driver for imx28 from Shawn Guo on a TX28 I
> encountered some problems with jffs2 when overwriting pages that have
> been written with 0xff (e.g. from padding from the file system image
> file).
> 
> The problem is that the ECC info for an all-0xff block is not all-0xff
> and thus a newly erased block is different from a block that has been
> written with 0xff.
> If such a block is being altered (jffs2 thinking it can simply
> overwrite it without erasing first) the ECC information will be
> corrupted and will produce ECC errors upon read.

Hello Lothar,

Can you describe more precisely what is happening ? How did you come to the
conclusion that JFFS2 "thinks it can simply overwrite a block without erasing it
first" ?

JFFS2 normally marks a block as clean just after it has erased it; it won't
blindly assume a block is erased and write to it.

I am not very familiar with how JFFS2 metadata work, but I doubt it would
confuse a blank page with a page containing a piece of file with 0xff bytes.

Are you sure your gpmi-nfc driver is not writing ECC info when JFFS2 writes its
cleanmarker, like in the issue previously discussed in
http://lists.infradead.org/pipermail/linux-mtd/2011-June/036538.html ?

BR,

Ivan
