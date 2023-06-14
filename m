Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D51BEB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 23:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjChizjqKJQQOG30I3l5s0jyoNBhQIat/SjenJYoA78=; b=YEMdFNXTS7hx39OiIKhhVJm6Eq
	sNqIQNJHgrDLKcHFUogoYuLuClubOoH6jLTPK3NDO6MzH/XAbLRwCvg8QkEhrWW+Vc/lwfDbGuJYj
	Ad6Krx1cnIcwRvUXjOCpjcqKdG4+aM0aSeaRwW3rexnxEiHz+RrhI/eQVLAPFzI8l5KiRq48Yp5TZ
	JlpWZPRTA9sNBWq0+nuVONM3RDl/ChIVFA+qw3SXlhDml6LuD9nvaXoBM1dUVcj4p1uF56xeCLyGU
	V4C1v3GYJ996c6VBmgqXGRhZ7KOIIv76HlCSRI3J66AWt5q3+WI5+KhYQ5ay/2cBj3cIawIEq4WKU
	OwDcodbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9aHl-00D4sL-0B;
	Wed, 14 Jun 2023 23:52:21 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9aHg-00D4qk-38
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 23:52:19 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f9c1735984so24645951cf.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1686786734; x=1689378734;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=QA9cIno+hadMJZhtXgApHDnZ7ycG1CKzLkRjTjLbbS8=;
        b=hSnI7Imz5jq7uVwtQl+3qoQa3trksdF0myNbwqASnU78UVW1piObCT1rpLJaHk6sG6
         czck+oFaJa6+xUHcu+dTenx98XT8nc6AcM+AM8bNUUUT6YkHVo6+c+hGd15AyL4WAKie
         ybF5aI47CJXCL5fzTrMnYN7mWnoaeEbPI0P1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686786734; x=1689378734;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA9cIno+hadMJZhtXgApHDnZ7ycG1CKzLkRjTjLbbS8=;
        b=TeSwTMr5RZYxZFd/uEYy73ZgIZ7oXMdoU7Pei0kTNDHU8+HZlPEU43D0x67qJGhFjd
         ECNaMF1FNqO6k/Orb4ANjxM1hyp7nxfwLJQbvJ8l9Wx/tm/qBs5KrE0QjFatoOPSdPZW
         A3b8mOJZ7Cq783M9+z1H7lovd+/Wlhs83TOSv9MyAoG0XRf7IQ3/whiN4T3huHDMPQyl
         NE6h861f7Q1KCShzS3SS6A2vymPRi1JJFB18aI+ywrOHUaUepuI/xK4YTZ4Ii32SOoJK
         ETMuO5dk3XhoBu5xRirgsRqCot0pVMWv4/tLmkV0nexEarmGXTI3eXOpiB1zuJKZMVmr
         A8Yg==
X-Gm-Message-State: AC+VfDxQ2IPNRioKor5O0W7FcAhpQjV3MUNT5fODld75AD5vMzKhpMoo
	b8cvo1A4UBBL1Z+PWzjIljVrEA==
X-Google-Smtp-Source: ACHHUZ4SOX+6kCept2oYuaB0UWwuwrflVpd2DU+hxA6SxDZYfsRgx1lWvUSpWZUEvrb8JyU1sUuo/w==
X-Received: by 2002:ac8:59c7:0:b0:3f9:efa3:9e6f with SMTP id f7-20020ac859c7000000b003f9efa39e6fmr4702568qtf.27.1686786733155;
        Wed, 14 Jun 2023 16:52:13 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id i6-20020ac84886000000b003f6bbd7863csm5495055qtq.86.2023.06.14.16.52.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2023 16:52:12 -0700 (PDT)
Subject: Re: [PATCH 10/12] mtd: rawnand: brcmnand: Add BCMBCA read data bus
 interface
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-arm-kernel@lists.infradead.org
References: <20230606231252.94838-1-william.zhang@broadcom.com>
 <20230606231252.94838-11-william.zhang@broadcom.com>
 <20230607102232.17c4a27b@xps-13>
 <7b393f47-4053-a8c7-f32e-3881d8130d80@broadcom.com>
 <20230608081821.1de5a50b@xps-13>
 <4ab08e3e-3be4-8b8b-6eb8-03a62337f46f@broadcom.com>
 <20230609103544.0f00f799@xps-13>
 <3d3b471b-c555-ee1c-96d6-c04d76979e76@broadcom.com>
 <20230612194908.5465bc56@xps-13> <20230612195305.4b097c46@xps-13>
 <da4cb6a6-aa7d-3747-3f64-19b5582b15e8@broadcom.com>
 <20230613084218.65a6da15@xps-13>
 <b4ceff9c-0126-99ba-6015-9ea9ec735dfc@broadcom.com>
 <20230614082205.74a04de1@xps-13>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <4f77131e-391a-16e0-5de3-cbed41360f2d@broadcom.com>
