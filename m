Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED7FC5B552
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 07:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7YK/Ypj2NQ4btpUCvgGbsXeN+l1QXjEkASWyxNifwQ=; b=4tqQ+1wdw8BpD6
	LHbRdsGLuIhnnq2ON2HVUiXDXFmo3Niqdvz/BvmbLc/I+DYAcVlvQaQ1+PArabpviZM9BqkRpItat
	7oheIhyrgKhHdP/21TxxBu2LL43qp5hSW8mKbrt+rpP6heBuVrvKgb+LKTwZQGJMRr/mCtg5Y1wKU
	vsKmMDg1L0Uggwh0GilkSPUBMyXQ7sI6/T96Ta2E1jSAM2pbXG3hubuj7VtW/Mrwr8fBRI4P0YkmZ
	fc9WGuDMqp8BRjVaNt0Cey970ClmCL1YGM3YgT6Zr4/UQSBaJN8PVdW9OZTsNWSfZZXxHLy+BUuAe
	KolJOnxZv8lLlzwsKuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOte4-000000063T2-3BUK;
	Tue, 10 Jun 2025 07:43:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOte2-000000063Sh-3tZq
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 07:43:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-236377f00easo5891235ad.1
        for <linux-mtd@lists.infradead.org>; Tue, 10 Jun 2025 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749541422; x=1750146222; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OfU97cZH2HgHI7uIemmkAw8kJldevbQFXn6zd95g/RE=;
        b=jwkJy+vKSXzqmTO+Q1M19zHQWvw5+7KDONslAHm2JnrlJOmzBIUGt7eXjH50GQgLW3
         uG3KBlfnUoGJLJLOqWwNQBxaUmS0z3vT718xcIIkF9sfZuQYLsAeiQuROJ8m4a6yZadb
         gL+6MeiKyCTqHXogHk1b/nbXBx+LaBbGojuuMV2uYejdYruSwC0y7rbRzy7Y4QZrM7Rc
         r6+jR3vDbNrk+iAp3rNM0fluzsrC2RfLxXKxTcNmHM8icDJNsrshfaNmCJ6wt1AFngHN
         KGDg59cjGBhbU8haKtHyX2NQs9a5dq2Q9noqRUrGsXjWC/qSrzTAiOac2w/bbJ1c5aoK
         HJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541422; x=1750146222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfU97cZH2HgHI7uIemmkAw8kJldevbQFXn6zd95g/RE=;
        b=tQeSFkLn1VcdIXQswjbN6165nGiHA4W67OxJfl6IIa1Bj4VXWNMNfib9zvhMIFTrIE
         rM96pYAtkuPa+i24F/myK+zciR5lK1ikvtbRi5OfZerVNGVOaSL4DkF2+hqBdIvigezs
         tMsMgWqz2sthFrJV8nACwbcMkh3TaskiqO7BiESzFupCRqJ0uXQNPbj9k3BZhrZj1x1S
         Taygx8OeYTix53jXkWxAHNH/tfm+5RX1CrU44vHlFtaQua9s7NAqfIEgt+fWPIMa/Dwx
         dGoWg1quNvmkT7RWwUeaxrR5lo+H/SCsFgeXsg53bhNm2tnIpRkRumqMsBfd0eRUloF9
         QRsA==
X-Forwarded-Encrypted: i=1; AJvYcCVPMtvcxlpKlNKvgs0PqjbMh2V7jX11/scwKO2ZbjzrfsdcadqZvDDpzFUYntbzMj+bJbRsHzneguY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmZVf+x6c95JhD4ZN1KQCS6t5wEVZs94KoLpYbeERB86cH7oey
	ioJtMcA7qQkeX7r8bvjRMaVJPc75n++W0IGDtM0aIXbXpArKxViJXRyk
