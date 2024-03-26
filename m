Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0749DC54E58
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QGmos+/t8YF6f3Zkinzw5MBGkDo32w5L+HQuZb/QtI=; b=EbgaMr27gSMkhW
	8JAAg9V4ftcryopvSqjhgB7WsUpH29zHfxmX9HD8ksn45GP4oRMdxx66Euf5iGBQk0xPI/Vo6pyHo
	vlgUTdmQ/TunvKCXNS1fZitZfM/CcIzhcMsmvAij4APSXny8XGdA7Rva4dURQIBhVi2PMNpV4ZNIm
	BhlyGRCum3NGc7Le53i5DEGL97++HsXFN1dKrPCzPaP75sR+/XoDbOcJS5ntvrWEajd3N0jSvAOig
	RNLV6+m9nkZAt5bMCIrcm/4oe/ygnB5sxIosTsyMbxX6jIaHm/YQgKsxbxXgCs7ltknz+z2yMJl9f
	SwAjxh3gt7yLnezQho+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1Ps-00000003TOW-14yb;
	Tue, 26 Mar 2024 07:40:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1Pc-00000003TMP-1dlN
	for linux-mtd@lists.infradead.org;
	Tue, 26 Mar 2024 07:40:02 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso2082969b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2024 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711438795; x=1712043595; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4FNmONmGMNfUWAyGbjVY02MYpPraJ84XZnXoSpBgNIE=;
        b=N2q6/PzIng4wA1GW6BIS27rT+B7LdFZXzrMNB2a8wsXyfqHbpo/UIfhN4OXaM65JdD
         emO2k0DqcDLIAsvj5eXJMMQOQjUW38SGoSucq1Q/gYNOkhTrzCjwwBInIH6GOdPAgDbX
         Vm1Lup07GTLTCS881cg13F02RPba6EJngcUwNF2fzbLPQk5snJqp7Cx2hXN8v1e/07ky
         PHpncbQkn7jEvsmbMtxAxYxIZwMJwabcqkQ+rAeTG4B8z99599VUZTPl35oin+aAkNI3
         Q1HteTfBN7hYu8BXKCztOyPVRTtjo9Cbo5dkjTxiCJ6RuxmyObmGk0SqQjZCnbKj/I/z
         ayWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711438795; x=1712043595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FNmONmGMNfUWAyGbjVY02MYpPraJ84XZnXoSpBgNIE=;
        b=jae1VnMaw/pRGdlgtQ+gQN3sbfiDGD0k2eI075pZSIZ6+fa63V196YW9FWPtvjpgPV
         aT/XvCVIGotV3oqJwXN+MUxqILbI1ON1+bk1bV68GJv8QPpJfrYkZw/z0eeN2KFWALJm
         dhNWFO3pjhmopZuoKHzO+WGD3oi4GbgV5RPR+88xm3neR0GQN0V9gfcpuBxS4GzgahnI
         DnpfEJFN5tEQQnJk5O4fiQRXSOXHg6qi6Mj9wRcSL2OKKTLVIn1zxyERw96IFjyMYYVf
         bncQwYpS6duL7xE6Z+jnRAzOGUgkqzum5IJHjlnfU532VaPDaWwrwcWyth4xljZNb5zF
         5d9w==
X-Forwarded-Encrypted: i=1; AJvYcCX3cX117OPq9/LliR3I0SDMdmU4B0LEEwWEe3su7i80uSnMJ5Srecncm65659eSSggljoOkWl/NEoz244ZZMlOb61qePLTNBL0xAc7jiA==
X-Gm-Message-State: AOJu0YzSuanzj9+JUqg5ocu/rUDbeGVrkSaX5ay84+RoECH5Um4AAvAp
	Om3GBlnZ/T73SGu/hx5aH7TEqlRW93p5Fplm/gpAbvVm7Rg6GwnlrnQJVm6n0g==
X-Google-Smtp-Source: AGHT+IHJlXwZ3IC716MHv8npsQJ6w1dHTImu5xrrXh/rtboJQ6PofKuxB0iLA8zqqLrX+vk2q6DCmw==
X-Received: by 2002:a05:6a21:99a2:b0:1a3:a67f:f3a8 with SMTP id ve34-20020a056a2199a200b001a3a67ff3a8mr9651411pzb.48.1711438794819;
        Tue, 26 Mar 2024 00:39:54 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902cec200b001db5ecd115bsm6010635plg.276.2024.03.26.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:39:54 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:09:47 +0530
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
Message-ID: <20240326073947.GA9565@thinkpad>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
 <20240326072512.GA8436@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326072512.GA8436@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_004001_398922_B66628FF 
