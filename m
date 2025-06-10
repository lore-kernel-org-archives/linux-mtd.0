Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BCCC677C4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PWbDcZNpjv0jMjbqae26mNcaNGUAg5ymDAxFitmRBU=; b=fqdvLBnr0xkKr6
	lVFzPx8B/IW+ThK4iUrd4XMSS8CS9OYxBxfB4kq3i2uNCuzXfO0d5zrcoa9ZGsIgmAS3MTlMHBC1O
	qT75t5qHXA934YTCy0PxqD+1rUB4jbVbrnUUZ1nqef/gVoh5F8zFA/+ATupGnUWhBCF/ZreL9H2ir
	d+9MO573FGqu5059puJRI+ZRl5sXlWR+zjA+PSgHkA5mQ5RW56DjFng5WHO8Lu4pN6wOem17k7Tui
	V7W0p/T/lo3HmqcE5FvS6/LmJZgAFns7z64SPRQCWXFENyYIyFRrqK6LY7QG8bE0rx/s8tZmHUa32
	AINLwgO4aaRx9VU5FR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4wq-00000007xIC-1Ocm;
	Tue, 10 Jun 2025 19:47:52 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1dJ-00000007RS6-2fjP
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 16:15:30 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6488221b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 10 Jun 2025 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749572129; x=1750176929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SGmRJAWB9RdYxrzDZGLu8XN2tBT3An3sj/2b1cUQNXg=;
        b=U7sKETXln7xrJKrtgN7bl9FZAytbhqym/QMjV48cQJXFEx+XJXDqVQ258lvajObjGg
         H0hzxrfW5jcMVl/eLzM0+ISwf1ejOo7Xxp4XnhA0tRnbQfMVIig0lARkLM5w9IXBvmRp
         5lELqQNkvlnoc+yYAVB28pd0+PGt85EVwI8eRRVTblgXk3cuMffV63Sw0CI3Ze+SEsYg
         3QnjGS1ZpNhQuFnW2dWtY5NPU5mFYgTpBJvHFeDbfFXfGQxf/YEojg3eYkVTZo3TFWgI
         XNZV99HliSlbc0O82PWc+GSG0mMh0+VaoZhbUL4xI5mR295bETdFbODnJekIL+ULz1Gs
         aNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572129; x=1750176929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGmRJAWB9RdYxrzDZGLu8XN2tBT3An3sj/2b1cUQNXg=;
        b=w3yvba0MJriaBahjJ+SzwbKS1YIYVjrrXGazKK6XXfs1mtPK3hqcovFWbSNpm+BiDv
         mVTv0p7sujOGUN1x6JYC4V1KvYflLuoCcCy29omKvlunq5132/gnZiyOEh5RMiC4hZbX
         HZt7tcpIxMwtoZeouXfVhwP0DFkerzz+iONM68Z63Y5hyyJmbYdDguJh2cVyLDkfmoab
         jhs+NPXTrhGA+xacs7Fzaty9weAT0wi1a9qLcPTzVskCJ+9bXSN2eHLaCWGc8gf2EROE
         +NvvECyYQe2Pt+BBFIn2GsyLSyTBUVyJTbYWvDL5p65tupNDQ6E8vVMmVxSj5oMEHbZa
         KbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKd2M3OwK/gb6dYdmiYmkfsN7XOAWSagZYT0klw7s1CWMuUDB72i/vZAunKUXzPk04Tiji8M8Gpww=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeoBiY4ZkulLAEd0xQm4ZLoJXUJgmLMaw0oWlo/8tVegQEjhNG
	O8U8L8kD07S9SYYMkNbdz84VA4hee2ghuMVRUEypQlC3xm+Q41rH6ZD1
X-Gm-Gg: ASbGncu5iYrl4Wazl0FQmksj37KpcMKBBQSKmShetCzc0KZWYTGPw1aBjP4gxaiOQUO
	iisVLZ88tIJhRrEjxpYwyRsRcKt7t8b/JEI3DcP9wQOjWFBWBuMB9qQyjIRsTU3nmDAIcHwcQCz
	onr4amh2JHerSgo/m0UNA4ZOnx7Q5V4Oq6zPs7pa+CwcgBc76qGD2aIiJDdQnuJ7qApVomiVUKV
	iyjHx+1JzIO+Fx8YI5BDjd8AoY5dNFMFMV4OpCEeh/B/iuaggOB/12vl+NrNPZ6BP6WKW16tyIY
	OyHRS4AVZSPICCaauFT73VNywphW3uxUynmfMxePiXwuGF4H3fuUznb/MPeXSu97g1rfD2XDzl9
	e5Nb7fK9jckq/WpB+3utcbO9wNMMw4V/KdAQ=
