Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302A8C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:51:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E4F20721
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJ4aDqIt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8E4F20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljKrbzf+qLEu834oRuT1hft19eUPkkEz3+6m+M+CxIA=; b=PJ4aDqItizadOG
	Ps6zKEI1RBbi/SnheF3vzd+2alCxDv89MY7yDE0nkKl+7QeHnxYV/tNH6IyBlXS2EjFwHNh7CHgX1
	M7Nz8yIcQ3Fj4xfsSUN87yTnHR0QJA4Qpb/32eL1fWN0QHBCMG5iAdlBlW9EvI6i/gviIw7l9R1Uu
	7uG3ONPkXr+bp5WDQnBAgN5VEHvrdjQLT8CVVdVbqdPniAC4vNvS7Q6q/I62CG3b5pctDMYw10TQm
	i7F6eOIHOFyKKsfKWz841jIFgsfIqTSwtTBKO7zoI2C2QtBq24EtXzOmeRjbkqRkXNSMbluFY45Jn
	famUxz9V89ac75bvIWBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipb1i-0000BY-QP; Thu, 09 Jan 2020 16:51:18 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipb1g-0000Ad-3o
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:51:17 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D0FFA240004;
 Thu,  9 Jan 2020 16:51:08 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:51:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add support for Macronix NAND
 randomizer
Message-ID: <20200109175107.57566c18@xps13>
In-Reply-To: <1571902807-10388-2-git-send-email-masonccyang@mxic.com.tw>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
 <1571902807-10388-2-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_085116_291348_A9481374 
X-CRM114-Status: GOOD (  11.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
VGh1LCAyNCBPY3QgMjAxOSAxNTo0MDowNgorMDgwMDoKCj4gTWFjcm9uaXggTkFORHMgc3VwcG9y
dCByYW5kb21pemVyIG9wZXJhdGlvbiBmb3IgdXNlciBkYXRhIHNjcmFtYmxlZCwKPiB3aGljaCBj
YW4gYmUgZW5hYmxlZCB3aXRoIGEgU0VUX0ZFQVRVUkUuCj4gCj4gVXNlciBkYXRhIHdyaXR0ZW4g
dG8gdGhlIE5BTkQgZGV2aWNlIHdpdGhvdXQgcmFuZG9taXplciBpcyBzdGlsbCByZWFkYWJsZQo+
IGFmdGVyIHJhbmRvbWl6ZXIgZnVuY3Rpb24gZW5hYmxlZC4KPiBUaGUgcGVuYWx0eSBvZiByYW5k
b21pemVyIGFyZSBzdWJwYWdlIGFjY2Vzc2VzIHByb2hpYml0ZWQgYW5kIG1vcmUgdGltZQo+IHBl
cmlvZCBpcyBuZWVkZWQgaW4gcHJvZ3JhbSBvcGVyYXRpb24gYW5kIGVudGVyaW5nIGRlZXAgcG93
ZXItZG93biBtb2RlLgo+IGkuZS4sIHRQUk9HIDMwMHVzIHRvIDM0MHVzKHJhbmRvbWl6ZXIgZW5h
YmxlZCkKPiAKPiBGb3IgbW9yZSBoaWdoLXJlbGlhYmlsaXR5IGNvbmNlcm4sIGlmIHN1YnBhZ2Ug
d3JpdGUgbm90IGF2YWlsYWJsZSB3aXRoCj4gaGFyZHdhcmUgRUNDIGFuZCB0aGVuIHRvIGVuYWJs
ZSByYW5kb21pemVyIGlzIHJlY29tbWVuZGVkIGJ5IGRlZmF1bHQuCj4gRHJpdmVyIGNoZWNrcyBi
eXRlIDE2NyBvZiBWZW5kb3IgQmxvY2tzIGluIE9ORkkgcGFyYW1ldGVyIHBhZ2UgdGFibGUKPiB0
byBzZWUgaWYgdGhpcyBoaWdoLXJlbGlhYmlsaXR5IGZ1bmN0aW9uIGlzIHN1cHBvcnRlZC4gQnkg
YWRkaW5nIGEgbmV3Cj4gc3BlY2lmaWMgRFQgcHJvcGVydHkgaW4gY2hpbGRyZW4gbm9kZXMgdG8g
ZW5hYmxlIHJhbmRvbWl6ZXIgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzb24gWWFu
ZyA8bWFzb25jY3lhbmdAbXhpYy5jb20udHc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfbWFjcm9uaXguYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX21hY3Jvbml4LmMKPiBpbmRleCA1ODUxMWFlLi44OTEwMWZhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+IEBAIC0xMSw2ICsxMSwxNCBAQAo+ICAjZGVmaW5l
IE1BQ1JPTklYX1JFQURfUkVUUllfQklUIEJJVCgwKQo+ICAjZGVmaW5lIE1BQ1JPTklYX05VTV9S
RUFEX1JFVFJZX01PREVTIDYKPiAgCj4gKyNkZWZpbmUgTUFDUk9OSVhfUkFORE9NSVpFUl9CSVQg
QklUKDEpCj4gKyNkZWZpbmUgT05GSV9GRUFUVVJFX0FERFJfTVhJQ19SQU5ET01JWkVSIDB4QjAK
PiArI2RlZmluZSBFTlBHTSBCSVQoMCkKPiArI2RlZmluZSBSQU5ERU4gQklUKDEpCj4gKyNkZWZp
bmUgUkFORE9QVCBCSVQoMikKCkkgZm9yZ290OiBwbGVhc2UgYmUgY29uc2lzdGVudCB3aXRoIHRo
ZSBuYW1pbmcuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
