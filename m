Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C36C54E67
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAZdRR5XDECNY1MYfZyyopu1LRdj4HtkGHuJWgMEJoc=; b=LyA888uQkknm3D
	T+kilFPaifpp55zfGoi2pQaOzTdxwIpYHiVGOD7uH6ZGeZ7qaWDwUK2dOf2RuEKfy+hImtQ42/iMZ
	ZxiluvF5kAokETp6yIX9ivqGVw7t5+EE8QEEKG/MzO+5IGv1QcfdDrybrHgQ0uOIYkWYg9baufCBF
	tej6dxD8gqQu89PfOlefMHf4KZA9mEN0II8/prvq9qiCHghCTq29MzKQa6n+XKxLUBSR27wxxaXIW
	l5GTwGGQjsq9pQwzGPfqNWmaRu7JNrycDAf9mfKkkt0aQchaIRnAPHJ2d6Orphf3OCOZ2jj5F5nv+
	Yim/wdwehBgPML+1PoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1BX-00000003Qe2-1Khy;
	Tue, 26 Mar 2024 07:25:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1BR-00000003QdG-1OAr
	for linux-mtd@lists.infradead.org;
	Tue, 26 Mar 2024 07:25:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6eabbce2d15so172540b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2024 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711437919; x=1712042719; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ziezrdSsh0z8yLzL6N5wKqOMM+Xy/az5Lcsk/lp8gTM=;
        b=twxt39X4uk8IZov8lIiiMGYCv1Xc/mDL+KssdJfzwAvaDBYVH5lwzRM5PLcSPTaRB1
         6Jjwf01LAopEmy4FXGUoCFhRmG4jOTdzWldTPOC+C8+7be3l9HjX4bzu5k4T6KV6U7vP
         dK7xrUm+8juctcCAdHl7B3UKgnpD/VM3bERTnPIaWXHy/SB5OMvPZ31C859CXAzlUJBV
         oBWQF9GcAhdQbKhvIGwdM4VH7VYT5e5FYUDO5LhhOvC9b6/QYdag/QMhAviEt+3usTru
         o0vFhKIXPTS6V02ZhrqWifxG8KmHvdnEa+oRGB1WPR1LgUSyOo2T6dnQyPjWdBZ7CilD
         WPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711437919; x=1712042719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziezrdSsh0z8yLzL6N5wKqOMM+Xy/az5Lcsk/lp8gTM=;
        b=kgfKJ0JXooZb1Fiv2vuDmM4KsFnXFSxX9Fb1gxTshzGNqT0I+c1S8kZB/6TdZmgEkT
         MOko5VftDv8K/ijb1av3BdnddMjZpY0lI4mfUgVsfb8BCnBBcHMd7aPzF9aU/b/M71tv
         cHgoA9eV2eR5RB8O63UEsei0YyawdG+z7+HaNZIb1dKBYbwL1BkZazWQveCe+fJUG0d2
         cx5ZMQIsy95EMWM4YGrsHH1AaYhJ3JDbqJ73nMslcOw7OjRonVfDb5s/ZSh9r2STznT+
         ZVbWFezxTpQX6XbIb7+gFfX5u3zIKVeA//yUWnDGtp4c2aZspDmrMVNVR9MiwJD3zyGD
         EQRg==
X-Forwarded-Encrypted: i=1; AJvYcCWgE6WT1I6EtzL/BoIiQ7jhfFM8cv8O+YMv6EvRICYGhcuXefxpPJlyTCoUx9NhWd55E71PWmeRkdElSi0kXQ/c33rC5QbsaFcSA9aD2Q==
X-Gm-Message-State: AOJu0YwYZK7+VGbYobACvhia0wjXX87A82ZyqjjCOpkFj25qvsRuFK3N
	G4Ky8CRKdkssOmIdgwNslBRCzHpTzQy4+54YyDhQuWszfsox6xC4ZI+ZOkGzwGBdt0opx78xL4E
	=
X-Google-Smtp-Source: AGHT+IHWfgFpUSpNvP9uI3sCuKgKc8JET+a3gmSe493+ufibi13U2SnauOugHZJYLmPcovLDrvBtjQ==
X-Received: by 2002:a05:6a00:1d1b:b0:6ea:bd1a:5dd6 with SMTP id a27-20020a056a001d1b00b006eabd1a5dd6mr483754pfx.32.1711437919416;
        Tue, 26 Mar 2024 00:25:19 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id fh7-20020a056a00390700b006eaacc63435sm2874254pfb.173.2024.03.26.00.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:25:19 -0700 (PDT)
Date: Tue, 26 Mar 2024 12:55:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix broken erase in
 misc_cmd_type in exec_op
