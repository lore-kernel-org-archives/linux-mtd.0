Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9C8C433E2
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 18:49:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC748221E5
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 18:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6bSlCui";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDAIpXCM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC748221E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hdJZEFehUjvynXktZYcyPZce4+EZ1Rg1Xycpsw1E55s=; b=T6bSlCuiegMh9euD5Y0hN6pVj
	n4CTRfn1x0pfaLlUPeG+yWfAnJMN17rTCntGr6LW9G3e0ERiD0/zias71mCNmJw3jJ6dh4ePguTmN
	DP5+3RVbfMUNNr8gLxZj+2OuUZ54/Golii+10Ilym9C3pxDCynjYMyxhlg+1dVJ0T+q9K6JKuS217
	IL32jKXpwa7GxJsrAFNGwiruC7IWOK7tVYC5AMN6LYSZHZ+hyntNN17QnMIcIbJ5L4GcPJE/PuYau
	9tPQ7NSkQsxZQ3hbZYN4Q13j25OgLWlG/eS/4rrqi/xwpwro4Ic1pR5SQ9QFiA741HCIlXG/13An8
	6TnW6qSrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHX3R-00032B-K1; Sun, 13 Sep 2020 18:48:49 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHX3P-00031m-9C
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 18:48:47 +0000
Received: by mail-qt1-x842.google.com with SMTP id c18so11901601qtw.5
 for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2020 11:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bnrnz0wLHPS+ADEtoROH+0raPS2mbY3JQqic/8V4qFo=;
 b=HDAIpXCMHOFDC/TpLEJiFG4ZzYm5vEKTKfZaloG6KNfmGivbxDD8VDVgfVWEdD3Hjy
 sZZlREk0j2MyhC9csJj6NwTs/RuREkjExKMcMqZfcGrE7RGz9DdpIvWJkygUOnU4wSVP
 Yj2KpfQZZlMTpl+J6uFPoSuFeF01RVsToRDkBqAeoMGURddwAGweepoM7LwH1fNp0A/6
 Q2UWsov5E6hcUP8nqkfOFmUTeSo9UWjPBs+nIKMk8YvH7u85UVQ4+J09UJgDE2wyu41P
 HwBe+14vl214W4nYtfInZHSnwgXmief0yXCsHeJKg1XWf0Sh6XpgYVNuUtsIPBpJROJ7
 TKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bnrnz0wLHPS+ADEtoROH+0raPS2mbY3JQqic/8V4qFo=;
 b=Y+0+NIgYZ6yfdCqNmOt5jhT47tTWaFkY3h3zZj3etffegB9o+OtZ6OjqRpvkzokWqM
 uE/f+Nq66SUheBk8xIz6zRdRNEAVgpOYWOZhjpE3gk2f8SG9ouxRC968B4wXR/lne+yM
 U2uzNqhPUCIfCXeZg5cmdochzwy3go/73wlpvXif+mnBJ1JccDeYLSMazAcwe5bohn8j
 R7i7boV7Idb258y7B/NRksi/czaZFK0BfTKTmVY0xIlR7VQx78ZevmDr1CyIn/Svpc1H
 z3P/BNQRgQ7mo4kjkEgWeDKBV4sK6ZjxHPr+bx3L4QAKLXXMgcok1lD/KmwoYQJaCdH0
 rZ5Q==
X-Gm-Message-State: AOAM530fmyQ7ujzpFoeeVnzvq+7TY7YG9GuOiIe42G61eGWLztqimrWs
 DaO8RQe4lMIZTes7Nrv7a/yz5c9mbm2Tc9et4P0=
X-Google-Smtp-Source: ABdhPJyGVtyaUYumPq8Vt3gwM5wnfDJyWmR9RfgKELlSyeLh3U3wsnMZozD6DFwDRZs7ozO3N4VJ41fA+oM8CO3L/vk=
X-Received: by 2002:ac8:fa4:: with SMTP id b33mr10813208qtk.13.1600022924801; 
 Sun, 13 Sep 2020 11:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
 <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
 <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
 <CAFLxGvycs7DNu5o5QY1WwTPfS6cTTykTh-91n9TQZ7yP_ADr4A@mail.gmail.com>
 <2086f822-e67a-43e4-76d8-5339eaccd3ac@huawei.com>
 <CAFLxGvzwoC1GcjJOfwpc8V5LD79=8XiJaNV2HjOm8EdQcCbp+w@mail.gmail.com>
 <5f7ae548-350b-cedf-3c8e-25fea06a8377@huawei.com>
 <CAFLxGvy-RRksDvPcB6z8GQUoMFZ_NRGxk9aM2FuTZ22UWU6Knw@mail.gmail.com>
 <56435b1e-ffdf-9d4a-5865-f2ce3b36644f@huawei.com>
In-Reply-To: <56435b1e-ffdf-9d4a-5865-f2ce3b36644f@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 13 Sep 2020 20:48:33 +0200
Message-ID: <CAFLxGvxdXOg7aHeHH0t8sZGvsTkY9QeN8RK8iRL7x7ge=MqFSw@mail.gmail.com>
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_144847_349614_CDEB3B27 
X-CRM114-Status: UNSURE (   8.13  )
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
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBBdWcgOCwgMjAyMCBhdCA1OjI2IEFNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+IHdyb3RlOgo+IOWcqCAyMDIwLzgvOCAzOjI5LCBSaWNoYXJkIFdlaW5iZXJn
ZXIg5YaZ6YGTOgo+ID4gT24gRnJpLCBBdWcgNywgMjAyMCBhdCA0OjE4IEFNIFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gPiBNYXliZSBpdCdzIGp1c3Qg
bWUgYmVpbmcgZGVuc2UgYW5kIGluIG5lZWQgZm9yIGEgdmFjYXRpb24uIDstKQoKQXBwbGllZCB0
byBmaXhlcy4gOi0pCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
