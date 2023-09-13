Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6C9EDEC50
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgTxm6j7w3VHPQvzvSKJSfq1EJPyb3KeA1DA71Wmom0=; b=YMBp3yPdKXqp+X
	S55AX6oYhkUeQiTL7a5e+H+0jZ0xGaixupbLXveEivWFclV+2XN+8/htVmc/sB+lBxTHQjHIoOhZ5
	9HMv2gwb75Xs4BpfltU+6TnaTm6iDeMbROVFluaTlnm2a8FW4epo9CBTy2P7Wkh7SPiYFPsCawZU0
	QiOoPiaLIFbUQklndhPwNfjpP3Trd1QMgAWMZLRbw//rgV8L3O6hyRbYtvDvn2cVq2tSVXT3Rl1wp
	CPoxm5wgJhAkwl3wCiL2d/qTar/VgT7gVTcwU4TOYJqBAKIYBwcg8peqNfnTGsj7PWsIMZvpV45uk
	+iwYbifJjeTnJqU33wNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPdU-005wp2-2q;
	Wed, 13 Sep 2023 13:10:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPdR-005wo3-0k
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 13:10:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401da71b85eso73885495e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694610622; x=1695215422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhylJXVHu1y/JGAQAiQbLZVjvUVFnXfhI4SjrH0o0KY=;
        b=BrXT6HP4oSYD+jIMmHXnFWunJAGzJeBx/dtE0q07RUiw47w2wJr9yJl2x9YzKxhYZf
         Fr7Ok0PUnidxbL/sSC00vczaon0fgMzx0ihDQAvN6KY8KF+AuMGLtep3veuMwy3UFJdv
         74/jGC8EfS+WnS6smKboWhaZv/29XdL6vG+8tWaAALuUji2H8Csp6MU3cUWwfHGP3dr+
         TDUFafpx77OzdcFVvm7atsYfEGD3IVrrjut2z4836Q2LyfwTP5p6/AdEx3aIrJjCh+WB
         7O8A3G3RAe04rfy5TIQ7+58yUmbYmZc5cqYIejYnjtUUrXuvjADntIJEtrAYJ8U37Kci
         8Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694610622; x=1695215422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhylJXVHu1y/JGAQAiQbLZVjvUVFnXfhI4SjrH0o0KY=;
        b=SbrIDVZRNEUe8+Mm8bTPCwvfpsu+Utl8VkT35q6UJMpu6VU6rgdLWkQyL9wFGprJQT
         BrbcVsl2NlJ7j5PsFyiKatFz4WZuwAKFGRb2CsXUri2uf+pvhGSIxvPqzHOxJlDU/vF6
         KDZ+mZgWH22R/Rkjd85u24/jxjGf5JVxzJXmYleNoFRh//jwrGtUthR/A62QGvhrPyZa
         tS+B5OZZBYCTndqGAVvfGXwvvoQ/ic0kqKtSCuVNbW5c5NfdSVXIgHDZwcWlAETpQo+6
         HSBBcjHZePgJmeTezDR0iLvige1MSZ9dSSDsgXekmjmPp81ObSEojEU/d3aWHzkxCoWe
         DOeQ==
X-Gm-Message-State: AOJu0YzsJllYLw+TQRO4PL6qFAk82Bu/92i4pV9D/YkNFS/m4lvvrbnq
	aB5HRnsK3Rmi2XeOGhgqDXhDuQ==
X-Google-Smtp-Source: AGHT+IHiJzJhe1Xrs12iA0t2UFcejF5aY0fuGShabimjAwKWm+vmmwmawqlnxHfAfdo7W9D+0o04pg==
X-Received: by 2002:a1c:4c1a:0:b0:400:57d1:4915 with SMTP id z26-20020a1c4c1a000000b0040057d14915mr2173211wmf.37.1694610622229;
        Wed, 13 Sep 2023 06:10:22 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id z12-20020a1c4c0c000000b003fee6e170f9sm1972778wmf.45.2023.09.13.06.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 06:10:21 -0700 (PDT)
Message-ID: <9486b1f0-9c5f-4c2e-9032-18efc4a63b24@linaro.org>
Date: Wed, 13 Sep 2023 14:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: mtd: add basic bindings for UBI
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Randy Dunlap <rdunlap@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
References: <cover.1691717480.git.daniel@makrotopia.org>
 <a640bb10e6fbaeef96efdb9e8b666ca39e993589.1691717480.git.daniel@makrotopia.org>
 <169263908218.2000617.16931192155432403196.robh@kernel.org>
 <ZP9kJYHMFwZ8GFnA@makrotopia.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ZP9kJYHMFwZ8GFnA@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_061025_318115_602FBCB0 
X-CRM114-Status: UNSURE (   7.96  )
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

Hi!

On 9/11/23 20:01, Daniel Golle wrote:
> Is there anything I can do from my end to have this series moving forward?

You could review other UBI submissions to reduce the review load on
Richard. I guess the queue of UBI pending patches is at:
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=&state=&q=ubi&archive=&delegate=

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