X-Gm-Gg: ASbGncsnrd3808gqSCutj0S2IdURo/QgxK0Tjh0liCartbFpEK9u12wWly1FAqaaOAh
	A0w6e4mqVMU8FEENofjI3XeiF+Sgg91fcOkqMETo5K5zrHmeIEI1/RSE2iXTxbMo/1SFcK1ieyJ
	SfgS6jy4PfVT8FbNAIna+dTd1/tVut6zAljVNgTS7HzdfMOEUDZnrSG7ayuIaIr10buz/+31GJG
	vDOeSsaS8Tvi4Tuj53ifRI5QYDBgEjwht4U75IeIBYjfaswf4uMfgZWDJB8loB43ft6X5xzgqan
	dmfrcv82m9Lp8hzyLWsRc8zDNxQEUGvPPcrRmsM2VWydxUzxaWe603MYABJ6Ht7LJjryTK8mXqF
	gzL9AjcvkGXP6YjKgwGeX7Gw+TD/7pJttoyI=
X-Google-Smtp-Source: AGHT+IHdhMgBtQokcJ/Q7bh9+BcN8CJW/QMCpCT6PI94inpveIKBqilCMqdGnB1z9W9y+xUFTQDFQQ==
X-Received: by 2002:a17:902:dacb:b0:235:f70:fd39 with SMTP id d9443c01a7336-23601ced438mr229890505ad.10.1749541422122;
        Tue, 10 Jun 2025 00:43:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed59cdcsm6305969a12.12.2025.06.10.00.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:43:41 -0700 (PDT)
Message-ID: <8d4bd876-3571-46e5-857a-948e58b21c5b@roeck-us.net>
Date: Tue, 10 Jun 2025 00:43:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Cheng Ming Lin <linchengming884@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
 <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
 <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_004342_969902_B89748BF 
X-CRM114-Status: GOOD (  24.88  )
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

