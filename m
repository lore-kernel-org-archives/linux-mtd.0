Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8422C3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cM/3sj9RHeo/G/m1CREZ/Y03KCO5LYg88SqE0qQ8US4=; b=gxpCY1lgjTfUQj
	TP6EqiyaTYkygEccPgj6Zqs6nWd6U7O4aaKqg3eBG/RngMYSn6JL51IB/D6QS9DZ2XamnKRKLkJcQ
	WHGDuN9pZPxspOivTyq0NSLQ6eRkTWLAH8wzHOlhXa8Crz2TXtDxvVQ2Oi/lc/cuNEcx6A+5Ioodg
	Mhw4bvpula4IBtwA15DRh+NMw38kNm7XUhFShU4yIgGQUxDU0Km6Wxl7pJUq6wRFg9lRKwDPllAIO
	dHdvfYfgyuH0+g90yoXtUyccbG0b3xOsggq5UO0A1OX6lqgkDBZq5vzf5+78nd+TUijDD/Eh0Nf+b
	l9Y3Vm/gSeDF92UTDk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9o85-004Wu6-Vv; Mon, 26 Dec 2022 14:07:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9o82-004Wpc-Vg
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 14:07:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E843160E9A;
	Mon, 26 Dec 2022 14:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35433C433EF;
	Mon, 26 Dec 2022 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672063616;
	bh=Vp1Gxgy8aLvVN6RcBm+WX5OTFGMNl28teaDAmCl1qbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tn6D7Pm8bTOWSB3Z821BU6g9RhR6NhaVobt3L3y/CHiWg2UIbi2w0qkIkqFtGrtUn
	 FgXf7Yi2+aX6InDx28AXg2m68o3RELhHE9XZ/3lmPgiQtr5QQshBi9jOLMZh117/Qm
	 Lqr2bH9CHVBtfvdSQkxTZkQCMGtEUMhwkxQb0j2wlhrMBvNJIv8vU69fjl4Utztfsl
	 lYgJlMKZBN3PvZzOsUOv1FIzcAGnUhpx7wnke+W7zUxhZEbbPKf+wKWXTFrAR+3w4t
	 7O/qfp2F0fHtFbGnOPPsw6Ds/DqWkz+sdK31hoKWLDqXt4wLpMRujxDrner/QLROep
	 uCe9GBfZGC6yQ==
Date: Mon, 26 Dec 2022 15:06:47 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
	michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: sfdp: Fix index value for SCCR
 dwords
Message-ID: <20221226140647.ahnw4ag55ctp3kal@yadavpratyush.com>
References: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
 <d8a2a77c2c95cf776e7dcae6392d29fdcf5d6307.1672026365.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8a2a77c2c95cf776e7dcae6392d29fdcf5d6307.1672026365.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_060659_176654_25DECA89 
X-CRM114-Status: UNSURE (   7.48  )
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

On 26/12/22 01:01PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Array index for SCCR 22th DOWRD should be 21.
> 
> Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
