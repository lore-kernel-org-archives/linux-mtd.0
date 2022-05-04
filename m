Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8423CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKzQIrS4oJDKd9709QV1xv59IBANKFH7qeCpZduo+fI=; b=gur2m4C5JZ9jRS
	VaZvsv6ycr+tnbmJG2XXH0lCbBvAJFa85vZhu/cIK5hsl90JuzYzFwFtf8r4jLJQVd7RNSHdrprBu
	9w8FfDBep/oQ7Niii7wq31bJCLTUlHzo9yqIwz8PxkQ7ZvHbIJpgU1bi7Ot/OUhrSWGvTxLg0U6OW
	6Rua5OXsag5+FJM7tfpk0cTDf7dKqz/G69lmkBSe6qd+cg/vDeOHmD3ZXXN1ljkFJtKw5UzG7aBzP
	9uAsZ/6UlY76aqvMxT6wwzurn9kVc1dATyhTKMQ0k8ZhRa7EuoytsbwRHcogPgR8D2MBr1FvahRWZ
	mtZk+PgiCE5xpyz4TD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmGbl-00BMAO-7M; Wed, 04 May 2022 15:08:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmGbg-00BM8y-GV
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 15:08:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id a21so2057554edb.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mYhHc3io7+EcnhLKfT5KHQo9CUo/I52V7+vAalDTDrc=;
 b=Pry1zIOhMcROdxNXGEJVcdAcgDOuaV5OGaAkCvZDv17g4fuJyui/y6CYLUIb6VBgVi
 gL0OF2zlO+uF0xoBDkzxd5tWoaJC84c9R+8TbvTK8j3F0UrGyb16hT228bylx8qDkF5e
 xuwWtsBzwpyICd9IHxKxZBGmoPfKvQjqGwORlFKxZ/0RlZNHpXYoot2EaaGMEumhVc0y
 p4Jbd2T+vjX5Cd4fEr3FruB9EmrJTTvZKzWiKl5bTLUtlnwsuwdEIjMx8vN0xg8FhLQb
 Lhi5Sxo7LVNOg2kUwU6NuxmlPV0TRB51ub6HeW6T3/8liyo19cpVpsgcTrIx517bHW1S
 ZuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mYhHc3io7+EcnhLKfT5KHQo9CUo/I52V7+vAalDTDrc=;
 b=rVp1uR6ZiQJoXUYYMuLzU24poQLV6QJIJ7vzwIfYIwR6oVTXJUT+J8t0WDkuMyWxRP
 xVtkAX9sYeE0OtqXlQu1rghdFlF4ceATUVPur09XR3Q1dJMG4YyEw/7JQeqg9z+Pxgcl
 8Y7ZTXN4SQEYQJEePyiZ3dc4nUhVIMqn26ZzQzStyrSjzF8BKSjHyUDpBhUpi1bbUhuh
 /khyF2midH8AotJM3felIlP7BxDfGVnT2JWAjK8uC2Ej8cayuFy0rEbgIXscwpwaQBDo
 +b9f4lyqZl6rrgQi3KWp99azKPexcE8vuB2sk3r6c9W8ZTqH2XvVqeL/iHj3BJXUOXrI
 LORg==
X-Gm-Message-State: AOAM530n1qQfGHeGwuVPFcalpsmAO2nFY8hwPoiQO32qMHdfa6Zico28
 0Za21+fH3WJF9RhqcMP6AU9yDumaq+UA89kB
X-Google-Smtp-Source: ABdhPJzRgmmHymU7jVZH1CKHjC7GjVaif3hOtBorH2duyoZJ9xUDy8vVdQtDPpGjbQsN3vH3LqEBNQ==
X-Received: by 2002:a05:6402:2788:b0:426:18e3:b6f9 with SMTP id
 b8-20020a056402278800b0042618e3b6f9mr23780128ede.81.1651676876667; 
 Wed, 04 May 2022 08:07:56 -0700 (PDT)
Received: from [192.168.0.215] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gv8-20020a1709072bc800b006f3ef214e5csm5810250ejc.194.2022.05.04.08.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 08:07:56 -0700 (PDT)
Message-ID: <5a6ab3be-1d76-76f0-b5da-eecf5c551bdc@linaro.org>
Date: Wed, 4 May 2022 17:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: partitions: Extend
 fixed-partitions binding
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>
References: <20220503154254.2339744-1-csharper2005@gmail.com>
 <20220503155007.2339847-1-csharper2005@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503155007.2339847-1-csharper2005@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_080800_591906_AFF68B7F 
X-CRM114-Status: UNSURE (   7.44  )
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

On 03/05/2022 17:50, Mikhail Zhilkin wrote:
> Extend fixed-partitions binding for support of Sercomm partition parser
> (add "sercomm,sc-partitions" compatible).
> 
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
