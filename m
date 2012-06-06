Received: from nm16-vm0.bullet.mail.ird.yahoo.com ([77.238.189.192])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sc4Rc-00008e-0d
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 00:49:52 +0000
Message-ID: <1338943789.75555.YahooMailClassic@web29010.mail.ird.yahoo.com>
Date: Wed, 6 Jun 2012 01:49:49 +0100 (BST)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: ubi debugfs possible regression
To: dedekind1@gmail.com, adrian.hunter@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In v3.4, ubi worked OK without debugfs.=0A=0AIn v3.5-rc1, ubi fails without=
 debugfs:=0A=0AUBI error: ubi_debugfs_init: cannot create "ubi" debugfs dir=
ectory, error -19=0AUBI error: ubi_init: UBI error: cannot initialize UBI, =
error -19=0A=0AIs this not a regression?
