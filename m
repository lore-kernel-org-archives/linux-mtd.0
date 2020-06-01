Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85253C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 13:55:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C582077D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 13:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MwXIPLKq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPpnXooY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C582077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kytJsTk3YENwSt50jJP+AyphqX0Pc8MTg35IzR7qp5o=; b=MwXIPLKq8jwovm
	U252HyGAUIxIZ96+EIyI/JTd5FNj/w4plxHUpdP602GD+Yi8efoHlsFXfkLGY3Z26zxkHeMR85oYQ
	xI0rtRpOgCB3EeN6EqXgkcXTtaj4YaVj6FF1tQntipxMArjriqZXzBc5YDiPVTkfgl2V+R36t//Dq
	1Jdwt6cOAO5KfHZ91mRDn+lHUNqV0AkJhQYO2UO/BFClpqw5N8DFuWQwoGgoml3q4GnAggjXUE78/
	8BRTvi8FJK7/14OoI2eFH/9MZRhJrX6ssE2Jg966YA3YJ177TAPMOuWqROss5YsL3PxOFVAqcueH6
	C4hZ5B/Fbu/yW2h8a2SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfkuU-0002Er-Uc; Mon, 01 Jun 2020 13:55:26 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfkuR-00026R-Pv
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 13:55:25 +0000
Received: by mail-qk1-x743.google.com with SMTP id f18so9100655qkh.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2020 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MTId0Os/yg4rhbm+EeuQBxt1UqEtEawNrCHYfpmyKkg=;
 b=kPpnXooYOT5d3nyDjaUTERRVJecKZ9IDmbZOQM+PJDrfGewsccmuewYh7EAISztcx/
 zOvbNr05Jr9ns5O7gh+Fmrdt6npj/dKdHjgFu2f1X3Gx7QSHCEI7XDGjsVK6Bk7g+vML
 uoR7TQ3xsf+TU1vXcE9oO7gcRsh+b6/fqxfzjgeszbmBybw0TPP0DUZ3WYypaBtXG+7u
 SyHJO6WW9Esr6mB/xzNfU3qXPqhCp6MR96r6RyhmPezDsAL2r+Fwz0VeKH7aZnP5Ql35
 u3T2gi9WgcT6f/6uF9g+gWMBx9+LPFZsTqmTd4uKSrixbLQpn34N1wJ5z/GK8b9lqAa+
 XrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MTId0Os/yg4rhbm+EeuQBxt1UqEtEawNrCHYfpmyKkg=;
 b=Fj5v0C+A9ZX3DwZnuRb//7oqxWpInbI4uklJ8Xj1DlLPZQ4rKbAjDANW24cdmHQRUh
 d0XDYPweOnkYo7d3BSRseZEVQHZPnIMj7rXjjWJDHTIUAspdjTSI4Uk9n+Dr3FHfRIZc
 yWvYU0Fe72xPPbQxlf8T4H5IOgjuaIcezV2FOW5bfuWrsrcwPQqDeWDHnaMGmxYhKgKF
 ZSfOowQHRIzJ8+arY0bBTVIiuCj3ZRoRNRrngv6HzgZISwwKyyCiw/3lonCQUaOfOVpn
 hNNH9lnDv20Z8DukK63/3yFcPp5do6tljJEtDqt8FZ1WMyKbLKmUmZ6zgKQ1Mo4jNy4F
 YH8w==
X-Gm-Message-State: AOAM5335rCZg0gcWXoxjsugFsZTkmi8t6vrW1VuZ79IE4iXrY9h3RDC2
 U8yL54gq1FqSgJVQPPOWLF+knAE0/WqJeGB3gRM=
X-Google-Smtp-Source: ABdhPJwkz7qkU5U9ZiQYP0Xlzql09Al1JdsPf0KW7zuxSuK/rW69hHCI63snVLovh3Grc3c2FJ9tMHXzDwzFiP2fG7o=
X-Received: by 2002:a37:a847:: with SMTP id r68mr21084003qke.45.1591019722322; 
 Mon, 01 Jun 2020 06:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
 <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
In-Reply-To: <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 1 Jun 2020 15:55:10 +0200
Message-ID: <CAFLxGvxGqes3By2Qg6nouo8Eg-c--=fmvyS6pq1xgMC+JKAmpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ubifs: Fix potential memory leaks while iterating
 entries
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_065523_861805_361F9D8A 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Yi Zhang <yi.zhang@huawei.com>, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMSwgMjAyMCBhdCAzOjQ2IFBNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4g5ZyoIDIwMjAvNi8xIDIwOjAwLCBNYXJrdXMgRWxmcmlu
ZyDlhpnpgZM6Cj4gPj4gRml4IHNvbWUgcG90ZW50aWFsIG1lbW9yeSBsZWFrcyBpbiBlcnJvciBo
YW5kbGluZyBicmFuY2hlcyB3aGlsZQo+ID4+IGl0ZXJhdGluZyB4YXR0ciBlbnRyaWVzLgo+ID4g
U3VjaCBpbmZvcm1hdGlvbiBpcyB1c2VmdWwuCj4gPgo+ID4KPiA+PiBGb3IgZXhhbXBsZSwgZnVu
Y3Rpb24gdWJpZnNfdG5jX3JlbW92ZV9pbm8oKQo+ID4+IGZvcmdldHMgdG8gZnJlZSBweGVudCBp
ZiBpdCBleGlzdHMuIFNpbWlsYXIgcHJvYmxlbXMgYWxzbyBleGlzdCBpbgo+ID4+IHViaWZzX3B1
cmdlX3hhdHRycygpLCB1Ymlmc19hZGRfb3JwaGFuKCkgYW5kIHViaWZzX2pubF93cml0ZV9pbm9k
ZSgpLgo+ID4gQ2FuIGFuIG90aGVyIHdvcmRpbmcgdmFyaWFudCBiZSBhIGJpdCBuaWNlcj8KPiBU
aGFua3MgZm9yIHJlbWluZGluZywgSSB3aWxsIGltcHJvdmUgdGhpcyBkZXNjcmlwdGlvbi4KClRo
ZSBkZXNjcmlwdGlvbiBpcyBmaW5lLiBObyBuZWVkIHRvIHJlc2VuZC4gUGF0Y2ggd2lsbCBiZSBx
dWV1ZWQgYWZ0ZXIKdGhlIG1lcmdlIHdpbmRvdy4KVGhhbmtzIGZvciBmaXhpbmcgdGhlc2UgaXNz
dWVzIQoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
