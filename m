Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0bua-0006eX-Qf
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 07:44:24 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUA001F2THFLW@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 08:44:04 +0100 (MET)
Date: Tue, 09 Mar 2004 08:41:30 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <01139FC052A0D411900B00508B9535FC102796CD@ZCH07EXM04.corp.mot.com>
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Message-id: <200403090841.30564.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <01139FC052A0D411900B00508B9535FC102796CD@ZCH07EXM04.corp.mot.com>
Subject: Re: How to verify the ECC code for NAND Flash do work
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 09 March 2004 06:47, Shen Aaron-r62966 wrote:
> Hello all,
>
>   I have modified the ECC part of code in my Linux system, but I don't know
> how to confirm that it does work. 

Why did you modify the code ? It is stable and tested.

> One way I'm thinking of is to get a NAND
> Flash with bad block somewhere inside it. 

The bad block is not related to ECC. Bad blocks are skipped. They aren't read, 
writted, erased.

>1. A suitable probram to create a period of bad block
> inside a normal NAND Flash is needed. 

You have to set the bad block marker. This can be done from userspace. Have a 
look at utils/nandwrite.c

> What's the result if the ECC part fails?

The raw data on flash are returned to the caller with an errorcode. If ECC 
fails completely then the data will be lost in the most cases.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
