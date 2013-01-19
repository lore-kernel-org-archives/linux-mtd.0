Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TwMzz-0003yn-Bb
 for linux-mtd@lists.infradead.org; Sat, 19 Jan 2013 01:13:31 +0000
Subject: [PATCH 6/6] ubifs: Wait for page writeback to provide stable pages
To: axboe@kernel.dk, lucho@ionkov.net, jack@suse.cz, darrick.wong@oracle.com,
 ericvh@gmail.com, viro@zeniv.linux.org.uk, rminnich@sandia.gov,
 tytso@mit.edu
From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Fri, 18 Jan 2013 17:13:16 -0800
Message-ID: <20130119011316.20902.56721.stgit@blackbox.djwong.org>
In-Reply-To: <20130119011231.20902.55954.stgit@blackbox.djwong.org>
References: <20130119011231.20902.55954.stgit@blackbox.djwong.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: martin.petersen@oracle.com, Artem Bityutskiy <dedekind1@gmail.com>,
 neilb@suse.de, linux-kernel@vger.kernel.org, david@fromorbit.com,
 gnehzuil.liu@gmail.com, Adrian Hunter <adrian.hunter@intel.com>,
 hch@infradead.org, jlayton@samba.org, adilger.kernel@dilger.ca,
 bharrosh@panasas.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hirofumi@mail.parknet.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When stable pages are required, we have to wait if the page is just
going to disk and we want to modify it. Add proper callback to
ubifs_vm_page_mkwrite().

CC: Artem Bityutskiy <dedekind1@gmail.com>
CC: Adrian Hunter <adrian.hunter@intel.com>
CC: linux-mtd@lists.infradead.org
From: Jan Kara <jack@suse.cz>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 fs/ubifs/file.c |    1 +
 1 file changed, 1 insertion(+)


diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5bc7781..4f6493c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1522,6 +1522,7 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
 			ubifs_release_dirty_inode_budget(c, ui);
 	}
 
+	wait_for_stable_page(page);
 	unlock_page(page);
 	return 0;
 
