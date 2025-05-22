Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E98C54E65
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 20:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqO3CfbAaVvZRQtdpP0OnjNeCmHMIrK0GEnb/Cwetig=; b=cQP1PKApU2G8QdjFOz2FJVPO3o
	McVUaXrVYZNVlmeZTf8etPLGFEUEe0c1jGVofdWnSlix9LZWAONCyB4BI9/Tzy+NsqiHaTAwPh4sw
	qHhbZdJ3FlE5ly5FE5FEFRuKKWibh/WscnyEMDzxDN/a7m6+lcRQa39ywCVUVuYvDa5eDWkgI6IzJ
	3wvcVdpHkg1z3RjKPiAxosy/kFDiG3TCKvI+Z0jZm02AxeDj9vzq+nigXavV0VoFwUy26HbkFWdiQ
	ebYK0So3fcZwNAWKkmTEl6m+J1ev5uuXk/Ked2w5p92u2aY+Xcdqqq2JUom7/VAFZJFpMwQ12uwq1
	I3Umm6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICQ9-000000027Ck-2g8C;
	Thu, 22 May 2025 20:21:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICQ7-000000027CQ-0myf
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 20:21:40 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so7485103b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 22 May 2025 13:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747945298; x=1748550098; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm4k4ovRqOoI0MDP4KWD2K4fuBBJ8zeOAXfHx9a9JHw=;
        b=Lyz2EtZI0XPMBm2eSrDR29X0l8rvJU2Xm8RRm7k2s7t/fgUAx7L+5NyZDlSdE1zheK
         4knnKQ7iZ1aiKEEslgszfQH5+bpUM+B6o5fo40IOeIzuFOkNwoye2GeJxDU8xYJt59cp
         L2rH6eWLz87NTyolHmDvEzzz7zC6+FBY6jhD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747945298; x=1748550098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tm4k4ovRqOoI0MDP4KWD2K4fuBBJ8zeOAXfHx9a9JHw=;
        b=KZHd3QMa13OT8nAn/i5o0HGWkirLQ1ZGuJ8WgHXie6S9vVw0klV9aXToy5fA6GpH9c
         WSrpjbk+UatTHBzmkrJObmvKcYqR8hSDRW4P6Vvq2ohvKmDzCwTaeAeT7trJTus4Xpc9
         6aAPXgS9vL1vAqOm37nGSK6wXBpDFaglYfr2C7lpBLojBhHepgN5kg1S0Pd+JzFQvY3f
         QUeEmgtMs8PHTtHaNWVa+5KiDxiWd3upfMXWxqT6VnWIJMUQp2ZA7DR26KQdVMxoatt0
         hIVmg1sGtCrlQp5F+eo+V0ocbedxmIctPxhgeCcd+b+oZ7CqYlPk/7mTay0irK1XSKTN
         IsFg==
X-Forwarded-Encrypted: i=1; AJvYcCUp/5DlAgCgGc+PvTYTdCSLe3YYzj3CJ4qVoDZ0kSD5iRzkRLzHI+g80C8e563aSzh4tQLM5i+OUB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbMozuw2VA1jvtfEd/Trhm/Lkuttxz5VJ//XWa73Rm2WWLJ9W6
	nsW/AKej2Tqdi2NtBE0uPRo6t4cApLRQpG/QvpMljlsi0MjZQBWxfu8ZlTpn1tgf/Q==
X-Gm-Gg: ASbGncthmu5zkCdDH0zlCNBc7ZXrPk9IIDPdphGVyVAkSizR2QJtCe6wzXZwzje+sO8
	FOphnkXIheoUqT8vnAevFLZSWDbFXE9ppoWMlYcSaFZwI6bFwRpkDz0yYJyzongMcTgQNMvhHHw
	f4iHRvx7DyC1ID/N68m5CpYTMGt8lnyQll5KgW4xoaz0pcoT9zvKP31xkKrBOMLsLH2TSxxV5kj
	zwD1t6qyJTFCrTd6GmH6PZ12WypO4ynYrY1TlMpo9pQDRvHqLVfvQh4AsUv4lezXJynrgaa0lqj
	1Ohg7SC8T0vN2Zj33HumabPmUK/baUbtJSCLNcfL/xmUtpHIT7NKWdDXXupMbYI+U9RZTV1dMdD
	1IRauG8UUB7ix/uk=
X-Google-Smtp-Source: AGHT+IEaTiXQ8DcjsheamxqoCiITTgF5Qwn9UxSlMyPIr8D4XZpnBsIW9NefScg8Yg/LjcEtiK6AUA==
X-Received: by 2002:a05:6a00:2e9a:b0:740:9abe:4d94 with SMTP id d2e1a72fcca58-745ed905b34mr653721b3a.21.1747945297901;
        Thu, 22 May 2025 13:21:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm11661081b3a.30.2025.05.22.13.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 13:21:36 -0700 (PDT)
Message-ID: <551fae31-05c7-4555-85cb-eaee2cc67691@broadcom.com>
Date: Thu, 22 May 2025 13:21:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 linux-mtd@lists.infradead.org, dregan@broadcom.com,
 miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com,
 florian.fainelli@broadcom.com, rafal@milecki.pl,
 computersforpeace@gmail.com, kamal.dasu@broadcom.com,
 dan.beygelman@broadcom.com, william.zhang@broadcom.com,
 frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com,
 jaimeliao.tw@gmail.com, kilobyte@angband.pl, jonas.gorski@gmail.com,
 dgcbueu@gmail.com
References: <20250521080325.581366-1-noltari@gmail.com>
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
In-Reply-To: <20250521080325.581366-1-noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_132139_259795_760DAB19 
X-CRM114-Status: UNSURE (   6.27  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNS8yMS8yNSAwMTowMywgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+IENvbW1p
dCAzYzgyNjBjZTc2NjMgKCJtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBleGVjX29wIGltcGxlbWVu
dGF0aW9uIikKPiByZW1vdmVkIGxlZ2FjeSBpbnRlcmZhY2UgZnVuY3Rpb25zLCBicmVha2luZyA8
IHY1LjAgY29udHJvbGxlcnMgc3VwcG9ydC4KPiBJbiBvcmRlciB0byBmaXggb2xkZXIgY29udHJv
bGxlcnMgd2UgbmVlZCB0byBhZGQgYW4gYWx0ZXJuYXRpdmUgZXhlY19vcAo+IGltcGxlbWVudGF0
aW9uIHdoaWNoIGRvZXNuJ3QgcmVseSBvbiBsb3cgbGV2ZWwgcmVnaXN0ZXJzLgo+IAo+IEZpeGVz
OiAzYzgyNjBjZTc2NjMgKCJtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBleGVjX29wIGltcGxlbWVu
dGF0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRh
cmlAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29t
LmNvbT4KClJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxpQGJy
b2FkY29tLmNvbT4KLS0gCkZsb3JpYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
