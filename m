Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9792C388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 12:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B787205CA
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 12:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VurlhKzV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESTkXrF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B787205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=stL4k/PhUEWu27NP+F0SSK51odFQI6PmG0w+SXz4gfQ=; b=VurlhKzVf10MmUNso7iZKDqmQ
	XHTUJoc/EPKwqiNNipFQnE6Wn1qf15+10CCBqyQLNG7PnIuooHiuAJhmlExZYKBq+XvVuLErmpJAM
	LxARH2w4gHzsM7BKyHbemgnSSD2m0B9cdIma6ZwIDHEXmetyRX2W+mwKQfCGVSYvh/V0l+7YMOXKD
	71HOdGJwCi7SVhiRiyLB3evP5YA1daM/rUmW0V+HgRZ88olhq9c61ac5Zc3TncXj1Vs+XSwhDZ8Gs
	+h5nVn9wJmO1oyQ3IufQhJNCEq+BwWXyqyEZb4iaJwu5wr/bXXGqxn9I7oGNYmazD5k6qYzDlcY7V
	Zyi53xpyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcSdh-00045M-Tf; Tue, 10 Nov 2020 12:20:45 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcSdf-00044g-H6
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 12:20:44 +0000
Received: by mail-lf1-x144.google.com with SMTP id u18so17173457lfd.9
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2020 04:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXqdvWPk22A/buJ8FZL1rHnc00Mo1Maen7NeXoe/6c0=;
 b=ESTkXrF1nLGUZeYDPVCe9fAw1KtFeg0O0hav/jYy3HLPpCiP/Neh8/S+pOTzTEMoSJ
 /zuX4puANoLu2yQ+E0tZQC6d/W0ryaVFlmnYzJp2iQhx5RsnrOUKwLI3arw3VFSB70Ew
 TTy0UYSQVx5eT3BU4T1fSwuJcZJW6jO7MB4ofNCannxjfvaTUE3dyOllMjyB9vYgTTQS
 d/4+lx3mnTDGQUTi8b4WalaM/akBHMXdS1nDJSC0kVpEsciGhUM+3c6orO896kBzGZw1
 fOOjCQtPblXoP2oIkcuI+7yE/002HhAfk+yBpPII30ibVgh/+hQClJIjTCgyreRFEmJ3
 SRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXqdvWPk22A/buJ8FZL1rHnc00Mo1Maen7NeXoe/6c0=;
 b=uN2mrKDCH04YAlyOZlqn4TdtO7U1tj+VC9zv+l1bfLEdXSte2CSquT85KuUTFXpiJE
 TZb7m/go6u3yTCqYPb7JaDaiADC6p5R4wMgxA/FO1KqsG5dolIKwvJNdRiTFPwJuQDyZ
 baJEzAb04RqzBEZ66oqsfS0xgJZyL6SE8VPel4IOjVwkmmWR7ag8eo13xUbaDn2GyTMW
 1+deExObGPXjM3/H1j3x0KTYuxRPLmuSA4ndcGF77jKhsuI5wIANjaVsOcZfDz2iieI7
 wJEYGLGwA/Xb1UI35TjtD7n+znzYoSGK4L266TA8BepVF8Ohau9eKNxPo68EyW+LM/ff
 +JWw==
X-Gm-Message-State: AOAM533y8BPDP+BEG1E37bm8rZf8aR1xi6rvL/JEwHpzFDTnfdgS95DF
 A4CJLXGJs7g6mF8CS4zE7QGMEUQzgWrhk+oG3zU=
X-Google-Smtp-Source: ABdhPJzC5FkU28+IvEAlT3TxMOBpf8TuuqoH8VZrInhgyHxgdV8rntWEeCN2+royMX8imA6nKv5q1e+QkYdkO9v2bas=
X-Received: by 2002:a05:6512:4c5:: with SMTP id
 w5mr2294758lfq.215.1605010841791; 
 Tue, 10 Nov 2020 04:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20201110002807.7072-1-festevam@gmail.com>
 <20201110080052.GN29830@pengutronix.de>
In-Reply-To: <20201110080052.GN29830@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2020 09:20:30 -0300
Message-ID: <CAOMZO5ArMtTu9OzRf8FMniU_iXkDJgv_CkivoG8jbZb50=GHHA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Remove platform data support
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_072043_635542_F483E2C6 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sascha,

On Tue, Nov 10, 2020 at 5:00 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> mxcnd_probe_dt() can still return values > 0 in which case you should
> return an error from probe. I think this code path should be cleaned up
> a bit. Maybe you can inline mxcnd_probe_dt() here.

Thanks for your review. I have addressed your comments and sent a v2.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
