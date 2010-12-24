Received: from nm9.bullet.mail.ne1.yahoo.com ([98.138.90.72])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PWCWh-0002uR-Qw
	for linux-mtd@lists.infradead.org; Fri, 24 Dec 2010 18:38:05 +0000
Message-ID: <89885.88076.qm@web180308.mail.gq1.yahoo.com>
Date: Fri, 24 Dec 2010 10:37:57 -0800 (PST)
From: David Brownell <david-b@pacbell.net>
Subject: Re: Issue : jffs2 and ecc layout
To: Charles Manning <manningc2@actrix.gen.nz>, Ming Lei <tom.leiming@gmail.com>
In-Reply-To: <AANLkTiky0G_H9vGDRNj-y=JTcfCcvRgfXraa0SbAZM4t@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	SukumarGhorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ISTR that while JFFS2 worked with NAND, it had
to reserve a few bytes of OOB data that might more
naturally be used for ECC data.  I've not looked
at your layout ... does it reserve those bytes
for use by JFFS, or is it using them for ECC?

Also, ISTR that Some People felt that using JFFS2
with NAND was sub-optimal.  Which is why we have other NAND filesystem choices, like UBI/UBIFS,
and  (currently out-of-tree) YAFFS2.

- Dave
