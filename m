Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uv7N5-00015N-9r
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2013 14:52:28 +0000
Message-ID: <1373036147.2711.60.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for 3.11-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 05 Jul 2013 17:55:47 +0300
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Linus!

The following changes since commit c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1:

  Linux 3.9 (2013-04-28 17:36:01 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.11-rc1

for you to fetch changes up to beadadfa5467e09e36891f39cae1f5d8d3bbf17e:

  UBIFS: correct mount message (2013-05-10 17:07:01 +0300)

----------------------------------------------------------------
Only a single patch which fixes a message.

----------------------------------------------------------------
Richard Genoud (1):
      UBIFS: correct mount message

 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Best Regards,
Artem Bityutskiy
