Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FB0C73C53
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 20:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CE742073D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 20:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+vEc8Tb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CE742073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t09J5qDLhOrQ/5DNzclCiMq7K2GGk+jwA5YoLJLV1+k=; b=k+vEc8TbrJLZ04
	/G2E+JfTBuU3CuuOoi1CDafCJexMtGpBaUrxcux5dLib8kI4VdIUfU/lr/7nYK2ZAg0LkFw2/iigQ
	sJzm9tc5NbUOa0P80aLl7As5ojfEtiLyEZyRA8YDry0pw99GsmtW8DjMdFQAbXkEgmt2AdOGyw989
	BFqlKejsi6ALEATbeVfjxeolGkBkj2f0jKArSEaobVHq7dMYlVmRFtrgZniFr9c1A9ksGwN+ovUWO
	Nc3d92SI4LoTP/Gkfp+CvvUM1q9tOAqf1ZmX1mXIapluZhIjWPpU49qycYaFNU2KTo0ZqLClslE4T
	uBVlrHoAtr8ZW4AOZOMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkwQh-0006UM-OL; Tue, 09 Jul 2019 20:09:35 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkwQ7-00063E-O3; Tue, 09 Jul 2019 20:09:01 +0000
Received: by mail-io1-f66.google.com with SMTP id m24so36436659ioo.2;
 Tue, 09 Jul 2019 13:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IxRusaB6/iyB44ZXKwv1Y+4wUL94u8uFC2wlPuO5HDA=;
 b=WdY39dIt2b9Vm1SRtWEqLJnSVhP9E8q79QpMMV833mUaUl0QZm1ZOThNyHTMcN+i0D
 k6zfOTZhe5otyjG1IA+bezA9XEnVvbz65ahiF0ZAuahYaafZuxlc+/WhsCCgedzyof9J
 4qgOd0ZEP6P1y3P0v+aFd+mT12VBX2SbiwKUOZHcye+opQ9p2U8g3SLu9JLaHMIYtfqG
 KlSldN5wVUCxwNJCDvvCy0amMuq5aSzRAxo6cttZ5enwptObkHKdH/9LA7TrgM/fuVlJ
 6VMZfxndovyf7RixXuCVxmfLpdN/8ofPBtPgfpL82BQThVqtGsuWs21pfJRMjxm25oHG
 /5NA==
X-Gm-Message-State: APjAAAXChPYyXLktu3Tccm5NgO7RY5TRN8osFj0gztYX2W8Ej/9oyif/
 uE/qs4274DY/E5BdJFZkXA==
X-Google-Smtp-Source: APXvYqwgd7tVOXHETgkkm76xD20iAJG7Cx7wu+EG/GsDSVtPfjT/kQQX13fkDk6Uvy1rv8KXzARRtA==
X-Received: by 2002:a02:340d:: with SMTP id x13mr30040764jae.125.1562702938184; 
 Tue, 09 Jul 2019 13:08:58 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id j25sm38049414ioj.67.2019.07.09.13.08.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 13:08:57 -0700 (PDT)
Date: Tue, 9 Jul 2019 14:08:57 -0600
From: Rob Herring <robh@kernel.org>
To: Ashish Kumar <Ashish.Kumar@nxp.com>
Subject: Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add bindings of
 ls1088a and ls1012a
Message-ID: <20190709200857.GA8477@bogus>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-3-git-send-email-Ashish.Kumar@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560942714-13330-3-git-send-email-Ashish.Kumar@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_130859_965524_40B16655 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: devicetree@vger.kernel.org, bbrezillon@kernel.org,
 Kuldeep Singh <kuldeep.singh@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>,
 broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 19 Jun 2019 16:41:54 +0530, Ashish Kumar wrote:
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> ---
> v3:
> Rebase to top
> v2: 
> Convert to patch series and rebasing done on top of tree
> 
>  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
