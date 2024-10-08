Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5696CED26E
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWWl1yAtTmhNq7IfA8s2z1hl2vsgJc0TUnIOt7oZ5UA=; b=WLHg9OCdkaBV9Q
	v7bGGJJmeA8ECd1Y+CNqE9bQJknStz8GaPEEvVZ28HrZLSAgPO7PjZR5BZXaefqLt8ikuHWu5PJ7j
	Z60Ew8hkz/swQTsRCVZ/lbADG0k+XLDR9yGJTuPYe1HbsUJEuTtgP9ED3BObyIKNAPqX2QBcbEss1
	z+nQ909lwvPDghHYriWQ37jecF/h9Ahbt/cuog7tWRMxAVThnnlh7V1mq5ZU5UQx5U6morPYBi+eS
	2f3MsVe65UEMpE9RmoOYB7FM3ZziguzxX+VbUuOzbNd+AJCDY4zyX3reg6AIJetPXzpq2nj3CZ/MI
	oDawSHmQlP8reyDFSrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3gm-00000004eZS-1BSY;
	Tue, 08 Oct 2024 06:27:20 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3fK-00000004eNl-49wr
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 06:25:52 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ea0728475dso1250089a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2024 23:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728368749; x=1728973549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuwSf4Pm5FFZAaCJzdEmF7YF87t8Moz7TFWPmvQhC5Y=;
        b=ZsT/dGEH7pzuZOV/xYh9wjoPz0h9dFBL2W3GmHu6w+Sx4ckWBDSQx7xWNHBXIy6f1w
         CexHq2gtHQgabGFHisBJb221Gvd3mU0a3s2z8oh7CnT7iFXTW309hAJSusMuk1LOIWsq
         IpWn2mvvF02c0GthKtmNH91oWBWNlSfe09DnxQTmUHY7YEkkVV0IICyAgR9LCcuWmTw5
         +yUzjQJEq5aTXFamkXXpHG/evQOEfi9t3KJhbJRPXhacqIqV0a3ZykkLsja94w4F/eoU
         s+M8pcXaavywiulBfx77SAXOk71diSAcBNg6BHaw/GVPIW7zc4HOOB95gkGBDhfTgih9
         lJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728368749; x=1728973549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuwSf4Pm5FFZAaCJzdEmF7YF87t8Moz7TFWPmvQhC5Y=;
        b=Lnl1Ildo/ETy9WWOGk+l24/NYMJlesW5QcI2peiheGoGJaRwqLAsPebIkgfh4cINZ3
         fneXRuj6LW5oVgBogt4IeooBM0lXVZ4uuPv3BF7nDYQ6Vab/np8DoznDxLvnSb1WZ8xG
         P/9fWLU9G2566MrmXMd5TfyKTX9ywgZOIowjMnBVO3gncGnDEGdBqiBW3L8r707h7aH/
         JoOTZbXTg9bfLY3Aq28Hax3Gbz6izFyhMROlBYwKhb7b6QlfMY+lGVPMO75CX3NZsPgL
         iTInToAXCDZdMuI/yAmyvr1xn529Z6vtshyZxnWWWtSoYwXn86aRdJLh4MGy/eXFvMgH
         g/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBN+Jj2p9/xokOTy5sTl/d2GWekgst6am6ywMyD2yyEAotwp+uF1RZ7/PBCExAKhfGp58Kh3DS4tM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+BAaosJj5OP1vzWlFaoKCFwYK6P43+lukapo+y21W2Y3sanvp
	uYWxE5i0hswTwFH6O9EYiK5IvfXVNxttG0pwP9cLS5c83roDPsPmox2ddLnuUsCP3Cx7GQRl7IK
	wC36n9bFOqQ2CnHJ49DUtER+0eY7B4FEa
