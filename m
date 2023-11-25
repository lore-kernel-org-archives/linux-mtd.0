Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D541C4167B
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 17:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxW0aSDB0tP/byt1apnwaofNbMi3SOeAOB8bxyRDrv4=; b=i75F7GGPoAp6A5sWdkXuMClQ3v
	WXzmWIanswW/d1wexmZIx0NWZi3e0GRbYLMn3dK+Vkykx2XE6USAQUPkS3Ipwg4Q8HCZUv1OGpuRa
	KQOgFcJx0PGHxAjPvTyiA9kchppZybhDezEOpqqfXMCcly9AcMcWevxktGXIKa55L9Iga5nV5Fu7u
	XP6dxj+zYyULos7YfHPKli4IfgrU73eIGR7oc/SuQ65IeL4EeH26F5JAnndsvG8ZFgpN2jaO/LGyO
	FZsy8rvZ1zqZLkTZN/JcTrjbQVEHCmfsI4JGUir/QVmcK9BnIXYyD0MHEt2am+4p7CLcisYea9Fqh
	vH+5dN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wNt-009Xiv-1r;
	Sat, 25 Nov 2023 17:24:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wNq-009Xi6-1r
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 17:23:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cbe7386263so1926352b3a.2
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 09:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700933036; x=1701537836; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzsFwnTKlFweNImcDZvcUHGXmSag1w839oGhGY9efkQ=;
        b=bYkv6lu9Rim8E+XXcAwlsXUjGaYvlJ/kRed46TxU/Tn5n1rq0t+JpuRlejKYpcfTWD
         fLWvS841AuP4C8NOFuMskK1i8C/I9YcBxpPV18MKQczsHUWjL9pwzqVTqu4/4y28flNI
         q+t8nab1cE6MeXLGcAIAoMzGh12EtV8+g8Se/G5uHUNohTnpp3wjuXCRJoIRS+3EbO53
         XRh/dBmFfZOBYVROjcaVdugI5Csyy0XE7JneuGcZbNC5fx3URnvk/XL1ABv5PQYPv42W
         zwd4kuqdlZeia5zvt/NJx1ej2NdKrhrA2j4PVmnY8dqUYGBInJBM3H3uSJl6/sxFkMm1
         na4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700933036; x=1701537836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzsFwnTKlFweNImcDZvcUHGXmSag1w839oGhGY9efkQ=;
        b=lOUDvwSG3VoD4JLs8o6H/4Fp+vJ/PffDr25qI6t4Msb9HiuzyoZyRA6xuwSXr8RohG
         ozriGalp6lb/bhzIFxDFzjDHoDYDS9K0Ce3ips/pjp2ZBCuCQNSdPLjdUMoRcOI4xQsO
         V7xQr/32CTKbLdMSko4pT5OdklOjOCNhODS/aC6ZBheo1e/qhRhAMqqbPGHsYEXt5ySE
         +/qON6yQwnRLR8sALE9Ly0rkzAHmSGqJhwgELeAW+62FD++mC+NzMu7PFl2AxUmsruG9
         Xi4xJe+QozYRQ0VDH36iKdATGKy5wgCARO0LMdTqZWQM3P92VXdKfh0j9YQRtr5AjZ/J
         P5LA==
X-Gm-Message-State: AOJu0YyBepkVJ0I40CzRqgnvA7KFjU8BiAnm5GZErHXgIxVoa6znVt4A
	FX8dAgvjdzAYYeUAMtzPuz4=
X-Google-Smtp-Source: AGHT+IGzJ9k1/TLkPqkdI3S1w9XMUbKWgPqEF4xT5R9aRAPidE4RGizgkA/63W+bs0CRcF+fCM1sfA==
X-Received: by 2002:a05:6a00:8d87:b0:6cb:64b7:a3bc with SMTP id im7-20020a056a008d8700b006cb64b7a3bcmr7686980pfb.29.1700933035642;
        Sat, 25 Nov 2023 09:23:55 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b0068be3489b0dsm4721079pfo.172.2023.11.25.09.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 09:23:55 -0800 (PST)
Message-ID: <a2654a99-50e0-470e-a19d-3726f86b8640@gmail.com>
Date: Sat, 25 Nov 2023 09:23:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] mtd: rawnand: NAND controller write protect
Content-Language: en-US
To: dregan@broadcom.com, miquel.raynal@bootlin.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 rafal@milecki.pl, joel.peshkin@broadcom.com, computersforpeace@gmail.com,
 dan.beygelman@broadcom.com, william.zhang@broadcom.com,
 frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com,
 JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>
References: <20231125012438.15191-1-dregan@broadcom.com>
 <20231125012438.15191-2-dregan@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20231125012438.15191-2-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_092358_618592_0188C388 
X-CRM114-Status: UNSURE (   5.93  )
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
> Allow NAND controller to be responsible for write protect pin
> handling during fast path and exec_op destructive operation
> when controller_wp flag is set.
> 
> Signed-off-by: David Regan <dregan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
