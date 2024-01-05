Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD8CC3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QrQTDtpaXSET/pTUwH3d7wdQ/x6Gt2uhqJfW/y8pqE=; b=PuiX109nfkmAey
	C/OinjkLjnVBSYzmhOwGrZsFaqhdJLMH95+7KRdzgPlggvqj4/PmKgl3jMu5XkK20qMnfUp/7d8Zu
	I/crXKrIveJFBxeh4iST30QnTQmT3Kyhhh6oVWnTVT8ztCjtLkN0ShdEWxIcbSfKP/Jz75JEELyZq
	LIHkMFwzCPy6F5d885KpZKDFsmyYEJmx1XQGJ9LWpAXTr5UgjWP50tnLBwcbrEDCPuRP9TPGQCOav
	wCB9rDQ+8kGIpiEpPk+4rklf47eL6D1639Yppp0zm4kAoZMKH1+tL6U8dELKgWOnWfNgxll/Ruvdt
	4Kn8A00shcr1YuJOYGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmXk-00HDzn-1j;
	Fri, 05 Jan 2024 15:55:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmXh-00HDy0-3C
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 15:55:31 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50eaa8b447bso1901143e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2024 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704470124; x=1705074924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkvU2jP6F+TYCmXLML4f8jNr6z6Unk5LytAZK/GmgzY=;
        b=OLc0Lvk0P8mS2FprA2ogrzhfb9P9BlHfrEcfhuH3B7vOyPVO8A7z4dQVDq8bSinfHk
         zGXnGCS34LD+TS10WIUee6jFG9F2dTsyf/9NW0tNlwIcx0kqc+6BH4WEfvcTZKr+kiv4
         lpmZ6uJQxKoo97ez04iyJw4ki/7GZBHA+E42VR5/tSIXv16AEoKYkKwId9tbP30Sk+2B
         IZhKg9kyEsZ6uPRZ/P6X5n5apQfk1HEKs7bCvI9ASEL3LPOkzfedDw8wHlQ9wRGl1ZmX
         GZmPXa3nnWnXtzD0z3pTXyL81Z109it8zE6rsvqZXNCgDlFZNvksIiThbtcPTZPvEvW8
         7Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470124; x=1705074924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkvU2jP6F+TYCmXLML4f8jNr6z6Unk5LytAZK/GmgzY=;
        b=AZl1ke+6pNLVGi62oXyUv4YdZTZgvl5nvHkAPG+owU/vF3lE1ggYCWtOODI0x0wCCw
         k1JPjNKC/ojP2kvFvKyKVy1AHQjKdk2Sb92wE+i4QPYcaSqmjKwFsec9U3KBoEABY+XQ
         p2yS8ccS9lX+rdyffuCHh1qY/6bYdkeAhKNqAD/kLaRASVnMUXaYffLo/nFNybYCWC54
         dbQsAbrF7aebfE97TLewDWgOD9LeHdzW0hiquPH+p2VQDNt9yTD1Tpf638CZ4H+5LbzL
         SXiv1JrMG/o3StH7r96g9DnF/0u7Th6tHrQrXoxdOIjORLgLpBJTnSvt3HLJMwdwIJgv
         Cndw==
X-Gm-Message-State: AOJu0YzjNHqn+rXrp4L2FZqm6rfSvJXxYwnaAySy5dldIFCICMaUq15N
	qqZEW2H0H7+vaPnQWyp6tsSWds0sJ+++5NHGOnQ=
X-Google-Smtp-Source: AGHT+IHv+5fUTRxy54sAoptj93r7Tc0Y0iLJVqnR2jPYsRdXJi5cQajCPj0Gh3weNYeWfJ6GQ1ec7EXv1kaxFExX7Hc=
X-Received: by 2002:ac2:4254:0:b0:50e:cf8:b168 with SMTP id
 m20-20020ac24254000000b0050e0cf8b168mr513895lfl.208.1704470124225; Fri, 05
 Jan 2024 07:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20231111143314.1518314-1-chentao@kylinos.cn>
In-Reply-To: <20231111143314.1518314-1-chentao@kylinos.cn>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 5 Jan 2024 16:55:11 +0100
Message-ID: <CAFLxGvzAncnBTEbHZ0pA-oF6n9P+wKFMugz8c+8UQKoPeBiYig@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Remove unreachable code
To: Kunwu Chan <chentao@kylinos.cn>
Cc: richard@nod.at, Artem.Bityutskiy@nokia.com, kunwu.chan@hotmail.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_075530_028044_261EC589 
X-CRM114-Status: GOOD (  17.83  )
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

