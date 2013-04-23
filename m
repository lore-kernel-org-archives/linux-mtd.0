Received: from mail-pd0-f174.google.com ([209.85.192.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUVag-0007pN-8x
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 05:16:31 +0000
Received: by mail-pd0-f174.google.com with SMTP id y14so186156pdi.19
 for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2013 22:16:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130422212324.GB4704@localhost>
References: <1366389602-19313-1-git-send-email-linkinjeon@gmail.com>
 <20130422212324.GB4704@localhost>
Date: Tue, 23 Apr 2013 14:16:28 +0900
Message-ID: <CAKYAXd-PUJ2YXr7QMMw9HWzSXzOO=Yb_CCo7AyfrT-_MP5Sa6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] fix max discard sectors limit
From: Namjae Jeon <linkinjeon@gmail.com>
To: Kent Overstreet <koverstreet@google.com>
Content-Type: text/plain; charset=UTF-8
Cc: axboe@kernel.dk, nbd-general@lists.sourceforge.net,
 linux-raid@vger.kernel.org, npiggin@kernel.dk, linux-scsi@vger.kernel.org,
 neilb@suse.de, dwmw2@infradead.org, Namjae Jeon <namjae.jeon@samsung.com>,
 Paul.Clements@steeleye.com, adrian.hunter@intel.com, JBottomley@parallels.com,
 linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 jcmvbkbc@gmail.com, linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 cjb@laptop.org, shli@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/4/23, Kent Overstreet <koverstreet@google.com>:
> On Sat, Apr 20, 2013 at 01:40:02AM +0900, Namjae Jeon wrote:
>> From: Namjae Jeon <namjae.jeon@samsung.com>
>>
>> linux-v3.8-rc1 and later support for plug for blkdev_issue_discard with
>> commit 0cfbcafcae8b7364b5fa96c2b26ccde7a3a296a9
>> (block: add plug for blkdev_issue_discard )
>>
>> For example,
>> 1) DISCARD rq-1 with size size 4GB
>> 2) DISCARD rq-2 with size size 1GB
>>
>> If these 2 discard requests get merged, final request size will be 5GB.
>>
>> In this case, request's __data_len field may overflow as it can store
>> max 4GB(unsigned int).
>
> Complete NACK - like James said, this fix is nonsensical. This should be
> fixed by just checking for overflow before merging requests, not with
> weird hacks in the drivers.
that agree to your opinion, and will change at only appropriate
place(James'change) and will send the updated patch soon.
Thanks.
>
