Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4EBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFd34zyNY0p8q3AP8ybn1nZ+s+1GmJP79oXARM9Q/gk=; b=pSIE8LD2evI7ni
	+6xjt5zADgJu6jzZWfvVOs7wcaINeVtJKUoc2PsaJ4VOFgCzmSIczk/EChX7j1pGGCjLzDEFO9UAz
	1DaAYqZGUMPYKKD3FHUW1OKwllVtct544QgDNqYTkIp3Ou7eykXu2Pa2GWq3fW9qlmpNlLN2tuOFg
	MxcXgVMofDftzTUEu9hwin3lgJ4sa+vJJop4UheG2WxZ9Fi136t7e5takPkmhO8GKpnxDz8WtuYqW
	uIxrBf7HDF8ZhydpWL/m/+eEQ7dMnAeN8H86xrib02HgsjX52ir3EvS5BzTtCWFNFi+j9Zpm7+lFD
	XfxMg77OP9+8Fp7/4zRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMwOo-00Fj0H-Oq; Wed, 23 Feb 2022 18:30:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMwOl-00Fiz3-4C
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 18:30:00 +0000
Received: by mail-pf1-x433.google.com with SMTP id z16so16197357pfh.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2022 10:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SkZuVNW5EhwJqSpZnaByyGJdLCPW7Ju2zPYGUOXsjqM=;
 b=dC5HMCo5K4kF82jU3P9MGgHYmjD3SgZHQBVNL8r+3dcbwmwSC9FQKBkqvwUDKNSIp1
 MEJXGQh9ZvlPZlPWjKdxsCvDCNJ9CF/6kZTPmNfEU9zMdR7ip8su2U1QLXEkj+uZ0Jdl
 2LIt4R6GhXnT6bo77+ag2StqHl6/Wc/CKcePtMk8lgWmY7INuVg1XBlwFI7py58WhosU
 T3ETmSugjcBdc7g0NTMlrTOu/e5m1qXcbYXgJT1VCavksgHjRjqvKYyV01YZMLj1l5Ej
 lSsJ6sPdEzh1zrKnvYQa1ctRd5vPshfZS06bFcoNE1QEIpXoq3z7Fpw8j5DCOmo+IYPs
 3+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SkZuVNW5EhwJqSpZnaByyGJdLCPW7Ju2zPYGUOXsjqM=;
 b=IyG0sTccOHLhM/sSloRTer6MudTZCApJTmZCwYXxcTgKAIJUU6DTDE7P0PDX4Wzd+V
 3buY4oBzY8r225eKaOdSpnM3zVaLMr1080j4DTz5yKOT8YO/Wim6w2q1aj9m4AO/rBRs
 RwRS8QyTo0RRoInEAshXrPMvG4RC/uKbaeEyDP3V/MJ/aXir8dOadzugIGVl01SyLAbk
 0+2GZuQS6Ia5pp9bhMRoXHFmcvM4m6cX68JAN+AfcF7PQ5uZlTSuRjbmHNMd5VQXj9s2
 LmW6F175sBKFDWt+isJW3Fp670HYzG6JbzPuRQM68jYzPVW8Piad/6g+HgthCvwijGPu
 KY5w==
X-Gm-Message-State: AOAM531n/ScQS7hxzV9u7iweyh9exHir0QOvzShrq8XadJPkWk1xig1O
 +jVU9Jz4eHojprWHm7wwIFQ=
X-Google-Smtp-Source: ABdhPJw/aMkWYOkacTh9GK6zrN6Pxp+9MvTli2gOQggpOzRKne7hPDI4EZw1xVpdukjvOB118IG5Lg==
X-Received: by 2002:a05:6a00:198f:b0:4e1:abfd:43cc with SMTP id
 d15-20020a056a00198f00b004e1abfd43ccmr1069614pfl.20.1645640998104; 
 Wed, 23 Feb 2022 10:29:58 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 u25sm224039pfh.46.2022.02.23.10.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:29:57 -0800 (PST)
Message-ID: <0a1d6269-62b2-ebd4-f302-efe14ffa4b66@gmail.com>
Date: Wed, 23 Feb 2022 10:29:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH RESEND stable 4.9] mtd: rawnand: brcmnand: Fixed incorrect
 sub-page ECC status
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, sashal@kernel.org, david regan <dregan@mail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20220223174431.1083-1-f.fainelli@gmail.com>
 <20220223174431.1083-3-f.fainelli@gmail.com> <YhZ0vZxlp1VTgNG8@kroah.com>
 <325bb69b-691b-3c61-9578-d42ec33277b8@gmail.com> <YhZ70pTGdGoPEMUb@kroah.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YhZ70pTGdGoPEMUb@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_102959_230523_AA9AE9AD 
X-CRM114-Status: GOOD (  20.61  )
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



On 2/23/2022 10:24 AM, Greg KH wrote:
> On Wed, Feb 23, 2022 at 09:54:59AM -0800, Florian Fainelli wrote:
>>
>>
>> On 2/23/2022 9:54 AM, Greg KH wrote:
>>> On Wed, Feb 23, 2022 at 09:44:31AM -0800, Florian Fainelli wrote:
>>>> From: david regan <dregan@mail.com>
>>>>
>>>> commit 36415a7964711822e63695ea67fede63979054d9 upstream
>>>>
>>>> The brcmnand driver contains a bug in which if a page (example 2k byte)
>>>> is read from the parallel/ONFI NAND and within that page a subpage (512
>>>> byte) has correctable errors which is followed by a subpage with
>>>> uncorrectable errors, the page read will return the wrong status of
>>>> correctable (as opposed to the actual status of uncorrectable.)
>>>>
>>>> The bug is in function brcmnand_read_by_pio where there is a check for
>>>> uncorrectable bits which will be preempted if a previous status for
>>>> correctable bits is detected.
>>>>
>>>> The fix is to stop checking for bad bits only if we already have a bad
>>>> bits status.
>>>>
>>>> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
>>>> Signed-off-by: david regan <dregan@mail.com>
>>>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>> Link: https://lore.kernel.org/linux-mtd/trinity-478e0c09-9134-40e8-8f8c-31c371225eda-1643237024774@3c-app-mailcom-lxa02
>>>> [florian: make patch apply to 4.14, file was renamed]
>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>> ---
>>>>    drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> Why is this a RESEND?  What happened with the first set?
>>
>> I forgot to copy stable and you and Sasha, wanted to make it clear to the
>> MTD folks why this is being resent.
> 
> But this commit is already in the 4.14.268 and 4.19.231 release, why do
> we need to add it again?

We don't, sorry I got an email that the patch failed to apply and forgot 
to check 4.19 and 4.14 thinking they would not be there.

>  > For 4.9 we need the backport, I'll take that one...

Thanks!
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
