Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD4EC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 14:54:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A1060F57
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 14:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1A1060F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZHdUV/B+s6TY59vNw7cRQg0tjpPZTu6R2LGwZCdgYLg=; b=eX12g8zbRnK7u02prTvfcLGkQa
	STT64SkuyG6TVHVMh1M/7PpeLhCURiVYFjr4eobnSYp0IHzjKMNq8SkPmkDSGzP3+xIinXLHYd7UG
	j5JG2RxysawQ8An3q48nLwqKUFebHEemvz7TlhvQy6FLVSVql2RX9oRL+Coo4NmDlYjkFGcOiCwQ1
	tudAEiT8t6UI4vigUoRNN5kd95ZzA8uMuiKF6MpKtV9+i/S9cVtP/IN7CqhmZN8B7N+GxSTVXUmcK
	NvuVEZE0wydgPkw9LBWGPed+bDJuTfSFq/N5D96oGVLy7PuuaQHbNOojgguxekwzVnAVbGQ3lPewX
	SyOijvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZDjl-005ikj-UV; Sat, 09 Oct 2021 14:54:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZDjj-005ija-6N
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 14:54:08 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 687AD3FFF4
 for <linux-mtd@lists.infradead.org>; Sat,  9 Oct 2021 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633791245;
 bh=Z/66e4vIUc4jlwu8qwngzIGNtrlMePU5AHgS8MHQkVI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=bYvVMOsBPoDMy1MNYQGbk85dhzN1Ty6b9t0nDucSFyVDqpclKv3HNiAyArwBP6RFB
 QU65+pZdJBcHqYcq5ZQSHSpZhqwofd3ilPqigmcO8LuwxHVp5mlRVLH6+gtxcjJ5+Z
 PmHhkOkbO6vwf1RskNwuktfx8y1MJwNUGbwREVl7gm39esLUu+9ueKDHQmVAFDW3ar
 4Ol1q1oIKxPK674Ttfkoqx65S0FTJ7RE6CgPX2MTjhwy7MfgKzkX7vL9HOsoS8drI1
 eTDjv2/f/dIXuBV7k2Wj3dGgEgBm0RDchLwkjec+1vhJLJRP0+HQd/zLPN5sObYu3Q
 dyHcy8s39iGAQ==
Received: by mail-ed1-f72.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so11836128edj.0
 for <linux-mtd@lists.infradead.org>; Sat, 09 Oct 2021 07:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z/66e4vIUc4jlwu8qwngzIGNtrlMePU5AHgS8MHQkVI=;
 b=QtenOyiBOtqsV4lWaM1azEVfnhO/Z+hkAvCsBVkGJ/mkc2XHQqozsP50E6V+Jiyvi4
 LM008/7eiCkxmclrwM8XfSp+R9P4UslkURJaeX3hrsCSpxNTe/tPqoPp/AtRUfPiOsQ0
 dRMj81I3+oZGIFLmeL2X+bnFJyjPGpOGFKJta2J81JlbLdcWVIPKj5yW3/7OQNHo0iLS
 Mnt67wqgs7uk8ZPEy/4kJdJ0pCh4Rd2QxfScP5AP93AZFycp9buORpevkIKRJiTuN/P5
 xdIUV7nPh0eGQAICnrPHcCE9AA3oRGD9L0vf0K4Zp/oE76f21WQNtdplBg6yrhC90oMf
 8xKA==
X-Gm-Message-State: AOAM532iUNm2tLMRdXPyFncSWq3vDAXJ2Y022Pj2W+nzhoPc3XvSRNoW
 PhtAHnUgzjtKxX96o+508oUvJE8GrMHny5n3N2RBYmBp8GJ+N8UpXbumSEpJhJQ1srIam1Qhknl
 ota7RzPPBjRtgrAQUle6NWDQ77cLDuUBLGHDcX0uUphE=
X-Received: by 2002:a17:906:2b91:: with SMTP id
 m17mr11970335ejg.202.1633791244973; 
 Sat, 09 Oct 2021 07:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrqgQvL7LCCEPsBYg170QsPlUWmRldSNgpFRe8Ei1FFODLUOx87al9hRkomspH82VL67MniQ==
X-Received: by 2002:a17:906:2b91:: with SMTP id
 m17mr11970311ejg.202.1633791244796; 
 Sat, 09 Oct 2021 07:54:04 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id v13sm1071656ejo.36.2021.10.09.07.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 07:54:04 -0700 (PDT)
Subject: Re: [PATCH v5 6/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <20211007120830.17221-7-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <05368ff4-a2fa-a7d2-b87b-d8363b085148@canonical.com>
Date: Sat, 9 Oct 2021 16:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007120830.17221-7-rogerq@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_075407_410005_25D22639 
X-CRM114-Status: GOOD (  11.49  )
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

On 07/10/2021 14:08, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 ----------------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++++++++
>  2 files changed, 172 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