T24gNi8xMC8yNSAwMDoyOSwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gVHVkb3IgQW1iYXJ1cyA8
dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiDmlrwgMjAyNeW5tDbmnIgxMOaXpSDpgLHkuowg5LiL
5Y2IMjo0NuWvq+mBk++8mgo+Pgo+Pgo+Pgo+PiBPbiA2LzEwLzI1IDE6MTQgQU0sIEd1ZW50ZXIg
Um9lY2sgd3JvdGU6Cj4+PiBPbiA2LzgvMjUgMTg6MTMsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+
Pj4gT24gNi84LzI1IDA1OjUzLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPj4+Pj4gT24gU2F0LCBK
dW4gMDcgMjAyNSwgR3VlbnRlciBSb2VjayB3cm90ZToKPj4+Pj4KPj4+Pj4+IEhpLAo+Pj4+Pj4K
Pj4+Pj4+IE9uIE1vbiwgQXByIDA3LCAyMDI1IGF0IDAzOjUzOjU4UE0gKzA4MDAsIENoZW5nIE1p
bmcgTGluIHdyb3RlOgo+Pj4+Pj4+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5A
bXhpYy5jb20udHc+Cj4+Pj4+Pj4KPj4+Pj4+PiBNYW55IGZsYXNoIGRldmljZXMgc2hhcmUgdGhl
IHNhbWUgSUQgYnV0IGhhdmUgZGlmZmVyZW50IHBhcnQgbnVtYmVycy4KPj4+Pj4+PiBUbyBhdm9p
ZCBjb25mdXNpb24sIHRoZSBwYXJ0IG51bWJlciBmaWVsZCBpcyByZW1vdmVkLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gQWRkaXRpb25hbGx5LCBzaW5jZSBTRkRQIGFscmVhZHkgcHJvdmlkZXMgc2l6ZSBpbmZv
cm1hdGlvbiBhbmQKPj4+Pj4+PiBmdW5jdGlvbmFsaXR5IGNvdmVyZWQgYnkgbm9fc2ZkcF9mbGFn
cywgdGhlc2UgZmllbGRzIGFyZSBhbHNvIHJlbW92ZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBGdXJ0aGVy
bW9yZSwgd2hlbiA0LWJ5dGUgYWRkcmVzcyBpbnN0cnVjdGlvbiB0YWJsZSBpcyBhdmFpbGFibGUs
Cj4+Pj4+Pj4gdGhlIFNQSV9OT1JfNEJfT1BDT0RFUyBmbGFnIGlzIG5vIGxvbmdlciBuZWVkZWQg
YW5kIGlzIHJlbW92ZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5n
IExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+Pj4+Pj4+IEFja2VkLWJ5OiBUdWRvciBB
bWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+Pj4+Pgo+Pj4+Pj4gV2l0aCB0aGlz
IHBhdGNoIGluIHBsYWNlLCBzb21lIG9mIG15IHFlbXUgdGVzdHMgbm8gbG9uZ2VyIHJlY29nbml6
ZSB0aGUKPj4+Pj4+IGZsYXNoIGNoaXBzIChNWDI1TDI1NjM1RS9GKS4gRG8geW91IGhhdmUgYSBz
dWdnZXN0aW9uIG9uIGhvdyB0byBoYW5kbGUKPj4+Pj4+IHRoaXMgb3RoZXIgdGhhbiBhdm9pZGlu
ZyBNYWNyb25peCBmbGFzaCBjaGlwcyB3aGVuIHdvcmtpbmcgd2l0aCBxZW11ID8KPj4+Pj4KPj4+
Pj4gQ291bGQgeW91IHNoYXJlIHNvbWUgbG9ncz8gRG9lcyB0aGUgZmxhc2ggZmFpbCB0byBkZXRl
Y3QsIG9yIGRvZXMgdGhlCj4+Pj4+IFNGRFAtYmFzZWQgcHJvYmluZyBmYWlsPyBTaW5jZSB0aGlz
IGlzIHFlbXUsIGl0IHdvdWxkIGJlIGV2ZW4gYmV0dGVyIGlmCj4+Pj4+IHlvdSBjYW4gc2hhcmUg
YSBzZXR1cC9yZXByb2R1Y3Rpb24gZ3VpZGUuIEkgaGF2ZSBiZWVuIG1lYW5pbmcgdG8gc2V0IHVw
Cj4+Pj4+IHFlbXUgZm9yIFNQSSBOT1IgdGVzdGluZyBmb3Igc29tZSB0aW1lIG5vdywgYnV0IG5l
dmVyIGdvdCBhcm91bmQgdG8KPj4+Pj4gZmlndXJpbmcgaXQgb3V0Lgo+Pj4+Pgo+Pj4+Cj4+Pj4g
SSBzdXNwZWN0IHRoYXQgdGhlIFNGRFAgZGF0YSBmb3IgdGhlIGFmZmVjdGVkIGZsYXNoZXMgaXMg
aW5jb3JyZWN0IGluCj4+Pj4gcWVtdS4KPj4+PiBTaW5jZSB0aGlzIGlzIHZlcnkgbGlrZWx5IGEg
cWVtdSBwcm9ibGVtLCBJJ2xsIGp1c3QgY29uZmlndXJlCj4+Pj4gZGlmZmVyZW50IGZsYXNoCj4+
Pj4gY2hpcHMgd2hlbiBydW5uaW5nIGFmZmVjdGVkIHRlc3RzLgo+Pj4+Cj4+Pgo+Pj4gSSB3YXMg
YWJsZSB0byBjb25maXJtIHRoZSBhYm92ZS4gVGhpcyBpcyBmcm9tIHRoZSBrZXJuZWwgbG9nOgo+
Pj4KPj4+IFsgICAgNC41MDAwMDBdIHNwaS1ub3Igc3BpMC4wOiBCRlBUIHBhcnNpbmcgZmFpbGVk
LiBQbGVhc2UgY29uc2lkZXIKPj4+IHVzaW5nIFNQSV9OT1JfU0tJUF9TRkRQIHdoZW4gZGVjbGFy
aW5nIHRoZSBmbGFzaAo+Pj4gWyAgICA0LjUwMDAwMF0gc3BpLW5vciBzcGkwLjA6IHByb2JlIHdp
dGggZHJpdmVyIHNwaS1ub3IgZmFpbGVkIHdpdGgKPj4+IGVycm9yIC0yMgo+Pj4KPj4KPj4gSXQn
cyBsaWtlbHkgdGhlIHByb2JsZW0gd2hlcmUgdGhlIHNhbWUgZmxhc2ggSUQgaXMgdXNlZCBmb3Ig
ZGlmZmVyZW50Cj4+IGZsYXZvcnMgb2YgZmxhc2hlcy4gVHlwaWNhbGx5IHdlIGRpZmZlcmVudGlh
dGUgdGhlIGZsYXZvcnMgYnkgY29tcGFyaW5nCj4+IHRoZWlyIFNGRFAgZGF0YSBhbmQgdXNlIHBv
c3QgU0ZEUCBob29rcyB0byBhbWVuZCB3aGVyZSBuZWVkZWQuIElmIG5vIG9uZQo+PiBjYXJlcyBh
Ym91dCBmaXhpbmcgaXQsIHdlIGNhbiB1bmRvIHRoZSBjaGFuZ2UgZm9yIHRoZSBhZmZlY3RlZCBm
bGFzaCBvcgo+PiByZXZlcnQgdGhlIHBhdGNoIGVudGlyZWx5LiBDaGVuZz8KPj4KPiAKPiBTaW5j
ZSB0aGlzIHBhdGNoIHJlbW92ZWQgdGhlIHNpemUgZmllbGQsIHRoZSBpc3N1ZSBvY2N1cnMgYmVj
YXVzZSB0aGUKPiAic3BpX25vcl9pbml0X3BhcmFtcyIgZnVuY3Rpb24gbm93IHByb2Nlc3NlcyB0
aGUgInNwaV9ub3JfcGFyc2Vfc2ZkcCIKPiBmdW5jdGlvbi4gQXMgYSByZXN1bHQsIHRoZSBlcnJv
ciBpcyBsaWtlbHkgY2F1c2VkIGJ5IGEgcHJvYmxlbSBkdXJpbmcgdGhlCj4gU0ZEUCBwYXJzaW5n
LCB3aGljaCBsZWFkcyB0byB0aGUgZmFpbHVyZSBvZiAic3BpX25vcl9pbml0X3BhcmFtcyIuCj4g
Cj4gVGhlIGlzc3VlIGNhbiBiZSByZXNvbHZlZCBieSBhZGRpbmcgLnNpemUgPSBTWl8zMk0gdG8g
dGhlIGZsYXNoX2luZm8gZm9yCj4gTVgyNUwyNTYzNUUgdG8gcHJldmVudCBmYWlsdXJlcyBjYXVz
ZWQgYnkgU0ZEUCBwYXJzaW5nLgo+IAo+IFRoZSByb290IGNhdXNlIG9mIHRoaXMgcHJvYmxlbSBs
aWVzIGluIHRoZSBmYWlsdXJlIG9mIHBhcnNpbmcgdGhlIFNGRFAKPiBkYXRhIGZvciB0aGUgZmxh
c2gsIHJhdGhlciB0aGFuIGFuIGlzc3VlIHdpdGggdGhlIHBhdGNoIGl0c2VsZi4gSSBiZWxpZXZl
Cj4gd2Ugc2hvdWxkIG5vdCByZXZlcnQgdGhpcyBwYXRjaC4KPiAKCkkgdGVuZCB0byBhZ3JlZS4g
VGhlIHByb2JsZW0gaXMgdmVyeSBsaWtlbHkgb24gdGhlIHFlbXUgc2lkZSBhbmQgc2hvdWxkIGJl
CmFkZHJlc3NlZCB0aGVyZS4KCkd1ZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
