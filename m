Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axhBE-0004TI-P9
 for linux-mtd@lists.infradead.org; Tue, 03 May 2016 20:44:29 +0000
From: Jeff Moyer <jmoyer@redhat.com>
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
Subject: Re: [PATCH 00/42] v7: separate operations from flags in the
 bio/request structs
References: <1460747777-8479-1-git-send-email-mchristi@redhat.com>
Date: Tue, 03 May 2016 16:44:02 -0400
In-Reply-To: <1460747777-8479-1-git-send-email-mchristi@redhat.com>
 (mchristi@redhat.com's message of "Fri, 15 Apr 2016 14:15:35 -0500")
Message-ID: <x49d1p2c1nx.fsf@segfault.boston.devel.redhat.com>
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

mchristi@redhat.com writes:

> The following patches begin to cleanup the request->cmd_flags and
> bio->bi_rw mess. We currently use cmd_flags to specify the operation,
> attributes and state of the request. For bi_rw we use it for similar
> info and also the priority but then also have another bi_flags field
> for state. At some point, we abused them so much we just made cmd_flags
> 64 bits, so we could add more.
>
> The following patches seperate the operation (read, write discard,
> flush, etc) from cmd_flags/bi_rw.
>
> This patchset was made against linux-next from today April 15
> (git tag next-20160415).
>
> I put a git tree here:
> https://github.com/mikechristie/linux-kernel.git
> The patches are in the op branch.

Hi, Mike,

That git tree doesn't seem to exist.  I did manage to apply your patch
set on top of next-20160415, though.

So... what testing did you do? ;-) I ran into the following problems:
- git clone fails
- yum segfaults
- many blktrace/blkparse issues, including incorrect cpu recorded in
  traces, null task names, and blkparse outputting nothing for a trace
  file several gigabytes in size.

After that, I decided to back out your patches and test the base
linux-next kernel.  That kernel has none of those issues.

So, either I'm missing some dependencies, or I think we've got some
issues to iron out before this thing goes in.  Before I dig any further,
am I missing something?

Cheers,
Jeff
