Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C47FC021BC
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBwpnR6GAFgUthHa57avoTZd0sDmA5FJniMr1ZpEpoE=; b=YZ39/HujKakQ0y
	OsH3bEio9a0R0vK12CBlEoCOwDu8WUJ8YhOu41NuPujcCF5aZ/msDgsXYk+FaZNHM9fv7VYIyTUw2
	Ioc8cXRdB8Vy4HMC10pSHPj5+R7X1oeXtc8mHeJ2heEArYjVpEFNVvDd8dEfdYe30oQpylKWQilur
	bN6x7HUQpZkkraawmyR/WczLl6enc4R7TLoEq/RUVZzJGx3kB2Cl+unyapQEqVsPlVbjDGZlQLCM9
	g00ayZJh4qa/TVZx4fG2QXKIyd3Ic6gUcLBp+ACLvRcJJNCX8RJqeT6biG1uWL+i8Bi9LuJVuhH7a
	kji1RmqihsbnTnB+kieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaWF-0000000EIqP-3MJZ;
	Mon, 24 Feb 2025 15:37:19 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaJg-0000000EH8B-2net
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 15:24:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abb79af88afso837051966b.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740410658; x=1741015458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90b7JTu64HyQeEwAMfpKEcwfZyjyUK0IOy6HdZ/FyAs=;
        b=A5zg0yPa3wNKd4F98Y4b07LNUFgc3gYQ49+WVI5taTYNfdcxSCaHdOf/p8AvxeG7b1
         CLcMOd1Xs8VtvCTSw8BG3U6SfglgMiD/trCznxZvT22kOUMso5O+PP0laGwRtJDgGZYB
         ueqdwDHlJyf9KGOP2eCkGaynHY/L54q43GLakK1+wKEDznq9MMKgRalOcx5m5+uH5WXU
         zXePS4xWKgdxf6pSfO9dcoG9c6iNVOpMpUwT3iqA5e85n4I5Ay9rOMg8qhHM/dBEFlT2
         f25bKYjh7mSNcknniJWEzHpW6euRNWgzF9P6JAJ2AUdSJJfMXx60tnpeUBlaAqngsmmh
         g0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740410658; x=1741015458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90b7JTu64HyQeEwAMfpKEcwfZyjyUK0IOy6HdZ/FyAs=;
        b=PnENI2gWxaubRYvBi7196ZD5Ue1aHs1ncyzTpTbnIVqnI7VquWiSr7VwggOWPRdhkH
         OcjtXfptNNr8xcSkqTCupQBy4Aic7MI2gQsTOG4oEr6b0xmVLHArckog0Aif9dfLubXq
         MBWr9uzye3F7rFTwti0owxnCMFDs2g1FCbBnqktht4ymH3Dbk5NVhK9IKK4LeiO8Kx0w
         sogrW6cFe726nBzUEstg/eLBfZLkJQZMK7Dc/gFYvo+tHk6B1u/0M/fu4oZfZU8WYmuo
         zuIKTIwNblyLcLWk9Ph2180fVvNyZKNTgfIdILV1i9CuHLaXfbj22z7kQiy7HLTsGdWY
         LPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4qntUSPKzVtlu0/Vv3FidNxweZU4ZnoxI4mbx2V67LeJ9pvhVSaLcjfdka99zZT3/2rbYXKlWJMo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUN8nBPyfl5EdsKZPoS8AYpqyGD8PGcx7QKyg8nZbGCMyZud23
	H9KciOeu5ZI/4J9gCfoynIeSrtCes9k+UgRxxC8ciNd6x9d0dLhm
X-Gm-Gg: ASbGncsLEmc2l366Hh956Sz5ellUfUCdmEH4Dm616ONvlKPE5W4lSb2dsgDXVMWz/ff
	vnfDskSvEbw5uTaiKSdyMDqSurzXYlJtu/0vWiAF0nmMSgoZq1WxLIxejHecBl7TEZsx115ARKt
	xoKoMOR6l64XXf6CBfZ081e5aB4pVhr8dP4n+C0wD6fbI5XMFEFRpmg8x32y4Ccy+jTjMRI18GH
	31seSQr6nvp6PGGwQ6Goh1Q1V71GcgfaCb3EOOhltqzpJfweXtl93fnCutRe7c1nEG3E85kyG5S
	4xrUUZE0XNjED0z5B10axDOZO48=
