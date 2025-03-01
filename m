Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F565C282C5
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 00:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3///RF66r475FDh1qzhUh/C323Te2ltwo41ar7uJOeo=; b=4WhTNrIyW2pM1T
	nhyoTf4+TcYNy7Zr6yUiVvQVaWnNgenzs+vExyVQHAh3oTmEEkB1JjnzfNwKMQAVGXqG8UuHEfVdY
	HduUjYR6Nx7zRHYn5T3y0K6IBHkECnfx492UM1TBg/AwcruhxEgGc1kG+9QVS8AYXubjPA93F3FB7
	87X029GOYmHkUHxWjIf7bBHH1YlsO4nCVlf+X/3C9fPXRw8PoBr5EgYEV4C/9KzlhSw+AjDVeqnaG
	NVWum6JzSmaVlbxn5iad3dlBM8WGqOIJc1G521omZJ2Ovsank3uyseC8J8kHp6/lctOM6tTd7SHYo
	C2FcrG8tIN4Li5rzx+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toAte-0000000D5hq-3X37;
	Sat, 01 Mar 2025 00:40:02 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toAsj-0000000D5Vc-0SLZ
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 00:39:06 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fe98d173daso4531699a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2025 16:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740789543; x=1741394343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/AKFqXMEu6LaasHAIm4e5qEqtFSZY0U9wLZbXTQNpxg=;
        b=hN6/R6557gyThS6QYwOOssKCqX9KMMGM/53xbjNT35OIJg4W9/ctqTQu0yQYIrhyQY
         nYUOwdDXQDzPnK3a2MQw3DBdiM+2CoeNtQMEjfUMcGV3bawOW5SV56sCvFwmDXXIOXpT
         bjcDSL28Opl11kvPeDLLzde3aTN1i+VhnTjMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740789543; x=1741394343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AKFqXMEu6LaasHAIm4e5qEqtFSZY0U9wLZbXTQNpxg=;
        b=wZB3T3bRLqsQZ9s0rZO6HsmHNkDm35rk3eLztkzaV9kuLRHbtANb19pLbxyO+eY+5Y
         A+WWFbqY7IAVXJCG6N/zpNW54Qa1qy8I64BpI/O1MpLSLHxwe9iiyTCUKkd2UGfjVW+7
         euSnuf65p5BhUomOjwDt9y/XtSoCUm4Ruuj7Kx7HMiXEVWO4Ty4Ciszp27ud5CZ0X+FE
         5Z1xfY7eX58IyrgksW2271U7UbrMLQPWnS/svSZ/7DY1RwkAK6PaNZtPEsCYMB54jwk+
         0tSw03G8HE6sCZoXj6OpBQ9QG0xukpPKppr3t61/7GjV2wi1LoWPvkbioyRYterkPqKE
         0Sbg==
X-Forwarded-Encrypted: i=1; AJvYcCVl4b3TgfXTqrfd2br1+K4Kfo6SNi829LaeKFgsf0PbJIaZowRgfQCVt0pK2AEbcOeLLnWiuloSYGs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLpA98lGDHNDTai/VZ7h09SAfjqwGLDatxq4ql68t+m5g+6rC1
	2pv8QtQRzVouK6vGLT7TVQmd+3mYFUVQkYxGnE2MVlYvwlC7R323tOuRwVf3oQ==
X-Gm-Gg: ASbGnctSn9/HwDHotrapaV/f68LtWFzuVlFt9PqdPVvpYsbcc+kT6Sw7GDJPM6O2hKc
	r8iQeADVmkZDKsH1+W2lkm9Zbco6JGvBFl7sbGnJVsXUF6zOeMKxrRr43Wes5G4+VdM92gFrKvD
	AiprJR0jf4CHu6ApyrcGZBa/mQRoGJz5776bkREFXXrYh/FuWjGDEGi/XTpVmdVpEFOZNmoSJzm
	LvZKwvGRTK9Cpp5XHRi4pLZdOG8XENt3074MyK28viPCn1NKt0Rd8yZcYi0k4RNRcGXrDGyWUAZ
	Owp6+zwFiYoVn6ysa1ooBPEb7WnafXc/Jo9deykx6wqBQ2uJnzWwOQI7ARTCJ/iPRNTKU+1ucU2
	32r6UQbG1pehyRY7vrkY=
X-Google-Smtp-Source: AGHT+IHMQSHnwr3uviN5+94W125JGE7ftvPd1JP+j65khrHij9NRHLJcScli2qKh+6NlJbC0rDHRsw==
X-Received: by 2002:a17:90b:1a86:b0:2fe:b016:a6a1 with SMTP id 98e67ed59e1d1-2febac07c86mr8748750a91.29.1740789543183;
        Fri, 28 Feb 2025 16:39:03 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea679dc51sm4435685a91.21.2025.02.28.16.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 16:39:02 -0800 (PST)
Message-ID: <f7d5283e-2e24-4091-92bb-5c111cedd23a@broadcom.com>
Date: Fri, 28 Feb 2025 16:39:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: rawnand: brcmnand: fix PM resume warning
To: Kamal Dasu <kamal.dasu@broadcom.com>, florian.fainelli@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250227174653.8497-1-kamal.dasu@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250227174653.8497-1-kamal.dasu@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_163905_341888_0FF6A371 
X-CRM114-Status: GOOD (  11.92  )
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



