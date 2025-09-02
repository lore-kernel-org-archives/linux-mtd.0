Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31803CA100B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nV1k5mnNkXPkZu6KnGlDGQxr2meMBhUZiuXnnmpujAg=; b=19k2iVFf27MB8RM/sbUNNULPWH
	aB3VEgV7pLlVr8Ou7VBqVIzvVi7EvbrTZpQdBj7b969pZfyUZ8akhUX8k4QXcVQZ2fbdm5n0+eTFe
	3yZV5AUq+7ovWvZTdanyW7clcGf8r/KFPwbMrOFndq/MpZV8QLIuSl12RXXytlpnQ71UGp4Ox1GdO
	8WHtL6iDwVUAmywy6qRhA3CWQNH6g1Y/irO55HI8Ob9z/ZWiKFWPj+Pg9cKnpKOhV7/4cMfwXNblZ
	gVrmItB11bpwPtYiJ1Q4WMNet1N99z59RgXP97X/QfijjUJFUskCCgbkCF84j6oXFQheoW85MEslE
	0pGD9dNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLTZ-0000000Fl7g-06QA;
	Tue, 02 Sep 2025 07:30:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLMN-0000000FjCZ-0Irh
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 07:23:20 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3276f46c1caso4671599a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 02 Sep 2025 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756797798; x=1757402598; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFBpUVkk/SLpQU+JapXnL+35XvgcEAr8AC5EOl66PDw=;
        b=U4brYkLJLEw/Ba25SAcvRJ0pCh0urriiUoDZqWDwV5B4beUHt5e6bPY9eomSM3m6mN
         V6ZJVgRa0WgKDGsm1u0Yk540CPWLs2lJfbKbnFBJgXKveQtRnTFPZc167sStCdubNpF9
         HI8WlwMEhTSenjjFxLUUhrjCIHhYPRswjParnWzQRKZNWBl7iX8hYMBrWALToHntUUPJ
         yjsVkuBf9aahRPnGopSWRRt5n/cIO2A8untDjPrNTuNH8P//igONLbMouWErRGen46Bv
         eMUfNcXvh1JKjp4INKlhiyCS8Z4zuxOmSSjCbsmEm4K8Wk2/rvXxbJIy4lgns3zqkSHe
         jKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797798; x=1757402598;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFBpUVkk/SLpQU+JapXnL+35XvgcEAr8AC5EOl66PDw=;
        b=WRHVVFcCW8WA2g7UuAEVNP4587lNx8i9ihPLknmk8uEkNs3Pdv7l+Qp/R2h3go9u8+
         gm8ASY+mULVfbr8I3YWCOydJQNmTBT9T645pr8obAXOtfcBICbhgNyU+1MFztvci7iul
         t0++EmFnQzcSUfVE0oRHaWbHLCDpIbkWUfEi/SU99uvnJTPd+28MtZ0jQxEu3djQAVsA
         ybfZmGOXFkIPXfHORMYxftj5kEp0DGVe1qow1IZs8L135LED0E9MCltiAWVwuSFJekOf
         UGqFYcyRTqzA13IJw0tcqnWLKslNix00d1ZEN/k8s2VkEB/ijXBAr5eKI07hFUED8xFu
         u4GA==
X-Gm-Message-State: AOJu0YxqWjgh5NVAFuHPEr1+Sb/ueNsONYWdj1YDREd8NjddE7bXz+0h
	/topBN7ZF/+kQ3b+l3TItJ9F3TIhKcD2NzwXV8qIoUngGsrzzwXhSM0WN3sVqkp1Y4dVDZICuML
	08qxICCOnRH7lRm29mdGgEgovb4KeKvDHS504
X-Gm-Gg: ASbGncvVdpgmCa+/ZuRcO9jxj/CB3Xd5ZdotbGq0fd+dzA94hbyzZzrqGx3OaDdUYVU
	qx4a+8KHd59eQRnk5hXmFfSKAZWTYirFoRIcRXUVUV09AO6C45Kjxw7aN9WI3VSQ60rKOdoo6Zt
	H1Xw0/S32oMZxcM5skhOqncu9PQhANnnBqs+Ry5+kxsqBUWxDEIJrzyFQmGDUShIcO7If8fRYBe
	oRFzg==
X-Google-Smtp-Source: AGHT+IHo5m2bG21/X4LSh/GmxoqpCz0iu0U3uRlRFHQGyt7VjT/kMFqVf5HCJVa1gcXyHRVCLJKjB10WB14yq3f00nk=
X-Received: by 2002:a17:90b:3fd0:b0:325:65e7:5cc with SMTP id
 98e67ed59e1d1-3280d2b7e5amr14184164a91.3.1756797797620; Tue, 02 Sep 2025
 00:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-yarn-from-020874b4da63@thorsis.com>
