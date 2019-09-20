Return-Path: <SRS0=rWZ+=XP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D48C3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 14:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA2A206C2
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 14:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QiCGF7sE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5teQBJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA2A206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j67CruNNemuVPM84Zz6MTVUvuEqEE15AQTEvokIuZsI=; b=QiCGF7sEXikTjt
	XkaI0orooDEbTTO21W1Rm8nudWv+m0cbIR+orTCx2uh3tpFc8DI+Z7Dw3s+6XMEaeAVjwR35Xa175
	GOtQgnIKgWvxzNINcmljrFNAcxQCYWjFYYBF7QapTRG8O/HUOkiXnxFyY0YB6JC6ioNIY5NfokSA7
	kHxqvjJ1TERgfi6XMB2JWGHJtyevzAC1jpufM0fA5sF8lyYLehEG5gl6thb3ims7YByG7ZYsIy1SB
	cZt8Q1g9YBpC2vd57V9u7RE7lg50O4VEHMACP7sG0H/QESnt4amyPAXKeU2XoPdDSmxE4a47YObyd
	vpyJRqK0IRGLZ8A/7R7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBJyk-00083X-Bz; Fri, 20 Sep 2019 14:33:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBJyh-00081A-AF
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2019 14:33:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id q17so6990735wrx.10
 for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2019 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=au7Qr45MYfdaJddmdUzduxIIgjvGJDnnJ+isRdpqtxI=;
 b=e5teQBJwJg++JBbB8pOll3ci+R42R/zms0Ms9EfbvajvXSoP0y5VGkIFmdKupbBwsl
 60M3fwK5CWZrPeB6HnE7eEXVW60ud6KUAtnzXkGSm0KKVt5QE7fdy5I4Q7EFQ4eG9wzP
 5OOi1n2CVMryrT85tQXuJsIaBWevvlCmGeZrb/+SBCCJIf6UQmk0hM4QrT11wFmzZDe5
 G6zY7+mDfQK+fJHEJIkRjNHjD9B7/JBiK9hnBHoUuAT76c2kdcbufuis2z1xRbG87j/M
 6PmSFaGc+rna5a0JL6pdPVue6geslLTSVE3xbmkGNR7H642BteDqwDBrivbDzCoA169C
 wZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=au7Qr45MYfdaJddmdUzduxIIgjvGJDnnJ+isRdpqtxI=;
 b=AzmLE3esswO+wD98ZtL8IL/AKUc0FVCMYGdsCx7RXyvW24/UKKfSmsbDA+dC81AOCo
 1CpAhlQuvclWe+MUGTBjB5/xWZFoTwXS67DLSwOcdOhJ1O3HvMHJCag77z49mydyHCt+
 lEiuYB/uvqUvuFT/4GnoHkWHxLCDZSQMABdBKBkFEQDFypRbg88CiZto1UMX9AvSyz1e
 mOuO2k1EMtqr4FSMm5KcX+3DqG7pxYulzaagmgm6oiItvA/kQV7STQ3crfGmok5A0QzE
 LlIYwbJ9Ab6rZYsErcyzE3G1J7e00IpCwxJ8z8qUaBTew8gc03wzvAj1K6ogZHOyIQ+p
 4hAQ==
X-Gm-Message-State: APjAAAU7u310CrwKfk2JaPetGUVYoM1A4cRfFwSBFphWAAzTGfXXP4Ts
 mJdG3f63/xIAcZmp7W10rQUVWbJTNseuYyFqfJo=
X-Google-Smtp-Source: APXvYqxj7EvJXHK/tKKvNXG/vHxgbONRSo5NIiqMHWgsEeXQ4gR3GZLXoZAwZQJSQvWac7fF1ao3g467/ha/PfFBJXk=
X-Received: by 2002:adf:e388:: with SMTP id e8mr12343645wrm.306.1568990020370; 
 Fri, 20 Sep 2019 07:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWRK-ChXxovKqSLpDF+JO7DtjginYXY33O-xtEAq25MiuQ@mail.gmail.com>
 <20190920111010.AF800240014@gemini.denx.de>
In-Reply-To: <20190920111010.AF800240014@gemini.denx.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 20 Sep 2019 16:33:29 +0200
Message-ID: <CAFLxGvwN1_BJ+3iB8fdKH9cJ_XEr_JvkToFAhxTzmK=FsixCbA@mail.gmail.com>
Subject: Re: Missing all ubi commands in mtd-utils
To: Wolfgang Denk <wd@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_073343_358262_D7B7D094 
X-CRM114-Status: UNSURE (   5.73  )
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
Cc: linux-mtd@lists.infradead.org, JH <jupiter.hce@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 20, 2019 at 1:10 PM Wolfgang Denk <wd@denx.de> wrote:
> Probably "ubifs" is not set in your DISTRO_FEATURES ?

Yocto splits mtd-utils into many sub-packages, ubi stuff is in mtd-utils-ubifs.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
