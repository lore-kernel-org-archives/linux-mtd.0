Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NJbrB-0000rv-5f
	for linux-mtd@lists.infradead.org; Sat, 12 Dec 2009 23:58:42 +0000
Received: by ewy21 with SMTP id 21so547672ewy.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 12 Dec 2009 15:58:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <80y6mg5e34.fsf@merkur.tec.linutronix.de>
References: <804opb7d2y.fsf@merkur.tec.linutronix.de>
	<528f13590911071823sa26e1ane027d51d16357c79@mail.gmail.com>
	<80y6mg5e34.fsf@merkur.tec.linutronix.de>
Date: Sat, 12 Dec 2009 17:58:34 -0600
Message-ID: <528f13590912121558h26a95a1awcc2f8f384e8c3076@mail.gmail.com>
Subject: Re: [PATCH] mxc_nand: i.MX35 hardware ECC fixups
From: alfred steele <alfred.jaquez@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John/Stephanie,
> The patch sets a few registers that Sascha's patches forgot. It also
> correctly notices if there were ECC errors. Without the patch, most ECC
> errors will go unnoticed.
I am having a issue with using nandwrite mtd util and it so happens
that the nandwrite gets stuck at a particular block and the sonsole
hangs there forever.
We are using the mx27(mxc) with a large size page NAND(4k). The annd
write suceeds for the kernel MTD parition. I am suspecting my NAND
driver is somehow obsolete. How do i find out as to what could be the
root cause of the problem?
What could be the pest debugging path?

Cheers,
Alfred.
