Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYrUY-0006of-Dz
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 07:37:15 +0000
Message-ID: <1426836992.8234.24.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBI fixes for 4.0-rc5
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 20 Mar 2015 09:36:32 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

a pull request follows, but first a short explanation.

This pull request is based on a "random" commit, unfortunately. We
usually use a tagged -rc commit as a base, but not this time. Sorry for
this. Richard Weinberger is the new co-maintainer for UBI, and he was a
little bit too fast and did not wait for -rc1.


The following changes since commit 3d883483dc0a7261d73d8b1857a7387a1dd99eee:

  Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal (2015-02-19 17:51:22 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.0-rc5

for you to fetch changes up to b388e6a7a6ba988998ddd83919ae8d3debf1a13d:

  UBI: fix missing brace control flow (2015-02-23 22:17:24 +0100)

----------------------------------------------------------------
This pull request fixes a bug introduced during the v4.0 merge window where we
forgot to put braces where they should be.

----------------------------------------------------------------
Brian Norris (1):
      UBI: fix missing brace control flow

 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


--
Regards,
Artem.
