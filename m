Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AEDC4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 22:32:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019E721897
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 22:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OFpwVjBy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdYlYU4i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019E721897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6B3x9G36//4nRwSPSoSzxajYIviKmm55e3fhI6OyalA=; b=OFpwVjBy5ny3rNf6Zyp864Uvj
	bxpjTeCYClGBRc2Sp8+hJoVlq4ywx41dbbavzNTV0CU2QoBpRn1h58UEvK38VfjIuAswxwrvDI1Nz
	m/eqGaeBci+dKNn9iDzVHsJuMMRjHfjWdaMkrC5rv9T79/674A9khnj1Qm4IJYOo5lBlTC5E+xGZS
	3VxscrmjW5iVYhwHopwDp9rmmxxXnQuEEYjZ2Q1RQcpiIrLXXpz2oiY5MUWhHvHP/cUFFWAMGggFa
	f+wnmOS5xpbpK9ev8hzzALO9xqmrGWFtYGJvl8lw6hjyTAqh5iwYK6QcZSTLt9mn8ip7JepDfnxnq
	N+erY4Zag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAM1h-0005z0-1R; Tue, 17 Sep 2019 22:32:49 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAM1d-0005xe-3K
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 22:32:47 +0000
Received: by mail-pl1-x643.google.com with SMTP id d22so2145600pll.7
 for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2019 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dmHKlC95wEkb+HENLwm0wnzogMC58TL2IKPX+eVUAOk=;
 b=rdYlYU4iWu37JaHMYZYnsFvPb4IVU+ujYbjqRjhooffq05DM3nAh3j6bzbFqnl+Z+m
 u9ZAKZlglBUOYenB/3BrqhJ3tLmlHyZCLaO3E/Uya10zG0S2a7lm8L0FYkuj/hWdLa93
 4iShr/m6wuZq3U7YBdeXaA74t2uDX31eoste1s5rVd8Hm6zeO6vifII9CTxcFrqfmY/y
 frUpAk8OmB38+keSHKuVEZKnZRV3DHkXPFHewW+TK4X5qpWno7yju2r+e22NP8NAlFQc
 t0q/kHRZ2rZWLYq0mEi1eGiRbcw4+Iltb8k661e/Zg0AJwXBqcaJCA/7S9I5vvDxsGHl
 QT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dmHKlC95wEkb+HENLwm0wnzogMC58TL2IKPX+eVUAOk=;
 b=oixetf9qmjQqsU/so9WYnkBJiTYAufiJ0XJQV3YrZo1wRU4G8OLbE9nWtehtKrtnEm
 slx4I2C6EMZbb/WloCf49LEFRepcYwP7Now7Wm3+Odav/JS8JaGz1QFZ2B6fnf/vxvnA
 u31FGiXi0KpVvcV4FGL6QowfFvrWAgoBvFdSue42XFK/vBCzvJX3wNuwLodoTVA/mWXb
 gt65yEv3ZUqqrpFddSydfmPnEUz3PFzXcHEZGshph8yqUrlG/nAmL/jfi8QOpqxmGoXy
 Hyh95rJE/Q0SX5KfkCh5ddaM98YYPEnGISTYhKsGHTSWfQplfkvDyiR4t9diChUKieNg
 PM9g==
X-Gm-Message-State: APjAAAXZyurHpL1l5yQSrDTONl5dEe2bQ8P9ZZONriDqhlQr/Tirq/hT
 kSO0QFD4FSAutAqrC/IJ5P4=
X-Google-Smtp-Source: APXvYqz2kwMiV3IzxK9Tf5xKPsp4eqjTJDvh2n17maZJlAv70QrBj7iUZdXyac4Xthx4D2Em5ItjLA==
X-Received: by 2002:a17:902:9b86:: with SMTP id
 y6mr1010494plp.217.1568759563045; 
 Tue, 17 Sep 2019 15:32:43 -0700 (PDT)
Received: from ?IPv6:240b:10:2720:5510:a182:288:3ffa:432a?
 ([240b:10:2720:5510:a182:288:3ffa:432a])
 by smtp.gmail.com with ESMTPSA id v5sm5003146pfv.76.2019.09.17.15.32.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 15:32:42 -0700 (PDT)
Subject: Re: [PATCH for 5.2.y] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
To: Greg KH <greg@kroah.com>
References: <20190917175048.12895-1-ikegami.t@gmail.com>
 <20190917181127.GD1570310@kroah.com>
From: Tokunori Ikegami <ikegami.t@gmail.com>
Message-ID: <7c0113e0-d455-e3e6-86fc-45429be196fb@gmail.com>
Date: Wed, 18 Sep 2019 07:32:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917181127.GD1570310@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_153245_144499_4A439861 
X-CRM114-Status: GOOD (  20.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, stable@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2019/09/18 3:11, Greg KH wrote:
> On Wed, Sep 18, 2019 at 02:50:48AM +0900, Tokunori Ikegami wrote:
>> As reported by the OpenWRT team, write requests sometimes fail on some
>> platforms.
>> Currently to check the state chip_ready() is used correctly as described by
>> the flash memory S29GL256P11TFI01 datasheet.
>> Also chip_good() is used to check if the write is succeeded and it was
>> implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
>> checking").
>> But actually the write failure is caused on some platforms and also it can
>> be fixed by using chip_good() to check the state and retry instead.
>> Also it seems that it is caused after repeated about 1,000 times to retry
>> the write one word with the reset command.
>> By using chip_good() to check the state to be done it can be reduced the
>> retry with reset.
>> It is depended on the actual flash chip behavior so the root cause is
>> unknown.
>>
>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: stable@vger.kernel.org
>> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>> [vigneshr@ti.com: Fix a checkpatch warning]
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>   drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>   mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
> You changed the file to be executable???  That's not ok :(

Very sorry for this.
I missed it to fix to not be executable since it was changed to be 
executable on my local environment.
Anyway I will do fix it.

>
> Also, what is the git commit id of this patch in Linus's tree?  I can't
> seem to find it there.

Actually it has not been pulled in Linus's tree.
But it has been merged into 
git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next for 
v5.4-rc1 as the git commit id 37c673ade35c.
So I thought as that it is okay to send the patches for the stable trees.
But should I wait to be pulled the patch in Linus's tree at first?

>
> thanks,
>
> greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
