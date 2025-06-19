Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A8BC7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5BxlJawa8EiASPMl4JM/4HdslD83NDRduqzMQCAxIU=; b=40FC2XwWb9JtVd
	GhPPj5sWofcD/O4c2blqobGRDbR/COc5CjB3fWy5PoIDNONmXeSvJABAwiZZfueRYWS28jBvh106v
	i7wsNSniGw82FKn6/LcmoDl9AXPcJxems/gGUwJYXzMutZE0QydgIW0Z4TFzy42KAftsdJvC4jTNO
	r23Hk5mbNkQ+O39ZukWki1a44B2azDrcrliAl7iE+GlDg8rYTkPX8idCBTVpkqvzajRm1ABwSUZgM
	+kCiYhAWn+waoHIL08FAjTu8n9WKsWSmoB0RnFTU1xNCo9jJNw4XHl1cyw9qceoRkw45FtRslIVyw
	MWaCLLBj4Qd+HtQT2Jsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDo-0000000E0qJ-1Zqf;
	Thu, 19 Jun 2025 18:42:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJjQ-0000000DqEE-2wrs
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 18:11:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so732275a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Jun 2025 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750356683; x=1750961483; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F1ViY++JCslwslFZ2ivTe1AaApjS3uUEi0/MYj45rTI=;
        b=UECRQ0cCacnbwMDDPq2F0MskeuG2uK8PYoMvzt9FUdfGl7bdbzdRz+FsuvGgVxpKf+
         JUGFrwWucyuWmzI1vpmcVZ3Z0zl6faJG5L0CyoxYpOVNxlq+k8ykOxQSIVDpYHQZ0tTA
         8OnrOHPOUcEU5bkU8EQBusb7CIdsMcce9y72k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356683; x=1750961483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1ViY++JCslwslFZ2ivTe1AaApjS3uUEi0/MYj45rTI=;
        b=LiuFLWN368P38VkYsoH+AaR2V6G4Da1/CGtv2aupdT3OgSl3FGiBft0oCmD8y6M+ul
         uTOXynUiLaceDD5yg+yOEcDAv/KtpxQ5J5KjE0F2xZct3bgjITVyE8TIrv27JVxuvrwR
         DX8vqLbN0UkaBCxyWPq+Hkfx4LAyWPdSvQr8LD6X3/8xNBzK+i3t/EFn4Vjjw08ea724
         s46wNJqLVJTXdTVugiFf4kSZXJMEusx9d6ixYSte6KKAM3RJPSbfxEgKt8jCve3yg9Z9
         f953eFa8B7TLZpQbpfMGHoz244G3UzvamL1x7eeQ4XS7fdcmbYaj4r+rDPaUX2h5HyeL
         8Aqw==
X-Forwarded-Encrypted: i=1; AJvYcCXipkal4kJlGJMTGmPJTnu9ly1CUGdhzbFVLisvyIxRmyfDpjXTWQ+VOmV0w9BLuY60KnBKWmQ+YJc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+vgH7pwb4yU7MOR7hkUntaQUQwpZKWquYhu2amP3mX44eICD0
	gNXjdQRDniiSPHnUHa8pJ4zr6op+s7GKEV3VPBCkLatq1cG7JvWdWqRQdCTO5QF7Kg==
X-Gm-Gg: ASbGncvYGog/JM6I0vQnWQoa/dhkB1NCh1WlboeGYmUUn5gf60fFcIysv/POBXPqtwE
	AtkiWH2M3sexFViiq53UihEf9defS16S15ICZ1IZzD/lGOJTreSuju8pjR0UjoBtFqU5WiwoNMK
	VmWvBrh5rkNkFGhQII1ZF2InGUitAS+O2Nnj2H7I107xdBgW7o/VjmlaX9CYjE131T12vbDxk3g
	/BYnUT8WJFetbfLtAI4hUVTsdLlqcaB0Dce+VZ6BYJ/Wvitx+DyaHDHyauhIFnWMdepMYZNx02B
	rssGpXHQ6t3O8xW9S1eJ7CkIFKwufJYLg+V5at3K2yLaIjP47XtC31inZbztx+WGRTZn3rT5Aaw
	bPu6gRSuPTTku9iFNCwx/1X17ow==
X-Google-Smtp-Source: AGHT+IEUwsHN1GrfJdg9ZSt6e4DoOjhiR7sdM1DnwW5pSqQE0YhERlCw1nOK3dyoDhOAzyvBdUbgbA==
X-Received: by 2002:a17:90b:538d:b0:313:283e:e87c with SMTP id 98e67ed59e1d1-3159d6347famr291618a91.3.1750356683084;
        Thu, 19 Jun 2025 11:11:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e19bsm2548531a91.12.2025.06.19.11.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 11:11:22 -0700 (PDT)
Message-ID: <44bc4834-da10-49fd-90bb-0ca63746aae8@broadcom.com>
Date: Thu, 19 Jun 2025 11:11:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Regan <dregan@broadcom.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Dan Beygelman <dan.beygelman@broadcom.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com,
 JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>,
 Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu@gmail.com, dregan@mail.com
References: <20250606165756.1531164-1-dregan@broadcom.com>
 <8734c9z2ye.fsf@bootlin.com>
 <CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com>
 <87h60dmn86.fsf@bootlin.com>
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
In-Reply-To: <87h60dmn86.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_111124_780666_E8528B2C 
X-CRM114-Status: GOOD (  17.42  )
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

