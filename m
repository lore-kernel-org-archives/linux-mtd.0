Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1455C001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 12:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFDS2NMbBSLLyF2yF1BP+tOXEkRrSw0KOrb7W7EJba8=; b=kcQn93nvrf6pK/Q58n9z05KDS8
	sTJcjwFeBGeIBvLpSs2o3XoOEVnlDNm+V4KdICirOBVUwR4YbKXPuWVL3Xcds/OyIHHqEVCtC7xV/
	fnxcXbA0w35XIZI8yrbum1Ntd7ADbMJ1PzY5KJCFWu043zj4o2k4G8KDeRthW2UzANmR11tFfU6a1
	Xp9H2ycJIZ/gEbhuD1jx2+6VyGUI2+/wiof912rwLfYML+GbmuUFhQ0OkxwT6tp2urFRzB4QseLmR
	0RFPld0q0DgeDdSqQiuC454uuXEUgw7Bsqr01s5v8rsDWjFzCVkrEnGaPvxMi+nNgwdufgvL+gTkc
	8pdPpcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFYI-0047vc-2q;
	Wed, 16 Aug 2023 12:23:06 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFYE-0047u0-2b;
	Wed, 16 Aug 2023 12:23:04 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1F0C08E2;
	Wed, 16 Aug 2023 14:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692188580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHiNxjeUrAwzOphGHu0eZkI/pOqktqiZVERvri1bSWI=;
	b=o9R+3sm3pMwFG3qh3EzYHeTUHgjbIgTu8lM7an1cb+HYmwazI823tRZETHJIxMPBexoUPn
	vd/LVkxhgcSSt66PqNTUGxJo6BAe+9pO/fsrhRRrpWad/F+sd7Esa9097f5ALhX8Yk8lec
	RXlQNPwZ9Zo8v/Yh1nKCCEm8P7hFHGN8qXMahnr91zS0+arIA/Jlf4TMjXl8ymmPJ30+et
	SkfSfq4YAQ4SGue9Z4DtVr/EQ9WzrUcshtuupvENfeTzZskiwq35yXaDgZepLf9MeNXRRs
	2pygHBc6ovZ2wg2+Ha0gocKYgll3FMhxcqBrht2XxswRQ4jmfDuBPFwpwhgEaQ==
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 14:22:58 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal
 )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
In-Reply-To: <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
 <6702bac712daab13698b9bb9ad81d49e@walle.cc>
 <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
Message-ID: <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_052302_995687_4A539E6D 
X-CRM114-Status: GOOD (  13.45  )
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

Hi,

>> like a fundamental problem and that commit 39d1e3340c73 ("mtd: 
>> spi-nor:
>> Fix clearing of QE bit on lock()/unlock()") is broken in that regard.
> 
> what's wrong with the mentioned commit?

         } else if (nor->params->quad_enable) {
                 /*
                  * If the Status Register 2 Read command (35h) is not
                  * supported, we should at least be sure we don't
                  * change the value of the SR2 Quad Enable bit.
                  *
                  * We can safely assume that when the Quad Enable method 
is
                  * set, the value of the QE bit is one, as a consequence 
of the
                  * nor->params->quad_enable() call.
                  *
                  * We can safely assume that the Quad Enable bit is 
present in
                  * the Status Register 2 at BIT(1). According to the 
JESD216
                  * revB standard, BFPT DWORDS[15], bits 22:20, the 
16-bit
                  * Write Status (01h) command is available just for the 
cases
                  * in which the QE bit is described in SR2 at BIT(1).
                  */
                 sr_cr[1] = SR2_QUAD_EN_BIT1;
         } else {
                 sr_cr[1] = 0;
         }

"We can safely assume that when the Quad Enable method..". We cannot, if 
we
don't have 4 I/O lines. The quad_enable is just the op how to do it, but 
not
*if* can do it. It seems to be missing the same check as the
spi_nor_quad_enable(). But I'm not sure if it's that simple.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
