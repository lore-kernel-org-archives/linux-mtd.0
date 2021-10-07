Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C06FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 17:38:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B10C061248
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 17:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B10C061248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4NeD0BvlKsS6Ib34KkEscNZ045M72LKpVTWqYYmFx3A=; b=1sSqn8rcN6YGD9TRmA+SuGPERW
	wWC5Kl8LW+xcDUhpMlsZrHfSLyQcZozq9cBMG7lupvZE087kV7XT9MpPXFNionEQAg6jN3CjGMtwo
	rrGKKRIZOTi9tX992zoTcuC23WEBgH4WRlv6v3cmL3SeYPaeQC+9zjY6HF71yMjykqkSFyM7+Vhkd
	Tz75dr4gotlvV7iqCOQEQWKM+QHff88pQZIIuqb8ygddX7X131oDfGo9gBuJwKfjXrle5Urpt6CDO
	COY/cdXeMXHe3E44UazZriD1dliQfZYuHuL+9QwZEeprHfLoyQ9erL9X164o2QHxXK1J4Q2UFlRew
	jq0JCA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYXL6-000NyX-A0; Thu, 07 Oct 2021 17:37:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYXL3-000Ny6-5t
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 17:37:50 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7025A3FFFE
 for <linux-mtd@lists.infradead.org>; Thu,  7 Oct 2021 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633628264;
 bh=5flUaf6jKiDLWUPC8SE0c+myQU9KVt7aFY9IwB5v+1Y=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=m0nIQYzxzHZBsy7Q5pXii5iUojo1yyY5uXT88bFBevOjqU6rEyNxv38zZq/BnRPn7
 RGJLGzV0vIgzMo0FiW0ynHRc/V1s5L4RbPEOXeM+Q/LXPw+aMya+Y+aJsEstgoPSmR
 jE2sCmrylNTUiwdE6jaUB54CxpYZ/ANOdICbQkedfw+X+wZb6/BEowOp/+3/kjwcRN
 2aZnhgl7k8p7j5/nhami9KdqiCOf/xP3Pog/j3fJ8aZxQ/5irqIPhMDnspy8z+sva9
 n9MVpdMW2fHzvq32sp+1eGTA9T+jc047zgFH6T8UNQXe80lM2d1N9cnzc/bYnoHTn1
 IDc4JmzbmnjcQ==
Received: by mail-ed1-f72.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso6603869edf.7
 for <linux-mtd@lists.infradead.org>; Thu, 07 Oct 2021 10:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5flUaf6jKiDLWUPC8SE0c+myQU9KVt7aFY9IwB5v+1Y=;
 b=tNxlTfl0Yy6N8gXKCsmRU1YLld6TBgtSc7iSERWDGgQBaJFcz53a1Vh0nkzv5obpat
 TTpZiz/51Qtp/0wbNL/0Pbh/oAePiE2ThsPR9Olkq6m8SX/ESk24N+cFL+3m8H+xtkhX
 nLvD5bFbsK3vInYXaqYDLIz8TFM14mjEWaEPX8JL72ozvVWvXzyIC7RVQMDPkUDroUrO
 e9JDf8T3i+w6iLdaVT4z3IseAa7B9iGZc1ucVki/RWpfbkzxh3/m115rR87ye72hJ6Tw
 4/7VLuPHXak0zGG0bU/E7h5UPLGjGuZOfku1GCUs+LbgwXiPQ5INsznZh5cUjLrIC5b1
 X9fQ==
X-Gm-Message-State: AOAM530HMQTf3PkioghZSEp5vqvWrXs4tE1mfHHPndXA0YFGdS+tKJpm
 8DkbiMY0Y6Tw3UvObbWqOa+m/VdzoYyszhjaURpQTa2oFJZ+TevCs++qAC54bNFAVBZ97zaX+MU
 QKglHLyhcelcuK2kgyKFdDYNecQHkSl34jnj+o1O17q0=
X-Received: by 2002:aa7:dbcf:: with SMTP id v15mr7948893edt.243.1633628264141; 
 Thu, 07 Oct 2021 10:37:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiw5fAi2srcOES1uBrM+2ioQHt4K41K6+prToUJlETyugFBx966hJWqDGKNiOpd+Zl4XJjVg==
X-Received: by 2002:aa7:dbcf:: with SMTP id v15mr7948871edt.243.1633628264021; 
 Thu, 07 Oct 2021 10:37:44 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch.
 [188.155.186.13])
 by smtp.gmail.com with ESMTPSA id b5sm42732edu.13.2021.10.07.10.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:37:43 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
Date: Thu, 7 Oct 2021 19:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007120830.17221-1-rogerq@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_103749_471246_EA1D954E 
X-CRM114-Status: GOOD (  10.81  )
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
> Hi,
> 
> This series converts ti,gpmc memory controller and ti,gpmc-nand and
> ti,gpmc-onenand MTD controller bindings to yaml.
> 
> cheers,
> -roger
> 

Hi,

Although you did not mention it here, it looks like you have some
dependencies between the patches. Maybe this shall go simply via Rob's tree?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
