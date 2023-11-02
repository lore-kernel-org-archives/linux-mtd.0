Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E34DC4167D
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJpK7kQhSXriPYHfB/0kFs3s0qBxyC2+MP9Mhe7gnzk=; b=AAZ7hldM1McSts
	dMe2hpmStB0nxFSFtdi5HrbMQmyA9cy6m0JMgvY74oHz+pxGW7v2pWSg9ublhdXLDqoaylOuWjQjj
	G1YQzbBq1n3AhLOpBJr8+fG0w6fxw7e7lOGCU1/9nmyNqFiYjF3bUM3mwtymyCa03FwfcwGiyHubV
	tW3Rls5+dbdOhSjef77wslItAHWQGXYSLCePYJ1L9QOKLM/mzinDy4Q6nYjyA0GGeiTBvZG1hP5hV
	5UjC5ujNgZTC9YGgziFzOYJbONDCnZt5jha34fGVIcjlWJNemR4Iiqw1FNEDQ7ConJVmtmV1k9cLy
	5WctSMfljUsVc/fbpCuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qybz5-00A2OQ-0c;
	Thu, 02 Nov 2023 17:59:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qybz0-00A2Lv-0p
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 17:59:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-991c786369cso196571066b.1
        for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2023 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698947992; x=1699552792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=armVh6XIZg6sHBGuhenoSiRd2wtQ1ljaxseUfoDZvz8=;
        b=vJolev0rQUcfPVL/DRJulnUyJDiJGHMrqG2edO2w01uXj4ahzOELqBQXDyt8tm+RHF
         9sZ4E2dkm11JTbRcnBSgNXJcTdDEzXKtr/wWc9FNviW71FAo4KWwxaPLGs5AM0MoBs8a
         viW50s4ZHkMhVG388oB3xwL0o5DLDQvlTY8U3ioNud0sszFNOK/BqAIEcA1OqnBF5Kck
         EYJdZjZEiMPpzlBFQOR1NomA+6cC+M5iCx/6FQJDZIQ3gw/WAPdnt55EO9vXD6zHrNcQ
         gYSqgA0X3+5TmM8lYIqmtTHMJjcEPAuZJRDQlGkoh1Pe9aSRVtmh2S+PsN7anOsQP4yz
         FcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698947992; x=1699552792;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=armVh6XIZg6sHBGuhenoSiRd2wtQ1ljaxseUfoDZvz8=;
        b=VHOmFKcZhitMhZaj6SkmbIRLOYDiyZGz7U5s9OWOdvwVBzhr/1wK2ECMEie5Fq+EMW
         HoKoKFnzSoEBDug5fw14xZKJv0D/gLXjSoLCNDtankIOGr0cqjX4guk77Y2FZrP7ol0B
         XHRGjsc4aa6n4zYremQ0u8cAH8E20qg65qkjhpbkYTRs6/s27yAv4IEXvnjKhyTb0bWh
         usgXFCJxDmQoZHuLC5ien/0WWGPIX6ciLAmNDhc6n8B1Wf9OHs1IJIXWWJxafQvALHww
         XetJxIvZJR4LW8e/YgVI0LthHxGVp33sass8nCj4UxeWCd5BYJFK/tDxJIPtKXcjhXDN
         GQQQ==
X-Gm-Message-State: AOJu0YyI3k8Yd4Zp7sF+gZwzR9v3EJs0ZhWY4hPCrLrBfUzN2INWH9yP
	ydACG4SpdyZd4h+KpSzc6SG/lw==
X-Google-Smtp-Source: AGHT+IEeSEn+AqKnDi7+NW2X6vdlnl1wK6nxc7A+qVp6abDNSuZ/iXDKH7qmTgejGoL+x7t4cgahcg==
X-Received: by 2002:a17:906:ef0e:b0:9d0:4b8f:3da7 with SMTP id f14-20020a170906ef0e00b009d04b8f3da7mr5267054ejs.29.1698947991914;
        Thu, 02 Nov 2023 10:59:51 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id hb9-20020a170906b88900b009adcb6c0f0esm1411720ejb.193.2023.11.02.10.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 10:59:51 -0700 (PDT)
Message-ID: <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
Date: Thu, 2 Nov 2023 17:59:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Fabio Estevam <festevam@denx.de>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
In-Reply-To: <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_105954_294858_072C3DAA 
X-CRM114-Status: UNSURE (   7.50  )
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



On 11/2/23 17:54, Tudor Ambarus wrote:
> Does this help?
> 

I guess not, because you used the full flash erase in the first place,
but still a bug. Ok, I'll add some prints.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