Message-ID: <20240326072512.GA8436@thinkpad>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325103053.24408-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_002522_383500_CB10AD82 
X-CRM114-Status: GOOD (  19.99  )
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

T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgMTE6MzA6NDdBTSArMDEwMCwgQ2hyaXN0aWFuIE1hcmFu
Z2kgd3JvdGU6Cj4gbWlzY19jbWRfdHlwZSBpbiBleGVjX29wIGhhdmUgbXVsdGlwbGUgcHJvYmxl
bXMuIFdpdGggY29tbWl0IGE4Mjk5MGM4YTQwOQo+ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQg
cmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBhdGgiKSBpdCB3YXMKPiByZXdvcmtlZCBh
bmQgZ2VuZXJhbGl6ZWQgYnV0IGFjdHVhbGx5IGJyb2tlIHRoZSBoYW5kbGluZyBvZiB0aGUKPiBF
UkFTRV9CTE9DSyBjb21tYW5kLgo+IAo+IEFkZGl0aW9uYWwgbG9naWMgd2FzIGFkZGVkIHRvIHRo
ZSBlcmFzZSBjb21tYW5kIGN5Y2xlIHdpdGhvdXQgY2xlYXIKPiBleHBsYWluYXRpb24gY2F1c2lu
ZyB0aGUgZXJhc2UgY29tbWFuZCB0byBiZSBicm9rZW4gb24gdGVzdGluZyBpdCBvbgo+IGEgaXBx
ODA2eCBuYW5kYy4KPiAKPiBGaXggdGhlIGVyYXNlIGNvbW1hbmQgYnkgcmV2ZXJ0aW5nIHRoZSBh
ZGRpdGlvbmFsIGxvZ2ljIGFuZCBvbmx5IGFkZGluZwo+IHRoZSBOQU5EX0RFVjBfQ0ZHMCBhZGRp
dGlvbmFsIGNhbGwgKHJlcXVpcmVkIGZvciBlcmFzZSBjb21tYW5kKS4KPiAKPiBGaXhlczogYTgy
OTkwYzhhNDA5ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0IG9wcyBp
biBleGVjX29wIHBhdGgiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IC0tLQo+IENo
YW5nZXMgdjI6Cj4gLSBTcGxpdCB0aGlzIGFuZCByZXdvcmsgY29tbWl0IGRlc2NyaXB0aW9uIGFu
ZCB0aXRsZQo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA1ICsrLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IGIwNzk2MDVjODRkMy4uMTlkNzZlMzQ1
YTQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBAIC0yODMwLDkgKzI4MzAs
OCBAQCBzdGF0aWMgaW50IHFjb21fbWlzY19jbWRfdHlwZV9leGVjKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ygo+ICAJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5E
X0VYRUNfQ01ELCAxKTsKPiAgCj4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0ZMQVNIX0NN
RCwgaW5zdHJzLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gLQkocV9vcC5jbWRfcmVnID09IE9QX0JM
T0NLX0VSQVNFKSA/IHdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfREVWMF9DRkcwLAo+IC0JMiwg
TkFORF9CQU1fTkVYVF9TR0wpIDogcmVhZF9yZWdfZG1hKG5hbmRjLAo+IC0JTkFORF9GTEFTSF9T
VEFUVVMsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPiArCWlmIChxX29wLmNtZF9yZWcgPT0gT1Bf
QkxPQ0tfRVJBU0UpCj4gKwkJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9ERVYwX0NGRzAsIDIs
IE5BTkRfQkFNX05FWFRfU0dMKTsKClNvIHRoaXMgb25seSBhdm9pZHMgdGhlIGNhbGwgdG8sICdy
ZWFkX3JlZ19kbWEobmFuZGMsIE5BTkRfRkxBU0hfU1RBVFVTLCAxLApOQU5EX0JBTV9ORVhUX1NH
TCknIGlmIHFfb3AuY21kX3JlZyAhPSBPUF9CTE9DS19FUkFTRS4gQnV0IGZvciBxX29wLmNtZF9y
ZWcgPT0KT1BfQkxPQ0tfRVJBU0UsIHRoZSByZXN1bHQgaXMgdGhlIHNhbWUuCgpJJ20gd29uZGVy
aW5nIGhvdyBpdCByZXN1bHRzIGluIGZpeGluZyB0aGUgT1BfQkxPQ0tfRVJBU0UgY29tbWFuZC4K
CkNhbiB5b3Ugc2hhcmUgdGhlIGFjdHVhbCBpc3N1ZSB0aGF0IHlvdSBhcmUgc2VlaW5nPyBMaWtl
IGVycm9yIGxvZ3MgZXRjLi4uCgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqng
r40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
