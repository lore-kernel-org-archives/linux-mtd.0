Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C09C43463
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 10:41:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1E320684
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 10:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sHLdJM6v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M60B9UnS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F1E320684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q0yh/O+DsLbIIZOz+0se7qPMLK5mVhP+qRY1hlkspiI=; b=sHLdJM6vZPhqP3apPH7B39qtb
	TbJ1GWJn8lHKGFLHJ8HQXPm9YSCp9Y4gjy7QduvIGwSCr5P6Msg0sVGTuxEPsi/AIwYUuilihUjTe
	cYbB3WwipRnjNpyG+4SUbBSOFhbrb5afr4TfKEqlbsuIG9YyrtNPY2XnRm9K1RFyRUKupfQb8290k
	e4NkBiD0Z8NdLTQSgTryu2ZuiMdGU1uMB14RQQis/e0Wg8/sFy/mPamJ83mG9Kt/yeOGh23EwRVLk
	P0sz53qASg/VLLqKxdrxRZpM+ARCQShkwTsvhJkhbOv3qbnlPhHgJnA3Gdhy6wjkD7sHBpldvDCQR
	QRXV7dxcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJFT-00059x-Ju; Mon, 21 Sep 2020 10:40:43 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJFR-00059c-Qa
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 10:40:42 +0000
Received: by mail-ua1-x943.google.com with SMTP id w23so4141558uam.9
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2020 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RbZ0xHSk6i1h6fcwtmCKRJZvsUgQuosTWmAcYFZAQPM=;
 b=M60B9UnS2ILS1L93iOM87/Vzyqg2iDzGKk9DD4PiF1AemYHzbd/9OJhhXMbPaKxLh/
 t557a5fPnYCB5lMuDVvgeLKxWqjd7DY+VxjY7cLWvNloiC74B9cQ69uWGUVSfvTZlEGI
 qkacaWpgcjgn7v1d/T7hhlJCiC+2Q6nsm9dWwhk5Ol21ykd4gusp6SCgLVEjCkMVLe5A
 M1T9y98fJLYMEskniNebPtGz2mHXtZ2DPMT9oUG/JXvFASziqddYf9t4NH+aQITBFvwL
 ZYC8Qu6xFR4tITNAMXMkIaBce1d8obDsphRXDl+GnE/D7TMzSSKWtySEWEClN1p8jvX5
 8ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RbZ0xHSk6i1h6fcwtmCKRJZvsUgQuosTWmAcYFZAQPM=;
 b=oPSwIT1CjOl/xDw9WvQ7+9IZv+RlN2WRmwUMer25dtVc8dxEbMQw1G9vC+PHMjI8+8
 e5ZcBBthNXmbdRrop4L370iw7vNdllCxy99hkYtlvQB0XNxpjnweiCl1D1UUi/jEblwv
 X++HbfE637VgIMdVO8cstmX96Z3Jz8ZIfgAZBkEkBdShLDIzd1LacMs23s4FW3o6gnGJ
 9S3Uk1H6GJ0kH8XrGnaiPInxf0YJQE3OaeXpKqcLTmVTb0n/xtPfhpGWoraLTPjnDlNO
 WubHYPBHonDjrLcdgUe33ZgZWT5rz5gDpAjcqUMKIdmeLxgVGYxDu/Usi65JdtusNn+G
 kPtQ==
X-Gm-Message-State: AOAM530uvOFkY6NvGkcAafxSAiuxezpYmYDvfBNZJKKinQETogkUX27U
 GcaA2gcOVamxT9W6pLnUWirqIKcFVsF9D8O6HvUFnu9Kfpc=
X-Google-Smtp-Source: ABdhPJzo3yZcUyFNyEg3+PwlhwZ+igUIKpSccZIEH5FVM2vsq+FhhmMsXL83LE479mF+bqTmCyst2jqZ3GcLxFcLps4=
X-Received: by 2002:ab0:627:: with SMTP id f36mr22697836uaf.76.1600684839862; 
 Mon, 21 Sep 2020 03:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
 <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
 <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
 <CADBnMvhcowEVqUYwg3vVK-F-=N+mRNQAsaihXuUorW-iWnWcxg@mail.gmail.com>
 <1929983185.113286.1600681896280.JavaMail.zimbra@nod.at>
