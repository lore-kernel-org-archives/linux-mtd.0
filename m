Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A53BC25B75
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zueontbykXia+7IOX2XCPWyTlTEg3bQkQfF2vfp0VFg=; b=MFZvESY/vtmnJR
	NSDE3dXTD9bmxnDnIR0inaXvgZjjQo1nUounXGAe35PF6Jw0/gaNmM7OvPohuBiSfDRk9ASO3TN+I
	DjC7eHksadv/IGyAKbujBJ0NPk9rq0QKhLsQZJrYDGDOAdVS8gYrmZySYDxS92r5sNNu07oJ5ra/g
	6IRni9X3JWMCpCj2bDixTPWhfI6XSYqmbiw/Lg0SeB64RaNdYCKwDxyIFjytbO4mdFZefQwH+brFh
	r7f/on0F8HJvPZ36zWQJeB6C/iBomJA6zPQ0ThvGeeNAQWqfkoTOVaapr6rn/eAg1+mxrSGi9L7Ur
	M3Px7/w9JrQZOL0YPZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJJP-00000000qyz-1RP3;
	Tue, 04 Jun 2024 01:50:07 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJJM-00000000qxt-2YqS
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 01:50:05 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-6c4829d7136so454433a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2024 18:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717465801; x=1718070601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H4pqXxRrCq0m6vBhnz6FgDbkFxYIi3HVFe5Ghw4J1I=;
        b=aiqTV6u40Epb3AYM3bFbGNb0bU0GVa+q48ZmGuGCm7ldZfUVFCFRFBNxnTGjtPn2yr
         Hsi7FoAtqs1axOHA0R/YfGEZvdbV0hP9XOaPuVUO/m61COiZUvt7uma7WC4G0LnEJBBV
         cHG2hLrAZlACkei6rvldQmyZSfHqIbeqA8HV/iLCK0gfq2yfRj5m1IPkXJ20gippjNdy
         zhBBLZ7Me3qn/XdGk1p2eihq55xmtvUQCN8vcNDo2DA7rDWiiTq2z6AGiZ3GvRrs/ofq
         TSJrq0WIIOiCAO8LxvIry9cfxeYJw9OI2BM+sD/GiFIps32pypFbgI8ne+y0sgrrXgQy
         EdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717465801; x=1718070601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+H4pqXxRrCq0m6vBhnz6FgDbkFxYIi3HVFe5Ghw4J1I=;
        b=DCWUStrmuerqxOuxUB99KVQpBQpekDRKHUuacqkpPxEPMRdEv/5PPVcY81e/a/MRCj
         TC6YUOCahTPAe095RsQ5TwqAerT0qlPhkwppu0+A0CC9R+ioM5u7RnrLxf37TyxRLjCy
         034TMf0IjAHGWIuinmkWbeSf4C2zasdVe0FKy/SE4QsvPa+slyC5gFW4kuMddjg4fx44
         0aSGcNyaev7t4OmULxZJupX0Xmz7pyG4x/lVlbkH86VeCjOM7R0k9teRzBEyCBv0hUQq
         udexaQ/H2zPqiKYapPjjcS+fbo4fST9UuyCcqXwkT/5Dk8SEGGzuFh6z7wLbFYLUtjqG
         O/XA==
X-Forwarded-Encrypted: i=1; AJvYcCVza7i9fv9BAUN2wWP/KYGOfWbPN3/IJ3ehGOTFq88MUrSMbKN0mBh6aXstpizqlZVwJ/Pcl7ew0QPgwKRY43ir9WdM80D6/MlJ2miOnw==
X-Gm-Message-State: AOJu0YwZTVaczYweC9YiFnCYjQ8vvIb6PvOYbtBtiacguZxgn3k54RNm
	jdoipqzQsFQ11MkEx8+2l+fqSRFvQQkbpRRXF+S+RjmMRe8nErXwFEs4O4vTY/2YEDKnyoYAKtV
	QRNUdGJWPRRYOs1tzj4ULfJpM2zw=
X-Google-Smtp-Source: AGHT+IGcmMOxhyhO2/DrwQCt3Fcy8+rw8TRx36jgT/jXnxHEGeMRYs2KzXjAawrlomZM/k++yduuh+BE0QPcZU1zZ1Q=
X-Received: by 2002:a17:90a:71c6:b0:2c0:117e:42ae with SMTP id
 98e67ed59e1d1-2c1dc56ccbbmr9442988a91.5.1717465800832; Mon, 03 Jun 2024
 18:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240603073953.16399-1-linchengming884@gmail.com>
 <2024060337-relatable-ozone-510e@gregkh> <20240603151854.4db274a6@xps-13>
