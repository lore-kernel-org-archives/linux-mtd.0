Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E39BEBFD03
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=NVqT1aucDabppAY/cPQwz8jsLx
	Dt2+Jzw1myL865Zxm+mVd7OobXBC77CTwDIt0rdShCyzhwl8EM1nF+VkgGUu5tk+tFHIrCtvc/njd
	sj/pTJ6TPJ2RP2bLr2B1eG73FXl+dQmjsuRIbX+7XjuA8oeRgbW07ZeeUODDclbbcLepP0la4D1p9
	XoRhaW0qu9UL6r0JuZBxmtDoEvJA0tb1Ixp3lEX0tqkGFlOTBV9C6uXWBDIzh9zvxPMOd4zonkav0
	w+YfBvfaGd3Figp5O25fwM7VIH978qCbRLQWvWD0S+PUcu0Fnl5EbAy0lln5T01QN4vOYFJ3lG82v
	+XbHCY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBFV-0000000F6Zn-0AKm;
	Mon, 13 Apr 2026 06:58:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBFS-0000000F6Z2-2Bv9
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 06:58:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488b0046078so39410055e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776063496; x=1776668296; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=Q83erhURMx9jHvLlRzyaYKjaGSes59oDVclwjtElDjaDGfZYYfcj1aCLVYwKln3Sn3
         EdfmXdd5NVhWWdiLVh9ppCUJ+LFiLyT4xQjWsPgEvkLkG9Wo5JOyjRzsO+Vbg/XFstCl
         Fq24NKDhhwVk1RBcZCvqWnSHtWnvs31iRshh37bTPkb1cohBCx6xfyTyPAAE3EZ42qos
         OLHj/e9ZIvKamALpn28V7zZmnqShzphDzTGPxKtiYtX5MX2jXbWUyUOk9dAxr3UNls0i
         b+oCd+IaNHsOtDC0E0/bjgEOs1mWWBKI43LVxL0Q28Lp1AtyO+OzKuY7P6ab/oEoLAoG
         eU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063496; x=1776668296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=OVYE1shf7OiaOwXUaKMWFxlK0hhedArSld5DwrvRCiaurJNJJH5mVi0IlVgGnM4Bdu
         Wk2yjB5Msn0BBVIfxA1BrHFcWxOcY40BrCFU0wWHswavUznlfV6g2p1e4h0mDNgBEdex
         8nb3yzHvUOM7/Lgx9txWojndgKeyO7u5k7eAqon1zc6OCBwMXiO5OFeW/oQ/+exltkDV
         YssAoG/JqPEJXqQrlWY3BM0RM/Gu98jDVHg8Zt/bj9ZLY9NBoU8+oXTChhVXlLlnMdN3
         Pn2H8pCWXx/tJ3O+C74aWAuFUiTGpZiICHlecBx0W18Q29Z4lyX9Y9N+dygXnxU3b2mH
         K4vw==
X-Forwarded-Encrypted: i=1; AFNElJ8KjXimaIBF3e6OBXlfNS63c+G8sS/yQSPLOEc33VNul63WaozSSjTKrZPcFnasgQnitf+3aa1kEu0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfxSOXVJgVeuRiZwn/0/XwU5A6bihoEFzCyGa268jsdXSGpvmT
	F1t9MJ4ZKuHvxybIHt3CGqkzmRIjCpek2a7ltb/mSvoSDfxi77PZmUn51wkctN4xfWU=
X-Gm-Gg: AeBDiev/1M6sCiyDs9kybITJoR9CFZz7aX7v45fmeJvOuzl6qz/WoQ+2l/MINjDSQCO
	qbccmRWUYzxZ8HhcSHLvZjw6DIYlL8uXoFmB/+9FAJLM9Jkf8eteXR+3sxUtshZs6zXCYv9eRFT
	iOYN5lQp/ZKnHyvr5/w6v3ar3TstVk2Kcz5rAQEuIUHyJTXJ0nzqXu8nRcWSr7oBvpesjhIH6h1
	Zix05DykPGyCuQD3MXmbdGi8gEw91gxyEDjUrnFTy25+OIbu0FV87d0SZ+YHEQX4FChW/0+E7sn
	2iwcSdKimLVp0gWmv3yiNOIskd/D0C7wo5JU6xQAS3TGjDSbqmK6tG17NI0U9CFw9Ez23WrsbYO
	f2ALvttkMmRlrkchDpDVt0yDRiUatddJA0fhUwZFFm8V1WT1oR5+av2MPCAoCPLLEU63rU6xT4D
	mkRJKmmtei7tTTjHOZzgDaNIrH+CJkYwBuNBt2QJuyHWzMqA==
X-Received: by 2002:a05:600c:46cb:b0:488:c51f:e04e with SMTP id 5b1f17b1804b1-488d67f3a0fmr165365595e9.13.1776063496480;
        Sun, 12 Apr 2026 23:58:16 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d6898445sm91131375e9.36.2026.04.12.23.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 23:58:16 -0700 (PDT)
Message-ID: <4a28fcbf-d128-4dfa-a399-24c301fd7c51@sigma-star.at>
Date: Mon, 13 Apr 2026 08:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd-utils: tests: jittertest: reject overlong file names
To: Aviv Daum <aviv.daum@gmail.com>, linux-mtd@lists.infradead.org
References: <20260318225332.31623-1-aviv.daum@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260318225332.31623-1-aviv.daum@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_235818_560739_A1DE29F8 
X-CRM114-Status: UNSURE (   3.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
