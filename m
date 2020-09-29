Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E897CC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 08:47:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B2D2067D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 08:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyN8LNAl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH0vwQJv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B2D2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xIrQAL4AdsdJEAo7RP6RsRVAn48Doz/U2BfCaGG7GG8=; b=uyN8LNAl63OQrcrA+mX9VUPt8
	PRrNtgfQanF3gjBnVVsGVL6RCoFRWIpYUagK+JVn8nMI+icQ+NCzirQE3pnMBvKpiNr4Np294O6kf
	jWJWgtfJDXtmpJcBa7jmrtwPiUo+Y14MOG2dn/YAV1/Ss+6czJrACDhw3h863u6PaSdQLj3B5mYYr
	Ro8oK4p0+hcfLVqmqYgX6YAP+D6OzdxoflteIkvZbu+NdV6wiar+R2O7+Y/Y3SPdr2Ef0QS5pYR9q
	COvG2/ax8D7PJUJAihEEi4oO2T/5UFRCPxK7wS1IxNmS+q5VdHZ2SRIcyEUdi3aeLxtVy65c3LaGT
	IziashR5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNBGx-0001MV-IL; Tue, 29 Sep 2020 08:46:07 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNBGu-0001Ka-Kt
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 08:46:05 +0000
Received: by mail-qk1-x731.google.com with SMTP id o5so3554114qke.12
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ENayg0b03aN8oh6NtAzZAKoo2a0ju8QsO8GHbXFhZXs=;
 b=GH0vwQJvj0abMudCkVRJwZTIa8zBonKfg1gGQqDdzdFCUPuynDV6FaBsfSsWRtJobK
 952K0xjR0PF1b/jIze9/0+qd793hCT4EEGkrZf6vgvuZHHwx39/xycmPbqi43az5v8yK
 QmKvKFBvtj/YyqqykM4IbzUXJnFZ1VHOGM0Ms9rTDYR7u+ViPC12FCRNfas8ePj1t4Fr
 dCBV5WRZuXduZZb2oYNjrpC9YkDh4DNadUgoWJYqzVUhoU9jpsVerz4L+enmtZ0DrGYA
 PbZMYftyiEtrTptZejO7fRWjJ2YajW5sVyvJu56vwV8Ox51d93qseropt3B6Iuq6VMth
 bqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENayg0b03aN8oh6NtAzZAKoo2a0ju8QsO8GHbXFhZXs=;
 b=nut9VwqMnsC4qb5tKHDGUb8ZqVFzUu0yFce+DwErvbnUlfsELayrGNi0K3gglKpm8D
 JvU+iO9pIsC31MPQno3wyvg1KYrqy12kFz7hmxqn63SuMQ1vKrkM2dICQzRkOSJhsXdU
 RXgQSSMqtEYrhPMudhADfjh3KWr5ROEkSVRDDp91t9WMyX4sSpvoP6MUm6+vMycEWM/s
 pqABh5T8417lXe7jQjAbh/Cf4pZo9Ad2Q0dOGddV1iBjgq1J1NrkBQ7f/1sxphw9dY1y
 HjN8s0Km/19to0uh2g+vknedTOweCKG50u5MKbZqQIZYnp/ble0ImZlM1sd3lTILqDiV
 QT2Q==
X-Gm-Message-State: AOAM532cttH3CSccHQBMRdXHmTRNRIOk38M9c64EOugHXkF4V3ouQI+g
 30N9HZpt0tB3JzGft4dygr+ogDvBboGhaDKCUwjNEpPl
X-Google-Smtp-Source: ABdhPJw+v84u/6cEmOgt+a3nOzu96iRRmiu6XRMetsjn2FGDW3a/Lgi7bAJ/rn4MN7mARPKu20vm8BzPOep6RQTP93A=
X-Received: by 2002:a37:a189:: with SMTP id k131mr3242514qke.34.1601369160995; 
 Tue, 29 Sep 2020 01:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
 <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
 <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
 <CADBnMvhcowEVqUYwg3vVK-F-=N+mRNQAsaihXuUorW-iWnWcxg@mail.gmail.com>
 <1929983185.113286.1600681896280.JavaMail.zimbra@nod.at>
 <CADBnMvhKxZSjyzhYxu3FUjZ0KtSDUdfiyEWBnNYP8ireCpkX8Q@mail.gmail.com>
 <CAFLxGvwSUx_JBbvbJjoeyVaH31mMoyTLGm8oGRi75agG0sG30Q@mail.gmail.com>
 <CADBnMvgH_coPG6pE-b9rn_XTVxLNFc5q_FAvEx_2kxmJ-PJAMg@mail.gmail.com>
 <CADBnMvhxXdvjrA80z65zjzGffpT59+KcVq7bhqyQ7oBUpc=5=w@mail.gmail.com>
In-Reply-To: <CADBnMvhxXdvjrA80z65zjzGffpT59+KcVq7bhqyQ7oBUpc=5=w@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 29 Sep 2020 10:45:49 +0200
Message-ID: <CAFLxGvzwR88a0d5QpR_RLNbOBoZ_-oXwENiqPck0YuFUfPfAmw@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Kristof Havasi <havasiefr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_044604_736308_ABB39E17 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 10:29 AM Kristof Havasi <havasiefr@gmail.com> wrote:
>
> Dear Richard,
>
> after a day of stress test, we still didn't see any emerging panics, so we can confirm that your patch fixes the problem!

Nice.

> Thanks for my colleague, Karthik Chintamani Uppund for the extensive testing.

Thanks for reporting and testing!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
