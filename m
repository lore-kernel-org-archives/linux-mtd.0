Received: from p02c11o142.mxlogic.net ([208.65.144.75])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtkjW-00079d-AW
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 18:20:55 +0000
From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: static builds mtd-utils
Date: Wed, 17 Aug 2011 18:20:50 +0000
Message-ID: <F9C551623D2CBB4C9488801D14F864C6053A8F@ex-mb1.corp.adtran.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there currently a way, or would it be wanted (by anyone other than
me) for mtd-utils to be built as a multi-call binary?

I want this ability for my embedded project (as all the targets seem to
use the _exact_ same libs) where I build these tools static.

If there is no way to do this, currently, but the maintainers wouldn't
mind such a option in the mtd-util build system, I'll provide the
patch -- otherwise, I'll just make my patch, apply it through buildroot
and go on about my business.

Andy
