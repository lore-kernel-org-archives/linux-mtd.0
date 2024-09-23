Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4ABCF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1H83dflJMQB55hRma+FztyphBiMxyq/yDcCA8ATFYo=; b=IXCwyoEMhTIKgE
	6rGK77fgfVU5kwHyrl1mVJym5BuImqZMMgjuRfuoP09Q47zghmQ8wgF9R+F549JUx+3MIT0hHduJZ
	JBWisQkvmgP3JbLdTL07LBqgkrFopaMBHbbOBmT6PBwuylZuZGuPCwmRKiHOHYwdHk7/86GFHf7E2
	dID+65uhVMOUBUP+MBLvcH9aFZT//BuG/C5s20qs58VTFFwpM8xGL36+0qKK1DguAluQYlIQ7i81J
	B2B9Estnl7ugvoKhrxci4dXkrlwvrx4flp+QuaGLwWUTwh2Ow3xeK95TcL9oy7RNhz8e3l0Tb0nmu
	hdZQFC07pUhFQLEv1TaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnFk-00000000CD5-2hdI;
	Mon, 23 Sep 2024 17:53:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnFA-00000000C8l-0cc6
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 17:53:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so42290525e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727113983; x=1727718783; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uACufje9ISH13oK3Ox0whD6Xv8lAcOfXb4WXjw+PZus=;
        b=VHWj6xWhpyIUybcpPsE8Y5E+wr9wmp5Nmu1WQEe0WJzckSwyGYXp40WvmD0E+d8C1F
         m2k9QE8ewlL7gUooAkarYVqYxISbnJd/MQaIQQrHQBQUEhdRxYgxsfUxzz9oJeQXdtIC
         uJtQBIJDa+t8tPB8Du7VRo27Br/9E1oxeOLqoS6tLN4/UCCVy0DPURor7HfCxQ+3cAQt
         /GZjvCE9KYOXWWbOAdKoAwfYFxDRdRfTwd4l9epIJ7bkwbViA6SYCM3RjCwefKxvTzNL
         efBvCLajru7GDhsLb+rcsvrCg4X8ZuU49GplomjohIXIRxVsbQ2Fdf0oXWgczrkHcQ6I
         4Q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727113983; x=1727718783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uACufje9ISH13oK3Ox0whD6Xv8lAcOfXb4WXjw+PZus=;
        b=n/pCnhem1XAQz2kYEvMzG5hJP9wX9AsVT7nE9Ino10rkW7l4EplMVIRd99UYRcexnU
         /SIiH5Ytu0IrFc9PLv+WjbqYb2+3PYgCGFGkc1AfttXFexEDH4a3lCI90g68Jn94SFn/
         u0hJH6V7NtTyTnXwHftWyPGLW8IufrlrKmt5Neg+KdgfWHPADKwpd4yVifE47+Dr/HkJ
         /1GLewhOcfmzrWC6OjYcQu/KGWfLfLmm8u7mi7f/P+wFM/3uDSXWGhz9TzxfTC9J+Jp3
         dDvxqOJCUPH6ub283r5GAVSPnzrKXldJ9yGwwJ0+q+zA9xSvKW39LwF77sDT4fz7Hna7
         JP3w==
X-Forwarded-Encrypted: i=1; AJvYcCV2zezHzRj/lN7T2TlkXM8JsFOd2BSM5rfGXzcWWu52HRH0yWoWMEbZhnn8z5P07xgE45jZtZGmNNQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YweX659gb9Qw+kvFbuAUfyai52YgDU6t0hybY8IdLgT0Hi0sXBD
	otJ6uZ4AX5o7cInWKM1gCKWfzppcipgEsttCQr4C1H7pzgwc39f3vi0dR0LYJMw=
X-Google-Smtp-Source: AGHT+IHbteRKjUljv6qRO/hBCEdt2P47TUBo0rr7mSfx/GJswetlbmFmfajX1p09Zu4GovmhkJrC+Q==
X-Received: by 2002:a05:600c:6b18:b0:42c:cd7c:a196 with SMTP id 5b1f17b1804b1-42e7d5c8614mr102349705e9.17.1727113982531;
        Mon, 23 Sep 2024 10:53:02 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7ae60addsm108811575e9.2.2024.09.23.10.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 10:53:01 -0700 (PDT)
Message-ID: <ca2c03f7-0769-4b2a-b743-3ebda9e29755@linaro.org>
Date: Mon, 23 Sep 2024 18:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Erez <erezgeva2@gmail.com>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
 <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <2c87568d-3caa-4162-91de-094684f1b268@linaro.org>
 <CANeKEMO4ckeJZHKEOKHVeamPzR045jpwkXWfJS9S6rBiMTayuQ@mail.gmail.com>
 <688d3e68-c339-4a44-b6b5-366dd5f12965@linaro.org>
 <CANeKEMNKF5WtVgzxbMnLFsqRHNOz=+gD-if8aBqsWwjgDvz3GA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMNKF5WtVgzxbMnLFsqRHNOz=+gD-if8aBqsWwjgDvz3GA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_105304_261199_A8BF5A95 
