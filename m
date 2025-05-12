Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90D1C3ABCB
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bc7O7nZdqQ+t5X2ir9ga7X8kh004cHpWI2kyWhZre1k=; b=K34c1JHdJ87X8viIdaGqkFdTYw
	qV2QI1fMGY1MowobAzAcdyds4a7YrhTsDoOGmPXIQ/DSufq7OA3TbTkJ60gxdDhU1xbenj+axpuKO
	NGkrLkYYMAu/v9g9zOngUWXHnZwl3VB1Yf6wzLBSZXuJkkdc3csf8SiYPbrmhPbsh1uGMrlvVHbX+
	Ln9iQjBCO9z9DEZml8TO51t0aSRxGgRgBLoBrnMwp4+387QdpJmuUg0vYg6fP/h6Skgkf0diWeRGJ
	Mpl0vGtS2uoBNqgvgrZzZ9fJp/8W44QoNQEIUa98WyTeD3m5imx0VxG4+hevCmiZkAwy8fUEGHGjr
	xPWUXwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUiP-00000009pog-0Hvi;
	Mon, 12 May 2025 15:05:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUII-00000009lAh-38OW
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 14:38:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a0be321968so2705338f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 12 May 2025 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747060693; x=1747665493; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7EiJ3KDheimK0eEoXvhBi6uLkJp2hVXs5X1KRMU6bsI=;
        b=KC5qBiB8ZIygysDkLt3I6o+J+FFQ3wOHfhILjOcemnTw7Oir2SINkPO+1z0OVXaB77
         Cp7EipBHop/77yLRe2Zzp6ebu4M5zRxhXf4UZQID6riQB3frGQEbfEZjtz76fyCMwiZQ
         nsm4SUUAabXqy7CBIZSvHGztc1zhObUxTXRn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060693; x=1747665493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EiJ3KDheimK0eEoXvhBi6uLkJp2hVXs5X1KRMU6bsI=;
        b=qHmzHTN/oUrjbozgRTtMRBV7bM5lCnQAKdTrpucX7eysQpgJUlUF2j9ydJJgCSOtOj
         0k3VmGh1ytSw1e/o2kbQehmQtL093k9/CS7CSuiIh3SC1snSQcQAbe81QlJwR9/+whyJ
         dvs4PukyjCsS/WTAPayXBIOXcNHxQOdVD/c5fhqw+O55b7TRpWm2JQCD3UNFAwukU1Ai
         mQRYTRbLV3ygvQ++7FUrzVORR7dRoFKdb78C/Hlwmg5341xszomWCh+rEo54b/pI1Ajt
         eYwGSuvy/G6u+d/tmraIiImDTkd6rlEme0lWuDjta0B++2DxlVWkDV7l4hDT6mGcuyPu
         sllg==
X-Forwarded-Encrypted: i=1; AJvYcCVaEmGt1rv4ub7ziKsjsZYphQqskla9SDAA9oah3qMn53ziFr5p4D/jpay312lb6w/MnfrrB9aK88A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTYxP9tt5OqX159Xh5ERBWPzt6MymT4CJwUmNpVsp/aO7nCB3n
	dXVGY+8tPOuCyx15Gj529EqOoKclrYK9eZCy4w3cbXXU/yZycBWAe0nAWbMZpA==
X-Gm-Gg: ASbGncuM014WfVYARRIMHEIvXA5/KtKh0rQyWgr7IQdHLxzf3PpiaW6+98Cu01UHeQL
	emv1bE9X6AfEwl26fi8PEtVYtiTA/nIsuxEUBG96v8ALDTkHNSWdHtLKCssdtJL9xY5ZyN6/Fif
	zKofaJVCKeAAtMjLwtXVQvbWmbIPRJLpKrFwAWqebuWHUBSZga6JBj2GjcwBG5FhJWo9j7oG5mb
	ULmqeVFlitQ2yL/PLVvLmeN4cJ8LYb6Zu8qIH0Tw5d/LgI5y32NlsX9M2xC7wZHQDQaJLGkA9GG
	6ks+4Nw3Klg2J3Ru4SWGVw/nSajl3Kra2cnObX4bfOprGAU3edEWrliFMeMQXCUWogFJzVYnTQd
	fFXSwA7SOTIgAg+migQ==
X-Google-Smtp-Source: AGHT+IHtVKtNckwkGS0Cg04t40M2HE//ia/rcwOCx7LnM+yXL6cnr1sfbIg2b6C1vkYs0SueWv+2Ww==
X-Received: by 2002:a5d:59ac:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a1f64a4b57mr10113915f8f.41.1747060693115;
        Mon, 12 May 2025 07:38:13 -0700 (PDT)
