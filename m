Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC37AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0Eymp/pGxRMockCu8QjsVYWdlApHsTqu2I5zt15FZ4=; b=lXa2Dm/VBSgJ8M
	6SPsmWpTsbGZuO/Gm6SVqbf5SPDtcFNQmOTRzX49GpJrGdIhsM/rgKfQCjyt83wCS3CXfdrPI6Drf
	bxuPO3RSy6TvB3DzeJugRrYxa757eapzMJ15yCDRbSIDzcE1ETbhHMyK/iM3gp1C62T/lkEjtlOcH
	ItIefwcAv4LEyEWdo4jo3KEQetQQz/nFjjtAwei9d0a6GrfYubFl/SR2ODyvgk4396t11Vg2LXmky
	C5a9l/WGq1+1r1np0F4RaB3WGcRUumpYg/ekuunIwArXKMdqYXxabcvRZINbxdgDkV4AFukNCmtz5
	7WVgYYeB3qtK4xsWf9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvr0-00FbWv-Fh; Wed, 23 Feb 2022 17:55:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvqx-00FbVJ-UE
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 17:55:05 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso3235364pjk.1
 for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2022 09:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Dq2lraIciZDzd/HjyDAhppfvMrvTs3Uqdjz3uy1ukcg=;
 b=hZX24zwOTwAikIMX91EWvSTmc3hj4azwzlrBe5DoY3zZ0sgO78yJFEa9vNs8ziWtay
 VEq414kNw6DsVs0un+vEZndls2jYorbjw9DhGNwGBO4ITvUrelHkpk9cXYMn5U3AXSL1
 PczXf3R9WQSTa3yNBvMrp7e5cSC41/sDFllRWrDZ35hdXFEahK4f0wN1a8Re/n9mi/j/
 C5y+CTH3htqf/7/8v3C5OsazILtxNg/D34Ul2zfpFSXgzW/IhXO5mkhXBTaM77P5csvC
 1aR4Vv+IBE+5zH2g0SJb+xLSLOYPDeNtNQ+g52T0CgXot+fF/uO+Amoe0Kg7h/TCwriq
 WEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dq2lraIciZDzd/HjyDAhppfvMrvTs3Uqdjz3uy1ukcg=;
 b=CVYLcynsKfBExWnoW6yI7olyba52DSog1KOW54O08xg0lcMWI13+4hAXGOreIPfJ5o
 nH++6YWbkVCXJTZ9u+viEcafP+16RlssUfDqKhmKq/NzRZwz5ztlHTtbSWqTtmRgjskW
 3N1AlX+6kfl7R4tbNYwTo0SpTUGklPBh9doUxCcm7/6BpDH1NGvoLkWjl7vubriuqCNx
 U13ZMXmUPhfox7TcvD9YeGjavXNHzvcOCSEbDo3f2s/NIb7wB71/rfaR41ErgVIScq3c
 P/bvAxrlH5JN3a1tw/fWeoiqoyTZU04Vue+BE1YhyuQvOTu+g/xmKHNLF9SQ6SA0FP3B
 vW8w==
X-Gm-Message-State: AOAM530kRTYzHeAN9P6yv7zkZz8thaN/7aUdYyP4KYfO7B5/b+mOuOVO
 /wEBLtPXzZhdNMRsUmkr7yE=
X-Google-Smtp-Source: ABdhPJzgqmLhCMk9lL1zw0mhcc9V9PLsblLiFXuJIx66GOem/jOUW9+Y+o/Ln6kd4OgM5H+u+fkP1w==
X-Received: by 2002:a17:902:6acb:b0:150:c60:294a with SMTP id
 i11-20020a1709026acb00b001500c60294amr884052plt.71.1645638901514; 
 Wed, 23 Feb 2022 09:55:01 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 k15sm152074pff.36.2022.02.23.09.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 09:55:00 -0800 (PST)
Message-ID: <325bb69b-691b-3c61-9578-d42ec33277b8@gmail.com>
Date: Wed, 23 Feb 2022 09:54:59 -0800
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
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YhZ0vZxlp1VTgNG8@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_095504_041959_15DEC258 
X-CRM114-Status: GOOD (  17.75  )
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



On 2/23/2022 9:54 AM, Greg KH wrote:
> On Wed, Feb 23, 2022 at 09:44:31AM -0800, Florian Fainelli wrote:
>> From: david regan <dregan@mail.com>
>>
>> commit 36415a7964711822e63695ea67fede63979054d9 upstream
>>
>> The brcmnand driver contains a bug in which if a page (example 2k byte)
>> is read from the parallel/ONFI NAND and within that page a subpage (512
>> byte) has correctable errors which is followed by a subpage with
>> uncorrectable errors, the page read will return the wrong status of
>> correctable (as opposed to the actual status of uncorrectable.)
>>
>> The bug is in function brcmnand_read_by_pio where there is a check for
>> uncorrectable bits which will be preempted if a previous status for
>> correctable bits is detected.
>>
>> The fix is to stop checking for bad bits only if we already have a bad
>> bits status.
>>
>> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
>> Signed-off-by: david regan <dregan@mail.com>
>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> Link: https://lore.kernel.org/linux-mtd/trinity-478e0c09-9134-40e8-8f8c-31c371225eda-1643237024774@3c-app-mailcom-lxa02
>> [florian: make patch apply to 4.14, file was renamed]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Why is this a RESEND?  What happened with the first set?

I forgot to copy stable and you and Sasha, wanted to make it clear to 
the MTD folks why this is being resent.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
