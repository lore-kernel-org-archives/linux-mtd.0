Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13829CCD1BE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r+5cGkuLKc5Yot48odt3ZpLEOwdsEM4bQ6O6jt49SI=; b=iek+/3KnGJTWzB
	ASs0OOjNLvQyvkhzvaGDn2AIPxBxwsX9pweZf2o2Hu5Z4/bUB9fS0fb/6xZlsnyWADHJCm6ISNPOV
	5VgZRK9E10iHKKyIsaH36dWjqMDvuk6cl6S5SWyPHggzj9lIWiaSJmyUB6kxylNSDLN+P+YlU3LQF
	8xu999sM6yxf2/KytmfBgcUJ71QyePUYxSDuT+QtzVYSc9Q2OAmsKORFb6dohR4k3uBiQkFB2aWcl
	n4QDbpfxNU2kZeoA0q2QNXgg10heN7aKNH3/7LokqdsRqC4Kmghh/sQD6xOOP1Ghrv1vhW1ZU6UMN
	Zmo5PzhEx+w0FbCASGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZhH-00000003BIj-0Q32;
	Wed, 22 Oct 2025 14:20:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZhD-00000003BGA-1bQ3
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 14:20:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A57AF4E4127A;
	Wed, 22 Oct 2025 14:20:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 749B8606DC;
	Wed, 22 Oct 2025 14:20:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87394102F2439;
	Wed, 22 Oct 2025 16:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761142808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YDrPkEB0fB9w+iRkPNkPwaIYR4vCHUz/cyHracxKgT4=;
	b=mzlx6EvEVaWafTpIjOYi/NVNX3P/BanSYBrvHxYuPvzxJfpqFMMZpck8YmaC5HTw1C3XLs
	B09tuEu/mUSZx/H86vZJpl18EpTIAwivq/TpGE1SHJdAjKoBnWEobjMETxCTz+5WEoXQjD
	H9BePMHaOakTqANK9rRsLGeknzf9hrL3P3/nOQIFJroEGB41OoWlszg8YlECWqGktUEDyH
	k5+bbVjWgADdchtjufx+oRkXPTvn18MX5wKx8OT51gzPHeWoqtHW3IxEum+/sonku+aPZx
	icOUzmmRgbPSPOYwddb6J2cWz41f3XxYHXhugOsUQs6/RYjN8t/SaPQn0YQ4ZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: jayxu1990@gmail.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  avnerkhan@utexas.edu,
  rdlee.upstream@gmail.com,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mtd: core: Add nand_id sysfs attribute for NAND devices
In-Reply-To: <20251014192455.4007534-1-jayxu1990@gmail.com> (jayxu's message
	of "Wed, 15 Oct 2025 03:24:55 +0800")
References: <20251007224049.2798233-1-jayxu1990@gmail.com>
	<20251014192455.4007534-1-jayxu1990@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 16:19:54 +0200
Message-ID: <874irrrpbp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_072011_555478_74ADCD92 
X-CRM114-Status: GOOD (  20.85  )
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