Date: Wed, 14 Jun 2023 16:52:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20230614082205.74a04de1@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_165217_215366_DEB45CFE 
X-CRM114-Status: GOOD (  50.72  )
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
Content-Type: multipart/mixed; boundary="===============4268409221846993452=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4268409221846993452==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000025897005fe1fa4f2"

--00000000000025897005fe1fa4f2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 06/13/2023 11:22 PM, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Tue, 13 Jun 2023 17:00:19 -0700:
> 
>> Hi Miquel,
>>
>> On 06/12/2023 11:42 PM, Miquel Raynal wrote:
>>> Hi William,
>>>
>>> william.zhang@broadcom.com wrote on Mon, 12 Jun 2023 12:18:58 -0700:
>>>    
>>>> On 06/12/2023 10:53 AM, Miquel Raynal wrote:
>>>>> Hello again,
>>>>>     >>>>>>>>>> Perhaps we could have a single function that is statically assigned at
>>>>>>>>>>>> probe time instead of a first helper with two conditions which calls in
>>>>>>>>>>>> one case another hook... This can be simplified I guess.
>>>>>>>>>>>>        >> Well this will need to be done at the SoC specific implementation level (bcm<xxx>_nand.c) and each SoC will need to have either general data bus read func with is_param option or data_bus_read_page, data_bus_read_param.
>>>>>>>>>>
>>>>>>>>>> You told me in case we would use exec_op we could avoid the param
>>>>>>>>>> cache. If that's true then the whole support can be simplified.
>>>>>>>>>>       >> Correct we may possibly unified the parameter data read but exec_op is long shot and we are not fully ready for that yet. It also depends on if the low level data register has endianess difference for the parameter data between difference SoCs.
>>>>>>>>>
>>>>>>>>> So I would like to push the current implementation and we can explore the exec_op option late which will be a much big and complete different implementation.
>>>>>>>>
>>>>>>>> I am sorry but this series is totally backwards, you're trying to guess
>>>>>>>> what comes next with the 'is_param' thing, it's exactly what we are
>>>>>>>> fighting against since 2017. There are plenty of ->exec_op()
>>>>>>>> conversions out there, I don't believe this one will be harder. You
>>>>>>>> need to convert the driver to this new API and get rid of this whole
>>>>>>>> endianness non-sense to simplify a lot the driver.
>>>>>>>>      >>> I am not guessing anything but just factor out the existing common nand cache read logic into the single default function(or one for page read and another for parameter read as I mentioned in another thread) and allow SoC to overrides the implementation when needed.
>>>>>>
>>>>>> No, you are trying to guess what type of read the core is performing,
>>>>>> either a regular data page read or a parameter page read.
>>>>>>    >>>>> I agree ->exec_op can possibly get rid of the parameter page read function and is the way to go. But it won't help on the page read for endianess.
>>>>>>
>>>>>> You told me there is no endianess issue with the data pages, so why it
>>>>>> won't help on the page read?
>>>>>>    >>>>> It's not that I am against exec_op but I want to take one step a time
>>>>>>> and I'd like to get these fixes
>>>>>>
>>>>>> I don't see any fix here? Let me know if I am missing something but
>>>>>> right now I see a new version of the controller being supported with
>>>>>> its own constraints. If you are fixing existing code for already
>>>>>> supported platform, then make it clear and we can discuss this. But if
>>>>>> you just want to support the bcmbca flavor, then there is no risk
>>>>>> mitigation involved here, and a conversion is the right step :)
>>>>>>    >>>
>>>>> I forgot to mention: the exec_op conversion is almost ready, Boris
>>>>> worked on it but he lacked the hardware so maybe you'll just need to
>>>>> revive the few patches which target your platform and do a little bit of
>>>>> debugging?
>>>>>
>>>>> https://github.com/bbrezillon/linux/commits/nand/exec-op-conversion?after=8a3cf6fd25d5e15c6667f9e95c1fc86e4cb735e6+34&branch=nand%2Fexec-op-conversion&qualified_name=refs%2Fheads%2Fnand%2Fexec-op-conversion
>>>>>     >> Yes this is the patch what our exec_op work is based on. Thanks Boris! The issue with patch is that performance is very slow for anything that rely on nand_read_page_op as the patch implementing it using the low level cmd and data register to transfer the data byte by byte.
>>>
>>> You don't need to use exec_op for your read_page/write_page hooks,
>>> quite the opposite actually. exec_op is not meant for high throughput.
>>> exec_op is meant to be simple. You can have fast I/Os with a different
>>> mechanism in your read/write_page hooks.
>>>    
>> Right it does not impact our fast path: controller based ecc read/write. But things like on-chip ecc nand driver that uses exec_op API get impacted badly. We need to add nand op parser, several matching rules and other logics to use fast path page read/write instead of the low level data register read/write.
>>
>>>>    I actually sent out email regarding this to Boris and he cc'ed you in
>>>>    sept last year. We have to use the nand parser to match the page read
>>>>    from exec_op so we can actually match and use the brcmnand_page_read
>>>>    fast path. But there are many situations that we need to match so the
>>>>    project to migrate exce_op are still work in progress just on our
>>>>    bcmbca chip as of now.  Just forward that email again to you and I
>>>>    appreciate it if you have any inputs there. So IMHO it is just too
>>>>    risky and too big of scope to have the exec_op added to this patch
>>>>    series and definitively better to do it afterwards with a dedicated
>>>>    patch.
>>>
>>> As long as you add small and orthogonal changes to cmd_ctrl/cmd_func
>>> I don't mind, but what you want now is to force me to pull dirty
>>> changes "first", the type of change we are refusing since 2018, making
>>> me expect you'll perform the conversion after. It would have been
>>> terribly less dirty and you would have all your code already upstreamed
>>> if you had performed the exec_op conversion since September.
>>>    
>> I didn't work on open source 5 years ago. I am sorry that I missed the background of the rejected changes since then but I do not agree that this change is dirty change just because I factor out the code with is_param argument(and I offered an alternative to remove is_param with two data read functions).
> 
> This _is_ dirty because you cannot know with the cmd_ctrl/cmdfunc
> API whether we read a parameter page or a page of data. So your are
> _guessing_. There are plenty ways of reading one of the others, the
> heuristics on the controller side will _always_ be wrong. That is why
> exec_op() was introduced.
> 
alright we have different definition of dirty ;) Understand it is not a 
preferred way to update the code in controller cmdfunc path especially 
for large change that can be done in exec_op.