X-CRM114-Status: GOOD (  24.09  )
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

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMTI6NTU6MTlQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDI1LCAyMDI0IGF0IDExOjMwOjQ3QU0gKzAxMDAs
IENocmlzdGlhbiBNYXJhbmdpIHdyb3RlOgo+ID4gbWlzY19jbWRfdHlwZSBpbiBleGVjX29wIGhh
dmUgbXVsdGlwbGUgcHJvYmxlbXMuIFdpdGggY29tbWl0IGE4Mjk5MGM4YTQwOQo+ID4gKCJtdGQ6
IHJhd25hbmQ6IHFjb206IEFkZCByZWFkL3JlYWRfc3RhcnQgb3BzIGluIGV4ZWNfb3AgcGF0aCIp
IGl0IHdhcwo+ID4gcmV3b3JrZWQgYW5kIGdlbmVyYWxpemVkIGJ1dCBhY3R1YWxseSBicm9rZSB0
aGUgaGFuZGxpbmcgb2YgdGhlCj4gPiBFUkFTRV9CTE9DSyBjb21tYW5kLgo+ID4gCj4gPiBBZGRp
dGlvbmFsIGxvZ2ljIHdhcyBhZGRlZCB0byB0aGUgZXJhc2UgY29tbWFuZCBjeWNsZSB3aXRob3V0
IGNsZWFyCj4gPiBleHBsYWluYXRpb24gY2F1c2luZyB0aGUgZXJhc2UgY29tbWFuZCB0byBiZSBi
cm9rZW4gb24gdGVzdGluZyBpdCBvbgo+ID4gYSBpcHE4MDZ4IG5hbmRjLgo+ID4gCj4gPiBGaXgg
dGhlIGVyYXNlIGNvbW1hbmQgYnkgcmV2ZXJ0aW5nIHRoZSBhZGRpdGlvbmFsIGxvZ2ljIGFuZCBv
bmx5IGFkZGluZwo+ID4gdGhlIE5BTkRfREVWMF9DRkcwIGFkZGl0aW9uYWwgY2FsbCAocmVxdWly
ZWQgZm9yIGVyYXNlIGNvbW1hbmQpLgo+ID4gCj4gPiBGaXhlczogYTgyOTkwYzhhNDA5ICgibXRk
OiByYXduYW5kOiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBhdGgi
KQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyB2
MjoKPiA+IC0gU3BsaXQgdGhpcyBhbmQgcmV3b3JrIGNvbW1pdCBkZXNjcmlwdGlvbiBhbmQgdGl0
bGUKPiA+IAo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDUgKystLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiBpbmRleCBiMDc5NjA1Yzg0ZDMuLjE5
ZDc2ZTM0NWE0OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiBAQCAt
MjgzMCw5ICsyODMwLDggQEAgc3RhdGljIGludCBxY29tX21pc2NfY21kX3R5cGVfZXhlYyhzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBzdHJ1Y3QgbmFuZF9zdWIKPiA+ICAJbmFuZGNfc2V0
X3JlZyhjaGlwLCBOQU5EX0VYRUNfQ01ELCAxKTsKPiA+ICAKPiA+ICAJd3JpdGVfcmVnX2RtYShu
YW5kYywgTkFORF9GTEFTSF9DTUQsIGluc3RycywgTkFORF9CQU1fTkVYVF9TR0wpOwo+ID4gLQko
cV9vcC5jbWRfcmVnID09IE9QX0JMT0NLX0VSQVNFKSA/IHdyaXRlX3JlZ19kbWEobmFuZGMsIE5B
TkRfREVWMF9DRkcwLAo+ID4gLQkyLCBOQU5EX0JBTV9ORVhUX1NHTCkgOiByZWFkX3JlZ19kbWEo
bmFuZGMsCj4gPiAtCU5BTkRfRkxBU0hfU1RBVFVTLCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4g
PiArCWlmIChxX29wLmNtZF9yZWcgPT0gT1BfQkxPQ0tfRVJBU0UpCj4gPiArCQl3cml0ZV9yZWdf
ZG1hKG5hbmRjLCBOQU5EX0RFVjBfQ0ZHMCwgMiwgTkFORF9CQU1fTkVYVF9TR0wpOwo+IAo+IFNv
IHRoaXMgb25seSBhdm9pZHMgdGhlIGNhbGwgdG8sICdyZWFkX3JlZ19kbWEobmFuZGMsIE5BTkRf
RkxBU0hfU1RBVFVTLCAxLAo+IE5BTkRfQkFNX05FWFRfU0dMKScgaWYgcV9vcC5jbWRfcmVnICE9
IE9QX0JMT0NLX0VSQVNFLiBCdXQgZm9yIHFfb3AuY21kX3JlZyA9PQo+IE9QX0JMT0NLX0VSQVNF
LCB0aGUgcmVzdWx0IGlzIHRoZSBzYW1lLgo+IAo+IEknbSB3b25kZXJpbmcgaG93IGl0IHJlc3Vs
dHMgaW4gZml4aW5nIHRoZSBPUF9CTE9DS19FUkFTRSBjb21tYW5kLgo+IAoKUGVyaGFwcyB5b3Ug
YXJlIHRyeWluZyB0byBmaXggdGhlIE9QX1JFU0VUX0RFVklDRSBjb21tYW5kIGFsdG9nZXRoZXI/
CgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/
4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
