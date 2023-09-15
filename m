Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9D0EE6455
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=licI+xkjIIKAFaVBU3nJW8pGZJlSX0nYZzuzmDhqOk0=; b=ndQd1Uq79t159J
	vn0t3f4m6kRKOp58xaj6roJAjnUUpIRrgxRgvVblX4EVITzK/xSYIY+C3q0BKx5Yw3aEkamVTQalv
	w1vSsFpTITGKv4X4ErkYgViWRxOrbV51+jNBxtidziVaiIhSbbT8b4F5PvIPa9U5wkX/kbTLFXgr9
	vnbecNxomcZ3zY3panOt9Li9Yx9pRVsIg5HKBJlipFgg7Xxx7xjMvfYe2R+lzFN5T0ofkfHf5yuuv
	s+MNR3oIoOtanyrOFb8FSi09JOi+NB/nIFlWjmNrCPnNc+FryXgI7U949bZsmRJ3J3WvlWnJfcKCv
	mlue0ktHkLrCRaLFVaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh6Yf-00AbBf-1s;
	Fri, 15 Sep 2023 11:00:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh6Yb-00Ab3x-0v
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 11:00:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31f853f2f3aso2048940f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694775613; x=1695380413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpbQlB4mjb78rjSUP8bafejWuvtuI54lBSHWWYp8cUk=;
        b=pb4eqBRY5XKW9W6RmCMPrkt5XtrF//7Wc7B6YS/bB+rZUBpawNYHdWDLZKqbz4XlkT
         JtGvQBWVCx0L1bBASvzFrQy77SDKRZUGeOE8yJK658hD2J3dvYzSLFkVUcWhgshapEF2
         LsIlQxNlVCAmhzhZ60glmCzRvlKeGM3GGtZ/vXX1juhotUvYa1yxNX2h6nvuhGEdInSl
         ou3bfwianaVe5aPXMxGRw+HrYnfUziMzXszv68Kenj0zB3dTVFba4Md3tXzRXMN7XROt
         QUKxdt0sXGge6NqYDMsygffSFl8fU9SzZhz8y+NlMKFtVAwxHOaQjg9VPOnomI4nEHXP
         fS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694775613; x=1695380413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpbQlB4mjb78rjSUP8bafejWuvtuI54lBSHWWYp8cUk=;
        b=DU7oB2adQX0k1jmW7GGLRZLzq5Is+uDCnQyRFdhcgOVvH2qvOA422LO/O8AZM4B59n
         Ch9KgtBrQFld7mw4RXBLTb2H1IK24x/X5I7zWMVwL6VTlyiUT6ftGPQd3kYLQRobxF+4
         ier/wRhVfEIEqYmNlSIVtrsQDpokfMqD3UamzBA5AnOxci9TS8Qj3rx50O8+GL+ky5NZ
         57f596BcX+1VDrG5tSuE5rwdTo145+rl/xGs6oE/3AgxIqLWUck12SvMFilV3JuMT0ns
         GFUwBavmmU0WeiQd25UkZzrE+GR+bx0vjufo5j7C8Tdh9k7n1yGyeXcYOmt67XtVBWSQ
         20Mg==
X-Gm-Message-State: AOJu0YyrLjQOQtxzSZOAbOvYge+97S0kHpWUPNrERbqGoLO2nLOPUDeF
	vOl/C05Y9N5I22XF0EaNw3sS13Y4PaVCL2RChGs=
X-Google-Smtp-Source: AGHT+IEos45Zc8390rDkKHePbKN2uLHi9tDs+24aSbHmPKAWNb7n2370dfdwOZtcYbU8OWdym81xJQ==
X-Received: by 2002:a05:6000:8c:b0:31f:335b:f436 with SMTP id m12-20020a056000008c00b0031f335bf436mr2973131wrx.22.1694775613014;
        Fri, 15 Sep 2023 04:00:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ci8-20020a5d5d88000000b0031fedb25b85sm1843665wrb.84.2023.09.15.04.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 04:00:12 -0700 (PDT)
Message-ID: <0a218ff4-9ef8-d18d-9310-4446dcf05795@linaro.org>
Date: Fri, 15 Sep 2023 13:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 25/42] dt-bindings: mtd: Add ts7200 nand-controller
Content-Language: en-US
To: nikita.shubin@maquefel.me, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
 <20230915-ep93xx-v4-25-a1d779dcec10@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915-ep93xx-v4-25-a1d779dcec10@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_040017_358766_D6DFA441 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

On 15/09/2023 10:11, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add YAML bindings for ts7200 NAND Controller.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