>> I see your point with exec_op and agree that is the way to go.  We had an initial look of the Borris exec_op patch last Sept and noticed the performance issue but we haven't got the chance to actively work on improving the performance and prepare for up-streaming until recently. What if we bring in the original exec_op patch in this series so we don't need to add the parameter data read function(if we verify it works on difference SoCs without endianess)?  Or better to have exec_op as separate patch first and then this series?
> 
> This one is my favorite:
> 1/ Add exec_op support
> 2/ Remove legacy hooks
> 3/ Add support for the bcmbca SoC
> 
Sounds good.  We will send exec_op series for 1 and 2 then another 
series for 3.   And I will send v2 of this series to just include the 
fixes (patch 1 to patch 4) with updates based on the comments received.

> Then you can improve the performance for on-die ECC situations, but to
> be honest this improvement looks little a very little addition. You can
> take example from the existing hooks, how they match specific
> operations in the parser and then hook them to specific helpers.
> Nothing terribly complex, there are dozens of conversions available
> now.
> 
> Good luck :)
> Miquèl
> 

--00000000000025897005fe1fa4f2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEICDX3Ja/07fdQnSIxzFAXo6fGYgC
CAZudKrlKxLKUCyHMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDYxNDIzNTIxNFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQA0ubhd10dbECovJt3+WfwpC73djYPvzKNvsqnYXPwb8Agz
Xu+BlrtnsZNQl2ZzU8l56h2qdzl01PVqDOJ+GhU9myzYBtXnf1Iies2HXSPlm4aot4ErmjD8U6s4
0AtwvWkeQYiAOKng7C5ckSEqPLTuKfS4DfNw/zsFeO8TnMtf/tPdI7bwK5wZCuCuDixjp39efTYA
j9ov1eXdaRP4Rnt9DKM5MggWnOGtClxc72tSWph+mEnwuTgb/lnsLPTSbcb+DeGnsK/FoisOiZax
YmDzp0EGl4cgvt1jjbwHuVmJw9kTsYqX4EFxfRgc5EAMO5eBIMYa6szaT1t8Zea2ky5P
--00000000000025897005fe1fa4f2--


--===============4268409221846993452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4268409221846993452==--

