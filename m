Received: from golem.3glab.com ([62.254.217.161] helo=onix.3glab.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MX1a-0003bZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:16:54 +0000
Received: from d151.3glab.com ([10.0.0.151] helo=dostrowski)
	by onix.3glab.com with smtp (Exim 3.13 #1)
	id 16MXBy-00081g-00
	for linux-mtd@lists.infradead.org; Fri, 04 Jan 2002 16:27:38 +0000
From: "Dominic Jan Ostrowski" <dominic.ostrowski@3glab.com>
To: <linux-mtd@lists.infradead.org>
Subject: eCos port JFFS2 for Compaq Ipaq
Date: Fri, 4 Jan 2002 16:20:19 -0000
Message-ID: <GEECJDDEGDDOOCPHBELJAELHCDAA.dominic.ostrowski@3glab.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Available from www.3glab.org


eCos port of JFFS2 for Compaq Ipaq

This package is in an early stage of development and, although functional,
has siginificant limitations - particularly in regard to garbage collection.

This package has only been tested on the Compaq Ipaq.

Currently, it is passing through the eCos test code for ram (building an fs
image from scratch) and the test for romfs (using a JFFS2 image built under
Linux - included in the support directory). It has primitive inode caching
(which could be worth extending). However just-in-time garbage collection is
failing.

Please look carefully at the readme.txt before trying out this package.
Minor modifications to eCos flash drivers are required, examples are
included in the package.

As this package is capable of modifying flash content, extreme care should
be taken to ensure that flash code areas are not corrupted. Any usage is
entirely at your own risk.
