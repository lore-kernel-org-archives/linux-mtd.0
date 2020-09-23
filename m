Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9B9C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 20:43:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA8420897
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 20:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OcDAGol2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA8420897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jYsI80NXF52tdMGIc/rKjtOTs5XL88Bd8Gok0p0dM0Q=; b=OcDAGol29dNsZ+Qjot949Vy3z
	uifaeGIJTgfMnGcup53bbf3bWf7+7p14ggDq98Dpzl/11XtjcvMuDxkdBwsEHzvlcZ89mM/a3vHbi
	+xmPUevVVSTMy8heBccdd5QbgPNbbfwgZvMhL0nD9gsIvl5Yzqhmzd4RLcSh6YEsEpYoReL4ubI9X
	jzrsAKZGIs9M1NZgvBt3N7uQcZ1EtInjv5NyoINsmKexypFdMLJr0RopZbJcsyNnugjYP6yihqeNx
	4MQQooiVj4m2SgOsznyGGbz3RTRRHBwy2YTqE+/iZKDb3/hkS/zewex+lABTO4fOpxS03deXlPqFM
	ue6hJNdHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLBaq-0007Lv-Cf; Wed, 23 Sep 2020 20:42:24 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLBam-0007Kq-7z; Wed, 23 Sep 2020 20:42:20 +0000
Received: by mail-il1-f193.google.com with SMTP id t13so910779ile.9;
 Wed, 23 Sep 2020 13:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fS6oQh2hrP6bIAjUY49Vx0h9Xj6F6+mhuU4YtCGAcxA=;
 b=CwIDn/xUn1fxxip1Dc6FvfFc2ThTFV5bMK2ozEJGge/VkPO60afaZDwVDyC3ydZF85
 bfDacDkAXmNFdde9SWlIHBU6RBkHnKpspvP5U/WldYOWciUY3g3uow3ndzh9leG/l/46
 GPw8D74aD+YCXxef8xfKelrzh16JxzR+G5V5jzbccboxyAMPRohnMmIzhJ1OR50EjVSX
 +90ZdYPL4VJJNwKtO3W/6+eQr5QPoB7a8DN2SCHcaUUHtwNOrZb41BKVBLpfmj40fbc+
 31qryj9er4ExnBuLaA8c9bo+cpg1Am1CvChOWOfT88pQL7e4J8Ex+qzcvL4nLgHz6lU0
 NPyQ==
X-Gm-Message-State: AOAM5311BMUrY99KhJebEpqJrYLhtXyhXZcza0qPKpUZeceuR/F3R817
 evnJOBDACGOPhHEC78p22g==
X-Google-Smtp-Source: ABdhPJyqTnaRXnDMPUpPR6Jh9uxMucw+SSn9Nb8IY7jUVy+XQm0dh3Alxg5sLL+gSWhdC7dFeM+uzA==
X-Received: by 2002:a05:6e02:787:: with SMTP id
 q7mr1321057ils.298.1600893739786; 
 Wed, 23 Sep 2020 13:42:19 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a11sm392698ilk.19.2020.09.23.13.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 13:42:19 -0700 (PDT)
Received: (nullmailer pid 1270392 invoked by uid 1000);
 Wed, 23 Sep 2020 20:42:16 -0000
Date: Wed, 23 Sep 2020 14:42:16 -0600
From: Rob Herring <robh@kernel.org>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: spi: add mt8192-nor compatible string
Message-ID: <20200923204216.GA1270362@bogus>
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.1.I4cd089ef1fe576535c6b6e4f1778eaab1c4441cf@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918162834.v2.1.I4cd089ef1fe576535c6b6e4f1778eaab1c4441cf@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_164220_296580_F5C132E2 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Sep 2020 16:31:19 +0800, Ikjoon Jang wrote:
> Add compatible string for mt8192 SoC.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
