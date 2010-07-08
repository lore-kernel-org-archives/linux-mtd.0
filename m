Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWy4e-0001rw-Gm
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 20:52:01 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] mtd-utils update
Date: Thu, 8 Jul 2010 13:50:03 -0700
Message-ID: <1278622209-20149-1-git-send-email-norris@broadcom.com>
In-Reply-To: <1278562169.7365.2.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series includes a few different fixes. Patches 1, 2, 3,
and 6 are fixes to the nanddump utility, while 4 and 5 are style
and minor issue patches.

As per the recommendation, I adapted the linux kernel dump function for
nanddump (patch 2).

The patches are:

[PATCH 1/6] mtd-utils/nanddump.c: Increase max OOB size
[PATCH 2/6] mtd-utils/nanddump.c: Robust pretty hexdump
[PATCH 3/6] mtd-utils/nanddump.c: Add canonical (hex+ascii) flag
[PATCH 4/6] mtd-utils/mkfs.jffs2: fixed warnings
[PATCH 5/6] mtd-utils/nandtest.c: Fixed indentation
[PATCH 6/6] mtd-utils/nanddump.c: Add "forcebinary" flag

Feedback is welcome, especially on the feature additions of patches
2, 3 and 6.

Thanks,
Brian
