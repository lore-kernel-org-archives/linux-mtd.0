Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAkV-0000d9-Gn
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:05:00 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 0/6] complete nanddump feature-removals
Date: Fri, 24 Jun 2011 11:03:08 -0700
Message-ID: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Here's my patchset to complete the feature removals and change of
defaults for nanddump (+ 1 bug fix for integck...). These should
be pushed after the 1.4.5 release.

Thanks,
Brian

Brian Norris (6):
  nanddump: kill --omitbad, --noskipbad
  nanddump: change default to --bb=3Dskipbad
  nanddump: change -o to mean --oob, not --omitoob
  nanddump: default to NOT dumping OOB data
  feature-removal: remove completed tasks
  integck: fix build error (MS_DIRSYNC, MS_RELATIME)

 feature-removal-schedule.txt       |   37 ----------------
 nanddump.c                         |   85 +++++---------------------------=
----
 tests/fs-tests/integrity/integck.c |    1 +
 3 files changed, 13 insertions(+), 110 deletions(-)