On 6/18/25 02:07, Miquel Raynal wrote:
> Hello David,
> 
>> I'm not familiar with nandbiterrs but here's the results from
>> mtd_nandbiterrs.ko on my NAND set to BCH8:
>>
>> # insmod mtd_nandbiterrs.ko dev=0
>> [  676.097190]
>> [  676.098760] ==================================================
>> [  676.104609] mtd_nandbiterrs: MTD device: 0
>> [  676.108732] mtd_nandbiterrs: MTD device size 2097152,
>> eraseblock=262144, page=4096, oob=216
>> [  676.117089] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
>> [  676.123188] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
>> [  676.130863] mtd_nandbiterrs: incremental biterrors test
>> [  676.136154] mtd_nandbiterrs: write_page
>> [  676.140761] mtd_nandbiterrs: rewrite page
>> [  676.145473] mtd_nandbiterrs: read_page
>> [  676.149621] mtd_nandbiterrs: verify_page
>> [  676.153625] mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
>> [  676.160678] mtd_nandbiterrs: Inserted biterror @ 0/5
>> [  676.165647] mtd_nandbiterrs: rewrite page
>> [  676.170363] mtd_nandbiterrs: read_page
>> [  676.174508] mtd_nandbiterrs: Read reported 1 corrected bit errors
>> [  676.180606] mtd_nandbiterrs: verify_page
>> [  676.184609] mtd_nandbiterrs: Successfully corrected 1 bit errors per subpage
>> [  676.191662] mtd_nandbiterrs: Inserted biterror @ 0/2
>> [  676.196631] mtd_nandbiterrs: rewrite page
>> [  676.201342] mtd_nandbiterrs: read_page
>> [  676.205487] mtd_nandbiterrs: Read reported 2 corrected bit errors
>> [  676.211586] mtd_nandbiterrs: verify_page
>> [  676.215588] mtd_nandbiterrs: Successfully corrected 2 bit errors per subpage
>> [  676.222641] mtd_nandbiterrs: Inserted biterror @ 0/0
>> [  676.227608] mtd_nandbiterrs: rewrite page
>> [  676.228356] mtd_nandbiterrs: read_page
>> [  676.228749] mtd_nandbiterrs: Read reported 3 corrected bit errors
>> [  676.228751] mtd_nandbiterrs: verify_page
>> [  676.228829] mtd_nandbiterrs: Successfully corrected 3 bit errors per subpage
>> [  676.228831] mtd_nandbiterrs: Inserted biterror @ 1/7
>> [  676.228833] mtd_nandbiterrs: rewrite page
>> [  676.229530] mtd_nandbiterrs: read_page
>> [  676.229922] mtd_nandbiterrs: Read reported 4 corrected bit errors
>> [  676.229924] mtd_nandbiterrs: verify_page
>> [  676.230001] mtd_nandbiterrs: Successfully corrected 4 bit errors per subpage
>> [  676.230003] mtd_nandbiterrs: Inserted biterror @ 1/5
>> [  676.230005] mtd_nandbiterrs: rewrite page
>> [  676.294177] mtd_nandbiterrs: read_page
>> [  676.298337] mtd_nandbiterrs: Read reported 5 corrected bit errors
>> [  676.304436] mtd_nandbiterrs: verify_page
>> [  676.308441] mtd_nandbiterrs: Successfully corrected 5 bit errors per subpage
>> [  676.315494] mtd_nandbiterrs: Inserted biterror @ 1/2
>> [  676.320464] mtd_nandbiterrs: rewrite page
>> [  676.325174] mtd_nandbiterrs: read_page
>> [  676.329327] mtd_nandbiterrs: Read reported 6 corrected bit errors
>> [  676.335426] mtd_nandbiterrs: verify_page
>> [  676.339429] mtd_nandbiterrs: Successfully corrected 6 bit errors per subpage
>> [  676.346483] mtd_nandbiterrs: Inserted biterror @ 1/0
>> [  676.351452] mtd_nandbiterrs: rewrite page
>> [  676.356162] mtd_nandbiterrs: read_page
>> [  676.360308] mtd_nandbiterrs: Read reported 7 corrected bit errors
>> [  676.366407] mtd_nandbiterrs: verify_page
>> [  676.370409] mtd_nandbiterrs: Successfully corrected 7 bit errors per subpage
>> [  676.377462] mtd_nandbiterrs: Inserted biterror @ 2/6
>> [  676.382432] mtd_nandbiterrs: rewrite page
>> [  676.387142] mtd_nandbiterrs: read_page
>> [  676.391287] mtd_nandbiterrs: Read reported 8 corrected bit errors
>> [  676.397385] mtd_nandbiterrs: verify_page
>> [  676.401388] mtd_nandbiterrs: Successfully corrected 8 bit errors
>> per subpage
> 
> So far the reporting looks good (and the nandflipbits output looks
> correct as well).
> 
>> [  676.408441] mtd_nandbiterrs: Inserted biterror @ 2/5
>> [  676.413411] mtd_nandbiterrs: rewrite page
>> [  676.418122] mtd_nandbiterrs: read_page
>> [  676.422267] mtd_nandbiterrs: verify_page
>> [  676.426194] mtd_nandbiterrs: Error: page offset 0, expected 25, got 00
>> [  676.432727] mtd_nandbiterrs: Error: page offset 1, expected a5, got 00
>> [  676.439260] mtd_nandbiterrs: Error: page offset 2, expected 65, got 05
>> [  676.445868] mtd_nandbiterrs: ECC failure, read data is incorrect
>> despite read success
> 
> Here however there is something wrong. We do expect a read failure,
> instead of returning wrong data. There is still a problem, I do not know
> if this problem was there before though, but this must be fixed.
> 
> Hello Florian, if you have time, I'd welcome you opinion on this patch :)

I don't think I am entitled any opinion on this patch other than 
confirming the register offset locations. Both William and David have 
far more experience with this NAND controller and devices that I do.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