T24gU2F0LCBOb3YgMTEsIDIwMjMgYXQgMzozM+KAr1BNIEt1bnd1IENoYW4gPGNoZW50YW9Aa3ls
aW5vcy5jbj4gd3JvdGU6Cj4KPiBCZWNhdXNlIHRoZXJlIGlzIG5vIGJyZWFrIHN0YXRlbWVudCBp
biB0aGUgZGVhZCBsb29wIGFib3ZlLGl0IGlzCj4gaW1wb3NzaWJsZSB0byBleGVjdXRlIHRoZSAn
ZXJyPTAnIHN0YXRlbWVudC5EZWxldGUgdGhlIGNvZGUgdGhhdAo+IHdpbGwgbmV2ZXIgZXhlY3V0
ZSBhbmQgaW5pdGlhbGl6ZSAnZXJyJyBhdCB0aGUgc3RhcnQgb2YgdGhlIGZ1bmN0aW9uLgo+Cj4g
Rml4ZXM6IDZmYjMyNGE0YjBjMyAoIlVCSUZTOiBhbGxvY2F0ZSBsdGFiIGNoZWNraW5nIGJ1ZmZl
ciBvbiBkZW1hbmQiKQo+IFNpZ25lZC1vZmYtYnk6IEt1bnd1IENoYW4gPGNoZW50YW9Aa3lsaW5v
cy5jbj4KPiAtLS0KPiAgZnMvdWJpZnMvbHB0X2NvbW1pdC5jIHwgNSArKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL2xwdF9jb21taXQuYyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+IGluZGV4IGM0
ZDA3OTMyOGI5Mi4uZDQ3NTE2MjhmZTcwIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2xwdF9jb21t
aXQuYwo+ICsrKyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+IEBAIC0xNTg5LDggKzE1ODksOCBA
QCBzdGF0aWMgaW50IGRiZ19pc19ub2RlX2RpcnR5KHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQg
bm9kZV90eXBlLCBpbnQgbG51bSwKPiAgICovCj4gIHN0YXRpYyBpbnQgZGJnX2NoZWNrX2x0YWJf
bG51bShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50IGxudW0pCj4gIHsKPiAtICAgICAgIGludCBl
cnIsIGxlbiA9IGMtPmxlYl9zaXplLCBkaXJ0eSA9IDAsIG5vZGVfdHlwZSwgbm9kZV9udW0sIG5v
ZGVfbGVuOwo+IC0gICAgICAgaW50IHJldDsKPiArICAgICAgIGludCBsZW4gPSBjLT5sZWJfc2l6
ZSwgZGlydHkgPSAwLCBub2RlX3R5cGUsIG5vZGVfbnVtLCBub2RlX2xlbjsKPiArICAgICAgIGlu
dCByZXQsIGVyciA9IDA7Cj4gICAgICAgICB2b2lkICpidWYsICpwOwoKTm93IGl0IGlzIHN0aWxs
IGRlYWQgY29kZS4KQSBmZXcgbGluZXMgbGF0ZXIgZXJyIHdpbGwgYmUgdXNlZCBmb3IgdGhlIHJl
c3VsdCBvZiB1Ymlmc19sZWJfcmVhZCgpLgpTbyB5b3UgY2FuIHJlbW92ZSB0aGUgaW5pdGlhbGl6
YXRpb24gb2YgZXJyIGNvbXBsZXRlbHkuCgo+ICAgICAgICAgaWYgKCFkYmdfaXNfY2hrX2xwcm9w
cyhjKSkKPiBAQCAtMTY0Niw3ICsxNjQ2LDYgQEAgc3RhdGljIGludCBkYmdfY2hlY2tfbHRhYl9s
bnVtKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSkKPiAgICAgICAgICAgICAgICAgbGVu
IC09IG5vZGVfbGVuOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBlcnIgPSAwOwo+ICBvdXQ6Cj4g
ICAgICAgICB2ZnJlZShidWYpOwo+ICAgICAgICAgcmV0dXJuIGVycjsKPiAtLQo+IDIuMzQuMQo+
CgoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
