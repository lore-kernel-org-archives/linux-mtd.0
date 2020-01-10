Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FA6C282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 20:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28362205F4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 20:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cPsGVEl6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U8Kl+MGD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28362205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBlOxGEiF0Hb5lLaLNO8l9SEsGAencyYZDJgPG0Zfk0=; b=cPsGVEl6RHAaO4
	cEuh5uiv0SW6P6N2cOoEkVQxQb7dDLQCSAEuvh317212xqnEiC6eFWGtG4TSlY2o81y+p5ABioWrG
	y4CLclpLTrTm93kesPdsQHOWR39+J1t0TYB76WzH2unXfcV1bb5Fn7mktEeO+vKykuh0nogJQ0q2Q
	f2DWXdUuRi2NX9A+1WXkrVRDxU+s+O8bgdP997lItn9yC1TGzb9prSvVpnuktXSbaI1YH/ETvp2r9
	EJ8MTsNKHlM5CL1/l3mOzLU0HHVF51br9SEpmT8KYrszqlIA+x8af1o4nY93q2qcVsvMf9BDaPuo9
	4LOXg45iTQg1wGaC1vfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iq0x3-0003oV-8v; Fri, 10 Jan 2020 20:32:13 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq0wz-0003n9-S4
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 20:32:11 +0000
Received: by mail-lj1-x242.google.com with SMTP id l2so3433548lja.6
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 12:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJY/k139t+jKR9coVO4oz8lqyEAClB7/i7kGMDvcB1E=;
 b=U8Kl+MGD1543lW5ezWJsO8oq463sERmIzSWDKAZ0apd6rJM0caY/D1COvpgRRh4ogt
 f0LM83WBDcyAgnUvGHNZKwxdRv2C3u5xmjLuY4iFlL+tm7t3iSVOg0qnmO68SsJpMHRG
 cmTIA35ClvhnccnTJ/L6rXx1hGLazRA7WgJpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJY/k139t+jKR9coVO4oz8lqyEAClB7/i7kGMDvcB1E=;
 b=rA8Oxm0gZT6BeveCVPliukMIrwS6Evcl8WH+vCWjYJI1PqkpRCu3IlBTazxL/OuPN0
 Yf5VD61DEYYz/M/Kp0C9qH2jyvjt9B23ytCDYaIc+C+BALUr7+IbxJqsd4UkSgP/bxJ9
 Yw9ONdFm+OR/Hvw3e7CBOkt3dlF4xLeaP9Agc14Sf5GDFVYPYw6ZDTU3n93BA7dzbiDp
 XYaahgO/wr1qH6/aoNv8s3c/dNPi81fH716LgV/g+21XsYsHYtX8dyNXtn7NVLQEXTQl
 HpUMKXEtrUFAdhyYp+xckSSiBPCd0mbgXRPJxB+aDxmJfdYDpeg2dYOmcVkPCCSyJsRg
 wgKA==
X-Gm-Message-State: APjAAAXQvR8FllmcGV9lxeerRazvC7lB2jjnHKk/zfDkQF1Zsi8WJYu3
 qu2lYd7noaUD5GgD2Dc/cEdCEJJXiaw=
X-Google-Smtp-Source: APXvYqzJmarnKlhgrjtic2LJXPvv1dyp8PNrWdzukW1k8dhkH0mShTjPAo2kVbgDw5lFK9l7JC99OA==
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr3738397ljl.65.1578688326960; 
 Fri, 10 Jan 2020 12:32:06 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id x84sm1596864lfa.97.2020.01.10.12.32.06
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 12:32:06 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id n25so2467655lfl.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 12:32:06 -0800 (PST)
X-Received: by 2002:ac2:58ea:: with SMTP id v10mr1444385lfo.202.1578688325770; 
 Fri, 10 Jan 2020 12:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110154218.0b28309f@xps13>
In-Reply-To: <20200110154218.0b28309f@xps13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Jan 2020 12:31:49 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg=8=nTeOYGoAbJ=VjS47Nh4-_OFK9zKsK3mK4nAi2dNA@mail.gmail.com>
Message-ID: <CAHk-=wg=8=nTeOYGoAbJ=VjS47Nh4-_OFK9zKsK3mK4nAi2dNA@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Fixes for v5.5-rc6
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_123209_926317_069450DB 
X-CRM114-Status: UNSURE (   9.85  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2020 at 6:42 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> This is the MTD fixes PR for v5.5-rc6.

Hmm. I've pulled this, I've pushed it out, and I see it on the public
gitweb and I see the email on lore.kernel.org.

But I don't see a pr-tracker-bot reply.

I _did_ get one for Jens' block pull, so pr-tracker-bot is alive. I
can't see why this pull request didn't trigger it, though.

Konstantin, can you see what's wrong?

            Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
