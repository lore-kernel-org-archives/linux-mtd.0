Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD9EC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Nov 2021 19:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7927610F9
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Nov 2021 19:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7927610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TULBsRTO+XrWNYtGn/EmCr3wXOpZWQymY9gKUrwKpF4=; b=5ELMDuLiWy+HPNwM4U4ESZmdwq
	lFNOk2LT3HO+7s/1UFHBGMAM7MctG7TcAOUKoL1Mb7Ted+MZnayutAYMIBJlVjUNl6EXsvhaKVBQG
	ZxRuV0G43Uya4SzmenU3AZudnupu2KQQW4EKo5eYgWQjzQDDLy+Zbg37scYpAT+RhpVj0pCoWJm9p
	UpXF9E+vxx6s5VKcZkTS6Aa65aP1BHKsxHt8AVMOFUM4w/m8tHrSiWMtkF5fYTUBrwsOZ0/9RPAmM
	qevvXnpgQcwqxQNcU6Qj9SYWyOktNXwo72/mZHdqK4eNIn07Tfj1N62VFAia5Wr+43V0oeqZEUhxo
	sjABtBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmKtn-00Dy9M-0n; Sun, 14 Nov 2021 19:10:43 +0000
Received: from p3plsmtp10-06-2.prod.phx3.secureserver.net ([97.74.135.192]
 helo=p3plwbeout10-06.prod.phx3.secureserver.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmKtk-00Dy8Z-0l
 for linux-mtd@lists.infradead.org; Sun, 14 Nov 2021 19:10:41 +0000
Received: from mailex.mailcore.me ([94.136.40.141]) by :WBEOUT: with ESMTP
 id mKtbmEna4FmkZmKtcmqLgS; Sun, 14 Nov 2021 12:10:32 -0700
X-CMAE-Analysis: v=2.4 cv=B618bMhM c=1 sm=1 tr=0 ts=61915f28
 a=bheWAUFm1xGnSTQFbH9Kqg==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=vIxV3rELxO4A:10 a=pGLkceISAAAA:8
 a=Mf-47KkiosanKr8LZmEA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: mKtbmEna4FmkZ
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp02.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1mmKta-000C30-IJ; Sun, 14 Nov 2021 19:10:31 +0000
Message-ID: <4b99139a-802a-8255-adf5-2d3f9d0ccf7c@squashfs.org.uk>
Date: Sun, 14 Nov 2021 19:10:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Kernel-4.14: With ubuntu-18.04 building rootfs images and booting
 gives SQUASHFS error: xz decompression failed, data probably corrupt
To: Pintu Agarwal <pintu.ping@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>, Richard Weinberger <richard@nod.at>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Rosenberg <drosen@google.com>, astrachan@google.com,
 speed.eom@samsung.com, Sami Tolvanen <samitolvanen@google.com>,
 snitzer@redhat.com, squashfs-devel@lists.sourceforge.net
References: <CAOuPNLinoW5Cx=xbUcT-DB4RiQkAPpe=9hsc-Rkch0LxD0mh+Q@mail.gmail.com>
 <CAOuPNLgquwOJg85kDcf67+4kTYP9N=45FvV+VDTJr6txYi5-wg@mail.gmail.com>
 <CAOuPNLjFtS7ftg=+-K3S+0ndyNYmUNqXo7SHkyV4zK4G9bZ4Og@mail.gmail.com>
 <CAOuPNLg_YwyhK6iPZZbRWe57Kkr1d8LjJaDniCvvOqk4t2-Sog@mail.gmail.com>
 <CAOuPNLgYhm=goOiABjUFsAvRW+s2NqHjHYdm5MA9PvoUAMxOpg@mail.gmail.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <CAOuPNLgYhm=goOiABjUFsAvRW+s2NqHjHYdm5MA9PvoUAMxOpg@mail.gmail.com>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfA2C8IgQmo+VH9dEmznz100WuP/elKqz7XaJbhB2jtOLRVXLrHCvcN2NZudS+5Wn3FaKL7jxfHHx97ZSm40Q+M1WoVlFFal4jF2INB7U47dwC7RNavB/
 4ZZQR2RJgCMkEJUea51smr9H2IfvkPqnmgZSlwX2kND2yVEQWLl//Gm5G3fbVrwJrEJ1rjDeihklkbL5Om6BOJZ/hd+FFkVPtFw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_111040_147239_396B2043 
X-CRM114-Status: GOOD (  25.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 14/11/2021 07:06, Pintu Agarwal wrote:
> + Adding squashfs-devel to get opinion from squashfs side.
> 
> On Fri, 12 Nov 2021 at 12:48, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>>
>> Hi,
>>
>> On Tue, 9 Nov 2021 at 21:04, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>>
>>>>> We only get these squashfs errors flooded in the boot logs:
>>>>> {{{
>>>>> ....
>>>>> [    5.153479] device-mapper: init: dm-0 is ready
>>>>> [    5.334282] VFS: Mounted root (squashfs filesystem) readonly on device 253:0.
>>>>> ....
>>>>> [    8.954120] SQUASHFS error: xz decompression failed, data probably corrupt
>>>>> [    8.954153] SQUASHFS error: squashfs_read_data failed to read block 0x1106
>>>>> [    8.970316] SQUASHFS error: Unable to read data cache entry [1106]
>>>>> [    8.970349] SQUASHFS error: Unable to read page, block 1106, size 776c
>>>>> [    8.980298] SQUASHFS error: Unable to read data cache entry [1106]
>>>>> [    8.981911] SQUASHFS error: Unable to read page, block 1106, size 776c
>>>>> [    8.988280] SQUASHFS error: Unable to read data cache entry [1106]
>>>>> ....
>>>>> }}}
>>>>>
>>
>> One more observation:
>> When I disable FEC flag in bootloader, I see the below error:
>> [    8.360791] device-mapper: verity: 253:0: data block 2 is corrupted
>> [    8.361134] device-mapper: verity: 253:0: data block 3 is corrupted
>> [    8.366016] SQUASHFS error: squashfs_read_data failed to read block 0x1106
>> [    8.379652] SQUASHFS error: Unable to read data cache entry [1106]
>> [    8.379680] SQUASHFS error: Unable to read page, block 1106, size 7770
>>
>> Also, now I see that the decompress error is gone, but the read error
>> is still there.
>>
>> This seems to me that dm-verity detects some corrupted blocks but with
>> FEC it auto corrects itself, how when dm-verity auto corrects itself,
>> the squashfs decompression algorithm somehow could not understand it.
>>
>> So, it seems like there is some mis-match between the way FEC
>> correction and the squashfs decompression happens ?
>>
>> Is this issue seen by anybody else here ?
>>
> 
> The squashfs version used by Kernel:
> [    0.355958] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> 
> The squashfs version available on Ubuntu:
> mksquashfs version 4.3-git (2014/06/09)
> 
> The squashfs version used by Yocto 2.6:
> squashfs-tools/0001-squashfs-tools-Allow-setting-selinux-xattrs-through-.patch:61:
>     printf("mksquashfs version 4.3-git (2014/09/12)\n");
> 
> We create dm-verity squashfs image using version 4.3 whereas, the
> kernel uses 4.0 version to decompress it.
> Is there something missing here?
> 
> When FEC (Forward Error Correction) comes into picture, then squashfs
> decompress fails.
> When we remove FEC flag from dm-verity then decompress works but read
> error still occurs.
> This seems as if something is missing either in FEC handling or either
> in squashfs decompress logic.
> 
> Just wanted to know if there are any fixes already available in the
> mainline for this ?
> 
> 

As Squashfs maintainer I want you to stop randomly blaming anything and 
everything here.  You won't fix anything doing that.

In a previous email you stated


> 
> One quick observation:
> This issue is seen only when we enable dm-verity in our bootloader and
> cross-building the bootloader/kernel (with Yocto 2.6 toolchain
> arm-oe-linux-gnueabi-) on Ubuntu 18.04.
> The issue is *NOT* seen (on the same device) when building the
> dm-verity enabled kernel on Ubuntu 16.04.
>
> Is it something to do with the cross-toolchain difference between
> Ubuntu 16 and 18 ?
> 

If that is the case, then it is not an issue with Squashfs or any
kernel code, it is a build time issue and *that* is where you should
be concentrating your efforts.  Find out what differences are there.

You don't seem to understand that a Squashfs filesystem generated
by any Mksquashfs 4.X is mountable *without* errors on any kernel
since 2.6.29 (January 2009).  Looking for mismatches between
Mksquashfs and/or kernel version and blaming that for the above 
different behaviour is a complete waste of time.

Phillip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
