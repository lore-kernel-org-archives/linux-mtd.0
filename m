Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD138C04AA7
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 15:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7942084A
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 15:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SJELNSYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F7942084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7SkwiUpvHBhbWMXJL+Ujyq2tXGbOlKCKVpexb/F7n4=; b=SJELNSYk5DnoTz
	PbGVkE1QN/57y+44nJVkCGNqIclAlKCh1ZJ5/H66DXfZVFv+biDKKkKW/+SwEy7GiCcnB6o3qcgEW
	YhgbY0ud2NWxuINU4FtGvS+VXML/m/v8tZXwHAQT4iBrc175MJgYLp8zZb7aHyuMEmoby2O1TfBPy
	gLh0fBmF1E7MV+69GHzt0BBSACLZvFw6LHNzkMGKJTqVva9FVz3WqaYr3cvB0m2ktfRcBJq8jXdNr
	ZBpQ1euByIFEhmb6ZIs8tVNUXmNb7zQvCiewnFzrfi1gYJuw0pTRIky13nex87EjlNqUPtL4Wef3R
	GbEDonp/z39Ch1D0j4Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQCsA-0005Xg-L4; Mon, 13 May 2019 15:28:14 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCs7-0005XE-SK
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 15:28:13 +0000
Received: by mail-ot1-f67.google.com with SMTP id i8so12103678oth.10
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2019 08:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=erjTI6eG9SyW0rfn2c4BFHN5r2eXk7Loba80RrzT740=;
 b=AM2rhCu12Splq7n0UHTPs/4S0TwFNEOY4nHB1HNGWdJgN+cpqMaiE7RV81TnMHVxJD
 IEehJXLCz2uDk2vK2ylIR2lgqRWKzahQSkps+I0lBO2eA/B0mtd4N1SJQlrIR3Vu9ddE
 5PbGk4cP/hIpIp9LmRBSmsOBpkf/ohNPlL6g/IMVuXVB1n0Ud3a/5Wrkgj2KOgIA1cET
 Dvh164MI2fGiAYIb6f2ukyKAVTkBZcfwt3M0GcYKhRrmKTBh0ZPaCbLug0eaF3AhYERD
 TGjNsk9Kt2Qh3cw8mGsSCAsCeoZevj6hir7IfLVh8Yd/iMGjjBLBp9rzfrAWP8sk5QuW
 LbGg==
X-Gm-Message-State: APjAAAUUQv506SMwqFMm+resGJD2vvKsJOHLNkCF/rA3x7FwSl3Iqbem
 Sdseg9h3MFo2bqk3lpv+dyVZ7p8=
X-Google-Smtp-Source: APXvYqzDLdKY3K7TQEkkzjYV6fUd9fFK/P6MrGXBIn6DbJSzv7nQ7usMzPtmE/GOn4buxfVLMjxXQQ==
X-Received: by 2002:a05:6830:14cd:: with SMTP id
 t13mr16704956otq.25.1557761290915; 
 Mon, 13 May 2019 08:28:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d70sm5923986oih.18.2019.05.13.08.28.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 08:28:09 -0700 (PDT)
Date: Mon, 13 May 2019 10:28:09 -0500
From: Rob Herring <robh@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCHv4 1/2] dt-bindings: cadence-quadspi: add options reset
 property
Message-ID: <20190513152809.GA28897@bogus>
References: <20190508134338.20565-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508134338.20565-1-dinguyen@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_082811_910039_FCFAA4CD 
X-CRM114-Status: GOOD (  15.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marex@denx.de, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 08, 2019 at 08:43:37AM -0500, Dinh Nguyen wrote:
> The QSPI module can have an optional reset signals that will hold the
> module in a reset state.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v4: no change
> v3: created base on review comments
> v2: did not exist
> v1: did not exist
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> index 4345c3a6f530..b6264323a03c 100644
> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> @@ -35,6 +35,8 @@ custom properties:
>  		  (qspi_n_ss_out).
>  - cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
>                    and first bit transfer.
> +- resets	: Must contain an entry for each entry in reset-names.
> +		  See ../reset/reset.txt for details.

reset-names needs to be documented with the values and order.

>  
>  Example:
>  
> @@ -50,6 +52,8 @@ Example:
>  		cdns,fifo-depth = <128>;
>  		cdns,fifo-width = <4>;
>  		cdns,trigger-address = <0x00000000>;
> +		resets = <&rst QSPI_RESET>, <&rst QSPI_OCP_RESET>;
> +		reset-names = "qspi", "qspi-ocp";
>  
>  		flash0: n25q00@0 {
>  			...
> -- 
> 2.20.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
