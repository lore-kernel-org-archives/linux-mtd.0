Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1ABC47DD9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pfr6k2xNM40JklZ4j2ffqjoTLVHN8+NOctcvAN9AAMs=; b=hFtWSj+MLDEZz5
	YGX6xKzWtlxDK1lktMRn40R7ddZ3xXyynZ2+EH5bEjl3JthSBhGEHBV32VtKP7cKbf8xEHwNaWDY5
	/Fij/dXTnFTY2+wQhzQf+Cz4EgviED1DBpMNu+ibGwasgPLdv06WMoyPA7j04fv8+vHNCosEOXY+Z
	3iRnFzfnCMZPvniMChG0grbNw74UgOPXbsd9ppKfVp6yz9PiIu5/BI/mZdJFD9rEZwlndvnVFcSwZ
	z1V1P14/NOwYTs6B5TH7CSNgIxXb7dzz9bSOHTjyjVgKhs9b+Zq9llfRJc/DPLX7qHjPUkwUpT+cD
	iYVZxZTRC8Wet2L+a3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngSP-00000007gYB-2kPt;
	Fri, 22 Mar 2024 15:05:21 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngSL-00000007gWJ-2DjS
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 15:05:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e6082eab17so1667739b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 Mar 2024 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711119915; x=1711724715; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYtRMDTbG4RNH7nK1yI7ROk5/pYQnmRT4k34XSD/fpw=;
        b=X8KSjagzHn2O8VMaRqOqj5gppPuQe7jbFeZ24P+s5xmUmmFVVHOAcfAh8IUG8UWduj
         4yyxM4WW75U+ez56XayfN+SIAB/iG1Hwx6pA2LLEklFlZR1fpxeD/E5j4TCbYNsvQPX+
         HBOK4HkIgket6WPOOZZUNPMMe7TGxN0YqA2IXaFLfgVMkvwk7gwNvocBtrDcl8rTRptc
         DUD9fDN5uRcHTZG4i28Qiju6iSJS+VikZVH81xQ6/YQly0ih3JjCTwZ9reSnYXnSEgR0
         BeKgk98pE8UjceRz8SVkNRusG4WPxmscpW1afwR2ntdHjN0YF5ZHgBt99STAF+UJ/b+o
         PwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711119915; x=1711724715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYtRMDTbG4RNH7nK1yI7ROk5/pYQnmRT4k34XSD/fpw=;
        b=Jtvf2gMt+t7EOnj7ylWca8aGb2UIsoHnyx5npPEhPnrdbedlPwmpoqprSB22spbYEC
         TJxvIVE+eY17S23x8sIxTT36nKi5CnjvrcAfVP+6DD5mFOgJgOZhthvZpNAE6Hdvxr3B
         EjcJXQ2tDLZAXj1m+vf3N6jCkl9Q5fBdV7nch+ZmoQyc8Fbq4L/xTQntzfzbhIxwDjRA
         B1ZWDAJ7JGF0DyIvpKM/3whY3l418x459naJEv1whNdoawcaIUfWLRy8MX2t3LdEC1KI
         ejfZrtuPaXZULPcCWCJfgRIHI5NIjdMVbG5ryX5qckiCnSWLb+dp/1B2L9Ukf4a56OTZ
         q6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW5y3XHZJEHtEn3WWhJ0f0Eue8dXXdEhs32H5WQ+PrVPgJptUA0UngE7QeaG4Ieu7Eq/d5bnDSg3vnsqicagS5cBuieu7OXRMvlRaQDLA==
X-Gm-Message-State: AOJu0YxVmpUt45tP7FXx1i/kJ5sYb/C101TMDXbKuGxWVhENonY99+yE
	OYf8xMz7g5JJXnQ2JnJciQuDreWcggRB9pJd9gr0BVpwD+EhDIatVr93FuUYAA==
X-Google-Smtp-Source: AGHT+IGYbQybiUZqXzRNwAr1M/pqxdrMdugBVhGSQDcs2L60R2/mNWIyHVBayTYGU3wCM5UA6L13jA==
X-Received: by 2002:a17:90a:ff95:b0:29f:9548:4932 with SMTP id hf21-20020a17090aff9500b0029f95484932mr2430080pjb.3.1711119914819;
        Fri, 22 Mar 2024 08:05:14 -0700 (PDT)
Received: from thinkpad ([103.28.246.103])
        by smtp.gmail.com with ESMTPSA id x20-20020a17090abc9400b0029dd7b52d1bsm5604576pjr.56.2024.03.22.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 08:05:14 -0700 (PDT)
Date: Fri, 22 Mar 2024 20:35:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix broken misc_cmd_type in exec_op
Message-ID: <20240322150510.GC3774@thinkpad>
References: <20240320001141.16560-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240320001141.16560-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_080517_648209_3AE2FED9 
X-CRM114-Status: GOOD (  21.45  )
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

