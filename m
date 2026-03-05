Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF806F513E7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 23:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UweZ0XQwj7Wi+1z5BXFc2DaElXwnYxVHiSFFd0PnvaI=; b=ac/6zKOEWBHrM8
	Ea/6o3wmmmee9YWrDktBOFZL4TJppXBwQzOoUFm0ogeHV5Tysb/r70DTthhPI3Fa1GH0KJngZ+Uiv
	maUWu6m8iFvNUpa3CFoWVcQvXZYRjBDRmhFbHjWDTHXwaEPEMz+XeQhGindrQsw26X8ubveRLEGpv
	NC00aZl7p6d2C/rZ2L0PN+hhoLh40DpqA67o6GaMKYkdSJYvZN8kXfdS0ohd9zWudiWpsLEL0EQVL
	gLSwMdWDxQpHZ8HZubJIFAIUzhPNTQXJW6F6BXW4EGTPBktGPOlS4vnazyKEY+M1gkEVmTeU6Ybdm
	udfrD1BK9i58u7RC2zTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHs9-00000002iJm-3TjV;
	Thu, 05 Mar 2026 23:12:49 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHs7-00000002iJT-2GzZ
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 23:12:48 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-2ae41544dcfso62488165ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 15:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772752366; x=1773357166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dMqZ0LvHE3xAoRASq7YjZFz+HV67N3xBC0l7/K0nmRM=;
        b=dl9BfjoST1eoDvoKOatYiKTFMCIMyROVTri+T6MY9cFQLY8i4uqRJ4YnvXBSQw30lk
         417A+eCHumAZHxIZRWZC/SYZ3e6FpWX4ZvRD1tgvmoWC7LPt5OyiODBQ9H+/j0UEWbOc
         UQv6xIgchnPHvyRFFku6PodiGzUoh+nOBjsqqVwOCoFmkLZcNGaLADWmSPOODjoVERIM
         g1fXh6AWqat9lkjOG+0xIozQkR9t9B2xeCjpJ9G51mCf1sHZRTI3eIbYPkoLJHe7T09x
         QNv/2kd86cd8sEiJRrcK3DvTli+StmBq1ueeGhJ67p2xAJLlP52CdCXN+iOePN7Ezt3T
         g5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtr+9n4fPqD1axVUVOhRnQt1vAuFbnCnX7QiJEpy/zFpa7meyf5semx1d84BumAhiBwLXyslf6f/M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzafZKx5Nj7ocjunCAuRjU2IBsWkRphx53eg7WsXzdl1A/GbR8E
	toFprB4OsTPAi8Jyw9VyjAwYjNConMlAbLzQDs9cUSaF2KBHSehbqnz9+7OkejMhQxfJUCtPydv
	bW45F0e8bN1b/9W2PQCHEa3Htk0aYn//hRtMV+wCp9DAoKqgEAniNrcCjm391OopD4nau1Z3mBw
	X3EQ+WhMwEUesKGkpLOdXlGAQcOpGd+DEw2iaJeG8ycOe4KJ4BPjTv6GICoFmbG4wdXGZ97Siyd
	a8mcx5vQ/JaUaRabIgPbQ0LFA==
X-Gm-Gg: ATEYQzzRixQxkN03Sm/sZ3eLc/pbtpcuRYmMFKZ4aHOoxx7kqb/1MvTFRg06wfkmHLh
	/jB5+eu47mztbdGXWksTO66Nd/aw/qXZU9pF+tYIUAm2jNCFatxGXxNvD+zNWigOMzRWbsHfmxI
	0BR+XJqKBhBMOP3ysFZMhJBDYjrgiRzlyz2yv3cqfOWznz4rdW2rDLuFgHmxq6Q9bUpTIk6s+cp
	KX+OVHRVUgtnFSe72BXHa6JKPuvHl7Lp2yadLB81nv6U809ttSyjhR3jIkCW+Vx5orrqk2ZrVsR
	xqFOQ/EoZbz6KwCFwW8OiyItirCkcwYCZeW1JPnyX+LMwCS5yu3KN6bk6IrUU/jAy/uXinHGmzt
	8Mt4cUK4OGcNchwrDytiu5lWHnKMF3sWsnUXvuVKZNJfWqqXvfs87vbvzGlN3jbzYRRWcPJWawa
	B6SJJgcKfoEnQktdK+2eWdLnuy2/qH4K9J1bSJVSUBPDoO1VdYA+bATkZ4muRqyYSk
X-Received: by 2002:a17:903:380f:b0:2ae:4f2b:9263 with SMTP id d9443c01a7336-2ae82451675mr2467335ad.40.1772752365927;
        Thu, 05 Mar 2026 15:12:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ae5468d85csm17108465ad.10.2026.03.05.15.12.45
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 15:12:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124a95b6f61so107493165c88.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 15:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772752364; x=1773357164; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dMqZ0LvHE3xAoRASq7YjZFz+HV67N3xBC0l7/K0nmRM=;
        b=LZKOY1TkZskerBTAyIlY7vNvON9RXPPHiw/YNUVkausWCKjzMC6Nx/m+83ol9EKwSF
         m003iWYbB0lgQK00Wv9QEbfDbQ5OJkNzg3cCAOUo29Bzj53IjiPbT1qtj9vje+cUzImz
         mV575dX3F1+kLReqTuDBye8IEzQe0C0/34s/Q=
X-Forwarded-Encrypted: i=1; AJvYcCX26oIUJubXOLaH4FON926XlPQdvvgaZKzqE7kExbv3H1Eq1RHrkDH9ykAtguLzuzD1dBno0kxghCA=@lists.infradead.org
X-Received: by 2002:a05:7022:122:b0:11b:c1ab:bdd4 with SMTP id a92af1059eb24-128c2eaea56mr58470c88.38.1772752363885;
        Thu, 05 Mar 2026 15:12:43 -0800 (PST)
X-Received: by 2002:a05:7022:122:b0:11b:c1ab:bdd4 with SMTP id a92af1059eb24-128c2eaea56mr58456c88.38.1772752363245;
        Thu, 05 Mar 2026 15:12:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128bac04455sm3307094c88.1.2026.03.05.15.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 15:12:42 -0800 (PST)
Message-ID: <75359b55-763f-4a90-bb09-141d42315eba@broadcom.com>
Date: Thu, 5 Mar 2026 15:12:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: brcmnand: skip DMA during panic write
To: Kamal Dasu <kamal.dasu@broadcom.com>, computersforpeace@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: florian.fainelli@broadcom.com, william.zhang@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260305202157.3571334-1-kamal.dasu@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20260305202157.3571334-1-kamal.dasu@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_151247_648341_B6BC1EFC 
X-CRM114-Status: UNSURE (   8.70  )
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

On 3/5/26 12:21, Kamal Dasu wrote:
> When oops_panic_write is set, the driver disables interrupts and
> switches to PIO polling mode but still falls through into the DMA
> path. DMA cannot be used reliably in panic context, so make the
> DMA path an else branch to ensure only PIO is used during panic
> writes.
> 
> Fixes: c1ac2dc34b51 ("mtd: rawnand: brcmnand: When oops in progress use pio and interrupt polling")
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