In-Reply-To: <1929983185.113286.1600681896280.JavaMail.zimbra@nod.at>
From: Kristof Havasi <havasiefr@gmail.com>
Date: Mon, 21 Sep 2020 12:41:07 +0200
Message-ID: <CADBnMvhKxZSjyzhYxu3FUjZ0KtSDUdfiyEWBnNYP8ireCpkX8Q@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_064041_885986_90F371F2 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMSBTZXAgMjAyMCBhdCAxMTo1MSwgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPj4g
PiBEb2VzIHRoZSBwcm9ibGVtIGFsc28gdHJpZ2dlciB3aXRoIGVuY3J5cHRpb24gZGlzYWJsZWQ/
IFNvIGp1c3Qgd2l0aAo+ID4+ID4gYXV0aGVudGljYXRpb24/Cj4gPiBJIGNvdWxkbid0IHRyaWdn
ZXIgdGhlIHNhbWUgZXJyb3Igd2l0aCBlbmNyeXB0aW9uIGRpc2FibGVkIGFuZCBhdXRoZW50aWNh
dGlvbgo+ID4gZW5hYmxlZC4gRXZlbiBpZiBJIGVuYWJsZWQgYWxsIHRoZSBjaGtfKiBrbm9icyB1
bmRlciBrZXJuZWwvZGVidWcvdWJpZnMvLCBubwo+ID4gZmFpbGVkIGFzc2VydGlvbiBvciBlcnJv
ci93YXJuaW5nIGxvZyBjb3VsZCBiZSBvYnNlcnZlZC4KPgo+IFNvLCB3aXRoIGVpdGhlciBlbmNy
eXB0aW9uIG9yIGF1dGhlbnRpY2F0aW9uIGVuYWJsZWQgZXZlcnl0aGluZyBpcyBmaW5lCj4gYnV0
IHdoZW4gYm90aCBhcmUgZW5hYmxlZCB5b3UgaGl0IHRoZSBwcm9ibGVtPwo+IEludGVyZXN0aW5n
LgoKVGhhdCBpcyBleGFjdGx5IHdoYXQgSSBjYW4gb2JzZXJ2ZS4KCj4KPiA+PiBEb2VzIGl0IHBy
aW50IGJpZyBMUFQgb3Igc21hbGwgTFBUIG1vZGVsPwo+ID4KPiA+IHNtYWxsIExQVCBtb2RlbC4K
Pgo+IEknbGwgdHJ5IHRvIHJlcHJvZHVjZSBub3cgb24gYSBzaW1pbGFyIHNpemVkIE5BTkQuIDot
KQoKSSBtZW50aW9uZWQgdGhhdCBJIHVzZSB0aGUgYnVpbGRyb290J3MgbWtmcy51YmlmcyB3aXRo
IGN1c3RvbWl6YXRpb24sCmJ1dCBoZXJlIGFyZSB0aGUgcGFyYW1ldGVyczoKKENvbmZpZ3VyZWQg
dmlhIEtjb25maWcpCgotLW1heC1sZWItY250PTM5NjgKLS1taW4taW8tc2l6ZT0weDEwMDAKLS1s
ZWItc2l6ZT0weDNFMDAwCi0ta2V5IC9wYXRoL3RvL2tleQotLWtleS1kZXNjcmlwdG9yIGRlYWQx
MjM0NTY3OGJlZWYKLS1jaXBoZXIgQUVTLTI1Ni1YVFMKLS1oYXNoLWFsZ28gc2hhMjU2Ci0tYXV0
aC1rZXk9InBrY3MxMTp0b2tlbj0uLi4iCgpUaGUgZmxhc2ggaXMgYSBNaWNyb24gTVQyOUY4RzA4
QUJBQ0FXUC1JVDpDIHdoaWNoIGhhcyAyMjQgYnl0ZXMgT09CLAp3aGljaCBpcyBub3QKaW5jbHVk
ZWQgaW4gdGhlIC0tbWluLWlvLXNpemUuIFRoYXQgaXMgb2ssIGlzbid0PwoKVGhhbmsgeW91LAog
ICAgICAgIEtyaXN0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
