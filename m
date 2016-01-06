Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGxKn-0003Fs-4G
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 23:17:41 +0000
To: mchristi@redhat.com
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 konrad.wilk@oracle.com, drbd-dev@lists.linbit.com,
 philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
 linux-raid@vger.kernel.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 osd-dev@open-osd.org, xfs@oss.sgi.com, ocfs2-devel@oss.oracle.com
Subject: Re: [PATCH 02/35] block: add REQ_OP definitions and bi_op/op fields
From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1452027218-32303-1-git-send-email-mchristi@redhat.com>
 <1452027218-32303-3-git-send-email-mchristi@redhat.com>
Date: Wed, 06 Jan 2016 18:17:01 -0500
In-Reply-To: <1452027218-32303-3-git-send-email-mchristi@redhat.com>
 (mchristi@redhat.com's message of "Tue, 5 Jan 2016 14:53:05 -0600")
Message-ID: <yq1d1tei9hu.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Mike" == mchristi  <mchristi@redhat.com> writes:

+enum req_op {
+	REQ_OP_READ,
+	REQ_OP_WRITE		= REQ_WRITE,
+	REQ_OP_DISCARD		= REQ_DISCARD,
+	REQ_OP_WRITE_SAME	= REQ_WRITE_SAME,
+};
+

I have been irked by the REQ_ prefix in bios since the flags were
consolidated a while back. When I attempted to fix the READ/WRITE mess I
used a BLK_ prefix as a result.

Anyway. Just bikeshedding...

-- 
Martin K. Petersen	Oracle Linux Engineering