In-Reply-To: <20240603151854.4db274a6@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 4 Jun 2024 09:49:35 +0800
Message-ID: <CAAyq3SaGPLkuiFw8ApjkWKvnoqiwsADs7pw07U1LA4bDPOa_Vg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: mtd: spinand: macronix: Add support for
 serial NAND flash
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, dwmw2@infradead.org, 
	computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_185004_682759_D83F61A6 
X-CRM114-Status: GOOD (  18.15  )
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

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiDmlrwgMjAy
NOW5tDbmnIgz5pelIOmAseS4gCDkuIvljYg5OjE55a+r6YGT77yaCj4KPiBIaSwKPgo+IGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlIG9uIE1vbiwgMyBKdW4gMjAyNCAwOTo1ODoyMyAr
MDIwMDoKPgo+ID4gT24gTW9uLCBKdW4gMDMsIDIwMjQgYXQgMDM6Mzk6NTNQTSArMDgwMCwgQ2hl
bmcgTWluZyBMaW4gd3JvdGU6Cj4gPiA+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmds
aW5AbXhpYy5jb20udHc+Cj4KPiBUaGUgdGl0bGUgcHJlZml4IGNvbnRhaW5zICJEb2N1bWVudGF0
aW9uOiAiLCBidXQgSSBkb24ndCBzZWUgYW55dGhpbmcKPiByZWxhdGVkIGluIHRoZSBkaWZmLgo+
CgpJdCBzZWVtcyB0aGVyZSB3YXMgYW4gb3ZlcnNpZ2h0IHdpdGggdGhlIHRpdGxlIHByZWZpeAoi
RG9jdW1lbnRhdGlvbjogIjsgd2UgaW5hZHZlcnRlbnRseSBpbmNsdWRlZCBpdC4KV2UnbGwgbWFr
ZSBzdXJlIHRvIGNvcnJlY3QgdGhpcyBpc3N1ZS4KCj4gPiA+Cj4gPiA+IE1YMzVVRnsxLDIsNH1H
RTRBRCBhbmQgTVgzNVVGezEsMn1HRTRBQyBoYXZlIGJlZW4gbWVyZ2UgaW50bwo+ID4gPiBMaW51
eCBrZXJuZWwgbWFpbmxpbmUuCj4gPgo+ID4gVHJhaWxpbmcgd2hpdGVzcGFjZSA6KAo+ID4KPiA+
ID4gQ29tbWl0IElEOiAiYzM3NDgzOWY5YjQ0NzUxNzNlNTM2ZDFlYWRkZmY0NWNiNDgxZGJkZiIu
Cj4gPgo+ID4gU2VlIHRoZSBrZXJuZWwgZG9jdW1lbnRhdGlvbiBmb3IgaG93IHRvIHByb3Blcmx5
IHJlZmVyZW5jZSBjb21taXRzIGluCj4gPiBjaGFuZ2Vsb2cgbWVzc2FnZXMuCj4gPgo+ID4gPiBG
b3IgU1BJLU5BTkQgZmxhc2ggc3VwcG9ydCBvbiBMaW51eCBrZXJuZWwgTFRTIHY1LjQueSwKPiA+
ID4gYWRkIFNQSS1OQU5EIGZsYXNoIE1YMzVVRnsxLDIsNH1HRTRBRCBhbmQgTVgzNVVGezEsMn1H
RTRBQyBpbiBpZCB0YWJsZXMuCj4gPiA+Cj4gPiA+IFRob3NlIGZpdmUgZmxhc2hlcyBoYXZlIGJl
ZW4gdmFsaWRhdGUgb24gWGlsaW54IHp5bnEtcGljb3plZCBib2FyZCBhbmQKPiA+ID4gTGludXgg
a2VybmVsIExUUyB2NS40LnkuCj4gPgo+ID4gV2hhdCBkb2VzIDUuNC55IGhhdmUgdG8gZG8gd2l0
aCB0aGUgbGF0ZXN0IG1haW5saW5lIHRyZWU/ICBJcyB0aGlzCj4gPiB0ZXN0ZWQgb24gb3VyIGxh
dGVzdCB0cmVlPwo+ID4KPiA+IHRoYW5rcywKPiA+Cj4gPiBncmVnIGstaAo+Cj4KPiBUaGFua3Ms
Cj4gTWlxdcOobAoKUmVnYXJkcywKQ2hlbmcgTWluZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
