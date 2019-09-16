Return-Path: <SRS0=la4X=XL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE32C49ED7
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 05:57:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8FA206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 05:57:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o+bV5ZDJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uB6QVSmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD8FA206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XztI3PbW68vJ8FiG5uDOHGajnZbhDsqSHUEz84Imml0=; b=o+bV5ZDJOSV9JX
	HvVwEDVGnyAJOnZyIdoco77HUTAjzasFH/cPxECyvqIxjmBkaspWLGcn2O8RfSfnUCaV2EtgVRr0V
	xi357lZ3EUJnM9xOf5ELP4chKuinuudCe34m+JsjS6syrfP0JH1sNLqvwhCN+o/prtJG1fKBg+r/x
	MRvSppXLqFSVDVfqKiihdVU0N64+xNL+B5PHLjCGxcv4H3RtYal8w2BpQ0MvX1SdMpcNzUN4Sc1mX
	QBG4lytY1NO+j0iBXejgjIilQ64Kmpj/U4RrGP/1PPnmJkbzpC+HPmR5wb5Lo0VNsq2vM0savld/i
	f/HwTHPdCqFrE/MOA2fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9k19-0004b8-KQ; Mon, 16 Sep 2019 05:57:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9k17-0004aY-Ba
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2019 05:57:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id t3so8662525wmj.1
 for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2019 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFPWRlDOBQcCWDgYZ/30gODo2m0Ll6/mTcEd3LsviEY=;
 b=uB6QVSmWd1utQ7APCj4wCsazoSm67NOoz8twjN7K/qeTPn+86RU5xgsUeegpn4PiNW
 mz/oK0VuM8y4FS710Ql2gXH+Tie8h3Ss2m52afHN2JY15Eb1BMDU6hchQ8rbnFPzIw7D
 /OaZ5zeThgSGkY2FEV+0RgJjRrnMvzgYbg0nIxnjxV77lm9Hyi09WdAD5n7ZLi8tfmH1
 erW0AU44bZXRnFveocMG+u3YiNSvYrO0D+0KKANdQ8EBanhqVEvNWZEGPcO2DuqCAxJJ
 bsmHF9Qzbw3fHt8Vp/nuay11Mgr/Wk8eZZwqUfOJCvN15fg40zhz760C/V7ncuDfTsYn
 12MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFPWRlDOBQcCWDgYZ/30gODo2m0Ll6/mTcEd3LsviEY=;
 b=s3YUdQhRK4p8dWFDYbcmkqLGvlmgZbTKwo7KkxCMzlAyedYQoHE1rduhV1LUy+yDOF
 Nop3pTfb/DD1jbQN8SZDSi5RU8WnZEloQsi+jl8UQRF7/LjrP9/pdsIVEcYtdwGHk1wo
 dVvyrZpVgcgVFzyt04OjSYXzzEEh+yBMRbFAS3Kgmtzup55/aUssLT3IK/vJxxNY8rub
 M6HuuEdbxp1f5NwmOkmW/CC2ms527YmHJz0FDAcdp8i0bzhpcaEYzho2b/VMxHeLxNwU
 eAMJUGgKiWO42T/L3NaVJnHBgf44nhKwXjtdZugmJQ+EG5bmCFMBxb39hRXVFaHeC/ui
 iGhg==
X-Gm-Message-State: APjAAAVp/g8qh7A4LrcAaboU+lyXvD8AtLM/E5hqF8+gKd7vGRl6PCX6
 5MZySM8w4ZXqL6DqM5B7+/ZnbtWBHESIE6DSGGoescfs
X-Google-Smtp-Source: APXvYqypSPDADDad99v1VFbWrQcCbamus7ul7pWpjndvWvlKAtRHFgpzOB6SOqexX17YthaFzQYxq0cHY0UiFkKNPls=
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr3043912wmk.137.1568613458704; 
 Sun, 15 Sep 2019 22:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190829145738.75734cd7@xps13>
In-Reply-To: <20190829145738.75734cd7@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Sep 2019 07:57:26 +0200
Message-ID: <CAFLxGvwi7RKc6UTzXyadZVVsQudeSrTW2PH2=Qi4qU6hAOgqeg@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.4
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190915_225741_425255_F647EA5E 
X-CRM114-Status: UNSURE (   7.56  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 29, 2019 at 2:57 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hello Richard,
>
> This is the NAND PR for 5.4.

Pulled. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
