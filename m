Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A39C5B549
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRgxwBxZuzgCsB5CWz6L582lvnwDnGgmDdhJRxyaTuc=; b=x95dVPzO0rWm3u
	ZLDpvCWQ31zxPhNuinP6NhcSzLt7lC8y6ennJU8bjIY0Tf9rK5SCka3X2XxlsVaKyip1bO3mifQKi
	2SbFGUjVMRb8pwDDvoZorgEEXUNWpu43uXIxPPHqCDQ20sRcrpd9ah6ukOcQ9DKC2f9GpbrVIpFhY
	J3NRC39jFqtBGXMNNUePmIaIIWR2qQZJzxd5nS0Mpscj6Q+Q9a9hN8n2rDjBlhaQ5xGCm5vTfgVbQ
	4RD/+rptnPXgPQ8obWpILoil274F/2Q4/JlCuz2Q58YfbHjNvdodXezmXY81jVUmMpXn5UlloFfkU
	shvI8ZS0HMRfL8PQCxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLy0k-00000006mWl-1Oz3;
	Mon, 02 Jun 2025 05:47:02 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxtq-00000006lmY-24vg
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 05:39:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a367ec7840so2635916f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2025 22:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1748842793; x=1749447593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUU4yjQrTvqgUq0fb4yEk8tqs34jddsEQOALKXieHZk=;
        b=K7yYxDotWCJjBRE09VosbuSz2Mn1Qw6G3ch/424cD7J+iBD9M8V61mC46QfblxsC6R
         jhouoleLtEQbX9soQiDMXV9rplBCqbNavna95sKAcUi8cL9dpsxu6kRb1ETR4niHyHzT
         9zVU33AqE289N9JhznoU6fTypRY0gfKRd44NgGMFzQaYl4H8Fvj8lCs3joA/yKaMZaCL
         cvdKsOJiVJXetXDTzXVzA8nfaHSfbgrXHqUCk+d6r7soMXXJIsq7/GDlxqOhLl4MX32Z
         NunMx9xirfXJzr/H8JRcypW5KRXGM8gxLdC2R/maNnTox1qaT4b7XWV1tZpJb6EtSuSa
         6Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748842793; x=1749447593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qUU4yjQrTvqgUq0fb4yEk8tqs34jddsEQOALKXieHZk=;
        b=ZZ+dhh4X4RMRluVSZUccnFynNJwyUeLWdhadAQVgWv019sINLKfCb6nSBrbVFjPL+7
         a7D4Oq/gYFi+c2GmLMaIkAuyQzMH3kuStYWKM3eb2yyKoPVkNk/UEPBRSMu8fDBLEqfp
         Q7TBYyAdrVurIGA3+WcysH9nkVfy2a5fCmw0QC+5gxc1zyAqJtQ1nUCPShy7tpXssWxh
         Mic4rhiUmCe0H1dIgfBcuku0y5dD7uKCZyzozloP9pceQscr1gZxFxBpII8zojjLD45v
         W+gTkNzvymn1IEPuehJv9WesSlWngaFJPVCZqtnYvW0LP/tr1FfjTgfeQdplT/mFB2Gr
         eO4w==
X-Forwarded-Encrypted: i=1; AJvYcCW338ETTmDhQo4og5gd3NFdnOzhIDnW/R7VTRJBm0Dz81LZBiM1fdRWJrOsR8JvwwoSvO3+HKtiqRc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yym7DMUYXQQBKV+f9BY393LAIoh70OqC1DoIbx3mNc3iPUVG0jQ
	ZWo+u6jeODR+KEsVtHfIvUXd9YgeKCth9C0QAY+TNkxO7AQF+NNAmjOz1iRSBPfmF4Aqlne3s8+
	UFsnp
X-Gm-Gg: ASbGncvStizRio2hYwKazqj279ZWbTq9rrMp4IU02rcnNL2Wrki5pLMNkit2fS4hkfn
	cAItVrGM0qT+ENf45xH4XYBHZGGjwdco//DBsF44Nd9NZRuGi0OmHf6IPG4NgBd2xcaIpmIh0zH
	2b1CSRx8kgMTNaPuScHm19AOyzm7yT74AwxLypeuTXBkPe9rRopQGLyeLq+/9gkgGCYbB9f3Inb
	kJ+6sT0/bDklNU5YiBU9iXWtcUcDdzPTPX1hQiO4v9vySEkG9rl54lffK2pLkEkUHD8EvKGMNoE
	C2zVqgGNay6gF/wD8gMzgslmCjY/U7cm7uBl1bq46y6+lZcdSTWswkC5QL/53dLdRNZ0yTJcug=
	=
X-Google-Smtp-Source: AGHT+IFrB3NbJAmn7E+7CKohDGlzu4480YD0dgqnOJr7+MIJzR3UDyo0qR0SB8S5WVDSLc5jLzhYMg==
X-Received: by 2002:a05:6000:4023:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3a4f89a7defmr7184651f8f.6.1748842792770;
        Sun, 01 Jun 2025 22:39:52 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6ca46sm13794573f8f.31.2025.06.01.22.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 22:39:52 -0700 (PDT)
Message-ID: <c21c9c87-59f4-4f93-ad8c-064471f1305c@sigma-star.at>
Date: Mon, 2 Jun 2025 07:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 mtd-utils 4/4] ubifs-utils: extract_files: Include
 <linux/limits.h>
To: Fabio Estevam <festevam@gmail.com>
Cc: chengzhihao1@huawei.com, raj.khem@gmail.com, linux-mtd@lists.infradead.org
References: <20250219130244.2119582-1-festevam@gmail.com>
 <20250219130244.2119582-4-festevam@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20250219130244.2119582-4-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223954_541147_FA08F73C 
X-CRM114-Status: UNSURE (   5.16  )
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

I cherry-picked the changes, save for the libexecinfo patch
and applied them to mtd-utils.git master.

The execinfo related issue should be resolved by [1] which
adds a check to mkfs.ubifs and properly links the libmissing
stub.

Thanks,

David

[1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20250226182400.1723418-1-ross.burton@arm.com/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
