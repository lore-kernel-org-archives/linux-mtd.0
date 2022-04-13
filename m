Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE19EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/prJP12Dc1IwBiIV+zOMFdXDNnmq/t+avjxKR7TOW8=; b=ysMBC8D4VM12I1
	XJC+ba3KAR0zPZLLv9evVIMJlsvFdrJ4IIXH+ZHGEVlNHhlUR1U7pCHVE2vHvssY4vvYq9l9TKBbL
	m4QBWrOLI+F2v2oWIyjhzwFmLFcK/1RkQh6qrUDd2hEWZlSBtpi4LgcIXgFCY+IF9Iu62ZU1YntEl
	DOZ4IhSnrAdC+Ydf2BnEBF5H5cN7eI2q1Lzzqxr0P7BGkvE48rUGueCIZMhqlbOldOyEovkVpyxoX
	wui0PDxQsEBh3k0Ct4Eh4iwHfaQ1WhyPd5q8XAmD5hx8X9hx6jrZiHk0554PrPCvLp3UTzO8+ot8B
	36VDL6qpPw5Pwi024c3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZgk-000RWH-8V; Wed, 13 Apr 2022 09:53:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZgh-000RVh-Oj
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 09:53:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bh17so2793001ejb.8
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2022 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vp9K+8Hl4/NfsYzNXBDKIhozV5SgmyerqnOmyR+rh00=;
 b=e8xdp0/auxVF/syVgSVHQFmbTch2hhK5Xh9aaDtS6tDhKPK1XilTbW3hqYJFYQliOO
 sKqX23UAyha4hpBGY2LpsYt+HlAfRDDLaGpsP6epuDOtpeORPHO8IrS2iV5JhpJhpFFK
 6G2th66uz61Sv8h9MyeJF9ckVpHz1fzEquPa4BKlGenQQh8GEANtGBhsnpCo0bQYAMHt
 6qVWQbINvpuyUsPBq/Z4djh8JSGr2TFLgExlElb98KmPW35VckG/DBRSI+r/5Bnu3jvP
 d3iFwroziSyK1YquB0ypHxGtY17bKByqdcurS9oScVEowfimZJz+9ji2Qqph0qSvv1K7
 dB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vp9K+8Hl4/NfsYzNXBDKIhozV5SgmyerqnOmyR+rh00=;
 b=l2nqlhQuBhPVcVKuQjG80FcLc2/w5WM5sFGYpjEW8Bo3oEMuNxiM1zuAbM9KVIiBNc
 M/dvfZibR/W4SFSS1iNACYQnv70GsgikYBDgzU2uHDWAkciR8Yis+hoHFTywzbLSpJt+
 Q6Jgs/8nD25418vjaswoa4LQMSFSYeLR3jmYgSjMHB2+C53cLiyGE1TuFrreNuuOF1N2
 KkvHv0B2U8K8p/fTw7PIfHqSfH/5ntLGB+bE9OLH6SOvosDzqNlLrOUdLE9S5XXnqJqx
 JpadtXr6NCY0n6SRYuAdT0lCDy6zAEzdDfQ1oEQhpezZYvXuYDNdgvoH5ZRykMsKzTy8
 hkCQ==
X-Gm-Message-State: AOAM5325tUxEjnig8sMK0nJsGyuB7mWT5N/RrP+x5SYgL25TKkXFwrkk
 GTEe58PwJK8jvE8UpIEi1QbzAQ==
X-Google-Smtp-Source: ABdhPJybwN+GXtG5z+gqsAv8zWtLVN850stkyxlqVGXwWhY95IkEqpMLUEB90jUjvfeLJXDp3vJKmg==
X-Received: by 2002:a17:907:3f25:b0:6b0:5e9a:83 with SMTP id
 hq37-20020a1709073f2500b006b05e9a0083mr40143493ejc.659.1649843600618; 
 Wed, 13 Apr 2022 02:53:20 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 kv22-20020a17090778d600b006e8a072fb1dsm2539456ejc.172.2022.04.13.02.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 02:53:19 -0700 (PDT)
Message-ID: <5691451b-a2a7-9ac7-abf4-06e4ed804db9@linaro.org>
Date: Wed, 13 Apr 2022 11:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual Mode
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>
References: <cde9bfacf704c81865f57b15d1b48a4793da4286.1649681476.git.geert+renesas@glider.be>
 <164984328891.36085.9849925261305937604.b4-ty@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <164984328891.36085.9849925261305937604.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_025323_854207_1B983351 
X-CRM114-Status: UNSURE (   9.80  )
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

On 13/04/2022 11:48, Krzysztof Kozlowski wrote:
> On Mon, 11 Apr 2022 14:53:45 +0200, Geert Uytterhoeven wrote:
>> HyperFlash devices fail to probe:
>>
>>     rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed
>>
>> In HyperFlash or Octal-SPI Flash mode, the Transfer Data Enable bits
>> (SPIDE) in the Manual Mode Enable Setting Register (SMENR) are derived
>> from half of the transfer size, cfr. the rpcif_bits_set() helper
>> function.  However, rpcif_reg_{read,write}() does not take the bus size
>> into account, and does not double all Manual Mode Data Register access
>> sizes when communicating with a HyperFlash or Octal-SPI Flash device.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] memory: renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode
>       commit: 953d7e7cedb49fec97807166be6fa1ecec1cf0c4
> 


Amended. This is not a proper tag:

WARNING: Unexpected content after email: 'Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> [QSPI]', should be: 'Lad
Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> (QSPI)'
#30:
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> [QSPI]


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
