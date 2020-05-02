Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219F7C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 20:52:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59CD2072E
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 20:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h8iB2iTp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTkqkhnB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59CD2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAiS6mdsT924uCAc3gbI3ALZQa5B+LhWxudroz2LYkE=; b=h8iB2iTpWzdjgf
	VZSrj9P/kg1+vOyos4k9t27xzfZEyONXP3tjWrv31mBcqGQBA+gU4pc1eh6CPYMovNNGLcl5jxSwm
	DeWxZQclvgFRWtu/Ruo95Uu2juIQA0iuE9gCrmu4CThFfK2q7Cyg0lS7BCKeyq/aHKiLeRokZdVAa
	gmtMOsCKgUtBtrx282tRg5aQs/pwsv2VlHDF38AOCnPzf0E/1ElZq0Q6U/9hqhKVQVy/hHYC/ckiE
	HFBc3/yDiPruEgN+6btmdrFqA3i1JMh2wFDeQb/Vms07o7514JteIXDUhHTp90nqmrZCygcq4IK0+
	/UKvWDP2RjULqVyAEsXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUz7R-0006OC-1K; Sat, 02 May 2020 20:52:17 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUz7O-0006Ns-0o
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 20:52:15 +0000
Received: by mail-pg1-x543.google.com with SMTP id l20so6455816pgb.11
 for <linux-mtd@lists.infradead.org>; Sat, 02 May 2020 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=quexCiWi2oqFOD1er6RWFHC8nDUp8vrpbF2hyNz1YDk=;
 b=KTkqkhnBavlNqH+FdL/axkGz6CE/wj4XBoxlBCeB9bP5PCj1j0NegJBvltKtfb/cHr
 Zlkiz40bdmSA8y7Z4dkwj4etXMOU8iCeFtIsx4KP00stIJ7I1/sEUMMolDMHrNZKv57j
 OlWcDE6OuzW8Ju2bh6vKfBS0lG4KF9xmYHPCkvyrX6AmbM3cVCMeg/CEbL05a10gP/OJ
 pwzMxlr4f0CrvBjDSOgMIrAcvVdEntkOaas9XicT3s7hSfUbqV9JIPv/r96LMYvP4is+
 aiFcYXhmPwfR9QKiHkMtpRfvLXX6+8+IrOHDJx+UeoeeNE9uOCJzNIuP2E6m56EShOIP
 TH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=quexCiWi2oqFOD1er6RWFHC8nDUp8vrpbF2hyNz1YDk=;
 b=BgRMfMJOARsfHNXlPUscC4pS7hZDmO0tYprFa2+Yci+9Dps2eap48N17S19NfOTvqN
 aIqXj6oHgTIxUttkpS9dHV7AjI7Yi0gVlQkoz3+1ejaBymLY4MAIdOKYaca5mr7wNCcb
 FDAVXYY/ApiQMmXLCQ9cWC0ekmdK+OGzjcMZdnp9yzwU55oLTwR2aL2pJrfOsTrVC9a+
 7VsOAm8fd6x+mpZ7DOCqNM2sDzb3srqSl9Pf5lMz0arD7TGykhHu6L+1kAxas/8sPwE/
 ZIcPmhIw3RvHGWMLKOm0+rXKpPnsEs49kFBikD+fsLSXIYelFA5YwmiMDmBLHV+g01vR
 H4iw==
X-Gm-Message-State: AGi0Publ1xhNElQmuuXAzo1ni5gAVkxytkjnNMLzbOOjFZMglPgHsjV+
 ClwmjzjlO7tyhhfkL1D+hMs=
X-Google-Smtp-Source: APiQypIGGvo4hPVTHloclEXPFvewsJZUgC/arK65mW0EELFwd5G01MaeRxV79MepK10FtePHDVldGA==
X-Received: by 2002:a63:4383:: with SMTP id q125mr9558514pga.27.1588452732707; 
 Sat, 02 May 2020 13:52:12 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 y2sm5180007pfq.16.2020.05.02.13.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2020 13:52:11 -0700 (PDT)
Subject: Re: [Patch] mtd:rawnand: brcmnand: Fix PM resume crash
To: Kamal Dasu <kdasu.kdev@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20200502204137.37134-1-kdasu.kdev@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f0e781e6-a7ac-37be-13c3-885eb65a0921@gmail.com>
Date: Sat, 2 May 2020 13:52:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502204137.37134-1-kdasu.kdev@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_135214_061700_E82E5A91 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 5/2/2020 1:41 PM, Kamal Dasu wrote:
> This change fixes crash observed on PM resume. This bug
> was introduced in the change made for flash-edu support.
> 
> Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
