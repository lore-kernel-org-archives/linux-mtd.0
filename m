Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1104BE77188
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2024 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4/L7vurFDC5xy7lGK5DSAqfU7J7BS9+gIkgEWgOGGc=; b=ehB13bZ//C0154
	ficnc49y9lNHDIb/dKeFShFJHqgW6bRXR07Oxb6MSZvvERDsziH7kMgDaGOMKojnSCSeton9XMZZJ
	CUWHUiaI8UyGasYpCQVVpV4OdhIE4I77+vIqHoJD7lGe+r2DShej9xzgdO+oNZdusIFssh+Qqn0YN
	W4tPPXOdfiyjb7u/jFUQgbFLFRQmRdv9/4K4GY7E+Ug3xV1oWZOkTFH0N814zd6SPSB3fRH00nnB1
	8ZiTgGZxJDuYdNYYBNQ8zWKxrh2nADGHihb3KA0uJube91xm2U2ZVgU1l+rUieC4Da144WD3pYNjJ
	ob56Utt+816oHl/2xb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZLF-00000004Qmh-0VFo;
	Fri, 20 Dec 2024 09:30:41 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZLC-00000004QmC-0XX3
	for linux-mtd@lists.infradead.org;
	Fri, 20 Dec 2024 09:30:39 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-728e1799d95so1990789b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2024 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734687037; x=1735291837; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByXi/X5ENmiNNt5+6rwHFixmOfwBVaDYK2KBq4o/HRw=;
        b=fBExJS0RccWCfLcNZhX92zvYHU1X+N73veoSWtTUgbmIo6IN1CUj4gXLBY0z8dnpu5
         4/XQtSj1LmjZJn65dVEWFQLnnn72W9rDEg1HEI6Ku9dFjWJmkExHlJbWz4ZKUs0ir65J
         f9L14UhC+Cb04bWo3A+Q5Lb2gszGoQs9Xx72Swx0Ew5gq8J3kRgXVFXcr1MrveRw2UV8
         Vo4mxyfr5L9j+P2v6gBGTkzF1joledY6Kl57v9XIzPCFwKZq+cwcpieSD9vMkixFf8+R
         Ojt+XTE3N05WXNvhDtuucP8yVaAPTWi38+1IlJu20oN5DCwsFn8kV/VXUJz4VZ0cFssS
         yEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687037; x=1735291837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByXi/X5ENmiNNt5+6rwHFixmOfwBVaDYK2KBq4o/HRw=;
        b=omQaCdgiTwzVyT6nAfU3eg1QnLOj6REDkU9IBp5bkT64K6nyZmVNUa0bf0P3xG/t8F
         42lxplHYxdbkcG7lrxhPjNIYZaS+gepmTLNXQ23JFN3d92YjgR6Sfn1cm1dOazpqzc4b
         16YTYNr3yFf3PTFVbfO7R7+8+5NQNOBYK7O1hZnXgjg+WiF4CWWNfYhMijn7B/CVk59t
         NGLECbJKuox0jU5pbnGdSAADOYxAA9eIH3R6cMZGL1ka6WEEv0W9JJP+MYnoASbSdkPb
         z+FSwR3p6Q4HlwSK/UIXwQi3b/GysdsTsm2Hi+iBWYT8hLf21j0VHBanjXdFme4znuHL
         bVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP/GUH95XP5YHIF3ex4OX95EhuADRAMm4JURfgdl0UsglhZwWPKYNfrt7fW8kljHGiTVMTJH02R7o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJSvi686WB2aRJosYkCGSMcB0XjoZuToJZoGtT8WZmdI4Lg4m2
	uHtBy0JAwVgRfQgzpZ4ZR+uN4yDD8rJoq3KoUoNpwxaxHHlqeKG+l22CbxNp1g==
