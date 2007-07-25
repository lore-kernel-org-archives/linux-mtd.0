Received: from xerxes.tchmachines.com ([208.76.80.175])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IDnBL-0002WN-Td
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 16:10:04 -0400
Received: from archite by xerxes.tchmachines.com with local (Exim 4.63)
	(envelope-from <linux@architechnical.net>) id 1IDnBH-0007gc-TX
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 16:09:59 -0400
Message-ID: <8871.69.30.123.186.1185394199.squirrel@architechnical.net>
Date: Wed, 25 Jul 2007 13:09:59 -0700 (PDT)
Subject: mkfs.jffs2 version broken
From: "Pete MacKay" <linux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Wakeman raised a valid issue in his XATTR email about the version
number reported in mkfs.jffs2.  We have two versions, both with different
behaviors and even option lists / help screens, and they both report as
version 1.50.  I pulled from the git last week and this was still the
case.

Could someone who has access or responsibility for that code please update
it or replace it with a date?  (It caused us hours of debugging and broke
our build).

Thanks Much,
Pete MacKay
