Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkuNH-0006Ho-Sy
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 14:44:21 +0000
Received: by mail-oi0-x242.google.com with SMTP id v62so3336956oig.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Sep 2016 07:43:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b496ab60-564b-249a-b421-8a59fc3a71ab@nod.at>
References: <20160914102151.21722-1-zajec5@gmail.com>
 <b496ab60-564b-249a-b421-8a59fc3a71ab@nod.at>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 16 Sep 2016 16:43:58 +0200
Message-ID: <CACna6rxarqxaepcwQkjp1m5z9Qq+qdddUdmQQ7Av1DOX-4xU8A@mail.gmail.com>
Subject: Re: [PATCH 0/2] ubifs: respect dirty_writeback_interval
To: Richard Weinberger <richard@nod.at>, Felix Fietkau <nbd@nbd.name>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 September 2016 at 15:53, Richard Weinberger <richard@nod.at> wrote:
> On 14.09.2016 12:21, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> Hi,
>>
>> This patchset allows some ubifs adjustments that we realized we needed
>> in LEDE project.
>>
>> LEDE can be unstable on power cuts when installed on NAND devices (with
>> ubifs). This is caused by the default high value of wbuf timeout used by
>> ubifs. Any write that isn't followed by fsync (this may happen with
>> buggy user space app or just shell script) may be lost if power cut
>> happens in less than 5 seconds.
>>
>> One idea for fixing this (without modifying kernel at all) is to mount
>> ubifs with -o sync. This could affect NAND performance however, so I'm
>> looking for a better solution.
>>
>> During IRC discussion MTD guys suggested lowering wbuf timeout and I
>> decided to give it a try. The simplest way to do that seems to be making
>> ubifs respect dirty_writeback_interval. This parameter can be easily set
>> with sysctl and is already used in some older file systems.
>>
>> What do you think about this? I gave it a try with a simple
>> uci commit foo; sleep 1s; POWER_CUT
>> and it works as expected.
>
> I think it is correct to tie the wbuf timeout to dirty_writeback_interval=
.
> Especially since jffs2 does the same.
> Please address the comments Boris raised. Then we can get this merged.
>
> On the other hand, IMHO you will abuse this feature.
> If your uci tool does not correctly fsync()/fdatasync() it is just broken=
 and
> needs fixing. Full stop.
> Lowering the wbut timeout reduces the chance to lose unsynced data but it
> won't fix the root cause. Users that face random power cuts will still ha=
ve a
> chance to lose data. Boris also pointed that out on IRC.

It was Felix who said we don't need to fix uci after all, but I'll try
to smuggle patch for it anyway. I hope Felix will consider it
noninvasive and maybe accept it.

For me it's more about other (broken) user space apps that users may
use but obviously we can't test them all.

I'll obviously update patch after Boris's comments, I was just waiting
to see if there will be any others. Thanks.

--=20
Rafa=C5=82
