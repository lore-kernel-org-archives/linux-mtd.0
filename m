Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC3FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 05:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKvcXR+M2pMSbFh0HxTIXX/qPHthT+yyyM9n+mn5FQ0=; b=spQCfY4kNuBQmu
	uokYEojaEonmE/fOUIywVGfEKs8oH3pYYgOiAnJFe+rYaUi2W69t/9cQfk5UQFbAS3YmGWxmEzdqe
	fmsFUHP1gMhBMKYnEdNS5Yz9Z/jMjog2SfZnS40YbEb5ENwL4uhQ46qV14OoRJiiZpTn8rb8LEM1A
	X6AxcCVbyJWu9tZUJjMn0SiOrpSVqgTI00sDvZ4xjj6wgvoJPoQUUSg6xkND0PBW2cJLJBGcAj70+
	8lnm1KYI6NOYZOIFOe2vKz/qNy7KauQfHL+k3MVKeME4O2nERpblJvOXczgYuDpUr+n+PLoUShfjY
	yOEUdJSRPRnlnHg7599Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfEEO-008bRd-2N; Fri, 15 Apr 2022 05:10:52 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEC5-008aDI-Kp
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 05:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649999309; x=1681535309;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6js5zQuBI=;
 b=CeodHj5AU0alJr2r4eFscU+D8m0kJXg1ODgX9nrmamfCnysDgYDih22x
 A4/4CNNDVJqetnitRhP6wlNYKCh51OoqZs/JpkVdBXrzAw7MjvRXiCuCA
 sEGzd1ON9AuuxolKxnCdScJO0/KGz3U4+0aVIT2Oniu/0tRDxkDlefefE
 aBVcr4cb1mtfuWvGR70CKnKu0E9O8bgUM+ieBmu1if8AEiGLt0Iq876Ie
 RRwzUpkQndC5L1W1oyQJ1SMWwbPVZ4ELzZL/38iaxBRBDIHBD1UsLmqoG
 P4slNwlBXE8J3zUa0jzEzdJ7D1+/5RIjzNeVmCCxKHslzHDp9bp2H9SE3 w==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="309936197"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 13:08:28 +0800
IronPort-SDR: zyB1mXfYUQb65Ge5AU2xRcfX45jlOXkUBt4XLQzfhuJJ31CDzopvi3ceRbW5CQfdqaW/pIvSwN
 N9wV/qK5dCuTWTOVfGtYBMATe/8ZDvt1Ky3IPv3oU73mjka/obW928jrBiGmX+G+BeTl46BrBD
 lnYsS/qfS7r4wzaFG7u7zfcGSYTOKUnGV1P36H8vmsb+/znUac1IigxOc11RRQzS72si9OGeXV
 GyqfzbfM6vTn7Q0nKcwLR3XlUZW0svhk5osTmEZpLpQ1TRJENfqimRONnbB5bsxhOSzz8rY6bi
 k63vBuSiOZEkOkIlAPh/SUyc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 21:39:39 -0700
IronPort-SDR: pAllGb8f5D7jmPb603Xt+OXry/SytyywZN/TgOnN6fT0oyQ5i5e/Ly1ZJmCDsz3pLkSImoDodn
 ayySVZUHjGdmI2vbPNDa45SdhjG9jSnivqXaRdxkUHakX3xMBnOOWZdNUNc5AZPP2tVa2iHaOL
 gqy/SUFHk/Xc11YLWXVNIdLg81Ejm0ChXKtsg3dMee/qwFKFMfnha3WeHgvk1cKjM3jCUQ1zfs
 Bf0BxVNZtqJvX/vZfFIb00FC0M+BCu1hSWCu7nZ1NrDfRjZxRq4N6SChkf0yyxcziRxO3HPMzy
 Kqg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 22:08:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kfkqv4l0hz1SVp1
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 22:08:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649999306; x=1652591307; bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6
 js5zQuBI=; b=ImgmXK0ljefxmjcwwGCZe/P1ZAiYRfxiStEm0q2wFeKQMvkTL85
 MoEiv1WWngR6yiDdywhy6m6c7CHetStsP2KPL7aGmRBSEDoQ0BBkWf7uSl7GctxX
 seFLiVHTqharLpAbcplk3yzDBSQpNNHnyTWqCGnT6SDEQPGGz4njOldB2JpZjV0c
 Fn1jBi13ZsAeHMQyLgImvLHIeNwH3xSreGo+kohOYlio/FQU9mPmWWTRsJd3G6Vg
 s7uGQ1kCv0yoS1gOWClHM7ArPs0jj6m4kJVcJWYcgsITqalXpkzGP3XvQ+R3owbL
 r+qmM2ogk4tvzMNidepDhru5fT38QuGd/Yg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id f0cmGJ7FUSO9 for <linux-mtd@lists.infradead.org>;
 Thu, 14 Apr 2022 22:08:26 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kfkqn6sCZz1Rvlx;
 Thu, 14 Apr 2022 22:08:21 -0700 (PDT)
Message-ID: <d7a39cfc-9b28-f0d6-bf62-4351c55daec2@opensource.wdc.com>
Date: Fri, 15 Apr 2022 14:08:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 27/27] direct-io: remove random prefetches
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-28-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220415045258.199825-28-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_220829_806196_8481D8B6 
X-CRM114-Status: GOOD (  11.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 4/15/22 13:52, Christoph Hellwig wrote:
> Randomly poking into block device internals for manual prefetches isn't
> exactly a very maintainable thing to do.  And none of the performance
> criticil direct I/O implementations still use this library function

s/criticil/critical

> anyway, so just drop it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
