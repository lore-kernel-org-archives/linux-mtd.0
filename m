Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C279FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jan 2022 04:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpMr3imyP+ipV8DrcZNS5OK0locuR7+tbVgOANGovc8=; b=hKQa6eHlHziMXFEq/KYPmjXSr/
	QgzS9WbNfJYgOJsdCnnpbig2XbOXcCYPoRJJGHSNQpg6F4F7jtuBnybtaI3ARwRo99Kr0/kARGgcM
	JQHavzdSaZuuIC3QEJ/ykCJ+Eqo8XxaYj2geUD1dnwkLh4cZwDdDCMlKIt9XcV1GjcSLOH8mZeJyS
	3vI3ukvOSlqFfrJHC1s1CkdGi6DfkiI4S8CgK4HQKvLtUiid72C07ZFKjt6TevCLokAmb4qnLxDuR
	k5OjpXCwlULstaIPb8fxr7wZ+u5cvmYLxerGGgMcbtvpFK28zpIaAca5QGEI1dndXsxNSIbRKgNrN
	+YVajRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7sBh-004eh6-27; Thu, 13 Jan 2022 04:58:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7sBd-004egb-H1
 for linux-mtd@lists.infradead.org; Thu, 13 Jan 2022 04:58:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id l15so7827742pls.7
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2022 20:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qAzEz7pNwCy63ZfPoKSPyc2p0TZfjxgR4mHYBVklyaM=;
 b=Ic6724BFCjVQMB7yfRCe6WmuZfUIUt6Tjp1EOAVfxEVmGqIEPZaQVTZx6q7yDhEtN3
 N0MLZNNlJqv4d+megA9+rBOzQjhOOeR6c3Dd8bzu66LMMzcTQ/11vRrjoxnn9bqEGar8
 L8YQu9lRD4bDN2I/ydhPvdQRuXRG0IzGZ2opN1scVTh1k6OHMaLDa3xY1ZT990gQXMJ1
 /mlMrRAUaYkSHumfgpxeCeGsg8Ymma4vj8OesYk8gTn79KVk2/G4SWo1hX0S5DDB3UB1
 39WIWvM2vS8/uj8GCPozt62flyHhGuxdzr6zUrMeLKJIooOtluIUDU3oIhZx9Kytn3rA
 CQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qAzEz7pNwCy63ZfPoKSPyc2p0TZfjxgR4mHYBVklyaM=;
 b=8Pc4xkO2w7HUpnEuNkV1Ignnw+/9BrChUbGjjHLp8GazD8e3gMRe6J8kL5dBxQ3tto
 ncwP+6DTon+MdpEHke7TF+4txc3cB+51EQlJlFVftciCS2J1hroRJhZI4IC2Vo92No/l
 gdd4jiyfuKsa6H0EKR7ZgNOAsL89KP0svkb+0E2k6XaqUqKxv/N/H9L8Qmn44o0yKbbI
 MLsXBBtOU8tx7ibKJUEi/L+PrQE090UK4nq61CvGx8CYzOhXKeozeUzBPC39fJYTjvBz
 6RB1h9Bz8VL2wBHj2XITVCyoVyI2Z8Bv2e++nGBV/+sGp+kFqgHB3bZ/fvvFy6A0VMpL
 4hVw==
X-Gm-Message-State: AOAM533Q+DaRgxPiVpWesmG4GutLKiDIAqOuqOHSRwNeWh3cFUeJs/0l
 6Jn2ZZEVuFXoIIHdqhrGsQk=
X-Google-Smtp-Source: ABdhPJzOv+3kXOgWFjtM2ihwJNAdvKDwuaRC7mm+y9LgXPsqwx1l53dG9s863GqIZVAFjauzGCBaag==
X-Received: by 2002:a05:6a00:1254:b0:4bb:68cc:58b1 with SMTP id
 u20-20020a056a00125400b004bb68cc58b1mr2884189pfi.19.1642049888055; 
 Wed, 12 Jan 2022 20:58:08 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 o11sm1046280pgk.36.2022.01.12.20.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 20:58:07 -0800 (PST)
Message-ID: <b6b56cc0-321b-1430-e290-9c45a1d47fbd@gmail.com>
Date: Wed, 12 Jan 2022 20:58:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC
 status
Content-Language: en-US
To: david regan <dregan@mail.com>, linux-mtd@lists.infradead.org,
 Kamal Dasu <kdasu.kdev@gmail.com>, Joel Peshkin <joel.peshkin@broadcom.com>
References: <trinity-0c92e0e4-dcf8-4753-a934-f2cc41b5e6de-1642021707668@3c-app-mailcom-lxa14>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <trinity-0c92e0e4-dcf8-4753-a934-f2cc41b5e6de-1642021707668@3c-app-mailcom-lxa14>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_205809_637272_D6B7E1B0 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 1/12/2022 1:08 PM, david regan wrote:
> The brcmnand driver contains a bug in which if a page (example 2k byte)
> is read from the parallel/ONFI NAND and within that page a subpage (512
> byte) has correctable errors which is followed by a subpage with
> uncorrectable errors, the page read will return the wrong status of
> correctable (as opposed to the actual status of uncorrectable.)
> 
> The bug is in function brcmnand_read_by_pio where there is a check for
> uncorrectable bits which will be preempted if a previous status for
> correctable bits is detected.
> 
> The fix is to stop checking for bad bits only if we already have a bad
> bits status.
> 
> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> 
> Signed-off-by: david regan <dregan@mail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks David!
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