X-Google-Smtp-Source: AGHT+IHwEwmqX5mmkSC2ugb4+419q36YdI/qjVqNttyenpryWwP78K4OzRqBdhnwlYm7Wbk+o1S1XR1Vptx0aoewPzs=
X-Received: by 2002:a17:90b:4c12:b0:2da:82d4:c63c with SMTP id
 98e67ed59e1d1-2e27dd3c2c0mr3501356a91.4.1728368749477; Mon, 07 Oct 2024
 23:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240905055333.2363358-1-linchengming884@gmail.com>
 <20240905055333.2363358-2-linchengming884@gmail.com> <20241001114039.67bab21e@xps-13>
 <CAAyq3SbP4kSW47ZaT7V9ZzeHauj_EwfU5GPipZjNK6j69qm7Vw@mail.gmail.com> <20241007103331.55f37dcb@xps-13>
In-Reply-To: <20241007103331.55f37dcb@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 8 Oct 2024 14:25:25 +0800
Message-ID: <CAAyq3SaZKMqJrv7caVwO0+u+nk8JWZ8qTRHdUqQOfQhx9gBF7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nand: Add fixups for read retry
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_232551_052547_F7725CD6 
X-CRM114-Status: GOOD (  16.21  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQxMOaciDfml6Ug6YCx5LiAIOS4i+WNiDQ6MzPlr6vpgZPvvJoKPgo+IEhpIENoZW5n
IE1pbmcsCj4KPiA+ID4gPiBAQCAtMzI1LDcgKzM3Myw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3BpbmFuZF9pbmZvIG1hY3Jvbml4X3NwaW5hbmRfdGFibGVbXSA9IHsKPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFu
dHMpLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICBTUElOQU5EX0hBU19RRV9CSVQsCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxh
eW91dCwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG14MzVsZjFn
ZTRhYl9lY2NfZ2V0X3N0YXR1cykpLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbXgzNWxmMWdlNGFiX2VjY19nZXRfc3RhdHVzKSwKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgU1BJTkFORF9GSVhVUFMoJnJlYWRfcmV0cnlfZml4dXBzKSksCj4gPiA+ID4gICAg
ICAgU1BJTkFORF9JTkZPKCJNWDM1VUYxR0U0QUMiLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4OTIsIDB4
MDEpLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICBOQU5EX01FTU9SRygxLCAyMDQ4LCA2NCwg
NjQsIDEwMjQsIDIwLCAxLCAxLCAxKSwKPiA+ID4KPiA+ID4gSSBleHBlY3QgYSBwYXRjaCB0YXJn
ZXRpbmcgdGhlIGNvcmUgZmlyc3QsIGFuZCB0aGVuIHRoZSBjaGFuZ2VzIGluIHRoZQo+ID4gPiBN
YWNyb25peCBkcml2ZXIuCj4gPgo+ID4gR290IGl0LCBzbyBkbyB5b3UgcHJlZmVyIHRoYXQgd2Ug
c3dpdGNoIHRvIHVzaW5nIGZsYWdzIGluc3RlYWQ/Cj4KPiBOb3QgbmVjZXNzYXJpbHksIGRpZCBJ
Pwo+Cj4gLi4uCj4KClVzaW5nIGEgZmxhZyBpbnN0ZWFkIG9mIGZpeHVwcyBhbGxvd3MgdGhpcyBw
YXRjaCB0byB0YXJnZXQgdGhlIGNvcmUgZmlyc3QsCmFuZCByZWR1Y2VzIGNoYW5nZXMgaW4gdGhl
IE1hY3Jvbml4IGRyaXZlci4KCj4gPiA+ID4gICAgICAgY29uc3Qgc3RydWN0IHNwaW5hbmRfbWFu
dWZhY3R1cmVyICptYW51ZmFjdHVyZXI7Cj4gPiA+ID4gICAgICAgdm9pZCAqcHJpdjsKPiA+ID4g
PiArICAgICBpbnQgcmVhZF9yZXRyaWVzOwo+ID4gPgo+ID4gPiBBbnkgcmVhc29uIHRvIGtlZXAg
dGhpcyB2YXJpYWJsZSBzaWduZWQ/Cj4gPgo+ID4gTm8sIHdlIGNhbiBzaW1wbHkgY2hhbmdlIGZy
b20gaW50IHRvIHU4Lgo+Cj4gSnVzdCB1bnNpZ25lZCBpbnQgaXMgZmluZS4KPgoKU3VyZSwgdGhh
bmtzIQoKPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
