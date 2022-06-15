Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35ECC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9oSfwBXW6OU4Gn9ChSd52qIQzlwMYEzyolPnjry3dQ=; b=yHJrvT4NDopSQr
	KzUDEhBsYSRyptMhO2nt2TNc3DkeyBBurLtOt26SIULnCjqtx/USdCGXAULyHJgDn9hrOaQyCz+ZA
	IAzZwrwmF9fwXQv5ClpvStlDe2ibBNx7D9TDk/gBmmj0l6kbfpZvEXQsK1rwI3Ktn6OBqqReIA5w1
	OM8Kkf8s7xflF79nmC8WEVuQILh4fLKeOCrDO+OzZ2FS/lHNABsSZO8J9d2Oq9rTvGH+YpB41PGNm
	VRt/NiOtgkF0PpGNpQTql2IlErSChlXwl5wp+1GA01NG1cRLV/xDoXVt1O+30+i+9brxwV1mjNflc
	IT9B9R3SJQ8BRKCVDs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1XTU-00Frxa-UB; Wed, 15 Jun 2022 18:10:40 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1XTR-00Frw5-AD
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 18:10:38 +0000
Received: from [127.0.0.1] (nyx.walle.cc [158.255.213.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 73E5B22249;
	Wed, 15 Jun 2022 20:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1655316627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TS3jYFS6YTAvU3pgkMvxRJI/YD6CxfyrTdrG5rg9tDU=;
	b=OlchZqjIeXpxF5LKa+OEpi2uZeC6CUN/XH0rxxwQ/x/J6nLbOgm5MbIm2Z9R9PJXpyqyWh
	ITd9PIHV0TBR+EcsaFzL0mjm/aMwRtzQ1p1ctjGfEYFVgvSbeoDaUZi2Gr+pYPueUu74xN
	GK5/IzzwgjecRTSUsCYOo2rolRVGf+4=
Date: Wed, 15 Jun 2022 20:10:13 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco)" <oocheret@cisco.com>
CC: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "mauro.lima@eclypsium.com" <mauro.lima@eclypsium.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] mtd: spi-nor: handle unsupported FSR opcodes properly
User-Agent: K-9 Mail for Android
In-Reply-To: <YqmrIsOEsFoKTwEK@lahna>
References: <YmZUCIE/ND82BlNh@lahna> <20220610191548.3626218-1-oocheret@cisco.com> <YqbWt9f3of+7Z76e@lahna> <BYAPR11MB27570F2863F7BCDFE629B3DFCDAA9@BYAPR11MB2757.namprd11.prod.outlook.com> <YqmrIsOEsFoKTwEK@lahna>
Message-ID: <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_111037_554830_DBAC067F 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

Am 15. Juni 2022 11:49:22 OEZ schrieb Mika Westerberg <mika.westerberg@linux.intel.com>:
>Hi,
>
>On Tue, Jun 14, 2022 at 05:56:54PM +0000, Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco) wrote:
>>    Hello Mika,
>> 
>>    in my case (I work with memory chip n25q128a13 for recent kernels) I'm
>>    getting return value -ENOTSUPP from spi_mem_exec_op() call in the
>>    micron_st_nor_read_fsr() method
>>    [[1]https://elixir.bootlin.com/linux/v5.19-rc2/source/drivers/spi/spi-m
>>    em.c#L326]. So I decided to provide the same errorcode to
>>    intel_spi_hw_cycle() method because older kernel versions throw the
>>    error there. It is fine to use -EOPNOTSUPP return value instead.
>> 
>>    I suspect we need to cover both cases to check -ENOTSUPP as well as
>>    -EOPNOTSUPP to let the driver work properly.
>> 
>>    if (ret == -ENOTSUPP || ret == -EOPNOTSUPP)
>
>I think we should follow the same in the Intel driver and return
>-ENOTSUPP too.

AFAIK ENOTSUPP is for nfs and shouldn't be used.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
