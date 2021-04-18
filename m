Return-Path: <SRS0=Qvgb=JP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309F5C433ED
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 17:04:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B9C61278
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 17:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64B9C61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5AXh2tIVVLR5LkARnrmn5lR0O+4hDoOQmSstWAV1Ckc=; b=ZvpCWrRFQQhXJSkWsE0srQGkA
	ojzIq7/DzkoE4WWxW5CuKW3iNQzGg+6A5og0IjZkM5yCHnOh5PmtfgrFv8+sM1Vh8uEk49mp5FD5m
	/s/J4HXn9DZZWtWiY9hAL1igZ4t/BQw65E7iII28anU72pf+SwP1j4cmt3NdRMNZaje1FOYkLoNOU
	W6/txomm7aT8FhFQfPUZKYAKf9udYNPZ+WpXOtTfIYb3I+OzdOWDSfZtmC6P+NJo+RG78A5khfXse
	wW1JmVMgMX+cNU7rfAPv41G8hkzSs5GC0xO3QEVW7kDRrRR1q4z4AynBBNo+QA1BTdyU6RXNpIzKw
	OghSo+ILg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYApl-008L6q-9N; Sun, 18 Apr 2021 17:03:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYApi-008L6a-Q9
 for linux-mtd@desiato.infradead.org; Sun, 18 Apr 2021 17:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=wZjHDFyIJwgltzOPYwo/FQpuqb63UKhAO+gnpdgNwac=; b=32zyVUuk1H8+FOfGlEECr4xg2o
 opfv92MLSIDoIyHHWJJDjPk6x0qJeZyGF34kY50MpPqYs2balviTzuEKeN4e+V742xLLSjMhMnZFv
 AsVcgD7CVkIqj5J0bQKoLmrQ4vTJbMlTv4q9Y86Vtn+XnOy9Jh4tHYxuyN878i12HXxCXz6mu0m35
 Gw3UqH79wVEnvPVUIzhrzeTz/Cx3+5ngxAzth9JSiC6ORqCzT2wonYq+wArfnu2HPiJxkNZHBbHk+
 6KUCC2NIyI+JFC+f/UpaIswooVb/lIoEtPj/RiC9jjfirJhvUcnv5pDRuffb5f6W90h33tHdDgVnm
 EjfsYLBQ==;
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYApe-00AWwl-Co
 for linux-mtd@lists.infradead.org; Sun, 18 Apr 2021 17:03:41 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4FNbr90xVMzQjxV;
 Sun, 18 Apr 2021 19:03:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1618765415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZjHDFyIJwgltzOPYwo/FQpuqb63UKhAO+gnpdgNwac=;
 b=nrMgmySGBZWGZd56v0v0t9f7GMdCdQNMtPTyJpsjCyIyb2JHx6Qi/9cQGuTt6ZKvXvpfkA
 1gHnFw2RX1zZPihkTmYizerNRlFOc8IOBptVZL1HEBXnZ4uXYrEksW8+0avUYKga6wdtwm
 0BMY1bZ0e2zPYeoMOaZpPuMDA8z92csfQw6kMFiVT6FqtTJXdcyEKBPmh8T48keak1cruS
 J5Uwr3wKsAd8MtuyQNmDiSi8EggZfako8wZddMBtkTBKBOONF2twABTWIuHtGRHdPp28O5
 jfGSGszF6zkfniMyXwmH6ONvuxbQY3bQgz8/S8pBb2P0VZip4KIbTksEFTvJqg==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id FzsY7P3jsSOD; Sun, 18 Apr 2021 19:03:33 +0200 (CEST)
Subject: Re: [PATCH 2/2] mtd: parsers: trx: Remove dependency to BRCM
 architectures
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
References: <20210315170711.567358-1-hauke@hauke-m.de>
 <20210315170711.567358-3-hauke@hauke-m.de>
 <16aba7dd-63ca-e68c-469f-f21cff75b32e@gmail.com>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <83e82a6f-f579-ec7b-e6fd-2fe47fbdd08b@hauke-m.de>
