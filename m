Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04487C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:25:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 306F764F18
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 306F764F18
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O/Ufv/eOzux6IVARMzNynZG65+VrvVxenbG13+10y+M=; b=lcroWou6nT0/ezs4FFUz9vY3/
	+qZSHunofudEggUv9JwOnnlsIyLm9K6GDW3e9eJQhpdFr4w6gFiwYcqRt8X0kQ88u4+AZSAKTlCfY
	fgLRf7DO5edjI/rY50W3lucePD15v5p9xRkclvD9/H+Ne6vqRilhZB+yUfUHTYzSd0otdbfZlBJnk
	PFIh7NGBrxO04ExAv1wgHv10kXfslPLddpmLYikkVECKX38plYTnJ6YV3zJBhVxR5hdz5OfzFZfPR
	nrxI22RaS615asfnHgaC/lGhob5AxPFRQxRMCJHl1QxJ03o++cMCwIRBjf7qxcDhLwXrAui6sdsXt
	6pBfwONMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHaqh-006wNv-Hy; Wed, 03 Mar 2021 23:24:11 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHUJq-005aug-Oq
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 16:25:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 063E32223A;
 Wed,  3 Mar 2021 17:25:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614788749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nBW9WYF4VIOc6BFxnRf5anhpRbWsUv3hkVrcjwL2WwU=;
 b=iBEg8N8OMPPPXXyef//mbJLbe7VeToyM8IMbtPns0WKqlh/76bnZI/isUmnLZ+qcbylVY7
 QWC8Ul9OsB8ZHm3tLimQMcQrYGV3KKXz4QlwkptDDF8bsKP7biaxf2dcd1o2DXDE3p4jl0
 oBpN6FaOCSkbtwsWPEplV/AIciVMtoc=
MIME-Version: 1.0
Date: Wed, 03 Mar 2021 17:25:48 +0100
From: Michael Walle <michael@walle.cc>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: require write permissions for locking and badblock
 ioctls
In-Reply-To: <689194005.42755.1614788236355.JavaMail.zimbra@nod.at>
References: <20210303155735.25887-1-michael@walle.cc>
 <YD+0mAPTMN8AwNBx@kroah.com>
 <689194005.42755.1614788236355.JavaMail.zimbra@nod.at>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <040cf2058fe4cf5e63dbff534582881a@walle.cc>
X-Sender: michael@walle.cc
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wMy0wMyAxNzoxNywgc2NocmllYiBSaWNoYXJkIFdlaW5iZXJnZXI6Cj4gTWljaGFl
bCwKPiAKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIkdyZWcgS3Jv
YWgtSGFydG1hbiIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiBBbjogIk1pY2hhZWwg
V2FsbGUiIDxtaWNoYWVsQHdhbGxlLmNjPgo+PiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBs
aXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIgCj4+IDxsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnPiwgIk1pcXVlbCBSYXluYWwiCj4+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIAo+PiBSYWdoYXZlbmRy
YSIgPHZpZ25lc2hyQHRpLmNvbT4KPj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAzLiBNw6RyeiAyMDIx
IDE3OjA4OjU2Cj4+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIG10ZDogcmVxdWlyZSB3cml0ZSBwZXJt
aXNzaW9ucyBmb3IgbG9ja2luZyBhbmQgCj4+IGJhZGJsb2NrIGlvY3Rscwo+IAo+PiBPbiBXZWQs
IE1hciAwMywgMjAyMSBhdCAwNDo1NzozNVBNICswMTAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+
Pj4gTUVNTE9DSywgTUVNVU5MT0NLIGFuZCBPVFBMT0NLIG1vZGlmeSBwcm90ZWN0aW9uIGJpdHMu
IFRodXMgcmVxdWlyZQo+Pj4gd3JpdGUgcGVybWlzc2lvbi4gRGVwZW5kaW5nIG9uIHRoZSBoYXJk
d2FyZSBNRU1MT0NLIG1pZ2h0IGV2ZW4gYmUKPj4+IHdyaXRlLW9uY2UsIGUuZy4gZm9yIFNQSS1O
T1IgZmxhc2hlcyB3aXRoIHRoZWlyIFdQIyB0aWVkIHRvIEdORC4gCj4+PiBPVFBMT0NLCj4+PiBp
cyBhbHdheXMgd3JpdGUtb25jZS4KPj4+IAo+Pj4gTUVNU0VUQkFEQkxPQ0sgbW9kaWZpZXMgdGhl
IGJhZCBibG9jayB0YWJsZS4KPj4+IAo+Pj4gRml4ZXM6IGY3ZTZiMTliYzc2NCAoIm10ZDogcHJv
cGVybHkgY2hlY2sgYWxsIHdyaXRlIGlvY3RscyBmb3IgCj4+PiBwZXJtaXNzaW9ucyIpCj4+PiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+Pj4gLS0tCj4+
PiAgZHJpdmVycy9tdGQvbXRkY2hhci5jIHwgOCArKysrLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+IAo+PiBUaGFua3MgZm9yIGF1ZGl0
aW5nIHRoZSByZXN0IG9mIHRoZXNlIGZyb20gbXkgb3JpZ2luYWwgcGF0Y2guICBJZiB0aGlzCj4+
IGlzIG9rIHdpdGggdXNlcnNwYWNlIHRvb2xzLCBpdCdzIGZpbmUgd2l0aCBtZSwgYnV0IEkgZG9u
J3QgZXZlbiBoYXZlCj4+IHRoaXMgaGFyZHdhcmUgdG8gdGVzdCB3aXRoIDopCj4gCj4gVGhhdCdz
IG15IGZlYXIuIE1pY2hhZWwsIGRpZCB5b3UgdmVyaWZ5PwoKSSBkb24ndCBrbm93IGFueSB0b29s
cyBleGNlcHQgdGhlIG10ZC11dGlscy4gU28gbm8uCgo+IEluIGdlbmVyYWwgeW91IG5lZWQgdG8g
YmUgcm9vdCB0byBvcGVuIHRoZXNlIGRldmljZSBmaWxlcy4KPiBTbywgSSBkb24ndCBzZWUgYSBz
ZWN1cml0eSBwcm9ibGVtIGhlcmUuCgpUaGVuIHRoaXMgYmVncyB0aGUgcXVlc3Rpb24sIHdoeSBp
cyB0aGlzIGNoZWNrIHRoZXJlIGluCnRoZSBmaXJzdCBwbGFjZT8KClRoaXMgY29tZSB1cCBiZWNh
dXNlIEkgd2FzIGFkZGluZyBhIE9UUEVSQVNFIHdoaWNoCndhcyBzdWdnZXN0ZWQgdGhhdCBpcyB3
YXMgYSAiZGFuZ2Vyb3VzIiBjb21tYW5kLiBTbyBJCndhcyBwdXp6bGVkIHdoeSB0aGUgb25lcyBh
Ym92ZSBhcmUgY29uc2lkZXJlZCAic2FmZSIgOykKCi1taWNoYWVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
