Received: from [207.209.118.131] (helo=msi-ex6.m-sys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aHCK-0001EP-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 15:45:04 +0100
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFE61@MSI-EX6>
From: Vadim Khmelnitsky <vadim.khmelnitsky@m-sys.com>
To: 'Ilguiz Latypov' <ilatypov@superbt.com>, Mark Meade
	 <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: [patch] doc_stage1.S : GRUB on DoC
Date: Thu, 1 Aug 2002 07:47:06 -0700 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

DOC_Millennium 8MB has small SRAM of 512bytes in size to accomodate IPL code
.
two copies of IPL code should be placed at offset 0 and offset 0x200 ( first
and second page ) of erasable unit 0 .

Vadim

-----Original Message-----
From: Ilguiz Latypov [mailto:ilatypov@superbt.com]
Sent: Wed, July 17, 2002 11:35 AM
To: Mark Meade
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC



On Tue, 16 Jul 2002, Mark Meade wrote:

> Ilguiz -- is the DOC_MIL_KEEP_IPL option still used?

I never used this conditional piece of code because I don't have DoC
Millennium.  I added that code before I could better understand the
mechanism of initial loading with DoC Millennium.  I don't know if the
Millennium's own IPL can perform extra download from flash offset 1024.  
If it can't, the DOC_MIL_KEEP_IPL piece can be removed.

I am behind my schedule at work at this moment.  I will be able to test 
the improved code on DoC 2000 around next week.

Ilguiz


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
