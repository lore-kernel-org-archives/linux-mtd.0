Return-Path: <SRS0=O0jx=BR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43327C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 19:31:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D8C204EC
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 19:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sARysBGv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVpVzgVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D8C204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Bs7EFYuXqQMfShpCcSOsykFgLOWkZza83w1vx6Jw2k=; b=sARysBGvSmQOGcMMQ010GfH0a
	CxzhJ6yLDpqNLgdSlk7EJ7fsSiCy6WjrxVJ3ssqcB7eEP5UGtnx+Uwl+dU1NX4ZbtiCW1MrEDcLR+
	OtvpBsSpx2U2LTgIiCat24Mx1oNrsq+2MEMR4QgOW89Uj87Qgf65xlNx8GydAOXTLj2CaMDApTpR6
	nUR8gFrFhWGJlNNI1052DeIynKLwptbhRcLE2G7S3DAbda785UNrevPzybZMeuSwadl6hJoIAilrp
	ycH51aAt5AuUJ/2WKmXJEE5buDZtMQEOhoA/CcG4UEof+TkhQNDkHraxS0uUZzlHjEW9AzwScmj52
	3bTGONOYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k483z-0004Ml-4K; Fri, 07 Aug 2020 19:29:59 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k483x-0004MK-Ph
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2020 19:29:58 +0000
Received: by mail-qt1-x830.google.com with SMTP id d27so2145616qtg.4
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2020 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DwHxa/wKxXJOTRK09zqSMYHbouDi1S4p4xtTraM5iGA=;
 b=YVpVzgVMyxrAA91SMgwq1uRERiYL9d2sigFhiHcc+Gb3HYQOXIe5VdR2+iTSNd3b/u
 8ASMZA8CikFbtPxyCvOQ0Q+/AGlV6EejSTXxHP/rb2zixr7q/nX3ZHgUOcsfo7J8przL
 L9BcRALgg3XDwa7kDV4mx2hYEqOgDymwxsfeKx//YyrR0Urdf1PzBTsthBdBanS/8Eqb
 bdup239rJK1C1usdexrexFv0mi9S2/y5Z7mVnA+7QHANdB7L0f6vffQzhdMhVTi8Utm/
 1ncX4gfpbz82zJ9qFBT/qwBdO7oxwEn8TfHC2XTMceUdXvaIl9yFeFTNZbzq3lC2YxZi
 dxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DwHxa/wKxXJOTRK09zqSMYHbouDi1S4p4xtTraM5iGA=;
 b=SEoBHpDzsDQZF1cYouzNf2W3cEBDRW3k4XrZXIpmQCy/yJffF9TOihmVKTDVreTqBY
 wYPwLPP69o1q7zTjRCSbJTLpR0Frl68XsZyrlJdEiWFZ3AnkV+v70c/piAoIac9FCYix
 hwbeK8jUCZ11fRs6WKw7cLGeBTbZSAJ2rOwBzHX6FC89n4XSKTJ7L5d9J+yVo7hrsVOm
 bdb2a8mw5vSFzJiheagt2OWYTLZTd7XeId8Ci5LjSiTJdY6DvG6IJ161dLmS8I+hqSC+
 QrYT4N+YVfqdG/E4HLX+moY5caKwLoFtb/hLQ9YKx1eO/flnD5HeW0QZGM9/jGA5c3+A
 ywPA==
X-Gm-Message-State: AOAM531WGrt6sKIrDLN06NmPsb1UnG3uV/Do0rFz0BiXPqF4lUX9CIDA
 6xxie92bs15if+nJSabHF8LwPWrf7bHkE0nC8F8=
X-Google-Smtp-Source: ABdhPJwVK8YxEVoCQuHZTJcCjYxNh0sSOhQEyT93e5WefGbitF2zu2ak5N7ORZ0X16QJ8/Swbk2HySVmZPk/OP9u4WY=
X-Received: by 2002:ac8:67da:: with SMTP id r26mr15451206qtp.332.1596828594651; 
 Fri, 07 Aug 2020 12:29:54 -0700 (PDT)
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
In-Reply-To: <5f7ae548-350b-cedf-3c8e-25fea06a8377@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 7 Aug 2020 21:29:43 +0200
Message-ID: <CAFLxGvy-RRksDvPcB6z8GQUoMFZ_NRGxk9aM2FuTZ22UWU6Knw@mail.gmail.com>
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_152957_848393_B5B8332E 
X-CRM114-Status: GOOD (  14.14  )
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

