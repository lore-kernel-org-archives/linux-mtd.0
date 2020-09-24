Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4398C2D0E2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:32:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7E72311A
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:32:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IGVQXIap";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tn+Ci11O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7E72311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJU1avwgwoSaAD3z9qzYX7/EbrzyjyhluLhNvd2ShU8=; b=IGVQXIapYYdTC5LXpSuEE0iM7
	CO8iVe06lYYKuG8vOWfvU/ffNTYxaJFGcyDgp4UV2ZmjBrewomw8KG9REPNeJZWyGIUO8Mnp3t0at
	WXDbH+4x9uE+J1ExyjEf6X3+E3Ov16lhYz+sC/34vA+uahUiiTG68bMP+2DBLZiWrQ3ub2dUtruqm
	Yc0lVVQ6BtQfjDf71753XdecZL+leJiUbdUkPebcxlb2RAvwpRWTjB3APh6fYr9bwdDYocAtXkC2P
	+tMkPfMcIVDCXpz62nIUP7T4bo0Tr4B7l/peChMTANiDikweKutZ55JXAmvcN674kg7IpzEomIptI
	bQ5+gcZtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLKmy-00027Y-DQ; Thu, 24 Sep 2020 06:31:32 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLKmw-00026U-6f
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 06:31:30 +0000
Received: by mail-qt1-x844.google.com with SMTP id g3so2110648qtq.10
 for <linux-mtd@lists.infradead.org>; Wed, 23 Sep 2020 23:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gYFQFKnELlUUKgHn/BDAIcBqNFORy1bWz1Z/zuLw2sQ=;
 b=tn+Ci11O5N6x3EbxHTxPJKpA18xiEXeyCZ+sDikC9pQgE/uH/OIhLciwDLAFWxQ++Z
 nJ+e8F71InCcxo6mLDJwjiJcKeCNMDCO2koRw0m9442ozNUthUd+uzzWwSe5cHVw/SRm
 JMjGyADq0qlg8kDtfShIWNzfbN4Vc/4LvISFyQkRapjbU+di/JO9QKE9IMUrnzNH37/A
 9etQtb8fBHzfbv8f5sGeu3ANH2LLuS2Df4/ApwVNehhBf+HwApf03N6TL9kGtshqfwvS
 Q7cNhz3dKFXkFinE1Zk3g8UuKBcwE8NKOpiLyplO9aM3nT9D5/Ib33wab1S4igq3hQVC
 7/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYFQFKnELlUUKgHn/BDAIcBqNFORy1bWz1Z/zuLw2sQ=;
 b=I5calN4p3td/IT73xI4ahR7jqDx5PmT6hxXcb9srU1/BBG9miP/ZDuFI7RE/9KfOEi
 aATlT++J/2TwfhlPdOIHCm8mVXpQC42ozMTgfNvy389Q5SvH3q1fFqKXpRrNFUFAd33p
 mqQo3wIS80/xmdZuzLX1P5vahclWknhhKIzeq817yBg9wHJrGTR4MgCyhZFcmLqbk76e
 +Gg33nJm/uomsgGIccNl5MQG3iBS0c0ApO74+bnguDKqUsgZIuRp8kccRni3kR22LcgF
 9VcWrhmKen2MAKRhvCPJqKRpKzW8AKBPVoEP8tBoZkX5NUlTHLI2haMLrLyI+Zwruchv
 1SDg==
X-Gm-Message-State: AOAM533uZygne9+AzBNdVA9VePxrdPTftaYiif2PKrBOs1E2jwwClV+U
 qzT++IaviBSxvaOVgzOhfzOT1AL3KEQM4ek5lhk=
X-Google-Smtp-Source: ABdhPJyOXyY8NardEtsjA0gmlxqeEhw+LMmNcp8E9Go4A54mRYVA5fSwn1GCmkQmJ0hhepi551JPwMrNm00z1NUMzCs=
X-Received: by 2002:aed:35d3:: with SMTP id d19mr3859185qte.332.1600929087585; 
 Wed, 23 Sep 2020 23:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20181222124008.28046-1-ken@kenjo.org>
 <10756fcb-b284-5465-ed5c-8251cb00d9c2@kenjo.org>
 <6672633.KqxhzBgVKO@blindfold> <20190104095302.236a19dc@bbrezillon>
 <48ea6042-943a-03b5-dfde-b68a0b223c49@pengutronix.de>
In-Reply-To: <48ea6042-943a-03b5-dfde-b68a0b223c49@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 24 Sep 2020 08:31:16 +0200
Message-ID: <CAFLxGvzcq-6PS9xGztxcf8YxoTs4ggZVX+LFLw4StAnFLASa+A@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: nandsim: Add support to disable subpage
 writes.
To: Marc Kleine-Budde <mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_023130_256788_2BEC97A9 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Kenneth Johansson <ken@kenjo.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2020 at 5:08 PM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> Sorry for picking up this old thread, but is there a change to get this patch
> upstream? It works and solved my problem of mounting a NAND dump of an UBI/UBIFS
> from an imx6 (2k page size/no sub pages).
>
> I think it doesn't apply clearly to current linus/master, but rebasing is
> trivial. I can send a v3.

Since a nandsim replacement did not materialize yet, the chances are
good to get this merged. :-)
Before we do so, can you please explain why ubiattach -O does not work for you?
This is the way I deal with subpage "issues" when inspecting ubi/ubifs
images on nandsim.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
