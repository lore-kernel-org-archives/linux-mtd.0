Received: from mx0b-00003501.pphosted.com ([67.231.152.68]
 helo=mx0a-000cda01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVLZw-0001Zb-NZ
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 16:33:05 +0000
Received: from pps.filterd (m0075034.ppops.net [127.0.0.1])
 by mx0b-00003501.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u74GI9r1016542
 for <linux-mtd@lists.infradead.org>; Thu, 4 Aug 2016 12:32:42 -0400
Received: from mail-qk0-f197.google.com (mail-qk0-f197.google.com
 [209.85.220.197])
 by mx0b-00003501.pphosted.com with ESMTP id 24m8fq8aw1-30
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 04 Aug 2016 12:32:42 -0400
Received: by mail-qk0-f197.google.com with SMTP id l2so414387853qkf.2
 for <linux-mtd@lists.infradead.org>; Thu, 04 Aug 2016 09:32:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160804154622.GB15656@infradead.org>
References: <1465155145-10812-1-git-send-email-mchristi@redhat.com>
 <1465155145-10812-38-git-send-email-mchristi@redhat.com>
 <CAOxpaSUMsgfTYsL0bL6VCnwxz7bpgpKO-ZfC5J8dFG9PN-hzvg@mail.gmail.com>
 <87fbe31f-27b3-ff7a-e381-34fc1aad337e@redhat.com>
 <CAJVOszAd9Eu88P2=QoNVArd0jwDH7KRe=OB82tCNMpjfv9B4KA@mail.gmail.com>
 <20160804154622.GB15656@infradead.org>
From: Shaun Tancheff <shaun.tancheff@seagate.com>
Date: Thu, 4 Aug 2016 11:32:16 -0500
Message-ID: <CAJVOszAqEw3UK6HV4bPvYfHeO6jvP0d-OtfXxRuve=5-Kmaokw@mail.gmail.com>
Subject: Re: [PATCH 37/45] drivers: use req op accessor
To: Christoph Hellwig <hch@infradead.org>
Cc: Mike Christie <mchristi@redhat.com>, philipp.reisner@linbit.com,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-scsi@vger.kernel.org, Ross Zwisler <ross.zwisler@linux.intel.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>, konrad.wilk@oracle.com,
 XFS Developers <xfs@oss.sgi.com>, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, linux-block@vger.kernel.org,
 osd-dev@open-osd.org, Ross Zwisler <zwisler@gmail.com>,
 Jens Axboe <axboe@fb.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lars.ellenberg@linbit.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 4, 2016 at 10:46 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Aug 03, 2016 at 07:30:29PM -0500, Shaun Tancheff wrote:
>> I think the translation in loop.c is suspicious here:
>>
>>     "if use DIO && not (a flush_flag or discard_flag)"
>> should translate to:
>>     "if use DIO && not ((a flush_flag) || op == discard)"
>>
>> But in the patch I read:
>>     "if use DIO && ((not a flush_flag) || op == discard)
>>
>> Which would have DIO && discards follow the AIO path?
>
> Indeed.  Sorry for missing out on your patch, I just sent a fix
> in reply to Dave's other report earlier which is pretty similar to
> yours.

No worries. I prefer your switch to a an if conditional here.

-- 
Shaun Tancheff
