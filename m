Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB6C54EE9
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Sep 2022 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8P3+oZUcdZiIQ3bSyXtUML9CGmzOiNm9xLueqQQGn1E=; b=Kgt/l3JV2drBT0
	SkxPL9ftk2IhkHq5KkraHcGiww5HFphEPz8B/S9A0aqJZbml/VJNpKaOoBL96aoHrIO5tc0Ni8KO8
	yAhagj/+bQMKAjwMaG5/IeiqEuiNubcTxqlrDgNx3waC4f+NJNl8JuwtvBPQZEfQPtG1cOTWrMA47
	DwB8o7y1K5s20ymx1ku4GYNZ0CQSN9R8n0H3AwFgQKwABy6sjGAuQLOAEQj9WLkJVC9aOUPxJVmx7
	Y6qVqYQX/dOT2Re4MA++2WRvonP0qENkP/xb57tGkKyHiTKmrFcxbLv8CCUnfBKNkUgrHMTk5YCgG
	dNGjKalVoUeqdPRzWrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUvSm-00AVYJ-1k; Sun, 04 Sep 2022 19:39:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUvSg-00AVSm-JO
	for linux-mtd@lists.infradead.org; Sun, 04 Sep 2022 19:39:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id x73so1947656ede.10
        for <linux-mtd@lists.infradead.org>; Sun, 04 Sep 2022 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stonybrook.edu; s=sbu-gmail;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=4ghNav2kIKIBt3QU6iZUN10E/wXCghQzHSR2iVOpt10=;
        b=b/cr4sS+eCMc8AgUN+YAWRss1v0EPAFi00LmwW8UpcY4u3uC1vI3COmD1aZWnhng6h
         s3k6YagsCLtlXZa2tiBqAPshkLr30rHgOAeV5aK++MFBC8BiS0Soa2blQFwUNtt0EY61
         t0TgjfFcwd9+OqT6iQhTGXlpN4m10ndUsdFPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4ghNav2kIKIBt3QU6iZUN10E/wXCghQzHSR2iVOpt10=;
        b=pjkNDxUR5JOCm3ZZTz8qRYYZ6+XEybs1p9E1Dw17ENy9VFOwFMB90y9RecaieQM8kC
         MG6Lqi9ie0cbVHJAIm8CHMXG6XvQXv9mQ+1HjKm7z2nWgkGGJjzLtqiHhlCqV1Y5WpkE
         /rLb0xaoxcE1ijeglKjmoDPlJ6ExnDqN00G+kqCdjjaU0/YZvqt+rZmitdiRNyTQSX3S
         JXcB5H+kbkyInlHF+ebQVh6whi92FL+LxRoeAfFLM3vUBz/0wC5FSipHcf4ecCxjP/Pv
         e/lufKA/hUgZqiY3xe04MgVjGk8x5rfP2lxlW9jzUd2XcYPlwC257JJSnV4fZXx8Jslj
         GxoQ==
X-Gm-Message-State: ACgBeo07yuw3rFq4tFqr2rGTqHqSccpPh4CUfQwNvAAWWIQFJzogTQ8x
	4DDCqCub+XHfuqawPQ5Zek2WRqCsiRqdla3SI01OWg==
X-Google-Smtp-Source: AA6agR67sB9aVc+ydN8FHz9obKc1oVcHATjW/BX3+KSidLP4D3TGQCh1gF/h0G36KOp+nM47j4zRzdSEM+VuO7Kdtc8=
X-Received: by 2002:a05:6402:40c3:b0:442:d798:48ad with SMTP id
 z3-20020a05640240c300b00442d79848admr40533402edb.154.1662320356154; Sun, 04
 Sep 2022 12:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220803155315.2073584-1-yifeliu@cs.stonybrook.edu>
 <PH0PR10MB46153A784F27AE96DA69120DF46E9@PH0PR10MB4615.namprd10.prod.outlook.com>
 <513220739.132330.1661149559308.JavaMail.zimbra@nod.at>
In-Reply-To: <513220739.132330.1661149559308.JavaMail.zimbra@nod.at>
From: Yifei Liu <yifeliu@cs.stonybrook.edu>
Date: Sun, 4 Sep 2022 15:39:05 -0400
Message-ID: <CABHrer3ho5aAWN4KNSwF3iP=+4uLA1y9-=oF9-GzOwFewzK9Qw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: correct logic when creating a hole in jffs2_write_begin
To: Richard Weinberger <richard@nod.at>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, ezk@cs.stonybrook.edu, 
	madkar@cs.stonybrook.edu, David Woodhouse <dwmw2@infradead.org>, 
	Matthew Wilcox <willy@infradead.org>, Kyeong Yoo <kyeong.yoo@alliedtelesis.co.nz>, 
	linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_123918_879145_347E0582 
X-CRM114-Status: GOOD (  10.91  )
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

QSBnZW50bGUgcmVtaW5kZXIuCgpCZXN0IFJlZ2FyZHMsCllpZmVpCgpCZXN0IFJlZ2FyZHMsCllp
ZmVpCgoKT24gTW9uLCBBdWcgMjIsIDIwMjIgYXQgMjoyNiBBTSBSaWNoYXJkIFdlaW5iZXJnZXIg
PHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0t
LS0KPiA+IFZvbjogIkpvYWtpbSBUamVybmx1bmQiIDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJh
LmNvbT4KPiA+IEFuOiAiWWlmZWkgTGl1IiA8eWlmZWxpdUBjcy5zdG9ueWJyb29rLmVkdT4KPiA+
IENDOiBlemtAY3Muc3Rvbnlicm9vay5lZHUsIG1hZGthckBjcy5zdG9ueWJyb29rLmVkdSwgIkRh
dmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVhZC5vcmc+LCAicmljaGFyZCIKPiA+IDxyaWNo
YXJkQG5vZC5hdD4sICJNYXR0aGV3IFdpbGNveCIgPHdpbGx5QGluZnJhZGVhZC5vcmc+LCAiS3ll
b25nIFlvbyIgPGt5ZW9uZy55b29AYWxsaWVkdGVsZXNpcy5jby5uej4sICJsaW51eC1tdGQiCj4g
PiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiA+IEdlc2VuZGV0OiBTb25udGFnLCAyMS4gQXVndXN0
IDIwMjIgMjA6MjE6MDQKPiA+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIGpmZnMyOiBjb3JyZWN0IGxv
Z2ljIHdoZW4gY3JlYXRpbmcgYSBob2xlIGluIGpmZnMyX3dyaXRlX2JlZ2luCj4KPiA+IFdoYXQg
aGFwcGVuZWQgd2l0aCB0aGlzIHBhdGNoPyBMb29rcyBsaWtlIGEgaW1wb3J0YW50IGZpeCBidXQg
SSBkb24ndCBzZWUgaXQKPiA+IGFwcGxpZWQgPwo+Cj4gSXQgd2lsbCBiZSBwYXJ0IG9mIHRoZSBu
ZXh0IGZpeGVzIFBSIGFmdGVyIEkgaGFkIGEgY2hhbmNlIHRvIHJldmlldyBpdC4KPgo+IFRoYW5r
cywKPiAvL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
