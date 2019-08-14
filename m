Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A26C433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 14:11:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE1E205C9
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 14:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aD8Iltl1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBE1E205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj/Rb1rnGT0CpUO6JA/9NbQEo1jwxk99zLE4UagYVH4=; b=aD8Iltl1L49YAQ
	1K8IUi77o0OU6Ybpk11Q2s9m1aITjHu/kNPqTV1ZaIcdQS34h00s4v7mPAPAtM8lkmiFe2PN/zwZH
	pWbCmXYfkWK/8ZwRlUMBkUDQZHt4S5yVN7vLPaNjMDaSzYCEaDJ93npIxvDOvWPJzHFjdH7MbruQT
	G/AT0596Y75AXy3ATdHv7ONYvBYQuE4L05SWfk8EgNx+ypJ8WgHWgdTvbRh7qGcw6QcK0vFb4TyIs
	8DrrXLrYvfJn1LTg7A7p3bKobxnogYp4+opdsPlRS191Jl5uP8zdN5WXnL4absfwCfQbf+77uyljd
	ETz8UCKTkc9/Sfz1ffaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxtzp-0004IU-Mb; Wed, 14 Aug 2019 14:11:25 +0000
Received: from smtp.eckelmann.de ([217.19.183.80] helo=EX-SRV2.eckelmann.group)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxtzm-0004I6-3k
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 14:11:24 +0000
Received: from EX-SRV1.eckelmann.group (2a00:1f08:4007:e035:172:18:35:4) by
 EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Wed, 14 Aug 2019 16:11:09 +0200
Received: from EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:faa6]) by
 EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:faa6%3]) with mapi id
 15.01.1591.017; Wed, 14 Aug 2019 16:11:09 +0200
From: "Mainz, Roland" <R.Mainz@eckelmann.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>
Subject: RE: [PATCH 07/11] ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
Thread-Topic: [PATCH 07/11] ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
Thread-Index: AQHVUprJKpCUtlXq4UynIEfGU5LZP6b6rqnA
Date: Wed, 14 Aug 2019 14:11:08 +0000
Message-ID: <48831093afb8467b90ecf3c96601a2db@eckelmann.de>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-8-s.hauer@pengutronix.de>
In-Reply-To: <20190814121834.13983-8-s.hauer@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:1f08:4007:3c00:dbc:b95a:c2c2:7d02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_071122_151966_3474C73A 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: "Mainz, Roland" <R.Mainz@eckelmann.de>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org




> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
> Sascha Hauer
> Sent: Wednesday, August 14, 2019 2:19 PM
> To: linux-fsdevel@vger.kernel.org
> Cc: Richard Weinberger <richard@nod.at>; Sascha Hauer
> <s.hauer@pengutronix.de>; linux-mtd@lists.infradead.org;
> kernel@pengutronix.de; Jan Kara <jack@suse.com>
> Subject: [PATCH 07/11] ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
> 
> The FS_IOC_FS[SG]ETXATTR ioctls are an alternative to FS_IOC_[GS]ETFLAGS
> with additional features. This patch adds support for these ioctls.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  fs/ubifs/ioctl.c | 89
> +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 84 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c index
> b9c4a51bceea..121aa1003e24 100644
> --- a/fs/ubifs/ioctl.c
> +++ b/fs/ubifs/ioctl.c
> @@ -95,9 +95,39 @@ static int ubifs2ioctl(int ubifs_flags)
>  	return ioctl_flags;
>  }
> 
> -static int setflags(struct file *file, int flags)
> +/* Transfer xflags flags to internal */ static inline unsigned long
> +ubifs_xflags_to_iflags(__u32 xflags)
>  {
> -	int oldflags, err, release;
> +	unsigned long iflags = 0;
> +
> +	if (xflags & FS_XFLAG_SYNC)
> +		iflags |= UBIFS_APPEND_FL;

Erm... what does |FS_XFLAG_SYNC| have to do with |*APPEND| ? Is this a typo ?

----

Bye,
Roland
-- 
Roland Mainz, MAA/CAS
Eckelmann AG, Berliner Str. 161, 65205 Wiesbaden
Telefon +49/611/7103-661, Fax +49/611/7103-133
r.mainz@eckelmann.de

Eckelmann Group - Source of inspiration

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
