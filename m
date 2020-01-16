Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB91C33CAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:32:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE07206D9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fd+NuYQa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d95X4kB3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE07206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5zeeKYtERZ26S0lAqowvbLrlgoMw0RjsZkBuatQAuY=; b=fd+NuYQa2Bn/Wk
	4EE3DTlUcokUFa74VPSwf6yLqdPi090z7b0f53SPR8jNclO8MlJqdqOi7qdPnkkXW7AJHxTQCyMPK
	MCW3DfFEV/wPxT4wqpD69HAY8gYLIPga+99bTpt0LaI8KAowhQHQpQIi/5s9EuJBVxa/ZK5oATeWg
	xgR/hG1e/Mx/mAptQxqeoNi2TJ3tsp0Joq3P7h/04XWNqBZmZKxQkdxdJHOcClJ32AwH+dqimeGA1
	D8YI0mTlLnz+jLprBtFulbJiFAI09fvBnEt/38C6Orx2L5WAoMRtlwMIQ8ZA8L7+JRU2mHe5P6FKy
	MERjfEc6gqXB7+cJNwFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isEcl-0003zH-0K; Thu, 16 Jan 2020 23:32:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isEci-0003yl-9B
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 23:32:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id w15so20970047wru.4
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2020 15:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YDWLm6XpqMI02rMFx3Yb45aze/71UxlSxD1MYyNVKss=;
 b=d95X4kB3aWSrf5EvGU4uzYYHZZbih5nZwN0V97zERE4yecu7yDy8A8+o7MOMZhrPgs
 /rPBKOGLIFY7ls4zfxHALS7VNK9jM2Nwjtag9b0DpaDEprrzTJxh5NLei1GRuZYXR169
 p/tmWDgXSPFu0bdauwtEXYSL2k+V1vn7tFidCiOEbR6/PAk+EKbVpZjvM1WAuskg1qQr
 89TTB5sZH+lRkQHlkuLd3/l7XZfWvj2hFYhXdOw1Mor7z9TwHC9jUzvH8gZH0dAqnBae
 UfabZpNgiT4LVL83N6F5MVDCZz9dU70ilxuerH+jnjuceu7G+/XzVqInobQz12XRk40t
 mydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YDWLm6XpqMI02rMFx3Yb45aze/71UxlSxD1MYyNVKss=;
 b=INuYOfmzJjB+RQL4vCk1YdIXWmV0Fl9TP8pW7Hqspuxtda9BfPGh22ybWHD4mRp7KU
 R9GFtSZ0YiWuFA8+ErKBddx20bWqFXAVupScSas96KJjfjQr+KS/OfRcCFEFKLrgkh4D
 LuUXAW4mAqrDOBfBkh3Z/SlLZ9cDS58Iug1sorSl3n//I9+jfeg6Ibp+4p8KmqV5wBoU
 wnjVU0minHzWmQdQrI+fmFE802ObT5Lpjm3mlB7W4ITcGSVGAMolNhp69KMNVGe8A+mX
 sNktfeEq1UOc0Xcu2a8eTIZfkj+adzYYXRfB6C4DP0NFj4lUGqvqo3ruV2d4xlFGf/7b
 2EDA==
X-Gm-Message-State: APjAAAWCGTGxp1G8fYm3PGFbU+JlHUtheh9fyt977+AE+3+C5h8UNaKk
 XflFL1A1QnCW6g+NnUgv6Wx8jKqtohN4lyjXdRo=
X-Google-Smtp-Source: APXvYqwLX0lrkZdJFe5t0zpO2tuKs8Y79hcNs/Gk+HUAJGy8yctH8b/KG5My1MY/0dBlSpc+VFll6ki0vfP1JpdRDMs=
X-Received: by 2002:adf:f606:: with SMTP id t6mr5590987wrp.85.1579217542497;
 Thu, 16 Jan 2020 15:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20191209222325.95656-1-ebiggers@kernel.org>
 <20200114220016.GL41220@gmail.com>
 <1925918130.21041.1579039436354.JavaMail.zimbra@nod.at>
In-Reply-To: <1925918130.21041.1579039436354.JavaMail.zimbra@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 Jan 2020 00:32:11 +0100
Message-ID: <CAFLxGvz8mjUdh67aw1vKoxJnQBHixrPUC8CTJYMbQG2CqZQrwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] ubifs: fixes for FS_IOC_GETFLAGS and FS_IOC_SETFLAGS
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_153224_347092_28705923 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-fscrypt <linux-fscrypt@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMTE6MDQgUE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4g
PiBWb246ICJFcmljIEJpZ2dlcnMiIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPgo+ID4gQW46ICJyaWNo
YXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWZzY3J5cHQiIDxsaW51eC1mc2NyeXB0QHZnZXIua2Vy
bmVsLm9yZz4sICJsaW51eC1mc2RldmVsIgo+ID4gPGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwu
b3JnPgo+ID4gR2VzZW5kZXQ6IERpZW5zdGFnLCAxNC4gSmFudWFyIDIwMjAgMjM6MDA6MTcKPiA+
IEJldHJlZmY6IFJlOiBbUEFUQ0ggMC8yXSB1YmlmczogZml4ZXMgZm9yIEZTX0lPQ19HRVRGTEFH
UyBhbmQgRlNfSU9DX1NFVEZMQUdTCj4KPiA+IE9uIE1vbiwgRGVjIDA5LCAyMDE5IGF0IDAyOjIz
OjIzUE0gLTA4MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiA+PiBPbiB1YmlmcywgZml4IEZTX0lP
Q19TRVRGTEFHUyB0byBub3QgY2xlYXIgdGhlIGVuY3J5cHQgZmxhZywgYW5kIHVwZGF0ZQo+ID4+
IEZTX0lPQ19HRVRGTEFHUyB0byByZXR1cm4gdGhlIGVuY3J5cHQgZmxhZyBsaWtlIGV4dDQgYW5k
IGYyZnMgZG8uCj4gPj4KPiA+PiBFcmljIEJpZ2dlcnMgKDIpOgo+ID4+ICAgdWJpZnM6IGZpeCBG
U19JT0NfU0VURkxBR1MgdW5leHBlY3RlZGx5IGNsZWFyaW5nIGVuY3J5cHQgZmxhZwo+ID4+ICAg
dWJpZnM6IGFkZCBzdXBwb3J0IGZvciBGU19FTkNSWVBUX0ZMCj4gPj4KPiA+PiAgZnMvdWJpZnMv
aW9jdGwuYyB8IDE0ICsrKysrKysrKysrLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IFJpY2hhcmQsIGhhdmUgeW91IGhhZCBh
IGNoYW5jZSB0byByZXZpZXcgdGhlc2U/ICBJJ20gaW50ZW5kaW5nIHRoYXQgdGhlc2UgYmUKPiA+
IHRha2VuIHRocm91Z2ggdGhlIFVCSUZTIHRyZWUgdG9vLgoKQm90aCBhcHBsaWVkLiBUaGFua3Mg
YSBsb3QgZm9yIGFkZHJlc3NpbmcgdGhpcywgRXJpYy4KLS0gClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
