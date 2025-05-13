Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17DDC3ABC9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 May 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXtmDWKkWnEF5TJyEks49UOxTfia0Qcxdd6KoKe5rl4=; b=LNQko6PCv8KX+hyh+tVZZnKniJ
	/PAZ4WmgqW1Kscp/MzJFV7lb1Q81Coi9OHJK69bos3fxsVlSwlJZ6m8rHKbOik9+TUB+H5rMZaihj
	U29yvSoRrLl0HR7LDsbe9bU1ZvvssqAHruItKxygvfHlsJ1jUethZrUmXhWaucsMdRumKSzeRHR0e
	XJGpkaSThkXihQvy2lt4QBNg/iKE3TPr3NcRyA6vxqPERyqiFr6iku7ZdK5TZhW/na/r647FiahtJ
	ClM53HPQA3y6bZsyMgFRi2beVH2spxJIplEJpMWM3bN94223we7agL1ajzhL76Y3mUA4viNG/MFtn
	KU7sZ7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElKn-0000000Bo81-2I2r;
	Tue, 13 May 2025 08:49:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElGC-0000000BnTG-18g1
	for linux-mtd@lists.infradead.org;
	Tue, 13 May 2025 08:45:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a0be50048eso4036940f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 May 2025 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747125911; x=1747730711; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hCvGZyLstKI0aTUegSOBAG24suthQJiUvCnzzicNsSE=;
        b=RvNYAOrw6shC5X6s50NrCUXprdUSy2fWvzPXNS6iIatBwFMVqnFX/Ea01/srdSJSTv
         EN4r3MnZZzInHdnU8DegqC4GrvMOXnl9j01feA6CBBA+ECPYVnO5vuwQxd2oZDKa+OE3
         FoSRHr24NRg1LCOa7P8VBsn/1NG4iGczFzmeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125911; x=1747730711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCvGZyLstKI0aTUegSOBAG24suthQJiUvCnzzicNsSE=;
        b=lSEnGwUB1YAN10FFDUoLWNjDveG7NrNO7J/20nm7SXkv8NrAJaZaENjAhu+MCPinvn
         Nh3WzE24Wdo7ByK6VL0g88wi24Sic12dsx50iRxseT2NfyuldoTjKXneJ6RssRLccrXP
         sNupyosw/vJoftKEsJ0zkD3omAx19e3bkvr8sNxr07Pq3vgP4rv2taIPshJVDDudfolR
         KWuW3lxAB0hrnv4qtQaPd2G5H489/JRf2Y6VVkp3KaAcdVwW3cH8+mWACdgWkXTmp1M2
         C/4mGsOrL8OTKn7q1y15Q5UtomprOnjYo8VqsrOAYCmAlOZFwvFoohtOqI1lyNzAYGWo
         iiuA==
X-Forwarded-Encrypted: i=1; AJvYcCVaRr0aDamKjjXL6Sp6KUlRgU8FcmNtLEjpGupHvL0grNyaO2WIh6IzVuuyGq4bc5IeuMvuWDUF+ok=@lists.infradead.org
X-Gm-Message-State: AOJu0YycNLZWMiRwjXVg1aDT9ybl4qLc9jt//1zNQuOyIbFhSJ4fMI1p
	ePrFKm4Jm2pMnKo5FYGXitZksAVxskQ2nVT6r2geD5pHmeIAMvRvEctXGVN8LQ==
X-Gm-Gg: ASbGncv9umcD5kxpqOBxk1HDN286iZcINwvQajktAgzmeZALnDFhJBmBa07WqJfpNcI
	bscRLIc3VDRSchc31AkKpq42fFbfVD0MtrI71gxQyzO470ETp3x1BXOQ5Ln3m2B2ONGyn06U8KJ
	xo7qSR9ETHi18pldVEltVG9ldE7qh2DPTRilUo9a0YMkkQhvh/uI5L9ODbzhMYOGUZC2iXwN8ek
	FchZ/PBOSsHz6dSW+VkOX9MI0y9JyN1cBrIQJYi9xBLu5rijccZzU7ASBegu8d1AYWAUTipXAdo
	gECddR9oq2wQKntKBrhkkqZn2v5jyYZsPZHY2/dicGWKB4eEXjOgmmM/yD3Y9CMqfYc2DYFkcuO
	OyB5W4vGl
X-Google-Smtp-Source: AGHT+IEwdZLZham7tCxHAfy6+RE0zKPKlxC1rlZdRDhmdgO4tQMzTMoCShAbJEX6bIpz/LBo8oIxKA==
X-Received: by 2002:adf:fe41:0:b0:3a0:b6c3:9bab with SMTP id ffacd0b85a97d-3a1f649b357mr10490206f8f.41.1747125910783;
        Tue, 13 May 2025 01:45:10 -0700 (PDT)
Received: from [10.229.41.178] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2b29sm15580950f8f.53.2025.05.13.01.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:45:09 -0700 (PDT)
Message-ID: <0369e781-3ea7-4d02-896b-ab3654e6140b@broadcom.com>
Date: Tue, 13 May 2025 10:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 dregan@broadcom.com, computersforpeace@gmail.com, kamal.dasu@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com, dgcbueu@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250513061052.547392-1-noltari@gmail.com>
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
In-Reply-To: <20250513061052.547392-1-noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_014512_307584_4170E248 
X-CRM114-Status: UNSURE (   6.47  )
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

CgpPbiA1LzEzLzIwMjUgODoxMCBBTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+
IGxhc3RfY21kIGFuZCBsYXN0X2J5dGUgYXJlIG5vdyB1bnVzZWQgYnJjbW5hbmRfaG9zdCBtZW1i
ZXJzLgo+IGxhc3RfYWRkciBpcyBvbmx5IHdyaXR0ZW4gYW5kIG5ldmVyIHJlYWQgc28gd2UgY2Fu
IHJlbW92ZSBpdCB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJv
amFzIDxub2x0YXJpQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxm
bG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbT4KLS0gCkZsb3JpYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
