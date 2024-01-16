Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAE6C47077
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jan 2024 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRQ5Puz8S2llgppt9u6Fqrh5ETodyy6DikJZFzlKnXQ=; b=DAmDJt8P0JUNVK
	uwaaJ4adsVrLKWJrzkiVL6WQ/JDHFJdWxLtt3c3VjCo2nU7eEfvWyvam0VfSWy8XsDzN8dOm3Mww1
	3JWgLpLsXQtz6I2AkiJUICOKm/rio1eQPJrnX5Ledbo6yciBBEKIe0tMVwmQCwJmfm774KeQzEA6y
	dBKiCuoWgh0yZrPbpZrOJR475HkDJDE6zYiBKt/HJUsNvkzyLPPXw4O32Mf9NhYT/sICsTDFebmEX
	NxWuMA3tkjh2B+HlSz83dotLyvm054Dv4HuiON0ZK7qUgVVsW/nBXogLvu1P2Q152VskTGor0N7Cw
	R22RNSQjRu7FNvlRoFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmx2-00CjTz-1q;
	Tue, 16 Jan 2024 17:10:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmwz-00CjTK-2l
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jan 2024 17:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 66053B80E77;
	Tue, 16 Jan 2024 17:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9121EC433F1;
	Tue, 16 Jan 2024 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705425007;
	bh=WCi6VGkBIXSBMccsoDB/WZ6vKhOsmu9kfVAUQ8dIkdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AC2tgQRJMJBy3BvQIGWENmv0xrO3i6eH56mpqRHbnn0HwwXlvLFF9J1+4w/Yv2rRi
	 uPgBAE4sECuMuo/D0docvQG7bY3GmiQI246QkRexqOZHwU6hd3NwFGQcvoqJmZJxkJ
	 I8C/D3RrRdsEnSvjOMxLOF21vAoO7b+C8Sc2fZBLNSh4Xx/wy4abrutJSPJ04oAQRd
	 so49wXxbsS+KdkYQClNx888QpyoHTnBm33/pAqye6SdwowMDFhnHmeU0qsx9JV2KUK
	 x5Q8CYFCuFgHPUqs3CMml/6ai+q/7/t3pZZj6s2s6r3aCokpFpOtZWfxLecO15UWO7
	 YV5f6MOUMX9Ng==
Date: Tue, 16 Jan 2024 11:10:05 -0600
From: Rob Herring <robh@kernel.org>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: krzysztof.kozlowski+dt@linaro.org, quic_tingweiz@quicinc.com,
	richard@nod.at, vigneshr@ti.com, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org, quic_bjorande@quicinc.com,
	devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: avoid automatically select from
 mtd.yaml
Message-ID: <170542500495.126061.10553621105906619365.robh@kernel.org>
References: <1704885705-7486-1-git-send-email-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1704885705-7486-1-git-send-email-quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_091010_028718_BFEC6377 
X-CRM114-Status: GOOD (  12.06  )
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


On Wed, 10 Jan 2024 19:21:45 +0800, Zhenhua Huang wrote:
> The mtd binding is always $ref'ed by other bindings, default selector
> should be from other binding files which ref'ed it. Now, "$nodename" in
> mtd.yaml turns into a "select" automatically such that a few binding check
> issues reported because it conflicts with sram devices(eg, qcom,imem.yaml,
> rules in folder sram/*)
> 
> To avoid the automatically created "select" in mtd.yaml, adding:
> 
> select: false
> 
> Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Fixes: 7bdc671822e9 ("dt-bindings: mtd: physmap: Reuse the generic definitions")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
> Hi Bjorn,
> 
> As the idea is from your comment, I added "Suggested-by" you.
> Please tell me if that's not suitable. Thanks.
> 
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
