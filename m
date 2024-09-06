Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABF3CE7B0C
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/UIx3NoE7TRlPyua0sn5SH0UDNCQS8pCRxRSCHWOso=; b=VAdRBM/Mbf74bv
	CzJ03n5Zp+oHUzDTxz3D6ip8zm7AdnfFy74D6hAb1tUuK2hT6Cqo9wFgOV0c2wpdHmJYJO9X6ukM3
	WOZwkcNa6DPOQT8+7i/XfcZ4AWbtn7ETXIXjd64sD1kNKrdrB/CMgnZ36V2BAANCEK2mmdDy4xvum
	gH6YcsqhRp+r9RCGTqov3EvHGf2ZFdx2pc/irvNxsbA0T4xPaGFUxVhEeFxu6zsoI5IpcvhEY5SAI
	2IL5Drhka9ekdVobNiMOAcb5JV5Mv8QJ1BXBLrf8tTbhy5QBZvVDqq3e4J444qXvr4ynCrZiMclAW
	XUitjI5DsgQcbEbglg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbeF-0000000Cw0k-39uk;
	Fri, 06 Sep 2024 16:17:23 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbMN-0000000CsA2-2VMj
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:58:57 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f75428b9f8so12581931fa.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2024 08:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725638333; x=1726243133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkBnq8mCYswULg3UnuBHVuyOVLf+1JP2qRJpgPT1EGI=;
        b=bLFceRdRz7OlwMEed7rjkf/jaCXT8F/yvBSX80F93sFrsnsPRrcKhSk4iFYuccPtO5
         kXeUaaDGneweOQRv1ibW0hfRvAkzviapcEyKBb4M4AQp81Vym9AK6DalmwwvVXQ+3yxg
         zLcsNQHqIh9tOoKapCkdvEj2EKiZtjRgci0yU0NJnlPVMVkJ09yRrf8ffXi9kD7KEF4y
         eTH9Q1F2KiCvVDJRCFeYiOMpa9M9UknzGHtIyMg1EVZjkKIKYOCMcy8d5nn+gJGdg+tI
         k1eosb978MoFVAojsEc4dIY/1r6o6GtgXuPOJQl4zyYAoBy/2yDIrlf5/nXC7yk65Lkc
         OxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725638333; x=1726243133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkBnq8mCYswULg3UnuBHVuyOVLf+1JP2qRJpgPT1EGI=;
        b=MouCgAnKZ5Ek9X1FjVv1zMwwtg90u/DNGkZscu4ehhUkmvoz6VlObOCWFLlw67SLQG
         5Wbm3y3J5KhD4cHur6G6hAkMeBIP0oyX6rkbS72wXT8+pNNfvvRJOntctugM/ja6fqA8
         +QGnrwoX/+UHtQR5g0DXiX8SQPAaUueGhDVHpjRSzsLFnEOE7hP4Y9Gm7afKecayf8Bo
         JBm3bMaDEY5Fck/1Rjj/4T0r9KtaNR+q22/1mjjxNLrf/6a3hDwBqyy6qD7zBxQhXSL5
         xWEBbSPxnG/mCeneH5ELvpW07RS2bLXXvaiUcs4qExkjtXd0tZ9Hej8fzf1bzBYYn2G1
         teSw==
X-Forwarded-Encrypted: i=1; AJvYcCXsJ7bitswGWIc/JYcMil+PMJZE5/fDjSNBmbYOvCyc/m8KdsIu/yzY33JW6iCIUad1jiHspLtaipg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMjDePH5XXv6TKjrp58TIFXicSFXXKt7V0eCCBih8bgGj/mt0s
	DClXLJobimv2TelWgPW7m9mi6undZNvZFeaEiX4xfHt1L65tpTGjB+oTo11wT6stMTHh/igj55r
	EyVLr/tAe9hc65mtQM3zLFk3xRp4=
X-Google-Smtp-Source: AGHT+IELSS3bZ4hLfoiN6Bml8bncyscvpkAlgKf97dNuUKWoVA/xzJn1XTNOg2ZS7PaKeAw4pxcrbYUjFq0bijemQkE=
X-Received: by 2002:a05:651c:4cb:b0:2f6:c683:553d with SMTP id
 38308e7fff4ca-2f6c6835665mr58864291fa.15.1725638332154; Fri, 06 Sep 2024
 08:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240905122020.872466-6-ubizjak@gmail.com> <20240906151021.736425-1-miquel.raynal@bootlin.com>
In-Reply-To: <20240906151021.736425-1-miquel.raynal@bootlin.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 6 Sep 2024 17:58:39 +0200
Message-ID: <CAFULd4ZwEcv-KZSpoQznMvd2wZBqAvqvr_JzK7fboR_Ec6721g@mail.gmail.com>
Subject: Re: [PATCH 05/18] mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_085855_655104_297047F2 
X-CRM114-Status: GOOD (  12.08  )
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

T24gRnJpLCBTZXAgNiwgMjAyNCBhdCA1OjEw4oCvUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIwMjQtMDktMDUgYXQgMTI6MTc6
MTMgVVRDLCBVcm9zIEJpemphayB3cm90ZToKPiA+IFVzYWdlIG9mIHBzZXVkby1yYW5kb20gZnVu
Y3Rpb25zIHJlcXVpcmVzIGluY2x1c2lvbiBvZgo+ID4gPGxpbnV4L3ByYW5kb20uaD4gaGVhZGVy
IGluc3RlYWQgb2YgPGxpbnV4L3JhbmRvbS5oPi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBVcm9z
IEJpemphayA8dWJpempha0BnbWFpbC5jb20+Cj4gPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0Pgo+ID4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiA+
IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Cj4gQXBwbGllZCB0byBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10
ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwsIGlzIGl0IHBvc3NpYmxlIHRvIGp1c3QgQUNLIHRoZSBw
YXRjaCBmb3Igbm93PyBUaGUgc2VyaWVzCnRvdWNoZXMgbWFueSBwYXJ0cyBvZiB0aGUga2VybmVs
LCBzbyBJIGd1ZXNzIGl0IGlzIGJlc3QgdG8gaGFydmVzdApBY2tlZC1ieTpzIGluIHRoaXMgc3Rh
Z2Ugb2YgZGV2ZWxvcG1lbnQgYW5kIGNvbW1pdCBhbGwgdGhlIHBhdGNoZXMKc29tZSB0aW1lIGFm
dGVyIHRoZSBtZXJnZSB3aW5kb3cuIFRoaXMgd2lsbCBhdm9pZCBtZXJnZSBjb25mbGljdHMgd2l0
aAp0aGUgc2VyaWVzLgoKVGhhbmtzLApVcm9zLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