T24gRnJpLCBBdWcgNywgMjAyMCBhdCA0OjE4IEFNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+IHdyb3RlOgo+IFRoYXQncyB3aGVyZSB3ZSBob2xkIGRpZmZlcmVudCB2aWV3
cy4gSSBoYXZlIDMgdmlld3BvaW50c++8iFlvdSBjYW4gcG9pbnQKPiBvdXQgd2hpY2ggb25lIHlv
dSBkaXNhZ3JlZS7vvIk6Cj4KPiAxLiBJZiBrdGhyZWFkX3N0b3AoKSBoYXBwZW5zIGF0IGxpbmUg
MTIsIHViaSB0aHJlYWQgaXMgKm1hcmtlZCogd2l0aAo+IHN0b3AgZmxhZywgaXQgd2lsbCBzdG9w
IGF0IGt0aHJlYWRfc2hvdWxkX3N0b3AoKSBhcyBsb25nIGFzIGl0IGNhbiByZWFjaAo+IHRoZSBu
ZXh0IGl0ZXJhdGlvbi4KPgo+IDIuIElmIHRhc2sgQSBpcyBvbiBydW5xdWV1ZSBhbmQgaXRzIHN0
YXRlIGlzIFRBU0tfUlVOTklORywgdGFzayBBIHdpbGwKPiBiZSBzY2hlZHVsZWQgdG8gZXhlY3V0
ZS4KPgo+IDMuIElmIGt0aHJlYWRfc3RvcCgpIGhhcHBlbnMgYXQgbGluZSAxMiwgYWZ0ZXIgcHJv
Z3JhbSBjb3VudGVyIGdvaW5nIHRvCj4gbGluZSAxNCwgdWJpIHRoZWFkIGlzIG9uIHJ1bnF1ZXVl
IGFuZCBpdHMgc3RhdGUgaXMgVEFTS19SVU5OSU5HLiBJIGhhdmUKPiBleHBsYWluZWQgdGhpcyBp
biBzaXR1YXRpb24gMSBpbiBsYXN0IHNlc3Npb24uCj4KPgo+IEkgbWVhbiB1YmkgdGhyZWFkIGlz
IG9uIHJ1bnF1ZXVlIHdpdGggVEFTS19SVU5OSU5HIHN0YXRlICYgc3RvcCBmbGFnCj4gYWZ0ZXIg
dGhlIHByb2Nlc3MgeW91IGRlc2NyaWJlZC4KPgo+IExpbmUgMTIgICBrdGhyZWFkX3N0b3AoKQo+
Cj4gICAgICAgICAgICAgICAgICAgc2V0X2JpdChtYXJrIHN0b3AgZmxhZykgJiYgd2FrZV91cF9w
cm9jZXNzKGVucXVldWUgJiYKPiBzZXQgVEFTS19SVU5OSU5HICkgICAgPT4gVEFTS19SVU5OSU5H
ICYgc3RvcCBmbGFnICYgb24gcnVucXVldWUKPgo+IExpbmUgMTMgIHNjaGVkdWxlKCkKPgo+ICAg
ICAgICAgICAgICAgICAgIERvIG5vdGhpbmcgYnV0IHBpY2sgbmV4dCB0YXNrIHRvIGV4ZWN1dGUK
CllvdSBhcmUgcGVyZmVjdGx5IHJpZ2h0ISBJIGZhaWxlZCB0byBjb25jZW50cmF0ZSBvbiB0aGUg
c3RhdGUgY2hhbmdlcy4KTm93IGFsbCBtYWtlcyBzZW5zZSwgYWxzbyB5b3VyIGNvbW1lbnQgYmVm
b3JlIHRoZSBpZiBzdGF0ZW1lbnQuClNvIEkgZG9uJ3Qga25vdyBob3cgdG8gbWFrZSB0aGlzIG1v
cmUgY2xlYXIgaW4gdGhlIGNvZGUuCk1heWJlIGl0J3MganVzdCBtZSBiZWluZyBkZW5zZSBhbmQg
aW4gbmVlZCBmb3IgYSB2YWNhdGlvbi4gOy0pCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
