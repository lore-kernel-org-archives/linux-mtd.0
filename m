Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IFH7-0005Er-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2001 20:58:57 +0100
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA0A3B8D@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: linux-mtd@lists.infradead.org
Subject: RE: mtd-JFFS2 HowTo doc
Date: Thu, 5 Jul 2001 15:03:05 -0500 
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

I initially need to get it working with 2.2.19 and as this 
will be the main filesystem in our application, it will be 
compiled into the kernel and not a loadable module. We have
a port of the 2.4.x kernel to our target arriving in the fall.
Anything in particular to get JFFS2 working under 2.2.x?

Keith

-> 
-> also, JFFS2 does not work out of the box (CVS) AFAIMT for 
-> kernel versions <
-> 2.4.x
-> 
-> Vipin
-> 
-> 
-> "Siders, Keith" wrote:
-> 
-> > Hi,
-> >
-> > Got Vipin's how-to doc and read it through. Was wondering 
-> if I can basically
-> > read JFFS as JFFS2 to use the newer filesystem?
-> >
-> > TIA,
-> >
-> > Keith
-> >
-> > ______________________________________________________
-> > Linux MTD discussion mailing list
-> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
-> 