Date: Sun, 18 Apr 2021 19:03:32 +0200
MIME-Version: 1.0
In-Reply-To: <16aba7dd-63ca-e68c-469f-f21cff75b32e@gmail.com>
Content-Language: en-US
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.41 / 15.00 / 15.00
X-Rspamd-Queue-Id: DCC1517E5
X-Rspamd-UID: f9beb5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_100338_612628_54D6C1AB 
X-CRM114-Status: GOOD (  15.61  )
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

T24gMy8xOC8yMSA3OjQ1IEFNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24gMTUuMDMuMjAy
MSAxODowNywgSGF1a2UgTWVocnRlbnMgd3JvdGU6Cj4+IEJ1ZmZhbG8gdXNlcyB0aGUgVFJYIHBh
cnRpdGlvbiBmb3JtYXQgYWxzbyBvbiBNZWRpYXRlayBTb0NzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBIYXVrZSBNZWhydGVucyA8aGF1a2VAaGF1a2UtbS5kZT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMv
bXRkL3BhcnNlcnMvS2NvbmZpZyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJz
ZXJzL0tjb25maWcgYi9kcml2ZXJzL210ZC9wYXJzZXJzL0tjb25maWcKPj4gaW5kZXggZDkwYzMw
MjI5MDUyLi42MjQyOTAzZDg4NDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMv
S2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL0tjb25maWcKPj4gQEAgLTk2LDcg
Kzk2LDcgQEAgY29uZmlnIE1URF9BRlNfUEFSVFMKPj4gwqAgY29uZmlnIE1URF9QQVJTRVJfVFJY
Cj4+IMKgwqDCoMKgwqAgdHJpc3RhdGUgIlBhcnNlciBmb3IgVFJYIGZvcm1hdCBwYXJ0aXRpb25z
Igo+PiAtwqDCoMKgIGRlcGVuZHMgb24gTVREICYmIChCQ000N1hYIHx8IEFSQ0hfQkNNXzUzMDFY
IHx8IENPTVBJTEVfVEVTVCkKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIE1URAo+PiDCoMKgwqDCoMKg
IGhlbHAKPj4gwqDCoMKgwqDCoMKgwqAgVFJYIGlzIGEgZmlybXdhcmUgZm9ybWF0IHVzZWQgYnkg
QnJvYWRjb20gb24gdGhlaXIgZGV2aWNlcy4gSXQKPj4gwqDCoMKgwqDCoMKgwqAgbWF5IGNvbnRh
aW4gdXAgdG8gMy80IHBhcnRpdGlvbnMgKGRlcGVuZGluZyBvbiB0aGUgdmVyc2lvbikuCj4+Cj4g
Cj4gUGxlYXNlIGNoZWNrIERvY3VtZW50YXRpb24va2J1aWxkL2tjb25maWctbGFuZ3VhZ2UucnN0
IGFuZCBjb21taXQKPiAxODA4NGU0MzVmZjYgKCJEb2N1bWVudGF0aW9uL2tidWlsZDogRG9jdW1l
bnQgcGxhdGZvcm0gZGVwZW5kZW5jeQo+IHByYWN0aXNlcyIpCj4gCj4gSSB0aGluayB5b3Ugc2hv
dWxkIHJhdGhlciBhZGQgcGxhdGZvcm0gdG8gREVQRU5EUy4KCk9rIEkgd2lsbCBhZGQgYSBkZXBl
bmRlbmN5IHRvIEFSQ0hfTUVESUFURUsuIEkgdGhpbmsgQnVmZmFsbyBhbHNvIHVzZWQgCnRoaXMg
b24gc29tZSBNZWRpYXRlay9yYWxpbmsgTUlQUyBkZXZpY2VzLCBidXQgdGhleSBhcmUgbm90IHN1
cHBvcnRlZCAKdXBzdHJlYW0geWV0LgoKSGF1a2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
