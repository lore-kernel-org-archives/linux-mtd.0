Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IV2C-0006GZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2001 13:48:36 +0100
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA0A3B8E@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: linux-mtd@lists.infradead.org
Subject: RE: FTL and Endianity 
Date: Fri, 6 Jul 2001 07:52:41 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1252"
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

So since I'm using big-endian MIPS, does this effect JFFS2? That is, 
does FTL stand for Flash Translation Layer, or some such thing? 

Keith

-> -----Original Message-----
-> From: David Woodhouse [mailto:dwmw2@infradead.org]
-> Sent: Friday, July 06, 2001 6:35 AM
-> To: Alexandr Andreev
-> Cc: linux-mtd@lists.infradead.org
-> Subject: Re: FTL and Endianity 
-> 
-> 
-> 
-> andreev@niisi.msk.ru said:
-> > But when the ftl_fromat utility creates an ftl partition, 
-> it doesn't
-> > swap any field of the header. So, it doesn't matter on 
-> which endianity
-> > the FTL driver and ftl_format works, it must be the same only. Am i
-> > wrong?
-> 
-> You're right - except that it does matter in theory. The FTL spec is 
-> defined as little-endian. So while it would _work_ if you do it all 
-> backwards, it's technically wrong. 
-> 
-> I'd be happier to fix ftl_format and ftl_check to do the 
-> byteswapping than 
-> to remove same from ftl.c.
-> 
-> --
-> dwmw2
-> 
-> 
-> 
-> ______________________________________________________
-> Linux MTD discussion mailing list
-> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-> 
