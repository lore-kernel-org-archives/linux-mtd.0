Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35BEC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 17:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01C12080F
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 17:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dVVJ8MlI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8CBKKgt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01C12080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lb/GL8PIAPx4isMgLLagGx9lpwxD+TWG3alorCTt6c8=; b=dVVJ8MlIKitIE+
	kPeUB8NMKq2CbpUu9D10RnlCH/U7QFMT8VyZ0yMm+aJ26+SFZuPkfbOGXusyqZ4+fPCSAGMG+HGrl
	iUeKe3sJqYw5uK2eGx4TbK/zevWA+quPSPwNFdn4V34D43xWN/PLpgn24gagwslPwNIQNnihAevKr
	cpD08j0gRM7c3qlkKgFrgnlrJfzLlvqlCqnsBdnROazK5GLmi55h+NoGw3WG0Nu8FTInoF8ofQGQu
	BxXEhgT2d6j/R167plIV47ogTZmEdmP4aJVKwpWR9ox4la8ZjV1o/7J+3pd4KtTv0rgObkKOnaOR6
	8jLJwvyvtW9EIZ2aBznQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icCDf-0002j3-2w; Tue, 03 Dec 2019 17:44:15 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icCDb-0002iV-Kx
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 17:44:13 +0000
Received: by mail-lj1-x232.google.com with SMTP id d20so4757194ljc.12
 for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2019 09:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bTPuJyf1AI42v5NJqygIAsVd2htehI6aaL44TevGESw=;
 b=A8CBKKgtAW0onig3Jdeecv5b9wSlQXQMY5YX3KlAwT2A3/jmwGVBzeZGAcizc0dgDh
 2vI4WUbesdNMhordO6eJlrksl1VC6s9z6Y1AFyXmK5P34U/DqAWsAWi7rm1gvVQHCQbs
 Qkd152TxGtPVvOkJucZrMxDOQa75RP4E6P6Oym/RctAH1NAQhJV9S9GWmCGmhaBt79bc
 7Ec8I1VZXFRPEdMv6BN6PfEwRxHjsSkSBJLy0qAMUbYAsuIppyCQXHQ2oslX+mbV9HFd
 6QfMuZb/ZkKK/Y1xJGBvzWBAf+nvIR1dppT2t4sh0fc/ylJ+6FNcsGJcSBYg6uDNtdv7
 KnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bTPuJyf1AI42v5NJqygIAsVd2htehI6aaL44TevGESw=;
 b=BWrDEtoHBR4g52sysaFz5SJjO57trEZu8iXkuDp6AVniLr7jBSpkd57l2iRuY3/Grq
 nWeg8d3WoCQurcsX7VVsCrLT+yY+KA32MBbe/Zg76FIYf320W17abI60S3FfLK5cLt9P
 CkMhL45DYxi4SfhvmVJ2IppBxrYglPNnS8aH2SEv7yaeAWGaogVh54fiH6JhnFI+ughu
 vWR+47qZ8MAGIkyBBPAHcBzvBPI8IT2EMK0FbK7Qk3F/DDvNSce3KEFgMWkR9ySzR22j
 oVKLJKdI262xpVWRtg6uc3Mmxkf0X0UbU7Et8PUwxAVl5VvFbXVHV1ZJvJoB+hYqh51q
 mZ+g==
X-Gm-Message-State: APjAAAVbolSS2fkBwlsk+l+lhAnVyKRo5/fBpS9Vqu/Kn0ivQTjGRvcJ
 ODV0QjF7hAbKElkMu8UISTpha4SWEG9OhNx9nX8=
X-Google-Smtp-Source: APXvYqxOAqaLCcVwOiRTnNOmf83y0u64gvAtBn4eDBR9Qocapf84AC+NhroxFJE6F6hRHDaVc7W5ujSQoDxPq6IDfc4=
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr3150197ljc.246.1575395049170; 
 Tue, 03 Dec 2019 09:44:09 -0800 (PST)
MIME-Version: 1.0
References: <CAOfSrV1CNn6EpPkAkP8F2VQUrit_B-t89sSxW=08zyKVOdt9AA@mail.gmail.com>
 <CAFLxGvziLKNA0gcPo+EGwfpuv6Fe6=sNOfhEa1DR7sN0oOxzMg@mail.gmail.com>
 <CAOfSrV0ZuG5qz0aW1bU30iZ2RX2vi4Y5aYF128XjkRUd1h+EhA@mail.gmail.com>
 <1237458020.97684.1574720847193.JavaMail.zimbra@nod.at>
 <CAOfSrV2QTRbg+pD2TfRbCFfjcjR3UT6BGVSV_Nkg4YxJL6r2RA@mail.gmail.com>
 <698719689.98401.1574800007975.JavaMail.zimbra@nod.at>
