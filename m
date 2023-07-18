Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7CAEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4L42jGeXkN8BU8sooR4YjE9bOwfZ76WZU4LnhAouis=; b=aofAz8wXe+mGQX
	4XXnJCFnXBMga7f4diqEVnIOaFpZtOXa/8dDyV1f1fHE33enFiKKYPbC2cSI3mwP0fmeP3XdbvZYK
	7z/nwuJUUlquCUsCfzmvOtnfpasB0xNuFHfCN32nxccWwZyJp008+iM/85jxnwWzb+b/E86NnxYDe
	Gkzv/9d/io9KwAesaI15g2Meio4fdjn/jdSjGim7IzwOxUoByaseU7ZfH8krGVMXVikbxpv0KeLkw
	aHhxv+GNxqEjey6of7lMz5zBbZ7uCWIDQbUE06a2tYt3LPkmnLlpsn5fvP9QK4+qVef94z+Lr1jzb
	W0swJgFEpeBo6utMb/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Cv-005UKe-11;
	Wed, 19 Jul 2023 05:58:41 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Ct-005UJd-29
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jBt8e2EoBByeTlhxicuduXe+Nvw8aC1zutFw9j2lMYw=; b=eVWurHhyxJ+S/30F2pm/+TJDJr
	V82PYpZltp65NjM+4zrK9nQnr+3sg82OEso0ePJoF6t2DtbFVKGr1+5Q9x1CkNi9WEG7FMGGzC9+8
	3WGLFl5c/ZjhBxgQMANfRgUFY+srJXE7QFXOhHSIQ6o3ShTFToz8hqXdyzkXykgx5xrbmT1vBvaEL
	mafEdz+koZkH7Rg1CMtmrmrrCkDdbABDGuerz9GYtRg2tGxI6X5MX/3w83jaeJJQba9w/NMDJe4fD
	6DH2jndIx5F2W4NBC02L/7OABgMkuBRZy48zjQoxzXIFx2V+EXX09HSVza+D6UhFDYEuw6s5tSTYW
	6b92Ic1g==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLeoi-00BFe6-3D
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 07:08:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b9cdef8619so33150745ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 00:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689664023; x=1692256023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBt8e2EoBByeTlhxicuduXe+Nvw8aC1zutFw9j2lMYw=;
        b=dGzDMtwxytEmvygSwWdq92ftiEhR84yODnuXG58/jZasApqC87Aayt1MoYIwhllIZl
         p7DEthRqpMRH7MHJ8A88PFc0abm23EmZU9L2bVZVuW7XINu6eZhpNA0aXfLgYciyA3a6
         Z0t8pOnYfr33/E9Uq5BLh81Wl4ITFhO4vfmJlD6Hdnc30X9GgfMd/WO1jUuOBC49jJmt
         eFyffklkqrhm2iAhni10q54F/Xs+nJyyU2P8BDbUf1/21eGEPyTmeF+z9NZX3SLZiFX4
         IGBPqtQsnGB20r6dmAgPlNBTD1n7/0jaRWDuaXTBDBz/eleTVh0xojvlrT+Kn7IFg8Pq
         MTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689664023; x=1692256023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBt8e2EoBByeTlhxicuduXe+Nvw8aC1zutFw9j2lMYw=;
        b=YotSFbK2rYssgq2rNh8Ewgd/juGPB+uifuBMIi9tQC/N3WDb3O72JPdZTjL7V4G2tw
         ulxFipb8wl0HaweAE4bHU1i6BLcSeaANryr9vSfBroLNzjdZu7vsfyXuM7yoTEdOKg2u
         wNvkIAXKuwkQifgYQyP2cLJiY5ipFnGnuyr37JnaNMGQSC20hTWWOTc4SHev8ZjAuCWA
         5njHq/KQ7z5Zom3YWvK3uPmJShW244WAR8yJa5gdRf306C8PnYdXGxYPoVk7a6BMOQQ5
         FVWXSXQxfdI27dZRp+lI4lX85N7EAIWQenuzel6MgjACqFwn3xTJ6etJu1DsvCLjPF2e
         iitQ==
X-Gm-Message-State: ABy/qLbNvk0vpMH1c8sITMhhDRXPNH6fCys7MyHDMYXQ3q9Z6QjB+sd7
	y0gDrOuJ4umwR9OakGlTY8U=
X-Google-Smtp-Source: APBJJlEstKXTaGRKqHbI98Wazq2AbF3p6PRW4bDUpA/kbmLGaoEnGBiQ7HwuIhEsegx41lhjZ/54bQ==
X-Received: by 2002:a17:90b:1b49:b0:262:ec71:b88f with SMTP id nv9-20020a17090b1b4900b00262ec71b88fmr897198pjb.25.1689664023280;
        Tue, 18 Jul 2023 00:07:03 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090b018300b00266a21984b0sm783105pjs.31.2023.07.18.00.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:07:02 -0700 (PDT)
Message-ID: <4917c61b-7f08-44f4-5a14-3443349e3277@gmail.com>
Date: Tue, 18 Jul 2023 16:06:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] mtd: spi-nor: spansion: Add MCP support in
 octal_dtr_enable()
To: Michael Walle <michael@walle.cc>, miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com, d-gole@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <cac44f4d9ed06e250c2fa8aa900d8de3de4c4337.1686557139.git.Takahiro.Kuwano@infineon.com>
 <d05156c981f0ddcdfb754c685530cd22@walle.cc>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <d05156c981f0ddcdfb754c685530cd22@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_080817_115857_9FC75561 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Michael,

On 7/18/2023 7:49 AM, Michael Walle wrote:
> Hi Takahiro, Hi Miquel,
> 
>> S28HS02GT is multi-chip package (MCP) device that requires Octal DTR
>> configuraion for each die. We can access to configuration registers in each
>> die by using params->n_dice and params->vreg_offset[] populated from SFDP.
> 
> I'm looking into cleaning up the flash db and come across the n_banks
> and n_dice parameter. Which sounds like they seem to be similar, maybe
> identical? Unfortunately, there is no public datasheet for the macronix
> flash.. IIRC there is one for the Semperflashes but I'm not sure if there
> is one for the MCP parts.
> Could we somehow clarify if these are the same properties? I've looked at
> the SFDP tables of the macronix flash and they don't have the SCCR map for
> multi chip devices :/
> 
> -michael

The n_banks and n_dice are different properties. One die can contain multiple
banks. Infineon does not have multi-bank parts that support RWW. The SEMPER
MCP parts do not support RWW on different die.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
