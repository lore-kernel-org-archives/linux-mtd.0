Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E52BCF9C6B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 06:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uav9HDFeVjlpIIA5gjPD/XDXOgF6pVU4JmRSKJVRCZc=; b=GTbeeL5I4/zB8G
	TeWHhCczCgFrTLfUHUeDSnfORJpe3/T+iC6BJQxC53zcrw1QV2cwqkXiEldd7JZtDDey8zYu/rQ2M
	BDEi8i+u1usDvV4JRiu91its7jLsQ3Hji6E8lGu3fbAdSnNicR9Q6zc/Nh1cg+2BudXXRt5f391f6
	w/WkCEah1+/AP95jeRIHZXHZltOdkMRQXWX3XoDD2jf/WRdTuQagibEY2SvtCwVOYoWb9x7rloT27
	ZYgVdZc2PO8sAgMNL2S0ZOuAvn3JnAXdItk5m4Uyip81Q5JUgUBTamT7Db6H/SFsCVCVLqDQB3gUn
	dsTgJXibces6RtXpk7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssycS-00000001AF9-3llh;
	Tue, 24 Sep 2024 06:01:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssycQ-00000001AER-08ei
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 06:01:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so43521095e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 23:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727157708; x=1727762508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ob6JTIBEgbtmPq1rO6JYwsnKZNVP+SaaSo/Eueelb/I=;
        b=CPyWLfkm2wYSJW3yYHvfWxX7+oJIUBlQk4DK0Dck/7+JwqSldChzgZtrAgNJ5zqOG5
         3/OAQyTCDZULXh4Cf18dcz9+0xcIuYbQRJNMvU8ThQ2dUFf80bTXYzYuC5OLuOMirq21
         gTPBlzLotgyp+n9RO1iGKIXKogp+XS5IpKmOwy2mE3r5C1lL5K6cZXiQIhfr/IohrFtf
         KT5p/pnlm5tCHQsdDhrH3xzTP8nxSQzvaYSi9Pq0TyX9FNY4XLZJVPdhq4Z7oSR1SjUT
         FKHk4ye8NcpOEY6dLEWj99C33GKc3jV2ZfnsZ/CfHOOY1A20d992W7F9NJ8P7Fs0Ni4D
         ho7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727157708; x=1727762508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob6JTIBEgbtmPq1rO6JYwsnKZNVP+SaaSo/Eueelb/I=;
        b=exWDlbCsnMUdo/E7kXJXz2FTwbYeX9L7jT432O2Si1HPUJlC755CQ9DVvb8hRhok9E
         2RpDmGllSFQkAe3eMzeQNEFdt3QHJvzbhrSa356D+fCyjJrzkOAKskskh/UfUY1uWuBf
         O7SpwzNVLJaar1vOo8tTRVWtT9yrANkfpcrbm0ueybA1acRVWzGmdqPYe6vQnNhLIT5L
         rQLqVl0h/q/27/EtCbZ24uwCS6mg6V3XBCw1lOdgemhI8QPwWGkNNkgRSjplLLKCHsrT
         PO7hRSfXXK1nzpIRmgTrYflQhRWH2rqqzl/2V+hOp9wlGl+rKqG4gmZacNamVlS4GNsh
         TXZg==
X-Forwarded-Encrypted: i=1; AJvYcCXCAFmu2Uf3NiBEidmr02TKviT40BzEwbLSfWyM9nLEfPk+yBnP+proZ8Gmmj5IjNAkGzDOa8Rk5BQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0/+QWsWoFi41QoH4V7HqIXiIPqJbBSwmA+mlVnBkx2Ky7/TW
	Fs+zpZzIZ7jZhHXobdvC6rFXJyjDi8W/vHEWSc0shA/tT08MRvzdzJPRJtVx9+bV5Rh7OBZ6Yy6
	j
X-Google-Smtp-Source: AGHT+IEc8dE1z8mjns2BVZvJiZddndWZFguZectKEyuhnGt4xCUxbxBYcfUzToBufPGSfnqeHYygsg==
X-Received: by 2002:a05:600c:3b17:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-42e7abe7af6mr102913185e9.8.1727157708060;
        Mon, 23 Sep 2024 23:01:48 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2cec13sm655158f8f.51.2024.09.23.23.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 23:01:46 -0700 (PDT)
