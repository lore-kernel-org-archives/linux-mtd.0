Received: from dsl-main-205-233-15-i159-cgy.nucleus.com ([205.233.15.159] helo=mail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wcez-0004ye-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 06:02:29 +0100
Received: (from rayl@localhost)
	by mail.com (8.11.2/8.11.2) id f9P5BDL17965
	for linux-mtd@lists.infradead.org; Wed, 24 Oct 2001 23:11:13 -0600
Date: Wed, 24 Oct 2001 23:11:13 -0600
From: Ray Lehtiniemi <rayl@otii.com>
To: linux-mtd@lists.infradead.org
Subject: intel J3 strataflash chip support
Message-ID: <20011024231113.E15411@otii.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

hi folks

i'm evaluating intel's 28F320J3A device for use in an arm-linux application.
since it is CFI compliant, and from scanning the archives, i gather it is
supported. (please! correct me if i'm wrong)

the marketing kit for this part mentions a piece of software, VFM (virtual
small block file manager).  there is a single reference to VFM in the archives
from early july 2001.  the poster mentioned running into some kind of problems
with 2.0.38, and buying the VFM code resolved things.


if i'm using 2.4 kernel, is there any reason to spend time looking at VFM?
could someone outline the differences between VFM and MTD+JFFS2?  any success
or failure stories with this device would also be welcome.


thanks in advance

-- 
---------------------------------------------------------------------------
    Ray Lehtiniemi <rayl@mail.com> <rayl@otii.com>
