Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZQd9-0004z5-Jv
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 16:50:20 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v3 0/7] prepare new nanddump options, defaults
Date: Wed, 22 Jun 2011 09:49:16 -0700
Message-ID: <1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I think this should be the last version necessary for this particular patch
series...

This series adds, changes, and deprecates several nanddump options, helping make
nanddump a closer inverse to nandwrite. This is mostly a preparation for the
next release, when several defaults might change. A short list of the planned
changes:

 * unify bad block methods under `--bb=METHOD', deprecating old ones
 * kill --omitbad in favor of --bb=skipbad
 * skip bad blocks by default (i.e., --bb=skipbad)
 * do not dump OOB by default (--omitoob)
 * add `--oob' to force dumping OOB

Please let me know when these are accepted and the 1.4.5 release is made, so I
can send a proper patchset to clean this all up as planned for the 1.4.6
release.

BTW, is each utility supposed to have its own version? (e.g., nanddump has
version 1.30?) Should these versions be kept in any kind of sync with the
mtd-utils revision tags? And does Artem take care of this stuff?

Thanks,
Brian

Brian Norris (7):
  nanddump: add --bb=METHOD option
  nanddump: remove --skipbad, leaving --bb=skipbad
  nanddump: update help message for BB method changes
  nanddump: warn about new default BB handling
  feature-removal-schedule: describe nanddump changes
  nanddump: add --oob option
  nanddump: document, warn about future default --omitoob

 feature-removal-schedule.txt |   37 ++++++++++++
 nanddump.c                   |  132 +++++++++++++++++++++++++++++++-----------
 2 files changed, 134 insertions(+), 35 deletions(-)
