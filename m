Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYoE5-00048Y-HX
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 23:49:54 +0000
Received: by wwf22 with SMTP id 22so1769269wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 16:49:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
	<0A40042D85E7C84DB443060EC44B3FD32A7208F91A@dekaexchange07.deka.local>
	<F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
Date: Mon, 20 Jun 2011 16:49:03 -0700
Message-ID: <BANLkTimZ+dWWkSwKf=Y+TdOe80hALCd0uw@mail.gmail.com>
Subject: Re: NAND OOB data.
From: Brian Norris <computersforpeace@gmail.com>
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 20, 2011 at 10:53 AM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wr=
ote:
> Okay, so how do I (without the luxury of u-boot), in user or
> kernel space, wipe the OOB data? =A0I'm looking at the code for
> u-boot nand_erase_nand right now. =A0I mean, I'm not above writing
> an userspace app that will do kernel level work for me. =A0I'm okay
> with using /dev/mem and screwing with stuff. =A0Am I on the right
> track? =A0I mean, I hate to go down this road if I'm just heading
> for a dead-end.

Well, it's hack-ish, but the easiest way I've found is just to
(temporarily) remove this piece of code from nand_erase_nand():
                /*
                 * heck if we have a bad block, we do not erase bad blocks =
!
                 */
                if (nand_block_checkbad(mtd, ((loff_t) page) <<
                                        chip->page_shift, 0, allowbbt)) {
                        printk(KERN_WARNING "%s: attempt to erase a bad blo=
ck "
                                        "at page 0x%08x\n", __func__, page)=
;
                        instr->state =3D MTD_ERASE_FAILED;
                        goto erase_exit;
                }

Then you can trick the MTD layer into erasing your bad blocks. Be sure
to undo this code change after you've erased the chip!

Brian
