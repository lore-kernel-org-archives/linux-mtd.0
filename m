Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539A7C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220A92173C
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zbn+c+v+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0ou+vsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220A92173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iK/jfmsknpBvWRkNQYH0DkAJF2VizRo4VQW662uaDm8=; b=Zbn+c+v+s15dR2
	jBffYApbnunUgDL+JXSPdUcgHPzRb3AsK3aQrUeh4QVYloN6z1VdA7t4pIVDHZSB7iLovx9eF4S53
	ev70kMvigY25feZIsC67K3lmXNsw1uEUCQUEy5B/MnKESOecaHNAT5Hm/E02S2Jn6cubCoucR+Scr
	Ia1TVsC37uxu6OCZhZ7D1ogYdXLW89iIW7YOZkifCCQd0BIh4QbU7URQ+BN6AjSTVXdfgp+w7iQIC
	54FifHepT8e82qtk/uw4U786/BUhirNFc1yOzNemGpoqmVsE0jmeF+fBRfL2RoN6vd9WwJyYcjQSa
	PehSVf23cKrfAZbSA9/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9h0l-0004sb-6y; Fri, 29 Mar 2019 02:12:51 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9h0h-0004s8-1B
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 02:12:49 +0000
Received: by mail-pf1-x441.google.com with SMTP id e24so262634pfi.12
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 19:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iYRmSfv1xI07n5zQ/QdqF398ruzIV3xc/JBVspwW89U=;
 b=f0ou+vsZ4EeAgCqmAvdH3n1+N43I0yrl53c+eWbGV5jn6dN9hUg4lE0FvKNdKM9RhD
 G+yDlX+NetwbD5cmMG550FVTc//ClPVMsMCqzq9FwGXVSJZj/Iwp1ipSb39c8S9x2Iqg
 4jyTQfLlFeyq7HZEgKm0vAeFPSsC+K2h+9hVygrF5JNL9uZwNC/EJZlfgJDvVHFrEHIt
 Afjc2qW5cG3wqFnYzxIzxg6ajfZ4KEGudR7S7td/t6SX+7gwJFaodLQgA7wLNXQ0AKiI
 Wjjg6fM0KxpNOXKsTR14TlD9SLD3vamVL1Ryhcl72NId354YyL673L2jF+C9S2QeP6AS
 6rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iYRmSfv1xI07n5zQ/QdqF398ruzIV3xc/JBVspwW89U=;
 b=IA632oZLZa2rTD57Llc7tT1lr5unOWyQyuv+2zhLf0KCKNYaKo7zu78F45Yf8SJIKd
 i+hEHOg97+R5Sepct41bbrsb8ScBDPJnE3NBtKwGPTh6yEZpNMtTTpE05b8hLK5LU+d/
 S9kA+wbHw6XPseVuomW548xFjwE0hwwdK3+efXLmn+ntx08zKFAXBTjif1fd/DMRTb/g
 elrXHpNJiy0/ETgoG+2Ht1OUy9kkStbEaZmf0U6ou82NKFZNblCfMpwSEL0r348uL14c
 yTgweLaX04L04JX7S9eMbLtB/3o37iXqS4IcNgVdL9uLgp1xfxpSfoJpqfc2UlJp7q84
 KTZA==
X-Gm-Message-State: APjAAAUV6wwUeMtduqXxLCy+8/WNMhsMmxjzRkKbtymusRNaloa1f36Y
 YlNWVng52UxvrTXTYlX8y+w=
X-Google-Smtp-Source: APXvYqz/Ga5j0eUTsaF1uhGgGmRtxSu2qYupzBaU76iQuW88vw6//0bebxcMpWctkFZVzGUrC2IvCw==
X-Received: by 2002:a62:75c5:: with SMTP id q188mr5964679pfc.76.1553825562352; 
 Thu, 28 Mar 2019 19:12:42 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id h13sm585727pfn.114.2019.03.28.19.12.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 19:12:41 -0700 (PDT)
Subject: Re: [PATCH V2 1/5] dt-bindings: mtd: describe the simple BCM963XX NOR
 flash layout
To: Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
 <20190328141910.5723-2-jonas.gorski@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <b9d3e33e-538e-4384-0ea9-ae293f60709e@gmail.com>
Date: Thu, 28 Mar 2019 19:12:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328141910.5723-2-jonas.gorski@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_191247_076891_97871A1D 
X-CRM114-Status: GOOD (  13.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/28/2019 7:19 AM, Jonas Gorski wrote:
> Add binding documentation for the standard CFE based BCM963XX flash
> layout, found in most devices using a BCM63XX SoC with NOR flash.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
