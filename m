Received: from smtprelay0071.hostedemail.com ([216.40.44.71]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYk48-0008SZ-Rd
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 23:09:13 +0000
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/7] seq_printf cleanups
Date: Mon, 29 Sep 2014 16:08:20 -0700
Message-Id: <cover.1412031505.git.joe@perches.com>
In-Reply-To: <20140929124246.3e39dac8@gandalf.local.home>
References: <20140929124246.3e39dac8@gandalf.local.home>
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.cz>,
 cluster-devel@redhat.com, coreteam@netfilter.org,
 linux-mtd@lists.infradead.org, Al Viro <viro@ZenIV.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

seq_printf should return void.

Add a public bool seq_is_full function that can be used to shortcut
unnecesary seq_printf/seq_puts calls when the seq buffer is full.

Start removing the misuses of the seq_printf/seq_puts return value.

Patchset brought forward from an unreplied to set of changes from
back in December 2013.

https://lkml.org/lkml/2013/12/11/713

Renamed seq_is_buf_full to seq_is_full.

Joe Perches (7):
  seq_file: Rename static bool seq_overflow to public bool seq_is_full
  netfilter: Convert print_tuple functions to return void
  dlm: Use seq_is_full - remove seq_printf returns
  dlm: Use seq_puts, remove unnecessary trailing spaces
  fs: Convert show_fdinfo functions to void
  debugfs: Fix misuse of seq_printf return value
  docg3: Fix mixuse of seq_printf return value

 Documentation/filesystems/seq_file.txt       |  28 +--
 Documentation/filesystems/vfs.txt            |   2 +-
 drivers/mtd/devices/docg3.c                  | 112 ++++++------
 drivers/net/tun.c                            |   4 +-
 fs/debugfs/file.c                            |  14 +-
 fs/dlm/debug_fs.c                            | 260 +++++++++++++--------------
 fs/eventfd.c                                 |  15 +-
 fs/eventpoll.c                               |  19 +-
 fs/notify/fdinfo.c                           |  76 ++++----
 fs/notify/fdinfo.h                           |   4 +-
 fs/proc/fd.c                                 |   2 +-
 fs/seq_file.c                                |  28 +--
 fs/signalfd.c                                |  10 +-
 fs/timerfd.c                                 |  27 +--
 include/linux/fs.h                           |   2 +-
 include/linux/seq_file.h                     |   8 +
 include/net/netfilter/nf_conntrack_core.h    |   2 +-
 include/net/netfilter/nf_conntrack_l3proto.h |   4 +-
 include/net/netfilter/nf_conntrack_l4proto.h |   4 +-
 net/netfilter/nf_conntrack_l3proto_generic.c |   5 +-
 net/netfilter/nf_conntrack_proto_dccp.c      |  10 +-
 net/netfilter/nf_conntrack_proto_generic.c   |   5 +-
 net/netfilter/nf_conntrack_proto_gre.c       |  10 +-
 net/netfilter/nf_conntrack_proto_sctp.c      |  10 +-
 net/netfilter/nf_conntrack_proto_tcp.c       |  10 +-
 net/netfilter/nf_conntrack_proto_udp.c       |  10 +-
 net/netfilter/nf_conntrack_proto_udplite.c   |  10 +-
 net/netfilter/nf_conntrack_standalone.c      |  15 +-
 28 files changed, 333 insertions(+), 373 deletions(-)

-- 
1.8.1.2.459.gbcd45b4.dirty