In-Reply-To: <20250902-yarn-from-020874b4da63@thorsis.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 2 Sep 2025 09:23:04 +0200
X-Gm-Features: Ac12FXy9sWf0mbkNJea7ykYvSQGMAgT7txawRQXCSHJT53XJnLBzaPb8xMBBf_o
Message-ID: <CAFLxGvzO2yszspJtd_A3BSTCRNSF+ts_5+2aMkNksxM48DYEwA@mail.gmail.com>
Subject: Re: State of the UBI fastmap feature
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_002319_151342_1D5E9A11 
X-CRM114-Status: GOOD (  16.17  )
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

T24gVHVlLCBTZXAgMiwgMjAyNSBhdCA4OjAw4oCvQU0gQWxleGFuZGVyIERhaGwgPGFkYUB0aG9y
c2lzLmNvbT4gd3JvdGU6Cj4gSGVsbG8gZXZlcnlvbmUsCj4KPiBhZnRlciB1c2luZyBVQkkgZm9y
IGFsbW9zdCAxNSB5ZWFycyBub3cgd2l0aG91dCBmYXN0bWFwLCBJJ20gY3VycmVudGx5Cj4gZXhw
ZXJpbWVudGluZyB3aXRoIHRoYXQgZmVhdHVyZS4gIFRoZSBoZWxwIHRleHQgaW4gS2NvbmZpZyBt
ZW51Cj4gKGRyaXZlcnMvbXRkL3ViaS9LY29uZmlnKSBzdGlsbCBzYXlzICJFeHBlcmltZW50YWwg
ZmVhdHVyZSIgYW5kCj4gZnVydGhlciBkb3duOgo+Cj4gPiBJbXBvcnRhbnQ6IHRoaXMgZmVhdHVy
ZSBpcyBleHBlcmltZW50YWwgc28gZmFyIGFuZCB0aGUgb24tZmxhc2gKPiA+IGZvcm1hdCBmb3Ig
ZmFzdG1hcCBtYXkgY2hhbmdlIGluIHRoZSBuZXh0IGtlcm5lbCB2ZXJzaW9ucwo+Cj4gSXMgdGhp
cyBzdGlsbCB0aGUgY3VycmVudCBzdGF0ZT8gIEkgY2FuIG5vdCByZW1lbWJlciBzZWluZyBhbnkg
cGF0Y2hlcwo+IHRvdWNoaW5nIGZhc3RtYXAgaW4gdGhlIGxhc3QgdGltZS4gIEFyZSB0aGVyZSBw
bGFucyB0byBzdGFiaWxpemUgdGhpcz8KPiBXaWxsIHRoZXJlIGJlIGNoYW5nZXMgaW4gdGhlIG9u
LWZsYXNoIGZvcm1hdD8gIERvIGZvbGtzIGV2ZW4gdXNlIHRoaXMKPiBmZWF0dXJlPyAgSW4gcHJv
ZHVjdGlvbj8KCkkgZG9u4oCZdCBleHBlY3QgY2hhbmdlcyB0byB0aGUgb24tZGlzayBmb3JtYXQs
IGJ1dCB0aGUgbnVtYmVyIG9mIG5ldyByYXcgTkFORApkZXZpY2VzIGJlaW5nIGludHJvZHVjZWQg
aXMgbm93IGNsb3NlIHRvIHplcm8uIEFzIGEgcmVzdWx0LCB0aGUgdXNlcgpiYXNlIGlzIHZlcnkg
c21hbGwsCmFuZCBzdWJ0bGUgYnVncyBhcmUgbGlrZWx5IHRvIHJlbWFpbiB1bmRpc2NvdmVyZWQu
CgpGYXN0bWFwIGRvZXMgaGF2ZSB1c2VycywgaW5jbHVkaW5nIGluIHByb2R1Y3Rpb24sCmJ1dCBJ
IGRvbuKAmXQgaGF2ZSBjb25jcmV0ZSBudW1iZXJzLiBBbmQgSSBkb24ndCBrbm93IHRoZWlyIHdv
cmtsb2FkLgpUaGF0IHNhaWQsIEZhc3RtYXAgc2hvdWxkIHdvcmsgYnV0IEkgc3RpbGwgYW50aWNp
cGF0ZSBwZXJmb3JtYW5jZSBhbmQKcnVudGltZSBpc3N1ZXMuCgpJIGd1ZXNzIHlvdXIgbW90aXZh
dGlvbiBpcyByZWR1Y2luZyB0aGUgYXR0YWNoIHRpbWU/CgotLSAKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
