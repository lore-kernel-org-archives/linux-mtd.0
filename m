Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C48C4167B
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkSqbZhXbSsLREEQYLkj/f0nqvjrsyzaeVrYpFpiLWs=; b=J0LfbLkh7+rE7eIIzv9Z2jZ5wI
	iVMw8Cnl3JBMu3mLTMcd0j6ZHg8agMLmqeKihMVB3dREHL5cLi3WIYI2GRGdTGcNT40Z+2h5ivzL4
	AyTNdZFmIbp3jg1gAXRVHWTIenaByzXanSCr3NP0prpTfmRXa+mrKgwryesRDOVEVa2exWMivinPE
	KYkuwbyV7KMjM9GL5+/x9OlOShsRiADFC3w45U+q+vrlZubyeH2YRpFBmRwMRfHd8263YTe6KO3xP
	oSb3J+nZ456BobajZcTloCK5Z78hj1GLVBSXNGAcgWA8nRlySlbYtRUeJVIU4EjHcyi6fIcuDB3qG
	ZtxOiAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wNP-009Xep-0g;
	Sat, 25 Nov 2023 17:23:31 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wNM-009XeL-2f
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 17:23:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ccc9e6a38aso241731b3a.3
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 09:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700933005; x=1701537805; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDUTsUlCkDvcgO/1HiIFUUzS46a8U3qY3WYodL061Xc=;
        b=jcsX9D/IpjcrkoUtXiq8nln88buvu2UyUJFMkoF48BtiBAIPkySbZ8rfebkgqCNpnM
         WylwAxX48Ofg2DSXNG6KFOV3Z941t/pCgor9SZ89r2oMPZR3aHVUrKyeKOdN6IcraBky
         wpUXiZQLf/KLK1io2Blf02H4Cry5MMpWZTu+BP7PG9v98FfHe20mPH4UxiaIVTegfFaG
         ViG2Dnku8GLQSRG5cD5fM2Simgdd4Jevkwt1PH9y05t5/McOYkxZTfJiazDNo3atC6kK
         WeAYO72Qc1kDsAsFR6UbAO06Puup3MchwdrBHx2rE1zf913LtU2FlqZnygZhjpxAKLQU
         EUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700933005; x=1701537805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDUTsUlCkDvcgO/1HiIFUUzS46a8U3qY3WYodL061Xc=;
        b=s2NU5/uD55fb3eDgTh43B9MyYz0tWfoDGWJhKr717RhHfK3J1C1Z+JQQ43CwT1Mu0i
         zBB4uFxd2415g8Kpyx/seyJQhaU6xEbGHpZr+tHtKGgT1kQsj5+rSwQV9QN/D5IFjf5Y
         RSb7xcpHGgG+t8GmhSAEo6xWJqhsnqVHs/ybJgsRmoGQ0qEIpRL6dhBjAIqsDH9ZKQ+B
         ZSrMgIz8+4UDwIJqOPG5Bz7LyWUG32LEq6FqedlPEx63j+vEX/CB4UNgH+BoH98uJXfp
         4LAF7vtc0E60YOFDZVcoP/ht7FPKYThI0Nz7MxmmxtFfSbb7gYPw/tYQlTd6SOTQW/Hm
         +eQQ==
X-Gm-Message-State: AOJu0YyKeYk3RvTSX2Tk8GW3crF8sw0VpTCwYdUQE+jRJ8XRUbtbztNm
	Ufhv5XQIlfcs0VGt25DKzyMYhhwOHF4=
X-Google-Smtp-Source: AGHT+IHJ9YnnPv6Tk6Tt6tkzJ6FPSAgX+0xt4tyoteGeKyNLP43hr6ewFFSoozZmKAMZYgy+z7FlKg==
X-Received: by 2002:a05:6a21:3399:b0:186:de1b:663 with SMTP id yy25-20020a056a21339900b00186de1b0663mr10083894pzb.28.1700933005483;
        Sat, 25 Nov 2023 09:23:25 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b0068be3489b0dsm4721079pfo.172.2023.11.25.09.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 09:23:24 -0800 (PST)
Message-ID: <7497c676-1c81-4363-913b-4e26ac33e6a4@gmail.com>
Date: Sat, 25 Nov 2023 09:23:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] mtd: rawnand: brcmnand: pass host struct to
 bcmnand_ctrl_poll_status
Content-Language: en-US
To: dregan@broadcom.com, miquel.raynal@bootlin.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 rafal@milecki.pl, joel.peshkin@broadcom.com, computersforpeace@gmail.com,
 dan.beygelman@broadcom.com, william.zhang@broadcom.com,
 frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com,
 JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>
References: <20231125012438.15191-1-dregan@broadcom.com>
 <20231125012438.15191-3-dregan@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20231125012438.15191-3-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_092328_886326_6C0D96E5 
X-CRM114-Status: UNSURE (   8.73  )
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



On 11/24/2023 5:24 PM, dregan@broadcom.com wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Pass host struct to bcmnand_ctrl_poll_status instead of ctrl struct
> since real time status requires host, and ctrl is a member of host.
> Real time status is required for low level commands vs cached status
> since the NAND controller will not do an automatic status read at the
> end of a low level command as it would with a high level command.
> 
> Signed-off-by: David Regan <dregan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
