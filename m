Received: from dmzraw2.extranet.tce.com ([157.254.234.138])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19p8YT-00014x-Q5
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2003 16:37:53 +0100
Message-ID: <2C1BAF8F8E1DD611862B0002A5D4C3FC01BC05E2@renexch3.rennes.thmulti.com>
From: Fillod Stephane <stephane.fillod@thomson.net>
To: "'jon.hoekwater@spansion.com'" <jon.hoekwater@spansion.com>
Date: Tue, 19 Aug 2003 17:37:28 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: FW: cfi_cmdset_0002.c support for erase suspend and resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jon,

> I noticed that support for erase suspend and resume
> is present in cfi_cmdset_0001.c but not in cfi_cmdset_0002.c.
> After reviewing the files, it seems like the same type
> solution could be applied to cfi_cmdset_0002.c for AMD/"AMD 
> like" devices.  Is this a correct assessment, or are there 
> some pitfalls that I have failed to see ?

> I am adding support for the Am29LV640M.

I'm working on the Amd's and Fujitsu too.

> I will add support for the three byte device ID and buffered
> writes.  Testing will be done on an Alchemy DbAU1500 using
> MontaVista Linux.

FYI, I have buffered writes implemented here and working already.
This gives a write boost of about 14x to 16x!
Testing was done on a PPC405 board equipped with Am29LV128MH,
using patched Denx Linux.

Let me know if this is of any interest for you.

I'm waiting for the 2 following patches to be commited before I submit 
what I've done.

Pre-requisite patchs:
Stefano's patch on "erase/write on the same AMD chip with not aligned words"
 http://lists.infradead.org/pipermail/linux-mtd/2003-August/008385.html
My patch on oops fixup
 http://lists.infradead.org/pipermail/linux-mtd/2003-August/008399.html


Regards,
Stephane

PS: sorry, my mailer suck and it's missing the Ref header.
