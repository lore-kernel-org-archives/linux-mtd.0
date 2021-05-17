Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E499DC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 11:37:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6372061073
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 11:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6372061073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AhQzHi/O5QPGOIBPsRQtbLV+fkMLsspzp6LMkEkclHg=; b=UAvrPcrDoEAkwsNp6hXfzAW0k
	q6Ig1EEEQg6jLUp4E+Yc0xLIMsN4eyDztkqo3MOn8P8gR254AzyxsH1LlUZ1tWu9ymSMACX2RN8p5
	1VDy8jmaR0irRY/QxG+u8Id0xPmmBQnLm1PGHPcwYE/elADnYNYJLFyh4Wg50543e4Ku0be1H9OqU
	QNA2SHTzaGyvV71XnHFx3k2sBePKc5jthVw8XLGD/2Yxe4NPVRgqlbqiVmUpf/sXk8P8/RqyKhPrh
	QhqnFtw/vgG+5ww7hDBv7CSN4sXKPINiOnA35XiiCOktaA2QwrvzzHdjvJW4sw+QdEumpLe+rS8ar
	VxxhgFcig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1libXG-00EkkO-BC; Mon, 17 May 2021 11:35:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1libWk-00Ekh1-IY
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 11:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=FCQ4za7ydSGKNQfq/GaeAXtIfgkTGsnkE551SGRAL9o=; b=nWEdtUNnPmIrSZiFkYe2/I5h2i
 STZPc03DQVowghkPnSx2v7pNiiE/K2nSSUYJhP9RNzpQ9bVhmu8r2PJS0NzqnSCfMHM6E3t/h/agZ
 yCSsIm2kWTXtzutQJxsJDN3Q2zDfI+e11gpF1U+kmG4K74Q0mBVgJ48gkN1GmwgGz8AozJVbH45hc
 0+wQOGQYPGAE2llLAvwREmrwEzF3DgntB0sm65PYKmZy+TdY8p0sYVTfYzK5WK7DUSdzuY43Arky4
 P05lu8riXl745bHEZfxIcS8AVjl1YfctKFHeDeeRKBAu8v/L2OYyNFhsv/beZWdcj6HT72S32sc5C
 BoK1AObA==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1libWh-00Dimq-Rx
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 11:35:13 +0000
Received: by mail-ej1-x62e.google.com with SMTP id b25so8705190eju.5
 for <linux-mtd@lists.infradead.org>; Mon, 17 May 2021 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FCQ4za7ydSGKNQfq/GaeAXtIfgkTGsnkE551SGRAL9o=;
 b=IB9zj1RMby7NHuY+7EN5m0uiAFQ4KX5vVjwATaFjhOVla9g4hl35b4tz/iuyPZBZvY
 TO53L9gA7bcbg6kfi24+bfALq1f8UhZF+LyQKnCznWBhslNChAXgtqX2X/dfceGYSejs
 z/y6qxLL6XKD0/1mtcX0CHf2DdzSrvqT8EK5lz/V3duMoRrrrxoJQSAe2zP87CLyg/HF
 dV1wkNfAsQr/fqnFGW7ROnn95vR2gM4Z84eV+TzD142yjIgzw7r3adE+p70fRc0IxJCK
 kKZeCaMz0o9Yx3y+YDPn1UAZw0vEngxW57zT02arhnkCUOHKci8Dgi7nQ3PTbPIR13FE
 OX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FCQ4za7ydSGKNQfq/GaeAXtIfgkTGsnkE551SGRAL9o=;
 b=Ocvuimmc1DCbwN39xARb5x0lnCtr7AlI7hURqzxSkzdecBiWPH2XFUkqxeLlnfbwb6
 zOEi1uibsDhAis+qWr1kwHZCG/DwWrZ0tjRtI+dTzx3qipjnMSxIM08lL9rcQjhWq7zo
 xVsg0LkkVhgZtChkodCutSuJ5BFTAMB9HWgjNN0UmLIxWKwLT/YUmm2eY2uwu9Iup5qD
 9JVyDgjmARlMoJOofpwhjxeH4K2UIBv1iwWRfMz5qSDqmtIdyk5WcCIOR7ay+yyqLCZz
 0rL5Th58sLLqeC023GYmgwUDkBqnppgNGStnsB+ZCiNSd5YyqQnp14Yr9ZkLGFjv3AVo
 g8Bg==
X-Gm-Message-State: AOAM5321ggRmlHc/V10JyThTbcPJqxYoGHBZe6Pyfwxe+UckB3zlj0PQ
 BIdckqS3uovgI1hh6AaOk6MjQqGrlV54888yBoQGfAPTT6I=
