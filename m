Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mcHo-0001mQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:41:44 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-35.mail.demon.net with esmtp (Exim 3.36 #2)
	id 17mcHn-0001NE-0U
	for linux-mtd@lists.infradead.org; Wed, 04 Sep 2002 16:41:43 +0100
Subject: compatmac.h
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Sep 2002 16:41:26 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B952D27@OPTEX1.optex.local>
Content-Class: urn:content-classes:message
From: "John Hall" <john.hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
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

I've found a problem in compatmac.h with current versions of 2.4 =
armlinux. From about 2.4.18-rmk6 or thereabouts, the following #defines =
are unnecessary:

#define major(d) (MAJOR(to_kdev_t(d)))=20
#define minor(d) (MINOR(to_kdev_t(d)))  #define minor(d) =
(MINOR(to_kdev_t(d)))=20
#define mk_kdev(ma,mi) MKDEV(ma,mi)  #define mk_kdev(ma,mi) MKDEV(ma,mi) =


so I adjusted the #if in my tree from LINUX_VERSION_CODE < =
KERNEL_VERSION(2,4,19) to 2,4,18. I still need the yield, however, so =
I've pulled this out into a separate case.

I haven't submitted a proper patch, because I don't know how to check =
for specific rmk kernel versions. Any suggestions?

Regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/
