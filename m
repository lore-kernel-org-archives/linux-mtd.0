Received: from mail-bl2on0065.outbound.protection.outlook.com ([65.55.169.65]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGqVM-00020J-8J
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 16:00:10 +0000
Subject: Re: [dm-devel] [PATCH 01/35] block/fs/drivers: remove rw argument
 from submit_bio
To: device-mapper development <dm-devel@redhat.com>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-ext4@vger.kernel.org>,
 <konrad.wilk@oracle.com>, <drbd-dev@lists.linbit.com>,
 <philipp.reisner@linbit.com>, <lars.ellenberg@linbit.com>,
 <linux-raid@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-bcache@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <target-devel@vger.kernel.org>,
 <linux-btrfs@vger.kernel.org>, <osd-dev@open-osd.org>, <xfs@oss.sgi.com>,
 <ocfs2-devel@oss.oracle.com>
References: <1452027218-32303-1-git-send-email-mchristi@redhat.com>
 <1452027218-32303-2-git-send-email-mchristi@redhat.com>
CC: Mike Christie <mchristi@redhat.com>
From: Bart Van Assche <bart.vanassche@sandisk.com>
Message-ID: <568D39DE.2060709@sandisk.com>
Date: Wed, 6 Jan 2016 16:59:26 +0100
MIME-Version: 1.0
In-Reply-To: <1452027218-32303-2-git-send-email-mchristi@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/05/2016 09:53 PM, mchristi@redhat.com wrote:
> From: Mike Christie <mchristi@redhat.com>
>
> This has callers of submit_bio/submit_bio_wait set the bio->bi_rw
> instead of passing it in. This makes that use the same as
> generic_make_request and how we set the other bio fields.

Reviewed-by: Bart Van Assche <bart.vanassche@sandisk.com>
