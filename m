Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EACFC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axXEQ6wCC09dZO7+cxZfS05S+dOFReJhtzTczMeNSMk=; b=hbCTnRPwUolNQV
	DWoxu8wFXs/YZg4MMKkNvta47l2sKOUzqUk6rIT0+NHqxA+V3/Cs2w7z77Z4ytW7lXcqJZDJDvcJJ
	tVQ1P2OUsgNXZkjwrJgZUDIAb98PPvfkoOQSluww3ctKqOl4Ud5YnZd3BbuhwdPZ+2tYy3LYc0IXX
	5L40nLT+mDKugkXa8Jm8a+uQH+35BscW7UK/HSah8nq+X2AUr39Li4x2saNm0tMz2X8sFtH2SoEF8
	fbXUI0oF9HcpzlnbQLjDuSellTEHQjC8/fO7xoWSwkKuXPuym5oqSUJymSqI4fDTvDqVc3jMYq+wA
	IUpV4EBlhA3YSz1/wfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1netu4-004L89-75; Thu, 14 Apr 2022 07:28:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1netu1-004L73-Av
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 07:28:30 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 21so5273771edv.1
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 00:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R74GtmZ8/eMYWWCWuYgOVriNQWIHf2AARvZd2OkuZF0=;
 b=eBxM/YwxID4Ni/TPXYUXJJ73zHPnp4UTyYhQ3sCYniBpv6uNurbjPclVftWHUzSbf9
 UZ3u0jmE6WZMizp4tddKCCDhc0e0frrhiaULiyDULyM1QDXtPdsFcYCDX0lFc8729v33
 pVMoUGWX+uzs9MId0hz5dhuhORSQVEWxsj2uY1FrXW4HwTYgCMzvfC1JL3x4LoUb4B4s
 GWpfLnULMNeIrGIbDe2xqBW7vUgHVMGH/qsOmxIPoGK2gORcH78c4P1lSLXX1yqintcS
 2asDRRIa8CLlBishtBlGoXb2KMgD2ZM+CM3zKlxlt55tX62+db8+PIJ4yVCLBoDRsUpz
 3DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R74GtmZ8/eMYWWCWuYgOVriNQWIHf2AARvZd2OkuZF0=;
 b=LfuqrYyN8HkKrdmKx+aJ3GPfWcFn3Ta+wUa8TcTfiti/H3OiK5SNdjBdBeb3bY7VJE
 7zd+J9YxxN3EeOGwagYIJN7NllVMoYQV8B3Fx3brQSNeyFrX8JjnZ5vGQadhdMV+EM1j
 XUqNp1Jz1rHqsfCEnkOhT1rbc01ZAtrXvQxHpjvmsn8BKDPG5Mam3LvtAYw+DhSflEuj
 5aEcsPhcU2bCtM4Dn7LgPirdCxGCfdyujbHjPAz0YROjyqdpB2E4g0FJ2H9pRMrJzwym
 hSAc3WV1KEqwgmCWFGimTV5QwovlC9y7NZcLDF0ERtbsoLGxJAlRamKhY9/GiAtSZt8p
 WvqA==
X-Gm-Message-State: AOAM533VZOBW+tSrVWQggkmNrvoCgM274rXrlH9TBtaKCy9cbmvWcdUI
 qG51pgoV6NIYbKTh1lJky6Xh1w==
X-Google-Smtp-Source: ABdhPJyj2kyU0EJnWAQ1cHHp1KDTEzl7iVeNPJETiPaZWyg/RnuYYBxLn6zDHCUMhls1PW0pZNwA+Q==
X-Received: by 2002:a50:c014:0:b0:41d:5ee9:f354 with SMTP id
 r20-20020a50c014000000b0041d5ee9f354mr1514653edb.257.1649921304926; 
 Thu, 14 Apr 2022 00:28:24 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05640204d000b0042062f9f0e1sm636450edw.15.2022.04.14.00.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 00:28:24 -0700 (PDT)
Message-ID: <50714f3e-7561-37fd-7a05-222fd6185c47@linaro.org>
Date: Thu, 14 Apr 2022 09:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] memory: renesas-rpc-if: Simplify single/double data
 register access
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_002829_437518_D2A86688 
X-CRM114-Status: UNSURE (   8.59  )
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

On 13/04/2022 15:49, Geert Uytterhoeven wrote:
> For manual write and read, factor out the common access to the first
> data register by keeping track of the current data pointer.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This does not apply on a next branch. Maybe because I put "memory:
renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode" for fixes?
Does this patch depend on that fix?


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