X-CRM114-Status: GOOD (  35.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/23/24 3:51 PM, Erez wrote:
> On Mon, 23 Sept 2024 at 16:18, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

cut

>>> After reading a lot of Mactronix datasheets, I suggest also reading
>>> all SFDP to all  Mactronix chips.
>>
>> Why? It seems too invasive. Generally it is not recommended to issue
>> unsupported commands to flashes. Change just the flash that you use and
>> can test.
> 
> It is not, All Mactronix chips in the last 15 years have SFDP.

This is false. I worked with an octal macronix flash that didn't define
SFDP tables, mx66something.

> The chips in the manufacturer compatibility table are all obsolete.
> Mactronix reuse the JEDEC IDs. There is no point pretending these are
> the same chips.
> 

If macronix doesn't care about backward compatibility, we/I do, and we
can't break it.

>> cut
>>
>>>> Which flash do you have at hand, both, none, just one of them?
>>>
>>> When I started working on the OTP code, I used MX25L12833F.
>>> But later I left the company.
>>> So I use my beaglebone black and connect it to a MX25L3233F.
>>
>> I understand mx25l12805d and mx25l12833f share the same ID. How is
>> mx25l3233f related, does it share the same ID as the previous two?
> 
> They are not. I just replaced the company hardware with a different one.
> You ask me to report the hardware I use for testing.

So MX25L3233F does not share the same ID as MX25L12833F and mx25l12805d?
Then why do we talk about ID reuse?
> 
> The patch covers the one I use with beaglebone black.
> I just mentioned the OTP callbacks are per manufacturer.
> But if a new chip in the future would require different callbacks,
> then just add them.
> My patch is using a single chip, the one I send the testing with.
> beaglebone black + MX25L3233F.

Sounds good.

cut

>> I said new compatibility will be introduced as a last resort only if we
>> can't differentiate the flashes at run-time. You haven't proved me yet
>> that this is the case.
> 
> Then you do not read my explanation.

What explanation? I've read your cover letter, commit message and I
didn't understood what you're trying to achieve.

> Do you wish me to send the Macronix datasheet of the 4 chips?

No, I need just a paragraph where you explain what are the challenges
and how you want to address them.
> 
>>
>>> You ask if it is possible to deduce it from JEDEC ID and SFDP,
>>> I answer that this is not possible, at least in some cases..
>>
>> I'm interested just about your case, not all the possible cases.
> 
> Actually it is the MX25L3233F and its previous chips.

Which previous chips? Do you have any such chip at hand? If not, why are
we talking about collisions?

> Anyway, I will not submit a broken solution.
> Whether you like the idea or not.
> 

Fine by me.

cut

>>>>> I told you we can not "guess" OTP settings based on JEDEC ID and SFDP existence.
>>>>
>>>> When? And more importantly, why?
>>>
>>> I send you example of 3/4 chips that using JEDEC ID and SFDP existence
>>> is not enough.
>>
>> Why? Do they have the exact SFDP tables? Prove me, drop them all.
>> Any bit that differs in the SFDP tables is enough to differentiate the
>> flavors of flashes. Vendor tables included ;)
> 
> Because the SFDP is not related to OTP in any way.
> You are planning to decide OTP parameters on non relevant information.
> If you wish to implement such a broken feature, you are welcomed.
> I'll pass.

Ideally we have a single jedec,spi-nor compatible. If there are flash ID
collisions we try very hard to differentiate the flashes at run-time.
New compatibles are introduced only if we can't differentiate the flavor
at runtime (be it by parsing SFDP or some other way).

cut

>>>> And I think I already said that you can differentiate between the two
>>>> based on SFDP presence. mx25l12833f has SFDP, thus when SFDP present use
>>>> the mx25l12833f-OTP configuration. When SFDP is not presence one may add
>>>> support for the mx25l12805d-OTP configuration.
>>>
>>> No, we have 3 chips.
>>> 2 are using the same JEDEC ID and both using SFDP, yet they use a different OTP.
>>
>> Which ones are these?
>>
>> I guess mx25l12805d is non-SFDP. Then mx25l12833f and mx25l3233f define
>> some SFDP tables. Do mx25l12833f and mx25l3233f have the same OTP
>> organization?
> 
> No, that is the point.
> 
? Do you care to explain?

cut

> 
>>>
>>>>
>>>> Is there any case that I miss?
>>>
>>> According to your reply, I would say pretty much most.
>>
>> This is again inappropriate ... I will read your next email as well, but
>> I'm not going to tolerate such replies anymore.
> 
> I agree on this one.
> Seems you are looking for something I do not agree on.

Michael disagrees with OTP being specified in DT too. We both already
suggested how to deal with flash ID collisions but you keep ignoring us ...

> This is not because I oppose probing,
>  this is because you ask for indirect probing, against Macronix own
> recommendation.

What did macronix exactly recommend? Did they say that we shouldn't
interrogate the SFDP data in order to differentiate the flashes at
run-time? If yes, why is that?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
