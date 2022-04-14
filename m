Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70105C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tEpwI9hIvTu+/xUN1jUX25s9wCsaJhtzWeJKHDWMFFs=; b=j4k
	z6M2EOq67CrbcVkMXolXrV4GO3pMrUlUo1fLntr0kJ5iTkptthJMwlKNnDFGyAmeF5p9wxgrEH7bJ
	i2bKww0WuiWG+wfCGU1zjXO0VXKUpVdc404WiAy/9KLQ1GdIIBXoq1SNAGc0flJF13YCklQEtzfWZ
	fbNIatOfhfz0qEG2pWAy+OZlPXtkSY0afkRSsoLLrBY7Gh3BGefNckggvA81D8SbnYs1+yibgmL1N
	GJlyCyCp9blyo7/rEpwYv/mpRe2OaT9aghdvjuYQkUt1rG+9+28TpcphjRj5+zKUvZgu6+BAjs5n0
	QtDM9lG2Q+oqVagIAqBg9yBAXzg5j2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf2bD-006WRY-Rf; Thu, 14 Apr 2022 16:45:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf2bA-006WR6-Vg
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 16:45:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id s25so6632729edi.13
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 09:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=/0Asl4L67baP45NBcrJ53xfQBOODoXYpWN0jo6bv8Qk=;
 b=kfOi1dbxjHZ9StmyQFYEpzds7/4ioUAZK7i9oEkX9NZG7P/RosgaNVjOIlB32Ibt8F
 IgarU3y1JpgjiEKtboEDij0TBWYA0KnG79195OSthzstoIdoDLg1b/PZXQHs6jEY7fpe
 DslcFdoWYnnWFJ7BM17gbQz/ArPOTS2fumxBO5xgfi19X9+BucFYb4A6yH2/MqwHmI+K
 DCMrCmHSDcB+1l6/mo4ybbLRhrNbO7VIgBfQHBfV4kWNHHpZXppI9tdtbV1QZer9BXUf
 yx2vsjAhTfU5P1rUU8Ju2HlQdkGTn4rJwyQbarPBjswylIBfBsGgPWxfzLDeAHqGs26r
 CLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=/0Asl4L67baP45NBcrJ53xfQBOODoXYpWN0jo6bv8Qk=;
 b=a7Yl1RpHt3Q6xr6SezGqZkQIHNVAeTPPJ7LjZyD9WN78nMGgegQ2N9CU2n07RLihi5
 jLIzjBxUGU8FqGTCE/cUqJ7CvQP6wvz2ps8H71HfWWV/mrPBiyazhfTvefTGuOhyrj+0
 PqNxmzntFA4FGFszIW88V15z7eVMX3ThstzXrSnIxy9yetOuPlxZg2nN4mfWIfK0kLBZ
 4ChZbLXp6ItLsOZLixy5VIaB1ITmn+Jwv35bPYi0y6Tb2FGrlBl5t7/K2TapqX0WzHX+
 cp9fuEpv7t+AXeZNmKjlMZ0/mu2yQj03OmG87qzv8cjrS47pyu3D1SMQa5cnKiqW1zzF
 +/EQ==
X-Gm-Message-State: AOAM533durzcCJrt9V4WT9kkslC2wldCvLvFFBS+zFL3Fc1h3jMprnCg
 SDqLrQhSDtkRH11g0U4jz2EOFIuJygXiDsPwO7waGnk2onumZQ==
X-Google-Smtp-Source: ABdhPJwgBk3yOM1vg6OLrA5/0H6gO1Z1pYjiqIsTo8appci26VXBQcZsB3TtIfkaoFRBDKR/HHuWBKEIbabVPhotbnI=
X-Received: by 2002:aa7:c948:0:b0:413:2bed:e82e with SMTP id
 h8-20020aa7c948000000b004132bede82emr3958447edt.394.1649954734819; Thu, 14
 Apr 2022 09:45:34 -0700 (PDT)
