Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE5BC4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 19:53:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D18E20862
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 19:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RAEP1bZk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Q6z1/Jo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D18E20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iu/vfNazGUNC0pmQx61WqbkQdXdP9kQ++0uu5w6R8z8=; b=RAEP1bZkEo6ED3
	WkvWJKyF6mSoNvxA4iHf9I+K2bydNlVyhVdNnRefgtFKsya8TczdfrBW4odBmU7SiGpqLiEhgL9Ay
	fx1MoiGFG4tC+qMQ6hI+KWXBAdp0YL6ylyLyzNhOCP3uQHRwz8CF2YZ6BVQ4e1nZGzEM+BwfheEDE
	DopV1b8R2B01FVkxfUu8xPputlfJ22hJgqV4WgYqU5dgy5K41YD+KbJiJH/wVMuy6Rbpm9fD6o2tb
	Jt9pTKOWafYt8LM/dS+xSTLvDicY7h0tOL49Dk1UWMGyfRGtEbT/e+Q2AtaxCvSvNOHyty11aopU9
	Y8czgo8cQBGThyhIX73A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAJXt-0005e5-Gr; Tue, 17 Sep 2019 19:53:53 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAJXp-0005dk-F9
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 19:53:52 +0000
Received: by mail-lj1-x242.google.com with SMTP id m7so4162901lji.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2019 12:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VT/0Zt31ttrrNkhbwB88m2NoNEHm91WZpAWde6t82u0=;
 b=Q6z1/Jo7LrFsWL8kk7PzsrwWW3vRr4VVcMZTIa2D4l7BFbCUBa9RZOH5Ce4NVcfbuF
 FxfC4PlG7BBeQvsAWVjfg8IurAMuzzrLu9zaoidpxrq0Ry0ScBdvh+A2bBBBT3FJoUyt
 7xzml+QGy11JbU2R0TWHqau2VwwPvXhO2vyUHme5RBZKYva84wbQ/IBP8Zsoha3E4hML
 ViCKAsF+8gXs4BE2DA/aQW/+nt5B4lw2M74ESU7Ij/eQASL42oqjXDz6/3wTwZqEJUPw
 JLtD9kkdDoJfgeKxjG8ls68dYr7YNURMjSiRLt2Pdv4N9Zwb9IG8q7idOT9Zg7LY/XN9
 P38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VT/0Zt31ttrrNkhbwB88m2NoNEHm91WZpAWde6t82u0=;
 b=JX/TIfxZJbeCucGD/P0UwPU7Ct2xYDqyHrCDs7pTtip9l1Mx8hV9yFOxcXBbLxPUCy
 +bg5PADO+1ufMAnnaYc5ghRA3XDWFlIX4VZCtqhm5HHkE4SyCItsJ7/zq0y/izP7rKxt
 SIUhCoTTt4hTBhT/z1jj6bwUhdXQsr9hC/wP8/GAyl3AExxr4g70QhrbF5a3YPpgRkHk
 rgVJ1VsZq11m5aapctdi2ho6a89fAD0qEcAOvKtH1xb7cLcrnP5d9x6/ebwzXY5mQPGm
 cBMRCydqxBi38OWz/bE6puyEGLX1VZKoDsADfk/+lWj1cDkJ1mxbayVaYEF2HAFRvi4G
 4QSw==
X-Gm-Message-State: APjAAAUUdeFwEL9aPgJ/e8nSYOhiameUV8zeIf/1LAC2AyUWiHUOVb9t
 +PPrrt/vfES4tJbatyPTItYekA==
X-Google-Smtp-Source: APXvYqxNL2lV0j3FMmfjunSABmONMX/X4utT3HRUsXCNzKSy1n5KOKpchWU43emQhPRHp74bA0mwEQ==
X-Received: by 2002:a2e:5456:: with SMTP id y22mr71537ljd.60.1568750027327;
 Tue, 17 Sep 2019 12:53:47 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:6e6:a4e9:c875:5d39:c4a4:275b])
 by smtp.gmail.com with ESMTPSA id y8sm604955ljh.21.2019.09.17.12.53.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 12:53:46 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_util: use DIV_ROUND_UP() in cfi_udelay()
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <bd64fb56-c42d-7f7b-c6f1-4d7b43a6d191@cogentembedded.com>
 <CAMuHMdVdKgBYSGJemH2LP+N61T+uui0XX1Zb-=dM5sNEAaQoMg@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <90d87853-621f-890a-be59-1591cfe1f4ea@cogentembedded.com>
Date: Tue, 17 Sep 2019 22:53:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVdKgBYSGJemH2LP+N61T+uui0XX1Zb-=dM5sNEAaQoMg@mail.gmail.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_125349_504971_D033FDBE 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 09/17/2019 10:43 PM, Geert Uytterhoeven wrote:

>> cfi_udelay() open-codes DIV_ROUND_UP(), violating the kernel coding style
> 
> Perhaps "violating" sounds a bit too harsh?

   Hm, indeed, scripts/checkpatch.pl doesn't complain on this line. Do you have
other ideas how to call this? Or just omit this?

>> while  doing this...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

   TY!

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