Message-ID: <d10ab191-d75b-4fad-aed2-33d08815f7a5@linaro.org>
Date: Tue, 24 Sep 2024 07:01:42 +0100
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
 <ca2c03f7-0769-4b2a-b743-3ebda9e29755@linaro.org>
 <CANeKEMNdGvteumpvLHhDoiVoZwPJ4iOs+Ej8KDoXR9-Vz0-rvQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMNdGvteumpvLHhDoiVoZwPJ4iOs+Ej8KDoXR9-Vz0-rvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_230150_142661_97604294 
X-CRM114-Status: GOOD (  21.06  )
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



On 9/23/24 8:30 PM, Erez wrote:
> On Mon, 23 Sept 2024 at 19:53, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

cut

>>>>> You ask if it is possible to deduce it from JEDEC ID and SFDP,
>>>>> I answer that this is not possible, at least in some cases..
>>>>
>>>> I'm interested just about your case, not all the possible cases.
>>>
>>> Actually it is the MX25L3233F and its previous chips.
>>
>> Which previous chips? Do you have any such chip at hand? If not, why are
>> we talking about collisions?
> 
> JEDEC ID 0xc22016
> MX25L3205D - No SFDP, 2 OTP  regions of 128-bit, 384-bit, Status:End of Life,
> Recommended Product MX25L3206E
> MX25L3206E - support SFDP, 2 OTP  regions of 128-bit, 384-bit, Status:
> Not recommend for new design Recommended Product MX25L3233F
> MX25L3233F - support SFDP, 1 OTP region of 4096-bit, Status Production
> 

Okay. So you have just MX25L3233F on your table and you are worried
about possible ID collisions with MX25L3206E and MX25L3205D. But you
don't have access to MX25L3206E and MX25L3205D. Is my understanding correct?

If it's a yes, then don't worry about ID collisions at all, you can't
test the other flashes anyway. OTP is not used by the older flashes as
there's no support right now, so you don't break anything. Just add your
OTP organization to your flash and I (or other SPI NOR maintainer) will
decide on how to handle the ID collisions when/if they appear.

> JEDEC ID 0xc22017
> MX25L6405D - No SFDP,  2 OTP  regions of 128-bit, 384-bit, Status: End
> of Life, recommend Product MX25L6406E.
> MX25L6406E - support SFDP, 2 OTP  regions of 128-bit, 384-bit,
> Status:Not recommended for new design,
> Recommended Product MX25L6433F.
> MX25L6433F - support SFDP, 2 OTP regions of 4096-bit, 4096-bit, Status
> Production.
> 
> JEDEC ID 0xc22015
> MX25L1606E - support SFDP, 2 OTP  regions of 128-bit, 384-bit,Status:
> Not recommend for new design,
> Recommended Product MX25V16066
> MX25V16066 - support SFDP, No OTP. Status Production.

Thanks for the dive. We can ignore these because you can't test any of
them. I'll worry about them when someone adds OTP support for them.

cut

>>
>>> This is not because I oppose probing,
>>>  this is because you ask for indirect probing, against Macronix own
>>> recommendation.
>>
>> What did macronix exactly recommend? Did they say that we shouldn't
>> interrogate the SFDP data in order to differentiate the flashes at
>> run-time? If yes, why is that?
> 
> 
> I forward the reply from Holger Schulze, Field Application Engineer,
> Macronix Europe N.V. I received on the 3 Jul.
> 
> I ask:
> "But the OTP setting is not in the SFDP.
> How can we know which OTP size and number of regions to set?"
> 
> And the reply:
> "You are correct, the OTP setting is not defined in the JEDEC spec for
> the SFDP table. The only way is to refer to the data sheet."

We already know that the OTP is not defined in any SFDP table. This
doesn't mean that we can't compare SFDP tables to determine which flavor
of flash is present. That is the reason why we ask for SFDP dumps when
someone proposes a flash update or addition. So that we can compare the
SFDP dumps and correctly identify the flash or assure backward
compatibility for it.




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