SGVsbG8sCgpPbiAxNS8xMC8yMDI1IGF0IDAzOjI0OjU1ICswOCwgamF5eHUxOTkwQGdtYWlsLmNv
bSB3cm90ZToKCj4gRnJvbTogSmF5IFh1IDxqYXl4dTE5OTBAZ21haWwuY29tPgo+Cj4gW1Byb2Js
ZW1dCj4gQ3VycmVudGx5LCBOQU5EIGRldmljZXMgZG8gbm90IGV4cG9zZSB0aGVpciBOQU5EIElE
IHRocm91Z2ggc3lzZnMsCj4gbWFraW5nIGl0IGRpZmZpY3VsdCBmb3IgdXNlcnNwYWNlIGFwcGxp
Y2F0aW9ucyB0byBpZGVudGlmeSB0aGUgc3BlY2lmaWMKPiBOQU5EIGZsYXNoIGNoaXAgaW4gdXNl
LiBGb3Igc3VwcGx5IG1hbmFnZW1lbnQgcmVhc29ucywgZWxlY3Ryb25pY3MKPiBwcm9kdWN0cyBh
cmUgdHlwaWNhbGx5IG1hbnVmYWN0dXJlZCB3aXRoIG11bHRpcGxlIHN0b3JhZ2UgZGV2aWNlCj4g
c3VwcGxpZXJzLCBjcmVhdGluZyBhIG5lZWQgdG8gaWRlbnRpZnkgd2hpY2ggc3RvcmFnZSBkZXZp
Y2UgaXMgdXNlZAo+IG9uIGEgcGFydGljdWxhciBwcm9kdWN0LiBUaGUgTkFORCBJRCBpcyBhIHNl
bWktdW5pcXVlIGlkZW50aWZpZXIgdGhhdCBjYW4KPiBiZSB1c2VkIHRvIGRldGVybWluZSBjaGlw
LXNwZWNpZmljIGNoYXJhY3RlcmlzdGljcyBzdWNoIGFzIG1heGltdW0gUC9FCj4gY3ljbGVzLCB3
aGljaCBpcyBlc3NlbnRpYWwgZm9yIE5BTkQgaGVhbHRoIG1vbml0b3JpbmcgYW5kIHdlYXIgbGV2
ZWxpbmcKPiBhbGdvcml0aG1zLgo+Cj4gW1NvbHV0aW9uXQo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5l
dyAnbmFuZF9pZCcgc3lzZnMgYXR0cmlidXRlIHRoYXQ6Cj4KPiAxLiBFeHBvc2VzIHRoZSBmdWxs
IE5BTkQgSUQgKHR5cGljYWxseSA1LTggYnl0ZXMpIGluIGhleGFkZWNpbWFsIGZvcm1hdAo+IDIu
IE9ubHkgYXBwZWFycyBvbiBwaHlzaWNhbCBOQU5EIGRldmljZXMgKE1URF9OQU5ERkxBU0gvTVRE
X01MQ05BTkRGTEFTSCkKPiAzLiBJcyBoaWRkZW4gb24gdmlydHVhbCBNVEQgZGV2aWNlcwo+IDQu
IFJlYWRzIGZyb20gdGhlIG1hc3RlciBkZXZpY2UgdG8gZW5zdXJlIGNvbnNpc3RlbnQgSUQgYWNy
b3NzIHBhcnRpdGlvbnMKPiA1LiBIYW5kbGVzIG9uLWRlbWFuZCBJRCByZWFkaW5nIGlmIG5vdCBh
bHJlYWR5IHBvcHVsYXRlZCBkdXJpbmcgcHJvYmUKPgo+IFRoZSBpbXBsZW1lbnRhdGlvbiB1c2Vz
IGEgc2VwYXJhdGUgYXR0cmlidXRlIGdyb3VwIHdpdGggdmlzaWJpbGl0eSBjb250cm9sCj4gdG8g
YXZvaWQgYWZmZWN0aW5nIGV4aXN0aW5nIE1URCBzeXNmcyBhdHRyaWJ1dGVzLiBBbGwgTkFORCBw
YXJ0aXRpb25zCj4gZnJvbSB0aGUgc2FtZSBwaHlzaWNhbCBjaGlwIHdpbGwgc2hvdyB0aGUgc2Ft
ZSBJRCwgYXMgZXhwZWN0ZWQuCj4KPiBUaGUgTkFORC1zcGVjaWZpYyBjb2RlIGlzIGNvbmRpdGlv
bmFsbHkgY29tcGlsZWQgd2l0aCBDT05GSUdfTVREX1JBV19OQU5ECj4gdG8gZW5zdXJlIGNsZWFu
IGJ1aWxkcyB3aGVuIHJhdyBOQU5EIHN1cHBvcnQgaXMgbm90IGVuYWJsZWQuCj4KPiBUaGlzIGVu
YWJsZXMgdXNlcnNwYWNlIHRvb2xzIHRvIHJlbGlhYmx5IGlkZW50aWZ5IE5BTkQgY2hpcHMgZm9y
Cj4gaGVhbHRoIG1vbml0b3JpbmcsIGJhZCBibG9jayBtYW5hZ2VtZW50LCBhbmQgZGV2aWNlLXNw
ZWNpZmljCj4gb3B0aW1pemF0aW9ucy4KPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWti
dWlsZC1hbGwvMjAyNTEwMTIwMzU2LlNUR0tEa0E1LWxrcEBpbnRlbC5jb20vCj4gU2lnbmVkLW9m
Zi1ieTogSmF5IFh1IDxqYXl4dTE5OTBAZ21haWwuY29tPgo+IC0tLQoKSSBoYXZlbid0IHJldmll
d2VkIHRoZSBjb2RlIHlldCwgYnV0IGF0IGEgZmlyc3QgZ2xhbmNlIEkgd291bGQgbm90IGJlCm9w
cG9zZWQgdG8gaXQuIEkgcmVtZW1iZXIgdGhvdWdoIHdlIGFscmVhZHkgaGFkIHNvbWUga2luZCBv
ZiBzaW1pbGFyCmRpc2N1c3Npb24gYW5kIElJUkMgd2UgZGVjbGluZWQgKEkgY2Fubm90IHJlbWVt
YmVyIHdoeSBub3IgZmluZCBhbnkKcmVsZXZhbnQgbGluaykuCgpSaWNoYXJkLCBkb2VzIHRoYXQg
cmluZyBhIGJlbGw/CgpJZiB3ZSBnbyB0aGUgcm91dGUgb2YgcHJpbnRpbmcgYW4gSUQsIG1heWJl
IHdlIHNob3VsZCBtYWtlIHN1cmUgdGhlIElECmlzIGFsd2F5cyBwb3B1bGF0ZWQgKHdlIGFsd2F5
cyByZWFkIGl0IGF0IHByb2JlIHRpbWUpIHNvIHdlIGRvIG5vdCBuZWVkCnRvIHJlLXJlYWQgaXQg
bGF0ZXIuIEFsc28sIHdlIHNob3VsZCBwcm9iYWJseSBzdG9yZSBpdCBzb21ld2hlcmUgaW4gdGhl
Ck5BTkQgY29yZSBhbmQgbm90IG1ha2UgaXQgcmF3IE5BTkQgc3BlY2lmaWMgYXMgU1BJIE5BTkRz
IHdpbGwgbGlrZWx5CnN1ZmZlciBmcm9tIHRoZSBzYW1lIGlzc3VlIGF0IHNvbWUgcG9pbnQuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
