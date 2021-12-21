Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E38C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5yOFuHR35MXsGE5tPxce7xB1ajb2/JPS5Kz43ry5qs=; b=Tr/uSfnV83ZNDn
	svZHcryuYfI5K1NPfRk/BVCgbpMrLFmeZNBhSN1wVr15R2Vo2MgLVbv5fR4ncbT63w39fTbQGLOyu
	5eLc352MFlXn880AWzonAJJbt61/ndxarTPQVPrUsLuC6xOfK/MrBtYvl3VV6iu3N9xEg5h0jE0/B
	e/hSwD7KBkhfco/40PU9I/2PKK9SgPPHHargGDdYktN2FAqNlqwKyBgtl5ooPXeu+T45lvV/WriXt
	jfKwn1WLMSvATOsi44kOTayf52ujlfx3vWbCmb9sxtFlAXftcC3Xt6bCAmz2Q6JOGg8GWOfjZL6li
	9F2zZ9OWtcCawG5aEczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzoc8-008jPl-EA; Tue, 21 Dec 2021 23:32:12 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzoc6-008jPJ-5B
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 23:32:11 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so2941459pjc.1
 for <linux-mtd@lists.infradead.org>; Tue, 21 Dec 2021 15:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lb+cvrC42rt2s8lO9hwyyl0Go0FOmSqUvPR9eMSdm50=;
 b=l5hMFKb66uAkdch3eeXxvVZd3S1rtXGkVEBRvO07V1SNf1Hbu/DZF1vBbO5JL8NGgj
 nEfQMT0r/p+WEIHoonLyBPLgF2dwB2J7+wXAhWj2Y+SRVIg+xS5MjCWVdkyPzjpdL71d
 3iqnD++8FzLiE8ysvDGWkjw29IvbMPCsfFZjQXfU7taLTkttOMeNL9eTLnNrAa9a20Wt
 MRoh/DnucuITRG6J2aAwjqBnzmkW17Cgvms7qFRyWQWmVFTin7nB+odmBforcUpk1Fd+
 PmLoaQD9pxaLl4ZN64eDad55iQB3nArZ6Ag6h1KTp23tO6Qe8tfWgKs/CwRWe0Nx/MdP
 mW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lb+cvrC42rt2s8lO9hwyyl0Go0FOmSqUvPR9eMSdm50=;
 b=md2/RfhgTN0yaN9+9n24pa2HahgebFFDPGjvefGZn5fbiGJo1VeLXQ3wo3lIQ/35rU
 pFtlEq0DewZZ6f+LW8aJ4mYhcGNrQevc7377HNlfeK/P1X+PuUDVyhmvfhzsHTHPJQJZ
 ecLwnV3JeD1KQH05Cwj2VRnwP91btyPknLoNJvHX97+zu6gUMhChBkCnULf4jatKoFZp
 MnfV7kFTBTfOe0+GvefIXCwd4mnTrTVVWtK0FGSbr+HYv6ECtRJCroRvWtYmzEnTq3NW
 In2DiD5CndZejbo03Z6cXiSNEviHuKJrtc4ukjfeAdZelS5IFBH8gXdKqe+m3rAGWLav
 RO5A==
X-Gm-Message-State: AOAM532/lHyy9nHECwm5iQ2S5g53kTQisDlKK6ZC3Qfyx2nFSCTEeYbG
 RUP55s0u3ALkxl0rWg2ctEc=
X-Google-Smtp-Source: ABdhPJyDZLoRtOpxb1hi61Z3QgitlD/OKOcU2QeDjYHzQvxJMDHxUwYsQzu5JtJS11rwNMDMz50d9g==
X-Received: by 2002:a17:902:e282:b0:148:ef58:10d8 with SMTP id
 o2-20020a170902e28200b00148ef5810d8mr606996plc.116.1640129528897; 
 Tue, 21 Dec 2021 15:32:08 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 q9sm173683pfj.114.2021.12.21.15.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:32:08 -0800 (PST)
Message-ID: <5c38b7ce-cf34-ec62-bdbd-56ee7a50e16a@gmail.com>
Date: Wed, 22 Dec 2021 08:32:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: How does an SPI NOR handle a single byte write in Octal DTR mode?
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Tudor.Ambarus@microchip.com, Takahiro.Kuwano@infineon.com,
 juliensu@mxic.com.tw, jaimeliao@mxic.com.tw, Bacem.Daassi@infineon.com,
 beanhuo@micron.com, shiva.linuxworks@gmail.com, sshivamurthy@micron.com,
 p.yadav@ti.com, linux-mtd@lists.infradead.org
References: <f593ded7-6cb1-7645-a0b4-dc20b5576d1d@microchip.com>
 <d40c879c-c419-82c4-c385-0a03e105a622@gmail.com>
 <a7bd7dc6db2cb9f74aa6e7737e888625@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <a7bd7dc6db2cb9f74aa6e7737e888625@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_153210_234834_990D0D1C 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I need to correct my previous statement.

On 12/21/2021 12:47 AM, Michael Walle wrote:
> Hi,
> 
> Am 2021-12-20 11:32, schrieb Takahiro Kuwano:
>> In case of Infineon(Cypress) S28 devices, it can be done by de-asserting
>> chip select before clock falling (not sure typical controllers support this).
This is true for single-byte register write op.

>> That means the device can take odd address in 8D-8D-8D mode.
For page program op, the S28 in 8D-8D-8D mode only supports programming
multiples of 2-bytes and the address must start at an even address.

> 
> Ahh nice. FWIW, I had a quick look at the FlexSPI controller found on
> the NXP LS1028A, it doesn't seem to support deasserting the CS after
> half a clock cycle, though.
> 
> -michael

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