Received: from [10.229.41.21] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm126777665e9.11.2025.05.12.07.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:38:12 -0700 (PDT)
Message-ID: <c19fcd0b-2004-4c99-8733-937fcfa0769a@broadcom.com>
Date: Mon, 12 May 2025 16:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: brcmnand: exec_op patch broke < v5.0 controllers
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 dregan@broadcom.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Brian Norris <computersforpeace@gmail.com>, dan.beygelman@broadcom.com,
 William Zhang <william.zhang@broadcom.com>, frieder.schrempf@kontron.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 bbrezillon@kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 liao jaime <jaimeliao.tw@gmail.com>, kilobyte@angband.pl,
 Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu <dgcbueu@gmail.com>
References: <CAKR-sGezB_SEb7UfPV6o6T2yibkAzNSqK9Hry1kNM46BMsH2_g@mail.gmail.com>
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
In-Reply-To: <CAKR-sGezB_SEb7UfPV6o6T2yibkAzNSqK9Hry1kNM46BMsH2_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_073814_790074_54D3879B 
X-CRM114-Status: GOOD (  16.55  )
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

CgpPbiA1LzExLzIwMjUgMTE6NDIgQU0sIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyB3cm90ZToK
PiBIaSBEYXZpZCwKPiAKPiBJJ3ZlIGp1c3QgcmVhbGl6ZWQgdGhhdCB5b3VyIGV4ZWNfb3AgaW1w
bGVtZW50YXRpb24gcGF0Y2ggYnJva2UKPiBzdXBwb3J0IG9mIHYyLjEsIHYyLjIgYW5kIHY0LjAg
Y29udHJvbGxlcnMuCj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC8z
YzgyNjBjZTc2NjM0MjkxYWVkODc3MDMyYTQxZTM3Mzg4NGQ2OWU0Cj4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8yMDIzMTEyNTAxMjQzOC4xNTE5
MS00LWRyZWdhbkBicm9hZGNvbS5jb20vCj4gSSBrbm93IGl0J3MgYW4gb2xkIHBhdGNoIGZyb20g
Ni44IGJ1dCBJIGp1c3QgZGlzY292ZXJlZCB0aGlzIHdoaWxlCj4gdHJ5aW5nIHRvIGFkZCA2LjEy
IHN1cHBvcnQgZm9yIGJtaXBzIG9uIE9wZW5XcnQgKGZyb20gNi42KToKPiBodHRwczovL2dpdGh1
Yi5jb20vb3BlbndydC9vcGVud3J0L3B1bGwvMTg3NDYKPiAKPiBUaGUgaXNzdWUgaXMgdGhhdCBs
b3cgbGV2ZWwgb3BzIGFsd2F5cyByZXR1cm4gMCBvbiB2NC4wIGNvbnRyb2xsZXJzCj4gYW5kIHYy
LjEvdjIuMiBjb250cm9sbGVycyBkb24ndCBldmVuIGhhdmUgdGhlIGxvdyBsZXZlbCByZWdpc3Rl
cnMKPiBkZWZpbmVkOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iLzNj
ZTk5MjU4MjNjN2Q2YmIwZTZlYjk1MWJmMmRiMGU5ZTE4MjU4MmQvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYyNMMzU3Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRz
L2xpbnV4L2Jsb2IvM2NlOTkyNTgyM2M3ZDZiYjBlNmViOTUxYmYyZGIwZTllMTgyNTgyZC9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jI0wzNzEKPiAKPiBJIGd1ZXNzIHRo
YXQgcmVzdG9yaW5nIHRoZSBsZWdhY3kgZnVuY3Rpb25zIGlzbid0IGdvaW5nIHRvIGhhcHBlbiwg
YnV0Cj4gaXMgaXQgcG9zc2libGUgdG8gcmVzdG9yZSA8IHY1LjAgY29tcGF0aWJpbGl0eSBvbiB0
aGUgbmV3IGV4ZWNfb3AKPiBpbXBsZW1lbnRhdGlvbj8KClVuZm9ydHVuYXRlbHksIEkgZG9uJ3Qg
dGhpbmsgd2UgaGF2ZSBhbnkgb3RoZXIgY2hvaWNlIHVubGVzcyB3ZSB3YW50IHRvIApoYXZlIGEg
ZnVuY3Rpb25hbCBOQU5EIGRyaXZlciBmb3IgdGhlc2Ugb2xkZXIgY2hpcHMuIFdvdWxkIHlvdSBi
ZSAKd2lsbGluZyB0byBkbyB0aGF0PyBUaGFua3MKLS0gCkZsb3JpYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
