Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A151ACD5BB3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgmppsZJJbgkNQXHf7LU7Rpvu8xA/rFGJVdYzKm443s=; b=PAJJBnMr3I3kmx
	6wmhN8UphjHfuXRMLg0Fy6ocIljldAkmUjTmlKp9CnVKRruORSXTSBSb59S0Xt1HHTCk5RKC3bat3
	CiarQWskhVjgLwww1zrpmhhiWv4PXSQdmVSnsyY3LrcnG/jFklj/faYp0ruAvXCBEa6G0VQ+Qtvwv
	5y8EEADKrsQ3wyGlmcUq3txjU+DYY8PrvNV/cDiRWc9eseoNR0j2wvplmnjbmDmQMmryMii+E6ZHY
	MPJc0yC3fRh5gJUbBrQgZcogTmwSF9ZLx6PbJghku6u2ed5PzGwyPwyD6xeLiTRY3kC6Svb/v7Rct
	dQoqeZ7AMznOJtOaNlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSqy-0000000BRSd-39Md;
	Fri, 22 May 2026 16:36:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSqv-0000000BRRr-3P0N
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 16:36:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48E18C5E179;
	Fri, 22 May 2026 16:36:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 799486003C;
	Fri, 22 May 2026 16:35:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0199110811189;
	Fri, 22 May 2026 18:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779467758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=btsefZSxGFHcFJTT/z3TV0y1ng0aLfAJSS13Lt5MOB4=;
	b=EHdn/+R+RWeaz650BsZ+fEZmucY1pz+RwMoCFqs7suF4mddWTOPvg2a8+jjOxEBVrzjGs4
	FzIQ2As7MYD6/fRpiiM3gLnrw5J7qQ8pKJ8JKS5rE4CyUKHUHovj5A7Zi+MOb+srVbiQWL
	0Ou8K1CrZnSFFSLGBKuuYpVc++tyXCE8j2MhglJLNRHotoBRYXjFJFiQAa7CfZ5qpEHUI7
	rKcnPqleQz0IynxValTC7UTX3rnV/kRLB1IuO080KwQkRZV7ii4lKzZVtlixypMLqil1Zq
	VjXRQc91tJeGl+od1ajfy+bKSzmNCw+07NlLpmtuVADJQNcnxlpc1Jj5oKWwLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 14/28] mtd: spi-nor: swp: Create helpers for building
 the SR register
In-Reply-To: <0640ef90-52f4-443b-90c9-ac4acb48d59f@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 12:56:55 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-14-93453e1a9597@bootlin.com>
	<0640ef90-52f4-443b-90c9-ac4acb48d59f@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 18:35:52 +0200
Message-ID: <87tsrzo107.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_093602_002245_B3CDA23D 
X-CRM114-Status: GOOD (  11.45  )
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

T24gMjIvMDUvMjAyNiBhdCAxMjo1Njo1NSArMDMsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDUvNy8yNiA3OjQ2IFBNLCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+PiBUaGUgc3RhdHVzIHJlZ2lzdGVyIGNvbnRhaW5zIDMgb3IgNCBCUCAoQmxvY2sg
UHJvdGVjdCkgYml0cywgMCBvciAxCj4+IFRCIChUb3AvQm90dG9tKSBiaXQsIHNvb24gMCBvciAx
IENNUCAoQ29tcGxlbWVudCkgYml0LiBUaGUgbGFzdCBCUCBiaXQKPj4gYW5kIHRoZSBUQiBiaXQg
bG9jYXRpb25zIGNoYW5nZSBiZXR3ZWVuIHZlbmRvcnMuIFRoZSB3aG9sZSBsb2dpYyBvZgo+PiBi
dWlsZGxpbmcgdGhlIGNvbnRlbnQgb2YgdGhlIHN0YXR1cyByZWdpc3RlciBiYXNlZCBvbiBzb21l
IGlucHV0Cj4+IGNvbmRpdGlvbnMgaXMgdXNlZCB0d28gdGltZXMgYW5kIHNvb24gd2lsbCBiZSB1
c2VkIDQgdGltZXMuCj4+IAo+PiBDcmVhdGUgZGVkaWNhdGVkIGhlbHBlcnMgZm9yIHRoZXNlIHN0
ZXBzLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9zcGktbm9yL3N3cC5jIHwgODMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3N3cC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zd3Au
Ywo+PiBpbmRleCA1NDBjZDIyMWM0NTUuLjhhYTBmZTI5NzE4OCAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9tdGQvc3BpLW5vci9zd3AuYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3N3cC5j
Cj4+IEBAIC0xMjUsNiArMTI1LDQzIEBAIHN0YXRpYyBib29sIHNwaV9ub3JfaXNfdW5sb2NrZWRf
c3Ioc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IG9mcywgdTY0IGxlbiwKPj4gIAlyZXR1cm4g
c3BpX25vcl9jaGVja19sb2NrX3N0YXR1c19zcihub3IsIG9mcywgbGVuLCBzciwgZmFsc2UpOwo+
PiAgfQo+PiAgCj4+ICtzdGF0aWMgaW50IHNwaV9ub3Jfc3Jfc2V0X2JwX21hc2soc3RydWN0IHNw
aV9ub3IgKm5vciwgdTggKnNyLCB1OCBwb3cpCj4+ICt7Cj4+ICsJdTggbWFzayA9IHNwaV9ub3Jf
Z2V0X3NyX2JwX21hc2sobm9yKTsKPj4gKwl1OCB2YWwgPSBwb3cgPDwgU1JfQlBfU0hJRlQ7Cj4+
ICsKPj4gKwlpZiAobm9yLT5mbGFncyAmIFNOT1JfRl9IQVNfU1JfQlAzX0JJVDYgJiYgdmFsICYg
U1JfQlAzKQo+PiArCQl2YWwgPSAodmFsICYgflNSX0JQMykgfCBTUl9CUDNfQklUNjsKPj4gKwo+
PiArCWlmICh2YWwgJiB+bWFzaykKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKwlzclsw
XSA9IHZhbDsKPgo+IEFzIHNhc2hpa28gYWxyZWFkeSBub3RpY2VkLCBJIHRoaW5rIHRvbyB0aGlz
IHNob3VsZCBoYXZlIGJlZW4gc3JbMF0gfD0gdmFsCgpZZXMgaW5kZWVkLCB0aGF0IGlzIGEgdmVy
eSBnb29kIGNhdGNoLiBEb2Vzbid0IGJ1ZyB3aXRoIG15IGNoaXBzIHdoaWNoCmNhcnJ5IHRoZSBR
RSBiaXQgaW4gdGhlIHNlY29uZCByZWdpc3RlciwgYnV0IGl0J3MgdW5pbnRlbmRlZC4gRml4ZWQg
b24KbXkgc2lkZSwgSSB3aWxsIGNvbnRpbnVlIHdpdGggU2FzaGlrbydzIGZlZWRiYWNrIGFuZCBz
ZW5kIGEgdjYuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
