Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA79AC433E8
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 08:25:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B715D2064C
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 08:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kc0u4K7w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmSjc2Qs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B715D2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/wYWfs0BKUESono1w1pKFMFBbXS+qQYCBANrGoNiUP8=; b=Kc0u4K7wMbSVgZKYncjC9aDE2
	AJVEwMnARuX42xK88U003rhuJkiRnRVu1pp+x9LxLRVi1Pf6HNxiRiL5vy92ogOBk5QtO3MqcNTeQ
	og5ukKVDKY81JXFnjT/LNTvX7kLw4i6T/EMr7ccIBDjdU84eZNGHRDVlZ4jVuAVHvRDvQwkvkxiIL
	iuCEheqaEl+HUDpU6dp3ItNwQ60ewjupaFa5sSFzEbFhWMK7aaIQe34gdZTCbeGTenzpG3bq7JGkC
	Ln6fh9gjz4geoo+51F2kyOLAqQvk0c53cZfOmCGSGL7CXZr1ZKXmGRbLvtTJxdzY6BZgTi7mc1vXc
	bBUBxwDiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzFUY-00017R-Hc; Sat, 25 Jul 2020 08:25:14 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzFUV-000179-QP
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 08:25:12 +0000
Received: by mail-qk1-x741.google.com with SMTP id x69so10902397qkb.1
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2020 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UrcaKYeTF7ajGP+JFvyzrD8tBDOTWyngjRCAMS+QLo=;
 b=WmSjc2QsVVpXm1TZEwxzvoBmX64EPSy0OJhd6yKgYDooSHhxrLpQHGLy77gk2tp3Rh
 55D0Q41BAG0N8vnEiSmADjI0v9GcjjCTWJSfavuhC6au4sq53QA70DH4M5DKg2jV0k5N
 V4EamUrGhP7U+eo+kmzW8yO8EdisYo23+nI3ufADBiE7PeIWy69mJ3NbGYDM8/c3JQN2
 6+Cmei4VBHWnPqMhqFGkwvchJszSV9Vijf2tftPmqkGL+VS2o5iXKdydUe6XhBvxsAv4
 qvIBHtEd6wklF4KpZjLya+4GOiJpp07vwMeYPzg2LXljluTjEuiqcK4Ryn3MhZF3YdXA
 Qv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UrcaKYeTF7ajGP+JFvyzrD8tBDOTWyngjRCAMS+QLo=;
 b=PNRA7zCkAdP/XfRq36TWAY8QX8YA0+t6EK5AQVPHeaLjO3G65cw6wn09ARCknJkNjE
 h+A2rHSypB5oawXShuyGhK0FpRP/lXbcSn5sWbl2T45SaWFrGJMEdjB6xURjE6EpZOaj
 fTjheFaplVjUESQykZIoIcG8BCBDqn5qMm7brxM5nSLmCAPZp5fPuQssSChzGdB8GWLk
 znu0o3t90gwQEIPm/kfpVMRjb0tfnL6UaPQ++cG6wDvWMeB3DU8JgDGnrqRFkyWOEUae
 5ICMBVl54h/3rLffXb1WxYEu7L2BD4m9YdQXnZ47ItLQHqvHMVdIlIVlTw4wln4/N9rO
 LRBQ==
X-Gm-Message-State: AOAM53202xxXN+IDM8jrPkoIXPN2b42jZXyDDtTX2nklYniyCwxTZZpY
 1R80HTZHImsyl6wxyReEK5Cz8ux2WdvxdZkSRReBsw==
X-Google-Smtp-Source: ABdhPJwQ5C4DRvj1ymAf603+F57mgFiVMciAJ090plzAaFwEdUBzVSaBrDuc7huE+BJJKCCwqoFmeoIkETqLLnT9s8s=
X-Received: by 2002:a37:8b01:: with SMTP id n1mr14717295qkd.370.1595665508274; 
 Sat, 25 Jul 2020 01:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200724074705.6376-1-bage@linutronix.de>
In-Reply-To: <20200724074705.6376-1-bage@linutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 25 Jul 2020 10:24:57 +0200
Message-ID: <CAFLxGvxwB3Lq6mnTBFyZ4aR+LPS5hwGPCwG+QqLssuT7FRBy_g@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: remove OPENSSL_no_config()
To: bage@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_042511_871037_C397CD63 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 10:00 AM <bage@linutronix.de> wrote:
>
> From: Torben Hohn <torben.hohn@linutronix.de>
>
> Especially for the pkcs11 engine, a configuration is required
> because the provider has to be configured.
>
> Its not clear why OPENSSL_no_config() is called.

My best guess is because on old openssl versions it used to work.

> Remove OPENSSL_no_config() and call OPENSSL_config(NULL)
> instead.

David, can you please check whether this change works with all openssl versions
we want to support?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
