Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhB35-0004vR-EA
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 04:30:28 +0000
Message-ID: <5285A33C.4040808@oracle.com>
Date: Fri, 15 Nov 2013 12:29:48 +0800
From: Jeff Liu <jeff.liu@oracle.com>
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] list: introduce list_last_entry_or_null()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: jfs-discussion@lists.sourceforge.net, jiri@resnulli.us,
 gregkh@linuxfoundation.org, oleg@redhat.com,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Folks,

This patch is trying to introduce a new list helper to retrieve the
last entry or return NULL if the list is empty corresponding to it,
which is inspired by Jiri Pirko's list_first_entry_or_null().

With this trivial helper, we could get a little benefit to simplify
the code logic of xfs_ail_max() and make the code looks a bit more
consistent with xfs_ail_min() which has already been simplified
via list_first_entry_or_null().

Moreover, as a per simple grep against fs as well as driver's tree,
I think there are some other places could make use of it for similar
purpose, here I spread this helper over some file systems as well.

Any comments are welcome!

Thanks,
-Jeff
