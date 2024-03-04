Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F23EC5478C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqoKwxnEXYL3MP/Eo8aPz+koHcWO8qcYIsLR/6+xo8E=; b=hqi47DUprca76Q
	CJzleeQV2m7RJGDtKQduiYDN2/NccmdEvQSV6/FU1NAdU0ZnFrS8sLN6nIPUQ/GSGFSj0xwOUZp3W
	wxpP43AZOPvlUcL6eQkFj4wiDXKxfmg7qS0bqNkcbBeVIm4OuD9xjO4oGDfVSUYVt0HZH9lUCgrzz
	S0ai0XwNYBdaAIdephu9R0jrm2giFqe7VCd1GIvW6Equix8cW5U9wHfQzkkOsky4tdd9xjrqRICHu
	9yHOO51LX52inKAN1Pk87i/+wydhGlQkmWt/AHS4YMiylzHV3dt8TVcn35v9JNzfHPan7T2BCH3Uv
	CsLL+85lGXV6TY9WKW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bw-00000008dPv-0NuL;
	Mon, 04 Mar 2024 10:31:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5S4-00000008aFS-1O4a
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 10:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547702;
	bh=CdqsZgMWba5+4/38tOJ0rHa2CTmblAVjgPmyX2jcBAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hmxqRTZHaFH0EmwDUqjKD9B2YwFeSsIN/Sv9G9R8MUAarAtX2CpV6WXAVo3j03DJZ
	 6vtWlYiV9WgPT41PzE6h8UvM67wx+aYuxtN5FD6Z5ySrC0TSYmZWVDzObsJNaEEq19
	 2F5mvVJ+sQerOh7Oec65NMyNutREUl9jXMX76RXUcTYj+60Jola5sSeKiapp7c3csh
	 DrnyU2GY34R8J3dVvpY3sTjr9zMAhT+l4KSSlIpa2KFcJtnKaqdo5tN6OKykJmv9wh
	 GlRMMxNol9Qj3uXcyXs/AHzksKgEVfi4mYlgmPapw+/Iel+AITOCchRhf27ktJFVQB
	 DDXKQJZ5gzz6A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7C77137813CB;
	Mon,  4 Mar 2024 10:21:41 +0000 (UTC)
Message-ID: <02738700-6328-460b-8a5f-fb531756dd55@collabora.com>
Date: Mon, 4 Mar 2024 11:21:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301144517.2811370-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_022144_985526_0470522E 
X-CRM114-Status: UNSURE (   6.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Il 01/03/24 15:45, Muhammad Usama Anjum ha scritto:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