X-Google-Smtp-Source: ABdhPJyxsRSu2QlYp44XYtwgzl6I0bstgqJ8bH0KDvR4FPEZPA6A61/popKdfYsU1DuCwFXs5irRgBvYX3UaMzX40+4=
X-Received: by 2002:a17:906:40d1:: with SMTP id
 a17mr29376397ejk.43.1621251309364; 
 Mon, 17 May 2021 04:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
 <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
 <CAOuPNLjmJ0YufFktJzjkyvdxwFTOpxVj5AW5gANAGSG=_yT=mQ@mail.gmail.com>
 <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
In-Reply-To: <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 17 May 2021 17:04:57 +0530
Message-ID: <CAOuPNLhn90z9i6jt0-Vv4e9hjsxwYUT2Su-7SQrxy+N=HDe_xA@mail.gmail.com>
Subject: Re: [RESEND]: Kernel 4.14: SQUASHFS error: unable to read xattr id
 index table
To: phillip@squashfs.org.uk
Cc: open list <linux-kernel@vger.kernel.org>, sean@geanix.com, 
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_043511_932240_4BE8CD89 
X-CRM114-Status: GOOD (  23.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAxNSBNYXkgMjAyMSBhdCAwMzoyMSwgUGhpbGxpcCBMb3VnaGVyIDxwaGlsbGlwQHNx
dWFzaGZzLm9yZy51az4gd3JvdGU6Cj4KPiBZb3VyIGtlcm5lbCAoNC4xNC4xNzApIHdhcyByZWxl
YXNlZCBvbiA1IEZlYiAyMDIwLCBhbmQgc28gaXQgd29uJ3QKPiBjb250YWluIGFueSBvZiB0aGUg
YWJvdmUgY29tbWl0cy4gVGhlIHhhdHRyIC1pZCBjb2RlIGluIDQuMTQuMTcwLAo+IHdhcyBsYXN0
IHVwZGF0ZWQgaW4gTWF5IDIwMTEsIGFuZCBzbyBpdCBpcyBtdWNoIG1vcmUgbGlrZWx5IHRoZQo+
IHByb2JsZW0gaXMgZWxzZXdoZXJlLgo+Ck9rYXkgdGhpcyBzZWVtcyB0byBiZSBVQkkgdm9sdW1l
IGZsYXNoaW5nIGlzc3VlIHRoZW4uIEkgd2lsbCBhbHNvIHRyeQp3aXRoIG5vbi1zcXVhc2hmcyBp
bWFnZSAoanVzdCB1YmlmcykuClNlZSB0aGUgcmVzdWx0IGluIHRoZSBlbmQuCgo+IFRoZSB4YXR0
ciBpZCBpbmRleCB0YWJsZSBpcyB3cml0dGVuIHRvIHRoZSBlbmQgb2YgdGhlIFNxdWFzaGZzIGZp
bGVzeXN0ZW0sCj4gYW5kIGl0IGlzIHRoZSBmaXJzdCB0YWJsZSByZWFkIG9uIG1vdW50aW5nLgo+
Ck9rYXkgdGhpcyBnaXZlcyBtZSBhIGNsdWUgdGhhdCB0aGVyZSBhcmUgc29tZSBjb3JydXB0aW9u
cyB3aGlsZQp3cml0aW5nIHRoZSBsZWZ0b3ZlciBibG9ja3MgaW4gdGhlIGVuZC4KCj4gMS4gQ2hl
Y2sgdGhlIFNxdWFzaGZzIGZpbGVzeXN0ZW0gZm9yIGNvcnJlY3RuZXNzIGJlZm9yZSB3cml0aW5n
IGl0IHRvCj4gdGhlIGZsYXNoLiBZb3UgY2FuIHJ1biBVbnNxdWFzaGZzIG9uIHRoZSBpbWFnZSBh
bmQgc2VlIGlmIGl0IHJlcG9ydHMKPiBhbnkgZXJyb3JzLgo+CkNhbiB5b3UgZ2l2ZSBtZSBzb21l
IHBvaW50ZXJzIG9uIGhvdyB0byB1c2UgdW5zcXVhc2hmcyA/IEkgY291bGQgbm90CmZpbmQgYW55
IHVuc3F1YXNoZnMgY29tbWFuZCBvbiBteSBkZXZpY2UuCkRvIHdlIG5lZWQgdG8gZG8gaXQgb24g
dGhlIGRldmljZSBvciBteSBVYnVudHUgUEMgPyBBcmUgdGhlcmUgc29tZQpjb21tYW5kcy91dGls
aXR5IGF2YWlsYWJsZSBvbiB1YnVudHUgPwoKPiAyLiBZb3UgbmVlZCB0byBjaGVjayB0aGUgZmls
ZXN5c3RlbSBmb3IgaW50ZWdyaXR5IGFmdGVyIHdyaXRpbmcgaXQgdG8KPiB0aGUgZmxhc2guIENv
bXB1dGUgYSBjaGVja3N1bSwgYW5kIGNvbXBhcmUgaXQgd2l0aCB0aGUgb3JpZ2luYWwKPiBjaGVj
a3N1bS4KPgpDYW4geW91IGFsc28gZ3VpZGUgbWUgd2l0aCBhbiBleGFtcGxlLCBob3cgdG8gZG8g
dGhpcyBhcyB3ZWxsID8KCkJUVywgSSBhbHNvIHRyaWVkICJyb290ZnMiIHZvbHVtZSBmbGFzaGlu
ZyB1c2luZyAidWJpZnMiIGltYWdlIChub24Kc3F1YXNoZnMpLiBIZXJlIGFyZSB0aGUgcmVzdWx0
cy4KYSkgV2l0aCB1YmlmcyBpbWFnZSBhbHNvLCB0aGUgZGV2aWNlIGlzIG5vdCBib290aW5nIGFm
dGVyIGZsYXNoaW5nIHRoZSB2b2x1bWUuCmIpIEJ1dCBJIGNhbiBzZWUgdGhhdCB0aGUgInJvb3Rm
cyIgdm9sdW1lIGNvdWxkIGJlIG1vdW50ZWQsIGJ1dCBsYXRlcgpnaXZlcyBzb21lIG90aGVyIGVy
cm9ycyBkdXJpbmcgcmVhZF9ub2RlLgoKVGhlc2UgYXJlIHRoZSBib290IHVwIGVycm9ycyBsb2dz
Ogp7e3sKWyA0LjYwMDAwMV0gdnJlZ19jb25uX3BhOiBkaXPilpJbIDQuNzEyNDU4XSBVQklGUyAo
dWJpMDowKTogVUJJRlM6Cm1vdW50ZWQgVUJJIGRldmljZSAwLCB2b2x1bWUgMCwgbmFtZSAicm9v
dGZzIiwgUi9PIG1vZGUKWyA0LjcxMjUyMF0gVUJJRlMgKHViaTA6MCk6IExFQiBzaXplOiAyNTM5
NTIgYnl0ZXMgKDI0OCBLaUIpLAptaW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDQwOTYgYnl0ZXMv
NDA5NiBieXRlcwpbIDQuNzE5ODIzXSBVQklGUyAodWJpMDowKTogRlMgc2l6ZTogMTEzMDA4NjQw
IGJ5dGVzICgxMDcgTWlCLCA0NDUKTEVCcyksIGpvdXJuYWwgc2l6ZSA5NDA0NDE2IGJ5dGVzICg4
IE1pQiwgMzggTEVCcykKWyA0LjcyOTg2N10gVUJJRlMgKHViaTA6MCk6IHJlc2VydmVkIGZvciBy
b290OiAwIGJ5dGVzICgwIEtpQikKWyA0Ljc0MDQwMF0gVUJJRlMgKHViaTA6MCk6IG1lZGlhIGZv
cm1hdDogdzQvcjAgKGxhdGVzdCBpcyB3NS9yMCksClVVSUQgeHh4eHh4eHh4LXh4eHh4eHh4eHgs
IHNtYWxsIExQVCBtb2RlbApbIDQuNzQ4NTg3XSBWRlM6IE1vdW50ZWQgcm9vdCAodWJpZnMgZmls
ZXN5c3RlbSkgcmVhZG9ubHkgb24gZGV2aWNlIDA6MTYuClsgNC43NTkwMzNdIGRldnRtcGZzOiBt
b3VudGVkClsgNC43NjY4MDNdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBtZW1vcnk6IDIwNDhLClsg
NC44MDUwMzVdIFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDEpOiB1Ymlmc19yZWFkX25vZGU6IGJh
ZCBub2RlIHR5cGUKKDI1NSBidXQgZXhwZWN0ZWQgOSkKWyA0LjgwNTA5N10gVUJJRlMgZXJyb3Ig
KHViaTA6MCBwaWQgMSk6IHViaWZzX3JlYWRfbm9kZTogYmFkIG5vZGUgYXQKTEVCIDMzNjoyNTA1
NjAsIExFQiBtYXBwaW5nIHN0YXR1cyAxClsgNC44MTI0MDFdIE5vdCBhIG5vZGUsIGZpcnN0IDI0
IGJ5dGVzOgpbIDQuODEyNDEzXSAwMDAwMDAwMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYKZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uCn19fQoKU2VlbXMgbGlrZSB0aGVyZSBpcyBzb21lIGNvcnJ1cHRpb24gaW4g
dGhlIGZpcnN0IDI0IGJ5dGVzID8/CgoKVGhhbmtzLApQaW50dQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
