Received: from gate13.itt.com ([151.190.254.108] helo=fwetgfw3r.itt.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196e86-0006uc-S8
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 23:14:47 +0100
Message-ID: <998FEBD9C16DD211881200A0C9D61AD705AD5F4C@acdfwx3.acdin.de.ittind.com>
From: "Kelly, Mike - ACDIN" <Michael.Kelly@itt.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 18 Apr 2003 17:14:23 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: JFFS2 - Can garbage collection at startup be disabled?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(I am still new at Linux and JFFS2, so please correct me if I make any
incorrect assumptions.)

I am working on an embedded product where power can be cycled at any time.
It appears that if the power is cycled when there are deleted files on the
flash device that haven't been garbage collected, that garbage collection
(erasing the flash) occurs on power-up just after the jffs2 filesystem is
mounted.  This is causing our normal boot-up time of 30 seconds to increase
to as much as 2 minutes, delaying the startup of our application.  Is there
a way to disable this garbage collection on power-up and have it run later
in the background?  Thanks.

--
Mike



************************************ 
If this email is not intended for you, or you are not responsible for the
delivery of this message to the addressee, please note that this message may
contain ITT Privileged/Proprietary Information.  In such a case, you may not
copy or deliver this message to anyone.  You should destroy this message and
kindly notify the sender by reply email.  Information contained in this
message that does not relate to the business of ITT is neither endorsed by
nor attributable to ITT. 
************************************ 
