Received: from sabe.cs.wisc.edu ([128.105.6.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aaRfE-0002Hi-DH
 for linux-mtd@lists.infradead.org; Mon, 29 Feb 2016 17:31:24 +0000
Subject: Re: [PATCH 00/35 v4] separate operations from flags in the
 bio/request structs
To: Christoph Hellwig <hch@infradead.org>, mchristi@redhat.com
References: <1456343292-14535-1-git-send-email-mchristi@redhat.com>
 <20160229171339.GA17755@infradead.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 konrad.wilk@oracle.com, drbd-dev@lists.linbit.com,
 philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
 linux-raid@vger.kernel.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 osd-dev@open-osd.org, xfs@oss.sgi.com, ocfs2-devel@oss.oracle.com
From: Mike Christie <michaelc@cs.wisc.edu>
Message-ID: <56D4802E.3090507@cs.wisc.edu>
Date: Mon, 29 Feb 2016 11:30:22 -0600
MIME-Version: 1.0
In-Reply-To: <20160229171339.GA17755@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/29/2016 11:13 AM, Christoph Hellwig wrote:
> Any reason you've dropped my ACK for the previous version?

Sorry. I think I accidentally dropped it when I rebased back over to
linux-next. It looks like it only got stuck on the first patch. I will
fix that up on the resend for those kbuild errors.
