Received: from gate12.itt.com ([151.190.254.107] helo=fwetgfw2r.itt.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19844y-000829-E6
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 21:09:26 +0100
Message-ID: <998FEBD9C16DD211881200A0C9D61AD705AD5F56@acdfwx3.acdin.de.ittind.com>
From: "Kelly, Mike - ACDIN" <Michael.Kelly@itt.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 22 Apr 2003 15:08:55 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Does jffs2 garbage collection include erasing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When one discusses garbage collection, does that include erasure of the
flash device?  Should manual activation of the garbage collection by sending
the SIGHUP signal to the jffs2 process also cause the process to start
erasing part of the flash device?

Thanks for any assistance you can give me -- a jffs2 newbie. 

************************************ 
If this email is not intended for you, or you are not responsible for the
delivery of this message to the addressee, please note that this message may
contain ITT Privileged/Proprietary Information.  In such a case, you may not
copy or deliver this message to anyone.  You should destroy this message and
kindly notify the sender by reply email.  Information contained in this
message that does not relate to the business of ITT is neither endorsed by
nor attributable to ITT. 
************************************ 
