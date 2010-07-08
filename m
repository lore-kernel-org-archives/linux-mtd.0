Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWsOV-0002mZ-Sz
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 14:48:08 +0000
From: Eric Millbrandt <emillbrandt@dekaresearch.com>
To: 'Sean Preston' <seanp@pfk.co.za>, Linux-MTD List
	<linux-mtd@lists.infradead.org>
Date: Thu, 8 Jul 2010 10:49:51 -0400
Subject: RE: New NAND Help
Message-ID: <0A40042D85E7C84DB443060EC44B3FD325405DE5AE@dekaexchange07.deka.local>
References: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>
In-Reply-To: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Sean Preston
> Sent: Thursday, July 08, 2010 08:47
> To: Linux-MTD List
> Subject: New NAND Help
>
<snip>
>
> Looking at the drivers/mtd/nand section of the tree I have added the new
> chip ID to nand_ids.c  There already appears to be support for 4096 page
> sizes and 512K block sizes.  What else would I need to check to ensure
> that
> the kernel is able to probe this chip and load the driver needed for it.
> The driver currently being loaded is the davinci_nand driver.  I have
> managed to get this chip working with uBoot which uses a modified version
> of
> the MTD driver.
>
I found that some of the newer Micron nand chips don't store information ab=
out the chip layout in the id block anymore.  It's all been moved to the pa=
rameter page.  nand_get_flash_type(), in nand_base.c, relies on that data t=
o correctly describe the chip layout, so you may need to hardcode the pages=
ize and eraseblock size in the nand_flash_ids table.

Take a look at the READ ID operation section in the micron datasheet to see=
 if the relevant data is still exists, otherwise you need to hardcode those=
 values.

Eric

-DISCLAIMER: an automatically appended disclaimer may follow. By posting-
-to a public e-mail mailing list I hereby grant permission to distribute-
-and copy this message.-

> Regards
> Sean
>
> --
> Sean Preston
> Email: seanp@pfk.co.za
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
