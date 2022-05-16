Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431CDC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWcNRL84GietEvUKI2OGUryQyLjzcV31u3oS+DVtCqU=; b=MpDY2OWkX3dHuq
	Y+f0dPnZhtjInzS6B4XMjkZMe2qukF944MOPnIVQnRdPjOxu458XSXwarTHuJ6rjzB+ONAwgxeHxU
	2tEOCjjPD7KT8lCBAytRRIjtoYTdS4uQ6+BoC1VBF3x+CAfjzI8aDZHim5uxDEn8IGY0BEfoMkZ75
	V6uk0IsoYlnlnbxHybi8ohY37xPGDOz3NBFwpA6CsoabkqvEm7HK1yWy3W9s4q9aLtoQc3Nqlj62/
	YohZsAXJ40bqAdl4AE2hzSxpOq0dVv/l/9+JqcFg5AU/vnFNbXnrnjPgzE4Rp2ZhAuH7qmJNoM4Io
	QAd1VN4gzzQ7Ticb3svA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqcor-008hy6-PL; Mon, 16 May 2022 15:39:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqcoo-008hwR-JX
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 15:39:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id m20so29412016ejj.10
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2022 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QeTzlSoKejIzpA/CAduavQTBSJGaWHTM+6ACJIUc4Ls=;
 b=iBUVsMo1tUy6ku2kKrAq06P4tNuRs8L7DuSuMJsMffIfw9EJq0At17N3EFzXWo+W89
 h1VRgjMAZCz/Tdo9TJVCB/EK+j0UB+Rc7Q876XFYXzbKhKdz/Z+z1lq4+aDYyKo8pXPv
 nOxdF1itJEz5oF055uiMM9uQRD8OBFIkwieOa+/CJMxUzc9eUZPrw/cIniXG/1TpBeIQ
 nXTs90Xi184cLv8dN0lQ0mtlKDZBZKle3MwTS3X70U77kfBgeJsPl0UrFU23FEUhavRm
 JIofXbf/FQdSA2DAyP/19uvDNwfeTyn7TJgxtAOa3hWQaDTLZqgxa2yRCKTlrZkfHAcn
 EvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QeTzlSoKejIzpA/CAduavQTBSJGaWHTM+6ACJIUc4Ls=;
 b=52Fj40WD7pACJubWZGgmpGlQrJHh8eYAOl7t8MS2/Vag9QofcwwO4sV6VQP5ZK7/IG
 QM08PMp9WjgLA8JMV5xa63Q1WIPz2iJzqDm49YSa9tdpeId/zjPoUaF8E7htNJ6BVYaf
 SE2Zhw7TMSobmRTpzshGqM+R4iwpnm3BWAkRJv/ftkUE4/bDLu7xnaZUkiBNUpxPLwQq
 9xDl8YTJhmlDXH8ffqcX2K8WjbnVLflZzhSc/0K4IfwIVyOayWtHcFChYHYEXOEK+WfL
 iPWkE02QLsg5YCN5m5e1rpAOBriCehzkO88m3EF+MRPsbVE1cRgnvea7gVD9rnfVS/Xp
 H/lA==
X-Gm-Message-State: AOAM530xdKtQSBxBPGlGSD7Tp9Y0n6HdsRXnJMMdjDhxROCzFvKZOjuF
 SLaEQtGJC8WGtiaGKoJ7Kbw6HQ==
X-Google-Smtp-Source: ABdhPJzGGrQoOSmJ9vD3CMkYO/M8Z/D7CsPSwd6YiSuqRc3ss5QTTRcW0bxHqNKD1ofxAe9kVrTeeA==
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id
 nd20-20020a170907629400b006e10ea474a3mr15582068ejc.168.1652715572978; 
 Mon, 16 May 2022 08:39:32 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w26-20020aa7d29a000000b0042aae307407sm2287770edq.21.2022.05.16.08.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 08:39:32 -0700 (PDT)
Message-ID: <e35ff2c4-e6a7-29d4-a0c5-aace840a0c19@linaro.org>
Date: Mon, 16 May 2022 17:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: partitions: Extend
 fixed-partitions binding
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 MTD Maling List <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karim <Karimdplay@gmail.com>, M <x1@disroot.org>
References: <20220503155007.2339847-1-csharper2005@gmail.com>
 <20220512152725.244872-1-miquel.raynal@bootlin.com>
 <CAL_JsqJdUm4p9qAq9dLeVTVC9PA2q2SP01kG2jyEb_f=Fo=bEQ@mail.gmail.com>
 <20220516102115.4ab6fada@xps13>
 <ed853a8c-f1a5-d137-e2bb-df782d43b65e@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ed853a8c-f1a5-d137-e2bb-df782d43b65e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_083934_690715_912A0987 
X-CRM114-Status: GOOD (  15.12  )
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

On 16/05/2022 17:34, Mikhail Zhilkin wrote:
> Hi, Miquel!
> 
> On 5/16/2022 11:21 AM, Miquel Raynal wrote:
>> Hi,
>>
>> robh+dt@kernel.org wrote on Fri, 13 May 2022 09:12:03 -0500:
>>
>>> On Thu, May 12, 2022 at 10:27 AM Miquel Raynal
>>> <miquel.raynal@bootlin.com> wrote:
>>>> On Tue, 2022-05-03 at 15:50:07 UTC, Mikhail Zhilkin wrote:  
>>>>> Extend fixed-partitions binding for support of Sercomm partition parser
>>>>> (add "sercomm,sc-partitions" compatible).
>>>>>
>>>>> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>  
>>>> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.  
>>> Patch 1 is a dependency, please apply it too. Without it, we now get
>>> in linux-next:
>> Only patch 3 was sent to me/the mtd ML. I'll drop the patch.
>>
>> Mikhail, please resend the series including us on all your patches.
> 
> Done! I sent the series to you and mtd
> https://lore.kernel.org/linux-mtd/20220516151228.885222-1-csharper2005@gmail.com/T/#t
> 
> P.S. get_maintainer.pl didn't recommend to add you and mtd that and this
> time. Do I need to send each patch from the series to all maintainers of
> all the patches in the future?

Yes, entire patchset should be sent to the same folks, same maintainers.
Otherwise maintainer should assume patches are independent, which is not
true.

Exception is for large patchsets where we do not want to spam everyone
and these require different approaches. It's not the case here.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
