Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwrE3-0002SG-BW
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2004 23:16:59 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HTR000TYNBOVM@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 28 Feb 2004 00:16:36 +0100 (MET)
Date: Sat, 28 Feb 2004 00:14:25 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <9961BDB14162AA47A39FF91932F1AE440ADF54@fcexmb01.efi.internal>
To: Ranjan Parthasarathy <Ranjan.Parthasarathy@efi.com>,
 linux-mtd@lists.infradead.org
Message-id: <200402280014.25433.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <9961BDB14162AA47A39FF91932F1AE440ADF54@fcexmb01.efi.internal>
Subject: Re: JFFS2 on Nand
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 February 2004 23:21, Ranjan Parthasarathy wrote:
> Hi
>
> How do I make a JFFS2 image for a NAND device with the OOB data included in
> the image. I have the new mkfs.jffs2 and related utils from cvs.
>
> Currently when I run
> # nandwrite -j -o /dev/mtd/1 jffs2.img
> I get the following message-
> Input file is not page aligned: Success

Input files should be page aligned, as NAND should be written with full page 
writes only. So the utility notifies you, if the image is not page aligned. 
This will result in some uncritical warning messages, if you mount the 
partition.

> The jffs2.img was created using mkfs.jffs2 -r <root> -o jffs2.img

Try:

mkfs.jffs2 -r <root> -e <erasesize> -p <erasesize> -n  -o jffs2.img

where <erasesize> is the blocksize of your NAND chip

-n disables cleanmarker insertion at the beginning of each block, as the 
cleanmarkers are stored in the oob area

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
