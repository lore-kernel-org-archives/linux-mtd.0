Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CABCD5BB0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dB3v6Usee4sFRQrnM+yrj4ZVSfZOOEUlQ9rz8vjZG4w=; b=1bPoCTzEecmLdR
	NW57AIuyTqdEKnjrZA1/9U2G13zVGDl9PE26oHldZDdwxwPEpYGzYv9y1iTpmOmBJhesvwkUrKBU3
	3T8ooOvqmwT/2AKsMQXRPXnj3cPxNYqnMKxLBhnhI4pBSYFRfn9BPlp+klDLG5XTWHp8ztx0BrJsc
	/L594tz9qI6vlgyGgdUrUNmlwspjbAQmRHulNO6J7kMlvmPpfTkl7W8WYj1vzvWYnt5ju4+b/lfko
	Jqn1ydSh3kI3lAqQVx2YKeLuVm9mrAAgCsgb3jcusUikGl0fp9+cSImfqHiReXz5rPBh+5EXjt4ED
	22CIuapCDAZs1WDJOhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLu8-0000000AHfS-27QT;
	Fri, 22 May 2026 09:10:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLu5-0000000AHet-3e3i
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:10:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so39698505e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779441048; x=1780045848; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQd0/PSDd5xChvfuHuigysCKmbERS12h0RRL2X7HT3Q=;
        b=vNphkNpl9Sie3QJ2LMU/5eZW6bqLUMeWU30b5AyDLA7V001UaE5LL37t5JnlBuJld8
         ie/RneIwHuKYE0wzaEim693emFQCn5pM16iVXdeqba2XaeX0u89DCcaMVhAB4aPPPZTR
         Fete2X3C5SgQ8tRcwGxiRpLZjR7h2gPEAsgAJRk62ar9Ur8498dlxbLXnuzR1FA7tm0n
         t4TLEk7azxdHJ2ORZmWerf+rgJVVClJLwsNa/xjU3wwKahnSiOlr44oirmQqFRMUXvjG
         0APhNxSaoiGS+lQvpTBn3utaRJmw4JtpvnpKbdDiTQYsDype+91vlv79Dw0LnifSJArr
         cEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441048; x=1780045848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQd0/PSDd5xChvfuHuigysCKmbERS12h0RRL2X7HT3Q=;
        b=tPOM6cIwxBIUZ0zG7gQz5+wD3AMu9B3xmi5IyAJDzdIP+1/qY1OfqkYj2OwXihLeWM
         0RgnrEjZgCpFTn/KWZawgqN1V3je/eacD0fzCPEGlYH5T99NCkEWvARNgZG9H3sWKB3R
         LssLPSXXE0kBoHt+c5Ssrx5eziu80InPqVfHA5ibaVn5h4DIlp+jhebvaIsoVhi5OeYW
         t12o1wUJhHnGdFedsEr0I3ltWypUiworo8mjy+jcKcB+uaxCU2tcCu0xSyk8m2rii6Bi
         ardzi0i5h8n+vxFsFfshtZLdZEhOu+24t7HvCmS/+/6MfyVGwRNoV0RKxW3CHv6sBFDr
         KlKg==
X-Forwarded-Encrypted: i=1; AFNElJ/igPv0++19yr7KF1G5BTR4hsCUARBsXw+mhWdbSt6pn+7OiswSxZpcOxLLontSX9seMslGyDnhWXY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxM7q08f+pb51FuwSwMJdhP7YBp2DbTttGqKxvwyiqWtTMIu/y7
	j6lOjuh2ix/SvEbXGuxBR3U2qX4aPuQC2CajRey5SN3tG3gTeEIrljmRvuimdmDu8Tc=
X-Gm-Gg: Acq92OFRa/8JzNLZxNbzUV+ZcW+E1rKA2Sh+6TaMPmaRUa4hBgnnCRY9xITb4mg8ohv
	dn9AygLvm88fAF6Lx67lygMvi+w5UMLq0RZaMU8v7xbTz6oItFI0DZVOIO+tJJ3etfWpzUZUkbi
	pA/BHlkKf6goArVCrlAt9JgVlpyo1m/0v1lZxk6+uSKHicdS0NBJUawry1jMNdLNaQyhYskMTRh
	3NpfgG7g1WVmRRljX1r39TvTw5mVHW1TGQub0tY5CGCrixRGvUSVdkX5MyN+10LGEKVVWlswP1X
	DlceXSptyzp/Hf+kQcDHN6A5B02FqapYzb1TpkrLzs+VHOxiJdXgLo0Qoypxnxkv9MeO+Z7W9xY
	HyOJM4gwaZpaYtmbjq923vUNAchVpASarREB4uWXcvlEiSEWbSs5S5TawwbbcaVtuZDdnbND8sf
	LXdsx5wsMp+xQxZZOeA3BQL0RBvN+0ziw=
X-Received: by 2002:a05:600c:c4a4:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4904225fbdamr31048875e9.2.1779441048168;
        Fri, 22 May 2026 02:10:48 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527f7f7sm50431205e9.7.2026.05.22.02.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:10:47 -0700 (PDT)
Message-ID: <9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
Date: Fri, 22 May 2026 12:10:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_021049_918600_50E1A3B6 
X-CRM114-Status: UNSURE (   4.46  )
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



On 5/7/26 7:46 PM, Miquel Raynal wrote:
> Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
> Cc: stable@kernel.org
Fixes shall be the first patches in the set.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