In-Reply-To: <698719689.98401.1574800007975.JavaMail.zimbra@nod.at>
From: Otto Blom <oblom586@gmail.com>
Date: Tue, 3 Dec 2019 09:43:58 -0800
Message-ID: <CAOfSrV0JCHWa+6gzXNQQ4ZWtYjUdSwMQS_+xVAphfB3u=Pvu2A@mail.gmail.com>
Subject: Re: mtd-utils io_paral test fails on NAND
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_094411_710371_4F331C42 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCAhCgpJIHVwZGF0ZWQgdG8gUGV0YWxpbnV4IDIwMTkuMiBhbmQgd2hpbGUgaXQg
c3RpbGwgZmFpbHMgaXQgbm93IGZhaWxzIGluCmEgZGlmZmVyZW50IG1hbm5lci4gUHJldmlvdXNs
eSBvbmx5IHRoZSByZWFkcyBmYWlsZWQgYW5kIGl0IHdhcyBhIGZ1bGwKcGFnZSBtaXNzaW5nLiBO
b3cgdGhlIHdyaXRlcyBmYWlscyBhbmQgaXRzIG5vIGxvbmdlciBmdWxsIHBhZ2VzLiA2NApieXRl
cyBhdCB0aGUgc3RhcnQgb2YgdGhlIHBhZ2UgaGFzIHNlZW1pbmdseSByYW5kb20gZGF0YSwgdGhl
biBjb3JyZWN0CmRhdGEgZm9yIDk2MCBieXRlcywgdGhlbiBhbm90aGVyIDEyOGJ5dGVzIG9mIHJh
bmRvbSBkYXRhIGZvbGxvd2VkIGJ5CmNvcnJlY3QgZGF0YS4gU28gdGhpcyBmZWVscyBtb3JlIGxp
a2Ugc29tZSBraW5kIG9mIERNQSBwcm9ibGVtLiBJJ2xsCmNvbnRhY3QgWGlsaW54IHRvIHNlZSB3
aGF0IHRoZXkgc2F5CgpUaGFua3MgZm9yIHlvdXIgaGVscCAhCgovT3R0bwoKT24gVHVlLCBOb3Yg
MjYsIDIwMTkgYXQgMTI6MjYgUE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4g
d3JvdGU6Cj4KPiBPdHRvLAo+Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4g
Vm9uOiAiT3R0byBCbG9tIiA8b2Jsb201ODZAZ21haWwuY29tPgo+ID4gQW46ICJyaWNoYXJkIiA8
cmljaGFyZEBub2QuYXQ+Cj4gPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZy
YWRlYWQub3JnPgo+ID4gR2VzZW5kZXQ6IERpZW5zdGFnLCAyNi4gTm92ZW1iZXIgMjAxOSAxODox
MTowOQo+ID4gQmV0cmVmZjogUmU6IG10ZC11dGlscyBpb19wYXJhbCB0ZXN0IGZhaWxzIG9uIE5B
TkQKPgo+ID4gSGkgUmljaGFyZCAhCj4gPgo+ID4gbmFuZHBhZ2V0ZXN0IHJhbiBmb3IgMTJoKyB3
L28gZmFpbGluZywgc28gaXQgbG9va3MgbGlrZSBhIGRyaXZlcgo+ID4gcHJvYmxlbSBsaWtlIHlv
dSBzdWdnZXN0ZWQuCj4gPgo+ID4gQWxsIHRoZSB0aW1lcyBJJ3ZlIHNlZW4gaWYgZmFpbCAoYXJv
dW5kIDEwKSB0aGUgZmFpbGVkIHBhZ2UgY2FtZSBiYWNrCj4gPiB3aXRoIGFsbCB6ZXJvcy4uIFdo
aWNoIGlzIGEgYml0IHN0cmFuZ2UgYXMgSSB3b3VsZCB0aGluayAicmFuZG9tIiAvCj4gPiBkdXBs
aWNhdGVkIHBhZ2Ugd291bGQgYmUgbW9yZSBsaWtlbHkuIE1heWJlIHRoZSBwYWdlIHJlYWQgZmFp
bHMKPiA+IHNpbGVudGx5IGFuZCB0aGUgY29udHJvbGxlciByZXR1cm5zIGFsbCB6ZXJvcwo+Cj4g
SWYgSSB3YXMgaW4geW91ciBzaXR1YXRpb24gSSdkIHRyeSB0byBmaWd1cmUgd2hlcmUgdGhlIDB4
MDAgYnl0ZXMgY29tZSBmcm9tLgo+IERvZXMgdGhlIGRyaXZlciB3cml0ZSB6ZXJvcz8gTWF5YmUg
dGhlIHBhZ2UgaXMgemVybyBpbml0aWFsaXplZCBhbmQgdGhlIGNvbnRyb2xsZXIKPiBjb21wbGV0
ZWx5IGZhaWxzIHRvIHRyYW5zZmVyIGRhdGEgYW5kIGRvZXMgbm90IHNpZ25hbCBpdD8KPgo+IFNp
bmNlIG5hbmRwYWdldGVzdCB3b3JrcywgYnV0IFVCSSBub3QgaXQgcG9pbnRzIGludG8gdGhlIGRp
cmVjdGlvbiBvZiBETUEuCj4gT24gdGhlIG90aGVyIGhhbmQsIFVCSSB1c2VzIG9mZnNldHMuIE1h
eWJlIHRoaXMgaXMgYnJva2VuIGluIHRoZSBkcml2ZXIuLi4KPgo+IEkgaGFkIG1vcmUgdGhhbiBv
bmNlIHRoZSBjYXNlIHdoZXJlIGEgZHJpdmVyIHdvcmtlZCBsaWtlIGNoYXJtIGlmIHlvdSBhc2tl
ZAo+IGl0IGZvciBhIHNpbmdsZSBwYWdlIG9yIGEgd2hvbGUgYmxvY2sgYnV0IGZhaWxlZCBpZiB5
b3UgYXNrZWQgZm9yIE4gcGFnZXMKPiBhdCBhIGdpdmVuIG9mZnNldC4KPgo+IFRoYW5rcywKPiAv
L3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
