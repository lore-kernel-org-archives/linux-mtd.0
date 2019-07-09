Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF8BC73C56
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 20:09:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16BD1214AF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 20:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RYEGFIVd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16BD1214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLJNv2g7eyz9zt2Q+uhMJd4PXCzz050llykFGgsbvBE=; b=RYEGFIVddKzqfh
	ZS44/NlWHq1f5uX6Ndbd+HOolq8OfjSsHNlQMpERUJ5b8pV/O44fn+TPPwcE5RoJUvxaCf7LxFgDR
	b8nHp8V61aINvh6sfAMNPJGHeIzJ96WUc52HwVWD5koV91vNKqo1dt+nC2mZCpuj3OZO9HbohSpZ8
	GX+C4gbwx12rXYm3zuGw3J8LWdzUx/ZhA8BjWScWzXDDn46hZM8bn0CsBT9vFG+8YdTC/1plZSPWT
	6IJIrHQ++mYcVbBxUeLppa2ybJtlCRWOpKzsTvZjAUmdrdER3UWg1+KOi+cKsfsAh7K6itAHBmC6t
	qcDGcZYTtVzvIfLxJDsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkwQ4-00060u-Hy; Tue, 09 Jul 2019 20:08:56 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkwPn-0005pw-BW; Tue, 09 Jul 2019 20:08:40 +0000
Received: by mail-io1-f65.google.com with SMTP id q22so24085605iog.4;
 Tue, 09 Jul 2019 13:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tMyCowNzgjxUaK5PWC6oQ1uWddr8utL+ufijtmsasYY=;
 b=DUeK3wJoEi9PhYO8GwBvkN9kcofQtZU6zEjUPrXImy2BHJs3MP9anCqRD2ebjngyq8
 eYlc3P/Pohwe/dR1XjlHwd/Wzbo1F9mrLpF8AmdVT5B7SXcOTyN3dAkRcz4iFaXRMAEp
 ZpkI7dliCiRi7NA8wF4cxCXSiKEMx4JHHxvra+tLGJ3aHRCVO6Lx3e9rVN3A7TeJKb3N
 35W5F/R7tF5bw6pvEtfmUjHy5uvdP/sU1cGFuI9TuxmoHAcQzy+6YfjXz9H8Nto8uiqy
 CzF5MB9ooZOdzipR5lYEg9YPHs5bTTzxFZkCHpGjR7Q/qn4X15kBNHHrZKk9U05Qmd4m
 GQNg==
X-Gm-Message-State: APjAAAW7qRPbHgvCDatFjxEsIgPjOYaXeYv8KimV9BY6g4OM6Kc+gQkV
 o72zNCuYCpkILUGv+G644A==
X-Google-Smtp-Source: APXvYqyKiyPFi1/Sk/eV1if8HfsDBQ9UxZKt6XHIcHyManJ2gt9dEXwY05nvvTvy0mh0ieg/bZNAQQ==
X-Received: by 2002:a02:b914:: with SMTP id v20mr29828003jan.83.1562702918640; 
 Tue, 09 Jul 2019 13:08:38 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id z17sm31248845iol.73.2019.07.09.13.08.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 13:08:37 -0700 (PDT)
Date: Tue, 9 Jul 2019 14:08:37 -0600
From: Rob Herring <robh@kernel.org>
To: Ashish Kumar <Ashish.Kumar@nxp.com>
Subject: Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string to bindings
Message-ID: <20190709200837.GA7806@bogus>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-2-git-send-email-Ashish.Kumar@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560942714-13330-2-git-send-email-Ashish.Kumar@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_130839_396974_F042EDB4 
X-CRM114-Status: GOOD (  10.09  )
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

On Wed, 19 Jun 2019 16:41:53 +0530, Ashish Kumar wrote:
> There are 2 version of QSPI-IP, according to which controller registers sets
> can be big endian or little endian.There are some other minor changes like
> RX fifo depth etc.
> 
> The big endian version uses driver compatible "fsl,ls1021a-qspi" and
> little endian version uses driver compatible "fsl,ls2080a-qspi"
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> ---
> v3:
> Rebase to top
> v2: 
> Convert to patch series and rebasing done on top of tree
> 
>  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
