Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF24CE835C
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2OQxv5bYL7EUsGW64by+ElI5mPMuyRnSRlTa5NnHIg=; b=abP8beF1x8pgyW
	T/LtIOYB/V0MB0WSDLJtdTUGuM0P/K+sEPY/Yy2hTjzWBEtBM2lJEMpcZrm4akEapHZOQIQ/05/EB
	OajzKmFABS+oI3FXpMJHkgFDoyE26QIJliVXrfloqc1RoN5P0y9pJQ/FcV91RqbL4BykICoE2J+lF
	Et+au2ZcpDUovY7rI3K8a4Rcy1mcm6ahBzyLhIRE9vJ45edSW2QJ+4O6+MVSYhTbuAfL93prMPmiJ
	0gxppqdQwLIo/FgKrukubkaDGZCZPxQuqyiJKopOuB9KWJsNsNzhwc7ZfGfkeCJ7AGsaJqh4L+gpW
	AB+KujnRLuKWchGS/uZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svIX3-000000006HE-1WmK;
	Mon, 30 Sep 2024 15:41:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svIW1-00000000624-3lg6
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 15:40:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20b9b35c7c3so7361665ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1727710848; x=1728315648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk4IT+ziW7GSilMgu7AJgpoE41t4jq/Ls2rSzqW+beE=;
        b=fyhvdB8DRMbw9YO+HQo09xePdwlGpUUcawqsQP1bOkQKwHIlyN9OpH0DQ50I1YojAq
         OtuNmlV/zGuMVP3GwzPlryyv7RAI9GC2G7EEm/C2+AKvpYhMyVtosmnCDxBWOHhF5tat
         zObcpz2RjmcHJR2r97mbNhDK9WpP6D3sg8HRRufi5mavlTVfOQ3DYTiJyiUI/v3QkteO
         qAj4WpS1a8v0p/+RjHAhttI3hNkuL+PX3do32bH06rCOK7ODHuxQVUlY8vn8e4Tvg8o9
         Dl2+PEtTWiDVP7eeDtiwNxXTVtRCFqPpjynqugIDaml5SKG0BoRjhmK4O4rTz9QVm+Uf
         9E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710848; x=1728315648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk4IT+ziW7GSilMgu7AJgpoE41t4jq/Ls2rSzqW+beE=;
        b=L4BWrEreISHCeOKsVv7URroIIBENH03TLaqlEe7FcFhiH2mWc2ZMH5WwR7tgdpzT9S
         riD6W7jmbXjrkovCW2SZ7huVo3qA86RwZtytlSS5lPO1TIhN7zFk3eJaX5IcSLw0/OPZ
         SovG1LfC9MKsiTR02Alb1nA/TcamKgVrCYW9kO+iIxP36k1csDV4xMpIUzIeVGN+yirP
         W2il7pIpW75afEknrh2ICiTSP3eMSXLSK2BsSYDcvynAMJVVEbpjXIJdsqPV3n/2066X
         1mVh29pPO7Kjf0NyNaCmPRCZn+otlfCDZFlmnFy30ekQ8PKIkScagLpzQfo7I3sQSzaE
         65jg==
X-Forwarded-Encrypted: i=1; AJvYcCWzfMKCd7hiTPxrOdpcmJM9dxtH1tRjtvjiEzllEWTxzGtLhyCPHn/h0PxDTOuZoKpi7WR0yqBMKQE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5LX0Y+liKDIHH1gLm/JdKhIDHtkALOlVBog7lgGomRt8u/uw8
	aWTvTSO5AcrOSFhNwCEPesQqi2sLXQrSpgNc9qH2qth7Jf7fxOvSpdvDdhe86OM=
X-Google-Smtp-Source: AGHT+IEBTYKGJiVF/hvLtnqHSF6GUD7YmyDMyv0oyolLcyv9IFVLXr8V4Z3pE6cLuKRIJT4zroumAw==
X-Received: by 2002:a17:902:f54f:b0:20b:5c94:da02 with SMTP id d9443c01a7336-20b5c94de48mr112201815ad.33.1727710848215;
        Mon, 30 Sep 2024 08:40:48 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e6c997sm55788515ad.307.2024.09.30.08.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 08:40:47 -0700 (PDT)
Date: Mon, 30 Sep 2024 08:40:45 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, Jamal Hadi Salim
 <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko
 <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH v3 17/19] netem: Include <linux/prandom.h> in
 sch_netem.c
Message-ID: <20240930084045.7c0e913e@hermes.local>
In-Reply-To: <20240930123702.803617-18-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
	<20240930123702.803617-18-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_084050_178814_25B7BA3C 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 30 Sep 2024 14:33:28 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> Include <linux/prandom.h> header to allow the removal of legacy
> inclusion of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Stephen Hemminger <stephen@networkplumber.org>
> Cc: Jamal Hadi Salim <jhs@mojatatu.com>
> Cc: Cong Wang <xiyou.wangcong@gmail.com>
> Cc: Jiri Pirko <jiri@resnulli.us>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>

Makes sense

Acked-by: Stephen Hemminger <stephen@networkplumber.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