T24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMDE6MTE6MzlBTSArMDEwMCwgQ2hyaXN0aWFuIE1hcmFu
Z2kgd3JvdGU6Cj4gbWlzY19jbWRfdHlwZSBpbiBleGVjX29wIGhhdmUgbXVsdGlwbGUgcHJvYmxl
bXMuIFdpdGggY29tbWl0IGE4Mjk5MGM4YTQwOQo+ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQg
cmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBhdGgiKSBpdCB3YXMKPiByZXdvcmtlZCBh
bmQgZ2VuZXJhbGl6ZWQgYnV0IGFjdHVhbGx5IGRyb3BwZWQgdGhlIGhhbmRsaW5nIG9mIHRoZQo+
IFJFU0VUX0RFVklDRSBjb21tYW5kLgo+IAo+IFRoZSByZXdvcmsgaXRzZWxmIHdhcyBjb3JyZWN0
IHdpdGggc3VwcG9ydGluZyBjYXNlIHdoZXJlIGEgc2luZ2xlIG1pc2MKPiBjb21tYW5kIGlzIGhh
bmRsZWQsIGJ1dCBiZWNhbWUgcHJvYmxlbWF0aWMgYnkgdGhlIGFkZGl0aW9uIG9mIGV4aXRpbmcK
PiBlYXJseSBpZiB3ZSBkaWRuJ3QgaGFkIGFuIEVSQVNFIG9yIGFuIE9QX1BST0dSQU1fUEFHRSBv
cGVyYXRpb24uCj4gCj4gQWxzbyBhZGRpdGlvbmFsIGxvZ2ljIHdhcyBhZGRlZCB3aXRob3V0IGNs
ZWFyIGV4cGxhaW5hdGlvbiBjYXVzaW5nIHRoZQo+IGVyYXNlIGNvbW1hbmQgdG8gYmUgYnJva2Vu
IG9uIHRlc3RpbmcgaXQgb24gYSBpcHE4MDZ4IG5hbmRjLgo+IAoKSW50ZXJlc3RpbmcuIEkgYmVs
aWV2ZSBBbGFtIHRlc3RlZCB0aGUgcmV3b3JrIG9uIElQUSBwbGF0Zm9ybXMgYW5kIG5vdCBzdXJl
IGhvdwppdCBnb3QgbWlzc2VkLgoKPiBBZGQgc29tZSBhZGRpdGlvbmFsIGxvZ2ljIHRvIHJlc3Rv
cmUgUkVTRVRfREVWSUNFIGNvbW1hbmQgaGFuZGxpbmcgYW5kCj4gZml4IGVyYXNlIGNvbW1hbmQu
Cj4gCgpUaGlzIHNvdW5kcyBsaWtlIHR3byBpbmRlcGVuZGVudCBmaXhlcywgbm8/IFBsZWFzZSBz
cGxpdCB0aGVtIGludG8gc2VwYXJhdGUKcGF0Y2hlcy4KCi0gTWFuaQoKPiBGaXhlczogYTgyOTkw
YzhhNDA5ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBl
eGVjX29wIHBhdGgiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA3ICsrKy0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jCj4gaW5kZXggYjA3OTYwNWM4NGQzLi5iOGNmZjkyNDBiMjggMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTI4MTUsNyArMjgxNSw3IEBAIHN0YXRpYyBpbnQg
cWNvbV9taXNjX2NtZF90eXBlX2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qgc3Ry
dWN0IG5hbmRfc3ViCj4gIAkJCSAgICAgIGhvc3QtPmNmZzBfcmF3ICYgfig3IDw8IENXX1BFUl9Q
QUdFKSk7Cj4gIAkJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0RFVjBfQ0ZHMSwgaG9zdC0+Y2Zn
MV9yYXcpOwo+ICAJCWluc3RycyA9IDM7Cj4gLQl9IGVsc2Ugewo+ICsJfSBlbHNlIGlmIChxX29w
LmNtZF9yZWcgIT0gT1BfUkVTRVRfREVWSUNFKSB7Cj4gIAkJcmV0dXJuIDA7Cj4gIAl9Cj4gIAo+
IEBAIC0yODMwLDkgKzI4MzAsOCBAQCBzdGF0aWMgaW50IHFjb21fbWlzY19jbWRfdHlwZV9leGVj
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ygo+ICAJbmFuZGNf
c2V0X3JlZyhjaGlwLCBOQU5EX0VYRUNfQ01ELCAxKTsKPiAgCj4gIAl3cml0ZV9yZWdfZG1hKG5h
bmRjLCBOQU5EX0ZMQVNIX0NNRCwgaW5zdHJzLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gLQkocV9v
cC5jbWRfcmVnID09IE9QX0JMT0NLX0VSQVNFKSA/IHdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRf
REVWMF9DRkcwLAo+IC0JMiwgTkFORF9CQU1fTkVYVF9TR0wpIDogcmVhZF9yZWdfZG1hKG5hbmRj
LAo+IC0JTkFORF9GTEFTSF9TVEFUVVMsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPiArCWlmIChx
X29wLmNtZF9yZWcgPT0gT1BfQkxPQ0tfRVJBU0UpCj4gKwkJd3JpdGVfcmVnX2RtYShuYW5kYywg
TkFORF9ERVYwX0NGRzAsIDIsIE5BTkRfQkFNX05FWFRfU0dMKTsKPiAgCj4gIAl3cml0ZV9yZWdf
ZG1hKG5hbmRjLCBOQU5EX0VYRUNfQ01ELCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gIAlyZWFk
X3JlZ19kbWEobmFuZGMsIE5BTkRfRkxBU0hfU1RBVFVTLCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7
Cj4gLS0gCj4gMi40My4wCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCu
pOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
