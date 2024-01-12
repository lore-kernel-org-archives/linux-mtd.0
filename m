Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47542C4707C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 20:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFYacFHaPlhX9d0Mb+Hsk2xqGIvmWZ1xINUgQQXsDQ4=; b=C+OXP85f1UmUuD
	2wrmvq5Dl1Nkznz0b4Q9LwTlObKh2YQ9qCeb0IvwV46V8bWckRQ1AgaVjRdVURjQhz8eCCvEU943C
	uSzwToFqk1kOfoIqn21rWpoEDARBj1vuYuF7qA9m4+aKGIokyic9X1aT3UDXC5fhc35973HEd272Q
	DgRLBggUgx5GSUtyHbqrwxPRsCcJR1fAzcrTytnfxVvavO5zE6TTciHcUHQ+q0uPzXeq9cCByCMbz
	lVC6w4h/3dthR++SswbITymzxZSPupwxUqm+6w07Z6G4oCHK+qtGvjO4DynaUcgsK2613QCWLeE+V
	ACWMHfLIvR4lxNcT1Ztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rONmN-003tSr-2t;
	Fri, 12 Jan 2024 20:05:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rONmL-003tS2-21;
	Fri, 12 Jan 2024 20:05:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6d9b5c4f332so4266653b3a.3;
        Fri, 12 Jan 2024 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705089919; x=1705694719; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=na4pzT09FoS2V7jC/k9PCQ6SoXGbrDcnbxJvw9iXvfw=;
        b=LGiGp3Kx9Vy525O/rMIOuzItiuGr/nZHZW3Z/LFn3xRqTm3+PI9+DNCOFotZXRtjVM
         OPYG2OStdUq/ZvWTFovC7j+zb8N3xgt7NXMS8YS4xJOO86cotySqrfss4/BlbtR8do2m
         80TgXVnGgltWRIqs3WwgsvPy2xIoL15hCoV5EAwieCqas9E6milM6qp2fn+nFiAqZ6mK
         NvjgHzxf75JVcPPc5z31rkTTu0ztNEJPQpJDzlIjkdHxpfgI1KN56eSvdfxhBBaTr89T
         CJeTUWlYaQzbj3WlKgwxC5n4mQJZ8cBliE21uXHNLMWF9QRRmCprmPeI47oSi6DGguuM
         eCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705089919; x=1705694719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=na4pzT09FoS2V7jC/k9PCQ6SoXGbrDcnbxJvw9iXvfw=;
        b=FXwRn6qfLfHVv/UIykCMWmGiq/TBapCd06lSgsC9jOjzMrm594Z7KKAZg23BzIwuHx
         k34hCLKJvymKynj8yn6/oC1hOC560AL0khouw1Kz19FMlT2cQkR7S2OozfLHrbkIVfwt
         ba8xDIPXMaqkmO/Klc5x2yYh0pdfnDGW7UFuZizj6RgeHJFf5L2ej6dZLChAr3jsaWwN
         HS/ir+9mWlo87AA0Cug/7yOoJNJM4Zo5Q4Tus9664ydNfnpLPcZzW4B48suOzM76fgiO
         60buiKGCqsrIVMgj1HJoqWiVLqX19RZ4LaQkzXP0+lX4EGtmMjsM8LSFzoYKwJfy3ZaW
         lgqA==
X-Gm-Message-State: AOJu0YzeCw3vjwJQlr1iA7XBubuxwZcLy9zw11Dbn9N1+f9kwQPMUU8m
	Ll8K86t6svPE4NVotbIY5Ko=
X-Google-Smtp-Source: AGHT+IEycVEFGBn6j534mvX1bIJ3wserMi/KocsyYR1yA0juEfXSWk02LCKmPQcDWHDQHxYvEQekQg==
X-Received: by 2002:a05:6a20:3942:b0:19a:59da:a73b with SMTP id r2-20020a056a20394200b0019a59daa73bmr1319668pzg.33.1705089919134;
        Fri, 12 Jan 2024 12:05:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id sk3-20020a17090b2dc300b0028d276f078asm6926015pjb.43.2024.01.12.12.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 12:05:18 -0800 (PST)
Message-ID: <3488ac24-a40d-4376-98f3-2d97ec1aa204@roeck-us.net>
Date: Fri, 12 Jan 2024 12:05:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sbinding@opensource.cirrus.com,
 lee@kernel.org, james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, michael@walle.cc,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d21e76ce-8b55-48b1-ade0-9ec22092caeb@sirena.org.uk>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <d21e76ce-8b55-48b1-ade0-9ec22092caeb@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_120521_696874_D50513F2 
X-CRM114-Status: GOOD (  11.98  )
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

On 1/12/24 11:16, Mark Brown wrote:
> On Fri, Jan 12, 2024 at 11:11:07AM -0800, Guenter Roeck wrote:
>> On Sat, Nov 25, 2023 at 02:51:30PM +0530, Amit Kumar Mahapatra wrote:
> 
>>> AMD-Xilinx GQSPI controller has two advanced mode that allows the
>>> controller to consider two flashes as one single device.
> 
> ...
> 
>> With this patch in the mainline kernel, two of my qemu emulations
>> (quanta-q71l-bmc and almetto-bmc) fail to instantiate the first SPI
>> controller and thus fail to boot from SPI. The error message is
> 
> Not sure what quanta-q711-bmc is - is almetto-bmc really palmetto-bmc
> (which has a mainline DT with a SPI flash)?
> 

Yes, sorry, it should have been palmetto-bmc.

quanta-q71l-bmc: See
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dts

(it is q71l, not q711)

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
