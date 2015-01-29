Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGkxG-0004oz-Hw
 for linux-mtd@lists.infradead.org; Thu, 29 Jan 2015 09:00:03 +0000
Message-ID: <54C9F676.9080100@nod.at>
Date: Thu, 29 Jan 2015 09:59:34 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [PATCH] Add myself as UBI co-maintainer
References: <1422444504-17217-1-git-send-email-richard@nod.at>
 <54C9ACE7.9060904@huawei.com>
In-Reply-To: <54C9ACE7.9060904@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.01.2015 um 04:45 schrieb hujianyang:
> On 2015/1/28 19:28, Richard Weinberger wrote:
>> ...and set the state to "Supported" as UBI is part
>> of my day job.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  MAINTAINERS | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2ebb056..6417fed 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9891,20 +9891,15 @@ F:	drivers/scsi/ufs/
>>  
>>  UNSORTED BLOCK IMAGES (UBI)
>>  M:	Artem Bityutskiy <dedekind1@gmail.com>
>> +M:	Richard Weinberger <richard@nod.at>
>>  W:	http://www.linux-mtd.infradead.org/
>>  L:	linux-mtd@lists.infradead.org
>>  T:	git git://git.infradead.org/ubifs-2.6.git
>> -S:	Maintained
>> +S:	Supported
>>  F:	drivers/mtd/ubi/
>>  F:	include/linux/mtd/ubi.h
>>  F:	include/uapi/mtd/ubi-user.h
>>  
>> -UNSORTED BLOCK IMAGES (UBI) Fastmap
>> -M:	Richard Weinberger <richard@nod.at>
>> -L:	linux-mtd@lists.infradead.org
>> -S:	Maintained
>> -F:	drivers/mtd/ubi/fastmap.c
>> -
>>  USB ACM DRIVER
>>  M:	Oliver Neukum <oliver@neukum.org>
>>  L:	linux-usb@vger.kernel.org
>>
> 
> Seems this patch is pushed into "linux-next" but "master" is
> the merging branch used by Artem before.
> 
> Just want to make sure you didn't miss the recent patch in
> branch "master". I should say sorry if my last mail misleading
> you.

No need to worry.
All patches from master are already in my local -next tree, build tests are running
and I'll push in jiffy.

Thanks,
//richard
