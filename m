Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjdbh-0001uC-7D
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 21:47:35 +0000
Received: by pbbrq13 with SMTP id rq13so682365pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 14:47:31 -0700 (PDT)
Message-ID: <4FEA2DC1.9090003@gmail.com>
Date: Tue, 26 Jun 2012 14:46:41 -0700
From: Tomer Barletz <barletz@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: Check mtdoffset is not larger than mtd.size in
 case of a bad block.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdoffset is being tested against mtd.size in the outer two loops, but 
the third nested one does not test against it.
In case of a bad block we'll try to access an out of bounds offset in 
the next MEMGETBADBLOCK ioctl, which will fail with EINVAL.
In case mtdoffset is indeed larger than the partition size, we need to 
bail, since there are not enough "good" blocks to complete the write.

Signed-off-by: Tomer Barletz <barletz@gmail.com>
---
  nandwrite.c |    5 +++++
  1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index a42f7c9..8bd00c1 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -399,6 +399,11 @@ int main(int argc, char * const argv[])

  				if (baderaseblock) {
  					mtdoffset = blockstart + ebsize_aligned;
+
+					if (mtdoffset > mtd.size) {
+						perror("Too many bad blocks - cannot complete request.");
+						goto closeall;
+					}
  				}
  				offs +=  ebsize_aligned / blockalign;
  			} while (offs < blockstart + ebsize_aligned);
-- 
1.7.1


--Tomer