On 2/27/2025 9:46 AM, Kamal Dasu wrote:
> Fixed warning on PM resume as shown below caused due to uninitialized
> struct nand_operation that checks chip select field :
> WARN_ON(op->cs >= nanddev_ntargets(&chip->base)
> 
> [   14.588522] ------------[ cut here ]------------
> [   14.588529] WARNING: CPU: 0 PID: 1392 at drivers/mtd/nand/raw/internals.h:139 nand_reset_op+0x1e0/0x1f8
> [   14.588553] Modules linked in: bdc udc_core
> [   14.588579] CPU: 0 UID: 0 PID: 1392 Comm: rtcwake Tainted: G        W          6.14.0-rc4-g5394eea10651 #16
> [   14.588590] Tainted: [W]=WARN
> [   14.588593] Hardware name: Broadcom STB (Flattened Device Tree)
> [   14.588598] Call trace:
> [   14.588604]  dump_backtrace from show_stack+0x18/0x1c
> [   14.588622]  r7:00000009 r6:0000008b r5:60000153 r4:c0fa558c
> [   14.588625]  show_stack from dump_stack_lvl+0x70/0x7c
> [   14.588639]  dump_stack_lvl from dump_stack+0x18/0x1c
> [   14.588653]  r5:c08d40b0 r4:c1003cb0
> [   14.588656]  dump_stack from __warn+0x84/0xe4
> [   14.588668]  __warn from warn_slowpath_fmt+0x18c/0x194
> [   14.588678]  r7:c08d40b0 r6:c1003cb0 r5:00000000 r4:00000000
> [   14.588681]  warn_slowpath_fmt from nand_reset_op+0x1e0/0x1f8
> [   14.588695]  r8:70c40dff r7:89705f41 r6:36b4a597 r5:c26c9444 r4:c26b0048
> [   14.588697]  nand_reset_op from brcmnand_resume+0x13c/0x150
> [   14.588714]  r9:00000000 r8:00000000 r7:c24f8010 r6:c228a3f8 r5:c26c94bc r4:c26b0040
> [   14.588717]  brcmnand_resume from platform_pm_resume+0x34/0x54
> [   14.588735]  r5:00000010 r4:c0840a50
> [   14.588738]  platform_pm_resume from dpm_run_callback+0x5c/0x14c
> [   14.588757]  dpm_run_callback from device_resume+0xc0/0x324
> [   14.588776]  r9:c24f8054 r8:c24f80a0 r7:00000000 r6:00000000 r5:00000010 r4:c24f8010
> [   14.588779]  device_resume from dpm_resume+0x130/0x160
> [   14.588799]  r9:c22539e4 r8:00000010 r7:c22bebb0 r6:c24f8010 r5:c22539dc r4:c22539b0
> [   14.588802]  dpm_resume from dpm_resume_end+0x14/0x20
> [   14.588822]  r10:c2204e40 r9:00000000 r8:c228a3fc r7:00000000 r6:00000003 r5:c228a414
> [   14.588826]  r4:00000010
> [   14.588828]  dpm_resume_end from suspend_devices_and_enter+0x274/0x6f8
> [   14.588848]  r5:c228a414 r4:00000000
> [   14.588851]  suspend_devices_and_enter from pm_suspend+0x228/0x2bc
> [   14.588868]  r10:c3502910 r9:c3501f40 r8:00000004 r7:c228a438 r6:c0f95e18 r5:00000000
> [   14.588871]  r4:00000003
> [   14.588874]  pm_suspend from state_store+0x74/0xd0
> [   14.588889]  r7:c228a438 r6:c0f934c8 r5:00000003 r4:00000003
> [   14.588892]  state_store from kobj_attr_store+0x1c/0x28
> [   14.588913]  r9:00000000 r8:00000000 r7:f09f9f08 r6:00000004 r5:c3502900 r4:c0283250
> [   14.588916]  kobj_attr_store from sysfs_kf_write+0x40/0x4c
> [   14.588936]  r5:c3502900 r4:c0d92a48
> [   14.588939]  sysfs_kf_write from kernfs_fop_write_iter+0x104/0x1f0
> [   14.588956]  r5:c3502900 r4:c3501f40
> [   14.588960]  kernfs_fop_write_iter from vfs_write+0x250/0x420
> [   14.588980]  r10:c0e14b48 r9:00000000 r8:c25f5780 r7:00443398 r6:f09f9f68 r5:c34f7f00
> [   14.588983]  r4:c042a88c
> [   14.588987]  vfs_write from ksys_write+0x74/0xe4
> [   14.589005]  r10:00000004 r9:c25f5780 r8:c02002fA0 r7:00000000 r6:00000000 r5:c34f7f00
> [   14.589008]  r4:c34f7f00
> [   14.589011]  ksys_write from sys_write+0x10/0x14
> [   14.589029]  r7:00000004 r6:004421c0 r5:00443398 r4:00000004
> [   14.589032]  sys_write from ret_fast_syscall+0x0/0x5c
> [   14.589044] Exception stack(0xf09f9fa8 to 0xf09f9ff0)
> [   14.589050] 9fa0:                   00000004 00443398 00000004 00443398 00000004 00000001
> [   14.589056] 9fc0: 00000004 00443398 004421c0 00000004 b6ecbd58 00000008 bebfbc38 0043eb78
> [   14.589062] 9fe0: 00440eb0 bebfbaf8 b6de18a0 b6e579e8
> [   14.589065] ---[ end trace 0000000000000000 ]---
> 
> The fix uses the higher level nand_reset(chip, chipnr); where chipnr = 0, when
> doing PM resume operation in compliance with the controller support for single
> die nand chip. Switching from nand_reset_op() to nand_reset() implies more
> than just setting the cs field op->cs, it also reconfigures the data interface
> (ie. the timings). Tested and confirmed the NAND chip is in sync timing wise
> with host after the fix.
> 
> Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
