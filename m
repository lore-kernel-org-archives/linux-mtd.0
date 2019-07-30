Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49878C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 22:29:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1830E206E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 22:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GF8QgNt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1830E206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tuxera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMdxrksd2JR44IxkBZ4LDEuOkJ996+f4/zTl80TGOaY=; b=GF8QgNt5GXkwXl
	qAwjA0aMbJ3CVU91aVtlzzv0LfvrP4I+aloeN8hPkFrMz+DZI0izIU9cDcTDbTzXe0N/UyxPDJQ8B
	OGKq6wwNBvP2a57T/v+K+daPJ3pyRb01QbHtu75o3eczXJUkzGokSfr+YFYNdqH03MqbS+h1Mm7GY
	q3w+/MhIrtpDJg7yrOQQkqykfdwH7TPYEi6ZME7cOJJ/cz5mJZcMMgLPuaSxf7g000fo+WqD99BJ5
	y1eZR3azo5VlesPCRoJiYWTlOJhAQnOCwrJ1+3OYCcPFYSG8LOxL4mrxtoAA5kkoB7dup360vA7CX
	JL5bOotXnsth5BjvNX0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsacm-00065v-1e; Tue, 30 Jul 2019 22:29:40 +0000
Received: from mgw-02.mpynet.fi ([82.197.21.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsach-00065b-S2
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 22:29:38 +0000
Received: from pps.filterd (mgw-02.mpynet.fi [127.0.0.1])
 by mgw-02.mpynet.fi (8.16.0.27/8.16.0.27) with SMTP id x6UMSZio119596;
 Wed, 31 Jul 2019 01:28:35 +0300
Received: from ex13.tuxera.com (ex13.tuxera.com [178.16.184.72])
 by mgw-02.mpynet.fi with ESMTP id 2u0a9uvs4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 31 Jul 2019 01:28:34 +0300
Received: from tuxera-exch.ad.tuxera.com (10.20.48.11) by
 tuxera-exch.ad.tuxera.com (10.20.48.11) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 31 Jul 2019 01:28:34 +0300
Received: from tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789]) by
 tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789%12]) with mapi id
 15.00.1395.000; Wed, 31 Jul 2019 01:28:34 +0300
From: Anton Altaparmakov <anton@tuxera.com>
To: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH 03/20] timestamp_truncate: Replace users of
 timespec64_trunc
Thread-Topic: [PATCH 03/20] timestamp_truncate: Replace users of
 timespec64_trunc
Thread-Index: AQHVRrCO7mUMDQahbUu7RSH43rBZCqbjOCQAgABUboA=
Date: Tue, 30 Jul 2019 22:28:33 +0000
Message-ID: <5340224D-5625-48A6-909E-70B24D2084BC@tuxera.com>
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
 <20190730014924.2193-4-deepa.kernel@gmail.com>
 <87d0hsapwr.fsf@mail.parknet.co.jp>
 <CABeXuvqgaxDSR8N_D1Tdw06g_5PGinZS--6nx-bPtAWP4v+mwg@mail.gmail.com>
In-Reply-To: <CABeXuvqgaxDSR8N_D1Tdw06g_5PGinZS--6nx-bPtAWP4v+mwg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [86.151.122.143]
Content-ID: <92684FF0F17B42478243313B03823A34@tuxera.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=800
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907300224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_152936_268900_C46EB395 
X-CRM114-Status: GOOD (  17.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 y2038
 Mailman List <y2038@lists.linaro.org>, Greg KH <gregkh@linuxfoundation.org>,
 "yuchao0@huawei.com" <yuchao0@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Richard Weinberger <richard@nod.at>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 stoph Hellwig <hch@lst.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Deepa,

> On 30 Jul 2019, at 18:26, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> 
> On Tue, Jul 30, 2019 at 1:27 AM OGAWA Hirofumi
> <hirofumi@mail.parknet.co.jp> wrote:
>> 
>> Deepa Dinamani <deepa.kernel@gmail.com> writes:
>> 
>>> diff --git a/fs/fat/misc.c b/fs/fat/misc.c
>>> index 1e08bd54c5fb..53bb7c6bf993 100644
>>> --- a/fs/fat/misc.c
>>> +++ b/fs/fat/misc.c
>>> @@ -307,8 +307,9 @@ int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
>>>              inode->i_atime = (struct timespec64){ seconds, 0 };
>>>      }
>>>      if (flags & S_CTIME) {
>>> -             if (sbi->options.isvfat)
>>> -                     inode->i_ctime = timespec64_trunc(*now, 10000000);
>>> +             if (sbi->options.isvfat) {
>>> +                     inode->i_ctime = timestamp_truncate(*now, inode);
>>> +             }
>>>              else
>>>                      inode->i_ctime = fat_timespec64_trunc_2secs(*now);
>>>      }
>> 
>> Looks like broken. It changed to sb->s_time_gran from 10000000, and
>> changed coding style.
> 
> This is using a new api: timestamp_truncate(). granularity is gotten
> by inode->sb->s_time_gran. See Patch [2/20]:
> https://lkml.org/lkml/2019/7/29/1853
> 
> So this is not broken if fat is filling in the right granularity in the sb.

It is broken for FAT because FAT has different granularities for different timestamps so it cannot put the correct value in the sb as that only allows one granularity.  Your patch is totally broken for fat as it would be immediately obvious if you spent a few minutes looking at the code...

Best regards,

	Anton

> 
> -Deepa


-- 
Anton Altaparmakov <anton at tuxera.com> (replace at with @)
Lead in File System Development, Tuxera Inc., http://www.tuxera.com/
Linux NTFS maintainer


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