X-Gm-Gg: ASbGncueYzeZlm29vbAgwCakGWHa6OLxgAuCmZK+x72iNOzAagGqHBx2+9Wvhnu6Wk8
	rdBHiaitOuXitpjFfKA/TOHyJcOHGr/wzToxgYFxzPzHd4K+xpEH4oHAdHYj2XASTjElh5OJF1b
	FqWtZQBoguSMis0mwGwgPGbnf1f8IvtQ5ny2BdAEX13zHiTfv+rN25v7fJvJCh2DEMvAwOX/isO
	OJHZ4JoMoAoIy0xcnCYOBiY9WIF7H1eCmQcA7eo53isrlix6PLE4u9QbJw8BSdOSHIt
X-Google-Smtp-Source: AGHT+IF/Nb2ERdvtlBhMiFXyGT0KhA8msdwfPAqL4vPVA2znS47Bj667IM2h2pVbccmBK1in6s1Ncg==
X-Received: by 2002:a05:6a00:4098:b0:725:c8ea:b30a with SMTP id d2e1a72fcca58-72abde2ab0emr3170686b3a.14.1734687037472;
        Fri, 20 Dec 2024 01:30:37 -0800 (PST)
Received: from thinkpad ([117.193.209.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbad9sm2768017b3a.103.2024.12.20.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:30:37 -0800 (PST)
Date: Fri, 20 Dec 2024 15:00:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Message-ID: <20241220093029.z4zsr3owdnqll2vg@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_013038_172368_D0085096 
X-CRM114-Status: GOOD (  13.27  )
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

T24gRnJpLCBOb3YgMjIsIDIwMjQgYXQgMDI6Mjk6MzBQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiB2MjoKPiAgKiBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlCj4gICogQWRkZWQgc3RhYmxl
IGtlcm5lbCB0YWcKPiAgKiBBZGRlZCBGaXhlcyB0YWcKPiAgKiBSZW5hbWVkIHRoZSB2YXJpYWJs
ZSBmcm9tIG9mZnNldF9mcm9tX3FwaWMgdG8gbmFuZGNfb2Zmc2V0Cj4gICogU2V0IGJ1Zl9jb3Vu
dCB0byA1MTIgaW4gdGhlIHBhcmFtZXRlciBwYWdlIHJlYWQKPiAgKiBSZXBsYWNlZCB0aGUgYnVm
X2NvdW50IHZhbHVlIG9mIDUxMiB3aXRoIHRoZSBsZW4gaW4gYnl0ZXMgCj4gCj4gdjE6Cj4gICog
VGhlc2UgcGF0Y2hlcyB3aWxsIGZpeCB0aGUgZm9sbG93aW5nOgo+ICAqIDEpIG9uZmkgcGFyYW0g
cGFnZSByZWFkIHdoaWNoIHdhcyBicm9rZW4gYnkgZXhlY19vcCgpIHBhdGNoLgo+ICAqIDIpIEZp
eGVkIG9mZnNldCBwYXNzZWQgdG8gQkFNIGZyb20gUVBJQyBiYXNlCj4gCj4gTWQgU2FkcmUgQWxh
bSAoMyk6Cj4gICBtdGQ6IHJhd25hbmQ6IHFjb206IFBhc3MgMTggYml0IG9mZnNldCBmcm9tIFFQ
SUMgYmFzZSBhZGRyZXNzIHRvIEJBTQo+ICAgbXRkOiByYXduYW5kOiBxY29tOiBGaXggb25maSBw
YXJhbSBwYWdlIHJlYWQKPiAgIG10ZDogcmF3bmFuZDogcWNvbTogRml4IHJlYWQgbGVuIGZvciBv
bmZpIHBhcmFtIHBhZ2UKPiAKCkRvIHlvdSBwbGFuIHRvIHJlc3BpbiB0aGlzIHNlcmllcz8gRllJ
LCB0aGVzZSBhcmUgcmVncmVzc2lvbnMsIHNvIHNob3VsZCBnbyBpbgplYXJseSBhcyBwb3NzaWJs
ZS4KCi0gTWFuaQoKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgMjMgKysr
KysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4zNC4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j
4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
