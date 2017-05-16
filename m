Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQ3-0001MI-AK
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:05 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 05/53] locking.rst: reformat locking table
Date: Tue, 16 May 2017 09:15:57 -0300
Message-Id: <5b9fd1d3be33c37c17d305752217f6099bff8667.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use a different markup for this table, in order to make it
smaller when seeing in text mode.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kernel-hacking/locking.rst | 37 ++++++++++++--------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index 976b2703df75..17774b1f7587 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -319,29 +319,20 @@ Remember the advice above: you can always use
 :c:func:`spin_lock_irqsave()`, which is a superset of all other
 spinlock primitives.
 
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-|                  | IRQ Handler A   | IRQ Handler B   | Softirq A   | Softirq B   | Tasklet A   | Tasklet B   | Timer A   | Timer B   | User Context A   | User Context B   |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| IRQ Handler A    | None            |                 |             |             |             |             |           |           |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| IRQ Handler B    | SLIS            | None            |             |             |             |             |           |           |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| Softirq A        | SLI             | SLI             | SL          |             |             |             |           |           |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| Softirq B        | SLI             | SLI             | SL          | SL          |             |             |           |           |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| Tasklet A        | SLI             | SLI             | SL          | SL          | None        |             |           |           |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| Tasklet B        | SLI             | SLI             | SL          | SL          | SL          | None        |           |           |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| Timer A          | SLI             | SLI             | SL          | SL          | SL          | SL          | None      |           |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| Timer B          | SLI             | SLI             | SL          | SL          | SL          | SL          | SL        | None      |                  |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| User Context A   | SLI             | SLI             | SLBH        | SLBH        | SLBH        | SLBH        | SLBH      | SLBH      | None             |                  |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
-| User Context B   | SLI             | SLI             | SLBH        | SLBH        | SLBH        | SLBH        | SLBH      | SLBH      | MLI              | None             |
-+------------------+-----------------+-----------------+-------------+-------------+-------------+-------------+-----------+-----------+------------------+------------------+
+============== ============= ============= ========= ========= ========= ========= ======= ======= ============== ==============
+.              IRQ Handler A IRQ Handler B Softirq A Softirq B Tasklet A Tasklet B Timer A Timer B User Context A User Context B
+============== ============= ============= ========= ========= ========= ========= ======= ======= ============== ==============
+IRQ Handler A  None
+IRQ Handler B  SLIS          None
+Softirq A      SLI           SLI           SL
+Softirq B      SLI           SLI           SL        SL
+Tasklet A      SLI           SLI           SL        SL        None
+Tasklet B      SLI           SLI           SL        SL        SL        None
+Timer A        SLI           SLI           SL        SL        SL        SL        None
+Timer B        SLI           SLI           SL        SL        SL        SL        SL      None
+User Context A SLI           SLI           SLBH      SLBH      SLBH      SLBH      SLBH    SLBH    None
+User Context B SLI           SLI           SLBH      SLBH      SLBH      SLBH      SLBH    SLBH    MLI            None
+============== ============= ============= ========= ========= ========= ========= ======= ======= ============== ==============
 
 Table: Table of Locking Requirements
 
-- 
2.9.3