X-Google-Smtp-Source: AGHT+IFuxTp/JUjRKgHm6bk8HGglm4eMoWBRrY8PM6xIIRBJOeg9hhqPfUM+m5fxkbKuGg8YC/F0FQ==
X-Received: by 2002:a17:907:c29:b0:ab7:86ae:4bb8 with SMTP id a640c23a62f3a-abc09a0bc37mr1270641566b.23.1740410658075;
        Mon, 24 Feb 2025 07:24:18 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9f8442c0sm1531734566b.150.2025.02.24.07.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 07:24:17 -0800 (PST)
Message-ID: <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
Date: Mon, 24 Feb 2025 16:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, mingo@kernel.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250223164217.2139331-4-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_072420_709131_EC6111D3 
X-CRM114-Status: GOOD (  18.84  )
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



On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity8() helper. This
> change eliminates redundant implementations and improves code
> efficiency.

The patch improves parity assembly code in bootflag.o from:

   58:	89 de                	mov    %ebx,%esi
   5a:	b9 08 00 00 00       	mov    $0x8,%ecx
   5f:	31 d2                	xor    %edx,%edx
   61:	89 f0                	mov    %esi,%eax
   63:	89 d7                	mov    %edx,%edi
   65:	40 d0 ee             	shr    %sil
   68:	83 e0 01             	and    $0x1,%eax
   6b:	31 c2                	xor    %eax,%edx
   6d:	83 e9 01             	sub    $0x1,%ecx
   70:	75 ef                	jne    61 <sbf_init+0x51>
   72:	39 c7                	cmp    %eax,%edi
   74:	74 7f                	je     f5 <sbf_init+0xe5>
   76:

to:

   54:	89 d8                	mov    %ebx,%eax
   56:	ba 96 69 00 00       	mov    $0x6996,%edx
   5b:	c0 e8 04             	shr    $0x4,%al
   5e:	31 d8                	xor    %ebx,%eax
   60:	83 e0 0f             	and    $0xf,%eax
   63:	0f a3 c2             	bt     %eax,%edx
   66:	73 64                	jae    cc <sbf_init+0xbc>
   68:

which is faster and smaller (-10 bytes) code.

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

Thanks,
Uros.

> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/x86/kernel/bootflag.c | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> index 3fed7ae58b60..314ff0e84900 100644
> --- a/arch/x86/kernel/bootflag.c
> +++ b/arch/x86/kernel/bootflag.c
> @@ -8,6 +8,7 @@
>   #include <linux/string.h>
>   #include <linux/spinlock.h>
>   #include <linux/acpi.h>
> +#include <linux/bitops.h>
>   #include <asm/io.h>
>   
>   #include <linux/mc146818rtc.h>
> @@ -20,26 +21,13 @@
>   
>   int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
>   
> -static int __init parity(u8 v)
> -{
> -	int x = 0;
> -	int i;
> -
> -	for (i = 0; i < 8; i++) {
> -		x ^= (v & 1);
> -		v >>= 1;
> -	}
> -
> -	return x;
> -}
> -
>   static void __init sbf_write(u8 v)
>   {
>   	unsigned long flags;
>   
>   	if (sbf_port != -1) {
>   		v &= ~SBF_PARITY;
> -		if (!parity(v))
> +		if (!parity8(v))
>   			v |= SBF_PARITY;
>   
>   		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
> @@ -70,7 +58,7 @@ static int __init sbf_value_valid(u8 v)
>   {
>   	if (v & SBF_RESERVED)		/* Reserved bits */
>   		return 0;
> -	if (!parity(v))
> +	if (!parity8(v))
>   		return 0;
>   
>   	return 1;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
