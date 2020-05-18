Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9298CC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 18:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69A4920826
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 18:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PugX72Xw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69A4920826
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nl6fgy2A2JGCCdy0xJ4K+XZ2ZBpdQwfAD3j3oKvegNU=; b=PugX72XwoF0ueH
	qdgX+U00hhDd3WomOu77kWg609fcDJxqgkrgLwo6mjb6U/4zNCQLXfBMIFK9ZldlVTGhlGIeKc6Kk
	hFuoockCbg8otskNdCRsjQMQ6eiHxwhTV0028bQpS3G4gawgsJtZpvAuMTgJGKMJUsUhxpSvkl9xY
	AMaVh6y0S09xCvv9ZhKGhDnYlpZ0h+thDmx/kCiBgLVw69NhCNmAQMrAUHLjVexeWCwafY/hG7Pdf
	Rue6E9YGyB2pOF1bWTTUjQuQZjV5BuhzpCnGxghM3yp7j1AOQPCchXgTMACo3rtpopwcgK5bAM9h3
	L7I2Rt1AseVZc99SBEWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jakFT-0007R6-BP; Mon, 18 May 2020 18:12:23 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jakFQ-0007Q6-Ub
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 18:12:22 +0000
Received: by mail-il1-f195.google.com with SMTP id j3so10760721ilk.11
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 11:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wza7y0iWSmQunc9aAsvn/ABnmr/MQ8TpkPd34EycxTs=;
 b=G4qGsnRvjs37weApgTWtbYu82TRzmyK0ll3+4ydL+EqM6zeO/G6b0DSqFE0aaTCrfw
 LB0jVS+dSHqaTblFR4XFvwz5MtKEmEAaPH4WaSV5zm8TJgN3/5uPRfXd/qCeyDDUEhRU
 /YlC8poDUoPyEYnhYAFa6YfsWclt657agtD5cp2ns0jPrValigFx6s51Ixzi14EDHMAx
 Jp71yxjfPvWRDFIrufKVf1K8UJ6xHAhP/x/za/ddYDsM6NfJ8iYQfbivUSkjOTcIpvoZ
 p/To5BUQiFt3Uh/1NJkzINiKBJuPC+8fpppp0CpwNH+YURrY2zdImh/RNPRClaoNlDPh
 Veng==
X-Gm-Message-State: AOAM531a65a7qcPFHxaj44Iau/Q+9PWo+wNISqsMjA7cMhItUzaPlC8f
 LcIsWmp30yLmxlxCPqnUew==
X-Google-Smtp-Source: ABdhPJxRuz2c7uilqkp6Yz7wsrwWTC5DyQruXesuSs2L9u16dXm49HJmPCUrA+N2gnuqLeLFa3yW+w==
X-Received: by 2002:a92:8cd6:: with SMTP id s83mr18470530ill.133.1589825538604; 
 Mon, 18 May 2020 11:12:18 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id p1sm4087313ioh.38.2020.05.18.11.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 11:12:17 -0700 (PDT)
Received: (nullmailer pid 15457 invoked by uid 1000);
 Mon, 18 May 2020 18:12:16 -0000
Date: Mon, 18 May 2020 12:12:16 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 6/8] dt-bindings: mtd: Document ARASAN NAND bindings
Message-ID: <20200518181216.GA15399@bogus>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
 <20200508171339.8052-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508171339.8052-7-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_111220_983336_415AB77B 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri,  8 May 2020 19:13:37 +0200, Miquel Raynal wrote:
> Document the Arasan NAND controller bindings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arasan,nand-controller.yaml  | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