X-Google-Smtp-Source: AGHT+IHYQYM7G6bttifJeNfjnkDx1F8NGq5T9NLpKQPd57Ef2ALNRna0f38GlbUS9BZPkJm49q/Gfw==
X-Received: by 2002:a05:6a00:2d15:b0:746:3200:620 with SMTP id d2e1a72fcca58-7486cb4ca2cmr227347b3a.9.1749572128739;
        Tue, 10 Jun 2025 09:15:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af38378sm7923696b3a.16.2025.06.10.09.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:15:28 -0700 (PDT)
Message-ID: <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
Date: Tue, 10 Jun 2025 09:15:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
To: Richard Weinberger <richard@nod.at>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
 <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
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
In-Reply-To: <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_091529_675193_32E03AE7 
X-CRM114-Status: UNSURE (   9.20  )
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

T24gNi8xMC8yNSAwNTo1NCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVyc3By
w7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiQWxleGFuZGVyIFVzeXNraW4iIDxhbGV4YW5k
ZXIudXN5c2tpbkBpbnRlbC5jb20+Cj4+IFJpY2hhcmQsIEkndmUgcmVwcm9kdWNlZCB5b3VyIHNl
dHVwIChtb2R1bG8gdGhhdCBJIG11c3QgbG9hZCBtdGRyYW0gbWFudWFsbHkpCj4+IGFuZCBwYXRj
aCBwcm92aWRlZCBpbiB0aGlzIHRocmVhZCBoZWxwcyB0byBmaXggdGhlIGlzc3VlLgo+PiBDYW4g
eW91IGFwcGx5IGFuZCBjb25maXJtPwo+IAo+IFllcywgaXQgZml4ZXMgdGhlIGlzc3VlIGhlcmUh
IDotKQo+IAoKSXQgZG9lc24ndCBzZWVtIHRvIGZpeCB0aGUgaXNzdWUgaWYgdGhlIHBhcnRpdGlv
biBkYXRhIGlzIGluIGRldmljZXRyZWUuCgpIZXJlIGlzIG15IHNhbXBsZSBxZW11IGNvbW1hbmQg
bGluZToKCnFlbXUtc3lzdGVtLWFybSAtTSBzdXBlcm1pY3JvLXgxMXNwaS1ibWMsZm1jLW1vZGVs
PW4yNXEyNTZhMTMsc3BpLW1vZGVsPW4yNXEyNTZhMTMgXAoJLWtlcm5lbCBhcmNoL2FybS9ib290
L3pJbWFnZSAtbm8tcmVib290IFwKCS1zbmFwc2hvdCAtYXVkaW8gbm9uZSBcCgktZHJpdmUgZmls
ZT0vdG1wL2ZsYXNoLGZvcm1hdD1yYXcsaWY9bXRkIFwKCS1kcml2ZSBmaWxlPS90bXAvZmxhc2gs
Zm9ybWF0PXJhdyxpZj1tdGQsaW5kZXg9MSBcCgktbmljIHVzZXIgXAoJLS1hcHBlbmQgImt1bml0
LmVuYWJsZT0wIHJvb3Q9L2Rldi9tdGRibG9jazAgcm9vdHdhaXQgY29uc29sZT10dHlTNCwxMTUy
MDAgZWFybHljb249dWFydDgyNTAsbW1pbzMyLDB4MWU3ODQwMDAsMTE1MjAwbjgiIFwKCS1kdGIg
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtc3VwZXJtaWNyby14MTFzcGkuZHRi
IFwKCS1ub2dyYXBoaWMgLW1vbml0b3IgbnVsbCAtc2VyaWFsIHN0ZGlvCgpUaGlzIGRvZXMgbm90
IGNyZWF0ZSBhbnkgbXRkIHBhcnRpdGlvbnMsIGV2ZW4gYWZ0ZXIgYXBwbHlpbmcgdGhlCnBhdGNo
IHN1Z2dlc3RlZCBlYXJsaWVyLgoKR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
