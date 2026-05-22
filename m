Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02443CD4F5B
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 05:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D9f3jJR6SkYhi39EBygdRIWnhlujkkBKI3XxXd0CXI=; b=z7ckRzEYr/HobX
	2yaTxjl6ubl5ogCPGmAfS8sUyIUCh+S5dmEMEw6oVAOxPlnL7GiepUNuGSCq2Z1yHnUjqMgxcSBND
	3STjDV+ZTN1RoxG5F49rFq4F466IS3NdiqsHoseTE4M8+/aJfP3arZDxm9FcGjY87G5Xu+Kk09dkY
	jFqC5nPZ+0bEszE90aK6DAsR9jqSxmsCDksC3riW26JkaVJAcBvzQAWp8hyBpIPCTK71UAjJHqjJ8
	EC2m/C81IcWTfQRy8nAUliiFr90u4QUJWMjBI+9vZ/UPSZnl82Iv/mp099A2FpktWYhyj/EWfVUdX
	wXcj+jWJnKJPbajjJpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQI4M-00000009oWG-3KNu;
	Fri, 22 May 2026 05:05:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQI4K-00000009oVo-148w
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 05:05:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bab82d75fdso34288355ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 21 May 2026 22:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779426307; x=1780031107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aETJDja9K3TqRGpyfdp+X7MBJ5hcPHB0R3KSY3PT/rA=;
        b=tF5gXWI7/soksBVEjWsXOEUKI6/82ohFQ4p/CxqCcsCAZSBzaSOCiSyzn6Cn726A7g
         COEEWy7mxOW6Srj8UZqbftpndCh2TlcOzut3b8FiYiLC2XKNhBhWoszAudif8KI2eX5w
         W5UyfxI8Me5zwMdcS6p3S97poNxQoj6qGweueGM/0M5AqtpEg3KnbjCNY4DahBZh8pAX
         V2Ao0s0tNb4MiuAFe/sFxZD+4ztWqxiaMb3wbHrtwza/7f60qMZ5nFjKhzvRnQqCXC5T
         uq8Ntl/86DhNzZxpWgzRrygjfossCaSkNaF1EZWJJpQAXY3IA6Ozjqm0Kj2YQwqwuSJE
         NYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779426307; x=1780031107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aETJDja9K3TqRGpyfdp+X7MBJ5hcPHB0R3KSY3PT/rA=;
        b=gVMsSY0kAtCcB9jYP9to9lFcrMCdWc9izZ1ltw1Tjo80o+MKPFajGawDKhuPEng6ku
         65KSXv8S22DCXYUKPBc4m9GQD+XVc2ROcTtMa8S0u9BN1zLo1neFgVgIYfEDOcDOUHbv
         q97mPuE0Hb8LPQe+jm6+ix/CNO3dikA7e2iTVDkT2K5X+MJbZFsBWENtBoaSPPH0qqF4
         z8OUfRFZ2AqUQ8G9ywlcGsdzB90T3m/Ck5trTfXYnO0ucOI4uyjMLRNpBrb2qsVpejiP
         W652WD3M0pxB/DoRtkD+rOnRldT3bLMsDJuwzxSEHenor9DdooNqIw4fmv9u/LsVda2s
         H2Ag==
X-Forwarded-Encrypted: i=1; AFNElJ9/WS3jmB4Hsyo8kQTzvWbKAdVINWpPD3dF8ds+FxkYXcdJSMNI/f0LiRqcFMVQRCnZpgCMy6u1Hgk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9oTKCuGI8yw5Cbd5C1eIcBzKuY8j6oghO3qwcwBtTzjynPxO3
	SYeXP+Ectu5TMtlqGmXhALzLHo2+pdfGWARHEG4noSXMZ7ZPUJ8icLPh
X-Gm-Gg: Acq92OHT1OuPRPaE+t0TfDwuP5UClNWNPgEONVl9NGY+3loF4u5vosbnU/ROXcOWKTu
	mBTopEFH8f/dLxKqyAg5NwvEswTphoEEjgW9p49ahLlL9QgmKft9wH0EfqYhd81wQdWhbXdz9V+
	6R1WPO15HDAZmfT1z4dK+d1pk7jLaKAkq6x9A76RLLb6iHvN48Tb5qQLN3JQSzbfaWMohsML54O
	nYUPsRvT/ytfPIE6T48fRFQf1tdOuwhB3vd6YghxifdlOki+iM/7JS3uARm3ZlK6glVL8qBDrQR
	bFoqHeCXDOpXtu5FsNu4+GH4E1EnjpSFAxzC7c7Oor/2GtV8o6A6B48goUFc4EjQ3JRbU3HLnnL
	rVwxWVEv9eBhr/3m2m52xV+Q78MaEp4jPQmQbmq7+05ZN0oygLq9DCkuB7eiS09KnHEN7hQKPxV
	AwBiwgw1vzMlvPYr8qD+w2j8J3bwM6RbevlFPyFXoly+9UrwV7o09hyZYT1ST1+SjJ0Q4KJDfBI
	Q==
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr19272635ad.5.1779426307412;
        Thu, 21 May 2026 22:05:07 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56bc151sm2923185ad.24.2026.05.21.22.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 22:05:06 -0700 (PDT)
Message-ID: <a2c0bcc0-5cec-4243-b078-ccee5c64c378@gmail.com>
Date: Fri, 22 May 2026 14:05:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
 devices.
To: Jeffrey Yu <jeyu@issi.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
References: <LV8PR19MB85975F9583F7CF7616D5FF27B6002@LV8PR19MB8597.namprd19.prod.outlook.com>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <LV8PR19MB85975F9583F7CF7616D5FF27B6002@LV8PR19MB8597.namprd19.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_220508_302354_1B8E004F 
X-CRM114-Status: UNSURE (   7.59  )
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

Hi,

On 5/19/2026 12:22 PM, Jeffrey Yu wrote:
> Add JEDEC ID table entries for additional ISSI SPI-NOR 
>  devices.
> 
> These parts previously not yet supported.
> With these entries, Linux software can match the device by JEDEC ID
> and use the existing ISSI SPI-NOR device handling.
> 
> Newly added devices include:
>   - IS25WX256  (JEDEC 0x9d5b19)
>     https://www.issi.com/WW/pdf/25LX-WX256-128.pdf
>   - IS25LX256  (JEDEC 0x9d5a19)
>     https://www.issi.com/WW/pdf/25LX-WX256-128.pdf
>   - IS25WX512M   (JEDEC 0x9d5b1a)
>     https://www.issi.com/WW/pdf/25LX-WX512M.pdf
>   - IS25LX512M   (JEDEC 0x9d5a1a)
>     https://www.issi.com/WW/pdf/25LX-WX512M.pdf
>   - IS25WX01G   (JEDEC 0x9d5b1b)
>     https://www.issi.com/WW/pdf/25LX-WX01G.pdf
>   - IS25LX01G   (JEDEC 0x9d5a1b)
>     https://www.issi.com/WW/pdf/25LX-WX01G.pdf
> 
> Signed-off-by: Jeffrey Y <jeyu@issi.com>

Same title as [1], but different parts are added in this patch.
Please use different titles for different patches.

Thanks,
Takahiro

[1] https://patchwork.ozlabs.org/project/linux-mtd/patch/LV8PR19MB85977D6569B526DB1B068CACB6382@LV8PR19MB8597.namprd19.prod.outlook.com/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
