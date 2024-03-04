Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB9C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNCghGwOHc2UjwECpcLUfSIvnnTMH3Ia7TTRPPUTpeQ=; b=Z5InnFZIpFm8Lj
	mtqZhZCtZqNT3xmn8ldycmO9XazF3hNycNz3ttHiDhLeQg45S1xijuFkAM2AymoQDdfxhOu3BmNoE
	HgHySgqmEMTeNGWXoFixTH+kTP3DteWb9sn5D8cREYaHG+i0oAy+O61D0bev8k6kcwnCYgSx/z9r0
	5w/4WGFsVB472mSmCXK9LeKVUbE90hpHSRs0z5orUdGcUdRb2UL4vgelbGQeOfM/wp5ISbKpVGgCh
	yZMzOEDjhmUcfJpAjtS0vQtti1ue+FeevDlg25xSwW/Hl5PR3G8cJ9rf0XMY5IbOxpE1hhSSf2djW
	hZtiXjamWKCcT9eAmIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh6bN-00000008qH4-1oRl;
	Mon, 04 Mar 2024 11:35:25 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5cN-00000008dkc-1Ndg
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 10:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709548341;
	bh=KIzJmkOsvRhcMZS0B9T7opj0yBL9GqIfatloVh3/Am4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i1yH4fpzGroY/z8eVXA2TS5zjJOZX8uHwkLqd4QP2aDIrfVAMk6u+ox/P8ACmkInH
	 p9+IVX5Wm0ndqsvmtCMLvkGSkcVaC2TqJqeSOKgVbHInYxJoMjkUVPHFFqze7Jh6kC
	 CCKpV4p5MZ850HI40/VXeiGA/wnFkuAYD+l3hMLFqFvCKZz3xz8uTK9yFL92H1vUsc
	 os61xfdUAHAb//65Ytdz4W5Q9uwPZnKgKtoH5doNvcY4yXW/Dph9xIgC3YQ4VQ0k/x
	 eLA59fSLbnxrlTp/nEF/o9+F2Gd6gmgrrrPb1vOa1mOR0ZMlHREbwv376+3DHHcN70
	 WbqldLG0XfaFA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4BD6537813CB;
	Mon,  4 Mar 2024 10:32:20 +0000 (UTC)
Message-ID: <d0ddbec4-2b08-4820-ba9e-eb1f976c7499@collabora.com>
Date: Mon, 4 Mar 2024 11:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240304090103.818092-1-usama.anjum@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_023224_438391_53E0C159 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 04/03/24 10:01, Muhammad Usama Anjum ha scritto:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