MIME-Version: 1.0
From: Scott Zhang <macromarship@gmail.com>
Date: Fri, 15 Apr 2022 00:45:23 +0800
Message-ID: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
Subject: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_094537_074139_41D44BC3 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8uIEV2ZXJ5b25lLgogICAgIEkgZW5jb3VudGVyZWQgYSBzdHJhbmdlIHByb2JsZW0gYWJv
dXQgdWJpZnMuIE15IGVtYmVkIGxpbnV4IHJ1bnMKd2VsbCBub3JtYWxseS4gQnV0IGFmdGVyIGFi
b3V0IDMtNCBkYXlzLCBkZXZlbG9waW5nIHBocCBhcHBsaWNhdGlvbiwKY29weWluZyBmaWxlcyBl
dGMuLiB0aGUgL29wdCBwYXJ0aXRpb24gd2hlbiByZWFkLCB0aGUgc3lzdGVtIGJlY29tZQp2ZXJ5
IHNsb3cuIEFmdGVyIGNoZWNrIGRtZXNnCnRoZSBvdXRwdXQgY29udGFpbnMgZnVsbCBvZiBkZWJ1
ZyBsb2dzIGFzIGJlbG93LgoKWzE3NTg4LjA0MDAwMF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQg
MTU2OTEpOiBkb19yZWFkcGFnZTogY2Fubm90CnJlYWQgcGFnZSAxNSBvZiBpbm9kZSAzOTYsIGVy
cm9yIC0yMgpbMTc1OTAuMDgwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTY5NSk6IHVi
aWZzX2RlY29tcHJlc3M6CmNhbm5vdCBkZWNvbXByZXNzIDIyOTMgYnl0ZXMsIGNvbXByZXNzb3Ig
bHpvLCBlcnJvciAtMjIKWzE3NTkwLjA5MDAwMF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTU2
OTUpOiBkb19yZWFkcGFnZTogYmFkIGRhdGEKbm9kZSAoYmxvY2sgMTUsIGlub2RlIDM5NikKbG90
cyBvZiBoZXggZHVtcCwgc2VlbXMgbm9ybWFsIGRhdGEKCkJhc2VkIG9uIG15IHVuZGVyc3RhbmRp
bmcgb2YgdWJpIGFuZCB1YmkgZnMuIFRoZSBib3R0b21lc3QgbmFuZCBkcml2ZXIKaGFzIHRoZSBl
Y2MgY29ycmVjdGlvbiwgdGhlbiB1YmkgaGFzIGNyYzMyIHRvIHZlcmlmeSBkYXRhIHdyaXRlIGFu
ZApyZWFkLiBUaGVuIHdoZW4gZGF0YSBjb21lIHRvIHViaWZzLCB0aGUgZGF0YSBzaG91bGQgYmUg
YWx3YXlzIGNvcnJlY3QuCkFueXRoaW5nIHdyb25nIHdpbGwgYmUgcmVwb3J0ZWQgZmlyc3RseSBi
eSB1YmkgYmVsb3cgb3IgbXRkIG5hbmQKZHJpdmVyIGJlbG93LgpTbyB0aGUgbXNnIHNob3dzIGFi
b3ZlIGNvbmZ1c2UgbWUuIFdoeSBkaWQgZGVjb21wcmVzcyBmYWlsIGZvciBwYXNzZWQKY3JjMzIg
ZGF0Ye+8nwpJcyB0aGVyZSBhbnl3YXkgdG8gc2ltcGxlIGRyb3AgdGhlIGJsb2NrIDE1LCBpbm9k
ZSAzOTYgc28gbm8gd2FybmluZwphbnltb3JlLiBFdmVuIHNvIG1hbnkgbG9ncyBkdW1wZWQgLHRo
ZSBzeXN0ZW0gY29udGludWVzIHJ1bnMgLCBidXQKcmFtZG9tbHkgaGFuZ3MuIE1heWJlIG5vIGhh
bmcsIHRoZSBsaW51eCBydW4gbGVkIGNvbnRpbnVlcyBibGluaywKbmV0d29yayBsZWQgYmxpbmss
IHRoZSBwaW5nIGlwIGlzIG5vdCByZWFjdC4KQmVjYXVzZSBJIHBvcnQgdGhlIG5hbmQgZHJpdmVy
IG15c2VsZiwgYW5kIHBvcnQgZXZlcnl0aGluZyB0byBtYWtlCm5hbmQgd29ya2luZy4gU28gSXMg
dGhlcmUgYSBwb3NzaWJpbGl0eSBJIG1ha2UgZWNjIGNoZWNrc3VtIHdyb25nLAp0aGVuIGdldCB0
aGlzIHdpZXJkIHByb2JsZW0/CgpJIGdvb2dsZWQgZmlyc3QsIGFuZCBvbmx5IHNlZSByZWxhdGVk
IGRpc2N1c3Mgb24gMjAxMSBidXQgY2FuJ3Qgc2VlIGl0IGhlbHAuCmh0dHBzOi8vbGludXgtbXRk
LmluZnJhZGVhZC5uYXJraXZlLmNvbS9jNjVTZWRZcC91Ymlmcy1kZWNvbXByZXNzLWNhbm5vdC1k
ZWNvbXByZXNzCgpUaGFua3MuClNjb3R0IFpoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
