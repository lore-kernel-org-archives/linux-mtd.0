Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4D9C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 08:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7380520C01
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 08:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZqTK/EM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMvry6xC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7380520C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Op21IIjsj8IR0mB7PDvO+MNuCpJkJjgHqpeeDn7VJg8=; b=nZqTK/EMfZhB0c
	hJ5rU/tCf39diljDfPNsMzcsYfdKZxUHo7dw5wJP+95KJgUtyMaJ3FKbzcS93JunGtLUgiSC83LR0
	mt22L6i86nWofiI/x1Xv0K6pMwKW6E6JRCqxDkUPJ6zVmHTIxdoU52nvtyWAqJTJpQ6AyTK+YOcfp
	vtCZnrfNHB7ebw6OPGMft6HJcTf7h8VDAUt85GnxryMvCWEQqZ/QScDtGDZq4yTnLIf6njJnsaneA
	zvpO3k2YKGZEAqaDhtCVpPKAT1MyZQcP7sJbkdWq7plV9MfvVf3GiHZ5wCyT7uQ/ENwKjvWuxK9uV
	HnO/CI9ZXefdrw01BXUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNvAB-0007l4-K0; Tue, 07 May 2019 08:09:23 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNvA8-0007kh-Ls
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 08:09:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id v10so8655529wrt.6
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zzpdqp++8/ryHIBCey8MOyUBPYqxWWhDztnOr1mfpjk=;
 b=kMvry6xC+gDc7mlisZN1DyrhTYU+yn4CcTLATfm73dsabJjbAR5KCfwF3/wYiHQxLO
 7FLefAgzUdZ6Kp1IK+8AIn2KGIRDH+87l5Csqn7Ozc6r2cSGfYcfgSLTrBTObv9V4pgG
 +D0nc+iHRpbhYAnQPAJ+l8Q+LSTsMpyeQQkqk3E/UHluOqtomhfNVDkGV2f8YI1VnQhc
 r4eajyRTEBZL6dz8IVz5QFkTzBVZpqs3cNrnmvWdrA7BXABWAc8hH+sbXHx5ljThk3Do
 TyWLUVaD37iGbvYCIYWti8gLrvzY2kyS2wdtcDG3cyDWYZ8eZtQ6CuTOip0VrsZ+aRlv
 wJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zzpdqp++8/ryHIBCey8MOyUBPYqxWWhDztnOr1mfpjk=;
 b=gp2OwKFLTIVWGKcODxSzbTdU8cP7BOc39/JBDG0ydkhjnWOlpUeqpabr/LDbqV9Bqe
 WjlLNmqE+gdxeA+KMNjVTpqRcZGBOyOj/A/wRIs0c4adoojsw98pYTki642fEtGIj3wE
 cZXqvyeEZkTnDiLUR7OSsgFJEa/tpMCVS7hcETMjcIIdx9909H6D1FemkKY8TkJaL1YU
 gNFolUIT/mIfCSrZD93Ln7rL3d/grlNXE0iXgUe0VP5EC3fOjnM6453jBaLjlKuN+5T+
 JYWPt83a0PQ7yhe0uLVXqUECZ28hBkaVgd0t2YbhTs+Rc4B08BEId4WazVZBe585yEFT
 Reiw==
X-Gm-Message-State: APjAAAW4yZKqcOs9YNykru/bxt1GhuASRZG1drh4IF2Lpn1LRYg8i6CV
 IUp9gWoiuFr1zZowCFxMCx9dgCpepCIsQFvY2Xs=
X-Google-Smtp-Source: APXvYqwoID+Da4kuLNbyIz0/+Fz3bLOhjZwkllfDCSzHohgHABWgrd4A4QX+dgXLsVkmqUZKESJTE/WdiDFcuw0Vhoo=
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr2083601wrt.291.1557216558378; 
 Tue, 07 May 2019 01:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190430142823.28044-1-xoxyuxu@gmail.com>
 <CAFLxGvzMU02By_GUAKwdXUY6Wa33G2FBxwTxg2QQ=1qrf39TOw@mail.gmail.com>
 <CAEGFndB13wDq6ajdUqJo=ne4XjKMif9oJ1NqJ1wSeVtLm3DKeQ@mail.gmail.com>
In-Reply-To: <CAEGFndB13wDq6ajdUqJo=ne4XjKMif9oJ1NqJ1wSeVtLm3DKeQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 7 May 2019 10:09:06 +0200
Message-ID: <CAFLxGvw_e-b9qZe1snuA-RyXadtcg5EM5=bzVeH_UngvSFKKTw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: wbuf->offs must be aligned to max_write_size
To: =?UTF-8?B?44GJ44KF44GF?= <xoxyuxu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_010920_739221_5FED97B7 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgNiwgMjAxOSBhdCAxMDo1NCBBTSDjgYnjgoXjgYUgPHhveHl1eHVAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFRoYW5rcyBmb3IgeW91ciByZXBseSEKPgo+IEkgYW0gc29ycnkgZm9y
IHRoZSBwYXRjaCB0aGF0IGlzIGhhcmQgdG8gdW5kZXJzdGFuZC4KPiBUaGlzIGlzIG15IGZpcnN0
IHBhdGNoIHBvc3QuIEkgd2lsbCBkbyBteSBiZXN0IHRvIGNvbnZleSBteSBpbnRlbnRpb25zLgoK
VGhhbmtzLCBub3cgSSB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtLiA6LSkKSSdtIGN1cnJlbnRseSBj
aGVja2luZyB3aGV0aGVyIHRoZXJlIGFyZSBtb3JlIHN1Y2ggY2FzZXMgd2UgbmVlZCB0byBmaXgu
CgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
