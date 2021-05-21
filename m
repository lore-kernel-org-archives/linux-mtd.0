Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253A9C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:00:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A0961363
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7A0961363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8FDzwvSnSiucP2AhmsFGZ5IiJtU1ew0aNhSd3NWfGE=; b=JKS2x4izcvz4+RVtnNyFXdoHkU
	wZe898clv/Y3hAwWD0Vln44+XjdfWfcpoe0fpW37w0PnWEx5eTD7iuquouPd2vcWSwPgoQMNiJKCI
	/1IEdvq22UNkU/6bxsBpwoC7613k2T39EEl1BBbCkOqHkUjUOraIlk6HVIzEUIT1wIEkiUUDj2jFi
	7dVsyBv2NX8BnbK2Xc0r/ri6le5gY+Zq69M6DxTwBYIodBXJ1ngfPDbFFdnAY1lLfaiO8YbOxpF72
	qmpYvYO1XRgBSYG0AI/5BRRS1AMsM37a7iCbPi0jPonFTrt9f2Of5bUL7odmLfkr7If/GnzUXR7N8
	2zcajaHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuS1-003PVw-0j; Fri, 21 May 2021 01:59:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuQc-003P2Q-Kd
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XASxSKTST8H3msmy7k2kFv3UAr6tDcERZNo3DL5fULg=; b=VFv0tLHfC7xMM9P926pH/rUcM4
 xoz+U+jqbMNzZywCd9ziX/WggPoCuwV+HWTz32kaRrleYjNwtRN+UfftTzytCapsMU72H2Dqzey3c
 mHu/Fd7vIW1n6a5nxnAwAhOREEy3VOWl5SNsNIFAX8Lg0+CLliDPfTO6MjvmH/icU+RJ2f7DoB34T
 fU6JWIrG76rNGQEuLQKDUNCWSh+1NpCgG3W30xFETPDWYHn7pPubzXtYH53t+wL6OnBCKLqwuaFK3
 onc3bSXYRBHwxE00/3eJ6yz78LJZLD0+cciAdaAIfRQbXgljqmN8gSBOaoau0AbbSVv0fp2mAyLc+
 w2BxEY4g==;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuQZ-00GlBO-UZ
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:58:17 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so16648991otc.12
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XASxSKTST8H3msmy7k2kFv3UAr6tDcERZNo3DL5fULg=;
 b=NQU+7qkcwVv/z8zCX5DY/g7DITCR53rWkRIekFB343wgsQ60iqPzXKBiBbWsqJEdIx
 /f2UFvSNxVt5hkiqBkRMyYZDgyjEJ9JzWi4o+S+ManQIQc10il7OpOHuDOz+/QnMvKaO
 l/A4qN1TTbnu1VBsTaZyf3AlVmqx4olONS1r9ld+SadvpQB7mzNIgcPw+SpByGjEQNKd
 T/pVJ+VHjuag2Flc2WZtCVDXmpnJo0ySxV9SAvdUNya7nJzUPD8u1Ys6HbmrMuRTpD3b
 CqNhyQDdouMVJzMBFrLk8KBs0l9BIK80vUiUTDs/ee3sCkvjEPWc8BC/1CedL822rgg9
 fMcA==
X-Gm-Message-State: AOAM531Uclt6TPmOH/4/3SqvgRNatC7CwAIFLcKaJa83R4hB5drgXTXe
 5G0zQVV99KatDRKvGFMw+Q==
X-Google-Smtp-Source: ABdhPJxpaVJzfUyPRKjQhljXhKDI1D3iFlMTg7PvdkELuVSdB+sJrtO2mbvZ/XUR1oJwny02ByLN3w==
X-Received: by 2002:a05:6830:1656:: with SMTP id
 h22mr6171588otr.371.1621562295370; 
 Thu, 20 May 2021 18:58:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j20sm750302oot.29.2021.05.20.18.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:58:14 -0700 (PDT)
Received: (nullmailer pid 2495285 invoked by uid 1000);
 Fri, 21 May 2021 01:58:13 -0000
Date: Thu, 20 May 2021 20:58:13 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <monstr@monstr.eu>, Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Srinivas Goud <sgoud@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Helmut Grohne <helmut.grohne@intenta.de>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v20 04/19] dt-binding: memory: pl353-smc: Describe the
 child reg property
Message-ID: <20210521015813.GA2495194@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185816_003505_D1EBCECF 
X-CRM114-Status: GOOD (  10.08  )
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

On Wed, 19 May 2021 20:26:21 +0200, Miquel Raynal wrote:
> Each chil node should have a reg property, no matter the type of
> controller (NAND, NOR, SRAM). This should be part of the bindings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/memory-controllers/pl353-smc.txt      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
