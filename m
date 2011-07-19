Date: Tue, 19 Jul 2011 08:48:02 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
Message-ID: <20110719064802.GA5788@parrot.com>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718145635.GA24419@parrot.com>
	<20005.7506.283476.184839@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20005.7506.283476.184839@ipc1.ka-ro>
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

On Tue, Jul 19, 2011 at 06:59:46AM +0100, Lothar Waßmann wrote:
> I'm writing a JFFS2 image file that is padded with 0xff to eraseblock
> size to flash (either from the bootloader or with the nandwrite
> utility from Linux).
> When mounting the filesystem everything is OK until the first file is
> being written. A subsequent read of the affected flash page gives ECC
> errors.
> 
> JFFS2 is giving out the first all-FF page in the last used block for
> creating the new file. Since that block has a non-FF ECC pattern, the
> ECC information is being corrupted on write.

OK, thanks for the clarification. So the problem only happens on partially
programmed blocks in the JFFS2 image, that end up fully programmed on the
device because of the 0xff padding.

I think the cleaner solution is to use a non-padded image and avoid programming
pages with 0xff in the last used block; programming nand pages multiple times
should be avoided if possible, as it is not supported on all (especially the
most recent) devices.

BR,

--
Ivan
