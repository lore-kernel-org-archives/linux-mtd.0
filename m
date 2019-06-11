Return-Path: <SRS0=yQQQ=UK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E236C43218
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 13:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54B020673
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 13:22:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZtkiVPl2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTNpENcR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54B020673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVB9PN7+6DCF//x/taVi60RtGXPtUrV4r+JLI+X1jhI=; b=ZtkiVPl2ig997Q
	gT0gZRfv0GZEAj0m5SohoNWICdysZyOKNQ6vSP3ZmwFg0nM77N3wI510vsP8nQq8o3QYh6vdAoxMD
	eI52QFON+NakivmI+btzM+fOoZlceoDRBLfGRyiym/wCrK3qi0ydg/ZPT1DuMlqlI0/0J8kzQr81+
	02EWbigaQOit9/bSO+NEKe4UL2z+U2aYfZ2H4mkw3y8k6r3uZvOm5np38fZsGAzb4kH2kc2JKqtc/
	RJXo8jVpcLGlQtDfXKpX8wNarmIgbUfA4+ZKdbkgbT2jqyQcGmMSEWjWLvBfZ6Mby3t049LVQt2WC
	ECsyZH1AReT47hWaX3Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hagir-0000by-G8; Tue, 11 Jun 2019 13:21:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hagio-0000bc-Km
 for linux-mtd@lists.infradead.org; Tue, 11 Jun 2019 13:21:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e16so13054912wrn.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2019 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZL348BrulEPJbyvrbT1Pm3cHOY9u7vp8QDokTQQCP0s=;
 b=mTNpENcR/BD01tSnwRU6/MnFmX1rwEPR98I93uhLJ/VkarEUy7/w/eU9tylA+7V8IY
 +xLrRPrpMG3n9nYuHXWPM+2l9DHv6Qqy8hrZ8Ovx70qtv77pQhNZrPDe9tJcjCUIBr+O
 x5kbrUej+B35AUFJ1SRl1GTFxZVkgco5SifBFVpeItXzVJ6+3ZL+bwemGcxxNUDSs7Ha
 O6wgtU+yYF0J85SZpaZD0ZNzr11YaCtzcuPEEWXPFKbA67XQJGzDiSue5Map6K1LsEUT
 +2oCjyDk5zlJcUrP6wUd5/RGP7ZlUlm1Sc1NILQfuRkOeknhUxyozcGjG15fpNXE36h0
 7fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZL348BrulEPJbyvrbT1Pm3cHOY9u7vp8QDokTQQCP0s=;
 b=Edj+Q2Q4l91k/BbbraBTwzDqzKkPk204BgpOCZ+379m0Wl2qCyLSkylXWcJr1CO3aJ
 LcmQQ6/tUHsgHRLQPwk+CaFGzeC7AoTTOlvF24K+8uZRMPHNxMgAtY4ptIYGTpsf/E+D
 NOk098XSC+RvHnX/HDBzLn8DG1tv1r5AmHsr5WEdw37RksBMKaYu8dgeq0k/m4JVvp0f
 DgNZbWIxwLWlOMrf1E7G6Wapgv7eaYjPaHFO/RHfzg2Nd6rJ1nXIJh1BOdVPkO/HsVzt
 WCThXQhZXs71+eM2ObnvP+U6nxkcxCRSq52YAsx5HF+7e3XTvLu1/vmTpc/3Axysb/sk
 Z4dg==
X-Gm-Message-State: APjAAAW5TMYnAttbPdmsIYuxv2d6vf+/bjI2oKZPRE6xugKmtWWdAw71
 YRvPucUxPoG4lppV0+ZpSbM20uQR2cp3vpDgCHU=
X-Google-Smtp-Source: APXvYqwAj7t0vfqZ0b1VCXC4O5ksA/hgWBES5DHgZDcGGt9e4/8LoC/BbAxYj13ty2GjXesqqK12LX0L/bwK/nC4eIQ=
X-Received: by 2002:adf:f14a:: with SMTP id y10mr36506196wro.183.1560259313059; 
 Tue, 11 Jun 2019 06:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSKQ4+BsQ9XPEhP+f=-oTA7CnbJ6=4upRZughg8mOUSUw@mail.gmail.com>
In-Reply-To: <CAA=hcWSKQ4+BsQ9XPEhP+f=-oTA7CnbJ6=4upRZughg8mOUSUw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 11 Jun 2019 15:21:41 +0200
Message-ID: <CAFLxGvzAHGVA9Pe0rvJWqjUgaPZKyExvV1gu3pZAezhNGDXryg@mail.gmail.com>
Subject: Re: NAND user space program
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_062154_683280_E0374019 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 11, 2019 at 12:20 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> In NOR flash, access flash in user space is integrated to the Linux
> system read / write, is it the same story for NAND flash? I installed
> mtd-utils, but not sure if I can still use Linux system read / write
> to access NAND flash or not.

Well, Linux exposes both NOR and NAND flashes as MTD.
So there shouldn't be much difference.
But make sure you can deal with specialties of NAND, such as
bad blocks.


-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
