Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE87CEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWT4jOuaR7yWw9g/AosT1Om4LUjcLRdR6rFG86oj6GY=; b=vYwKdEAWtaPSvm
	9VlfDm5qk6G6VPUBOfrPuzXBt+vb0O1ff7iIb68Dh2S01WIT1D6kFWuycC9Ri4n6f1vyzdVtN+Qi7
	Ud8ytzckLxi1v1kIMx5fDC1qnDssC1UkeHvyoWSRgy+8BL9DgAhAp5JCPkK41PsvBkC82oFr6HqtI
	86qv4QmXURU9vbRW+00cMtr6+8sr6Be0rD7jlYN+fs7lKCJBezGHq6sMSH/8F2k4TFrbg1LcJ0FP9
	SQR9bArSVl0y5Y/Kac4zYd7lxLdgZ5JRq8dtroUd72xa4oE/D4tezAud5iWgHrh5KGsWIWBTxPdwQ
	xaflkO3ohBO3EKrpSStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJe2h-000pTV-2q;
	Wed, 12 Jul 2023 17:54:23 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJe2f-000pRz-2u
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 17:54:23 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so11999365e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689184457; x=1691776457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fj8ThFvAfSG2X1fPBkE5ImF7649h6ECVdp5Ee3R5/zM=;
        b=VBKTLpekU/54h5gI2PxhaZp9nQHMLfK/fzU9j8mCLtgUAHLG0J3J+rIa/dT9rit1fu
         qOXCsJN5eFHz+5lRY+ovcTE/ul/byIZjEnJTvZC3A7t3Svs+PPqR8f+iAPhkxWqpqiSt
         CoWqAIpZIPVhfYtVNEfH57EpZ0Ua4W2Iq4uXwomToaDi6y+x6h4L7pKHf9I4b5zW5hRk
         MxbS0x7cLDAGt7hMq8RZ343/vDvm1hLukieVLhJk0dMSXVJNlOcwkoU++HZlMDXl4u2L
         nOXeUFn3MXcAgRzn1jTGkY2MuG8dBd2uAqfjzB5IzlChmSOA/HUENuzIAIlCW0kuRQxO
         atEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689184457; x=1691776457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fj8ThFvAfSG2X1fPBkE5ImF7649h6ECVdp5Ee3R5/zM=;
        b=ai6hnrAQJWlSP7IiUMzIPESC0AgcES+YUOJ8KnCSIqxw9b3ldqG9NN1AT1kL6+yFg3
         bHgTkN48O4xREXegr8JjyDveQnwkFPLtcsEBzZ6UXpTwXlmCjuNyIM/4ptqjvI0Smlo6
         qJNPjphgDbCjkwoCGpYWwGmnwlUck2SrlDkhqAIVcjQBI/CiUd7Sm5JfuU+gnUF9xSEI
         pzT8LfXyjwH17nZpNHFO7+PeUU8M8kiANKL4A6f8Z1rVg6Lg3kFvS3N4QcDY0mbZf9Ow
         ntjdyxp9CnyNPcNwoBHJCT6e/bIUobhR/1rcH/k4za1pLUz3cyzOiOmSE7NHzEMFuvFZ
         RAgQ==
X-Gm-Message-State: ABy/qLYsQHjpiTYvnYcZjqNlQTWU1kaxwqJrsidiUKFMLHi2ouPLKYki
	BrrqcBvcY4bkNTrclHdk2vMbFg==
X-Google-Smtp-Source: APBJJlEkXX+6u0lhKUCduM3ZhmYqLRlCbr/LEBz3MgN3+UblUPaidJLddRGjznw021vyO1vhYVeK0w==
X-Received: by 2002:a05:6512:31cf:b0:4f6:2b25:194e with SMTP id j15-20020a05651231cf00b004f62b25194emr16971157lfe.58.1689184457350;
        Wed, 12 Jul 2023 10:54:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f22-20020a50ee96000000b0051debcb1fa2sm3047961edr.69.2023.07.12.10.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 10:54:16 -0700 (PDT)
Message-ID: <8085ac44-80a5-e8b9-818b-c187676f71ae@linaro.org>
Date: Wed, 12 Jul 2023 19:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dt-bindings: mtd: Fix nand-controller.yaml license
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20230712151042.433593-1-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712151042.433593-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_105421_940187_B3ED24F6 
X-CRM114-Status: GOOD (  10.22  )
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

On 12/07/2023 17:10, Miquel Raynal wrote:
> Binding files should be dual licensed. This file was initially written
> as a .txt file with no specific license, so was implicitely
> GPLv2. Significant part of this file and its conversion into yaml were
> written by Bootlin employees which agree to comply with the rules
> regarding the dual licensing so let's fix the SPDX tag to reflect the
> correct license by changing it from GPL to GPL + BSD-2-Clause.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
