Return-Path: <SRS0=mMzh=XN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ABFC4CEC9
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 13:59:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C6121925
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 13:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cHEs8XgX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA20MKYY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C6121925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=69sK2+JlUs6QXcguoSZJH+ieUQf36jl+7Sc+phJ4ucE=; b=cHEs8XgXpD0e7YWYEXjxSkPRR
	BBi9rkdC02+WUsTT5+UCYwxEF00iWFApgHyp4NzCqjLvbITXNraMAOHXho9YSu8Lmv1/btDD88RBK
	q9VtXdjE6VS0XqGeekuPtZ3AsK/Z97HFZn7Oypbe7cgwxxqbfC3e65Go0lYCcU1iFLQHagt027Ohv
	ScUVbhIfX5JOSSBQ9TPgCnM0feFppXHTx5ITrBV54gqydmqgsk7vxB2H/toYF0739E8kN2gKSCRwA
	6nqHyI9+xLW/0D/q+ohVOyw0PfLsxlJRkPK1YNarCCo10viGRcM0zeR3AX1O2n8lKoaxGgtdejPEM
	u7QNm1D6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAaU9-0004eu-AC; Wed, 18 Sep 2019 13:59:09 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAaU5-0004eB-Si
 for linux-mtd@lists.infradead.org; Wed, 18 Sep 2019 13:59:07 +0000
Received: by mail-pg1-x544.google.com with SMTP id i18so4148736pgl.11
 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2019 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=S/KRTjZ02zi6c1DDfK/DqHGqV/93TPR7DjwT2TJEwJI=;
 b=fA20MKYYunP199zqtkonqkulcTdaHjqjGaf8aGDaHCI0MLa9D2dlXQz/CtrLHFq8qA
 pBsmdkEhkwUJv1KexBDOi1mHm43EEPT246gDC5+Dh94bJGOaqdoON47DGFp0okz90I6q
 ysIVe6vpOFuHJ256FribFKo+31MarFxqHPPd7oK4/8AU3/xRDHcHGFT8PCxcAcBWL3g2
 Tc+IfRLkuXyEk5xsFIQ3wCX0es/L8tKaGX1fR9MkuMj9lrMHOhMx9/O4icIVrU9Dtk1L
 zwmQOl1VmzglIx0ruHf0oWZ5buNILCRfIrLM1YtKK1FH76apwjaUjV373tQ91AaX4RDc
 DfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=S/KRTjZ02zi6c1DDfK/DqHGqV/93TPR7DjwT2TJEwJI=;
 b=M7Hgsy89ptUw76sWcywClejjsenGoy+G0vtS0hLtvn1A28sITON++Y1uQv+ENknwJh
 LXSDu23tA9xuEmrLRyJyKdRn6G8v3PODFWhjRpBOqRvw/ftr55kJreky0TmmumrbGJPb
 hW/af5TZA5o0InZExBO9qqj45q18dd/vE/BNw79IX9xBtM3HC14avBCEB5g/ZOwrZV7Q
 0DzZrQdJLEbmcj6gWpC+WSjN72C4HZ75zRomMRVkVbAGUJwZToPo6Y4eJzQDVQyCXCZZ
 GseGEPEqfakcOHov1p481Y15taudoatnF3n+B5/asb/t4tn9kgdMSvX6zkHvkIuLImDA
 kc0g==
X-Gm-Message-State: APjAAAXi0EaMTID83NtedI4QCL23K0k+1bfoRLOlejSMDgD8E2bX6cip
 Trfg5kA2OBFNNCgYjNVY5v6Sg86a
X-Google-Smtp-Source: APXvYqzIGgUvmqwt8HDdZsFSz9fyHCtMba88K+2dAaA5DyLiqRtCiRc1sSlmXLmyXnhVkZpBOai39Q==
X-Received: by 2002:a63:34cb:: with SMTP id b194mr4049917pga.446.1568815144998; 
 Wed, 18 Sep 2019 06:59:04 -0700 (PDT)
Received: from ?IPv6:240b:10:2720:5510:a182:288:3ffa:432a?
 ([240b:10:2720:5510:a182:288:3ffa:432a])
 by smtp.gmail.com with ESMTPSA id n1sm4679043pfa.12.2019.09.18.06.59.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Sep 2019 06:59:04 -0700 (PDT)
Subject: Re: [PATCH for 5.2.y] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
To: Greg KH <greg@kroah.com>
References: <20190917175048.12895-1-ikegami.t@gmail.com>
 <20190917181127.GD1570310@kroah.com>
 <7c0113e0-d455-e3e6-86fc-45429be196fb@gmail.com>
 <20190918055246.GC1830105@kroah.com>
From: Tokunori Ikegami <ikegami.t@gmail.com>
Message-ID: <f3d20580-ac4f-6c63-83b2-4d7d0e7d69b2@gmail.com>
Date: Wed, 18 Sep 2019 22:59:01 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918055246.GC1830105@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_065905_954118_FA252279 
X-CRM114-Status: GOOD (  20.59  )
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

Hi,

On 2019/09/18 14:52, Greg KH wrote:
> On Wed, Sep 18, 2019 at 07:32:39AM +0900, Tokunori Ikegami wrote:
>> On 2019/09/18 3:11, Greg KH wrote:
>>> On Wed, Sep 18, 2019 at 02:50:48AM +0900, Tokunori Ikegami wrote:
>>>> As reported by the OpenWRT team, write requests sometimes fail on some
>>>> platforms.
>>>> Currently to check the state chip_ready() is used correctly as described by
>>>> the flash memory S29GL256P11TFI01 datasheet.
>>>> Also chip_good() is used to check if the write is succeeded and it was
>>>> implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
>>>> checking").
>>>> But actually the write failure is caused on some platforms and also it can
>>>> be fixed by using chip_good() to check the state and retry instead.
>>>> Also it seems that it is caused after repeated about 1,000 times to retry
>>>> the write one word with the reset command.
>>>> By using chip_good() to check the state to be done it can be reduced the
>>>> retry with reset.
>>>> It is depended on the actual flash chip behavior so the root cause is
>>>> unknown.
>>>>
>>>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>>>> Cc: linux-mtd@lists.infradead.org
>>>> Cc: stable@vger.kernel.org
>>>> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>>>> [vigneshr@ti.com: Fix a checkpatch warning]
>>>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>>>> ---
>>>>    drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
>>>>    1 file changed, 12 insertions(+), 6 deletions(-)
>>>>    mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
>>> You changed the file to be executable???  That's not ok :(
>> Very sorry for this.
>> I missed it to fix to not be executable since it was changed to be
>> executable on my local environment.
>> Anyway I will do fix it.
> Please do, we can not take these patches as-is at all.

I see.

>
>>> Also, what is the git commit id of this patch in Linus's tree?  I can't
>>> seem to find it there.
>> Actually it has not been pulled in Linus's tree.
>> But it has been merged into
>> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next for
>> v5.4-rc1 as the git commit id 37c673ade35c.
>> So I thought as that it is okay to send the patches for the stable trees.
>> But should I wait to be pulled the patch in Linus's tree at first?
> Yes, you have to wait, please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.

Thank you for your advice.
I have just read the rule as described this so I will wait it to be 
existed in Linus's tree.

Regards,
Ikegami

>
> thanks,
>
> greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
