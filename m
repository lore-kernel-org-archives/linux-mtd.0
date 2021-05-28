Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED76FC47087
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 21:00:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BF806127C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 21:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BF806127C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVw4yi3xeZid5UHdivOUEfxzWYoMlKPgpZDqBMPmMaE=; b=ght4plUgZvHpg6yEAbHejq7K6t
	zgQlKuk/76q04fX2s4FK0nMIgDFCjl7eeAhm3N+ZfKBIBDpf1q1A5rt43Lo4zD8hVMTojGWbvCf2O
	DbMY5YL3kf+3x6MKSwdJmRlZjsQgjbDu8IeUiVXe61HBeqXLs7iJhzGN+GaQLeY/JaeBZ0hsTJO4V
	32yxpvC1MA7Yczyk9oO5vuT3VS/Y/KjVdzHOK3SJzf7w11J5QdOicYpsI5Bn2VnN7wwGIh9I0k/wj
	6LNcoRbvV3kdXTntAYISmUphVCD0YmoEe7M2Ad4XwC59CLf4+EOo6XQVWOem8Ml0sz0AMtrZlYhud
	iQSIqNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmjaL-0012Fx-12; Fri, 28 May 2021 21:00:01 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmjaH-0012EZ-8I
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 20:59:59 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4A05122172;
 Fri, 28 May 2021 22:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622235595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+Ak9MxM/Tu2TKVu01JfkBBeDC44vvq36QbydLIIGtM=;
 b=pX/HgxcaazgI+l8JEaPPf6q9bCPSJRFlf4xc9H3njBMFrAAPMqiRV+ceCHc3bChHbKPj8e
 NjxvdsgauTl3hHEAiemB6bDcKmDQLTRXsQ8eOetz22d7Tn3ur06kzZ0WBZQnLnzluBMBIh
 ZRYrClWNSXl2Vk+3wvhRYdzyfWl8H+0=
MIME-Version: 1.0
Date: Fri, 28 May 2021 22:59:54 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Naga
 Sureshkumar Relli <nagasure@xilinx.com>, Amit Kumar Mahapatra
 <akumarma@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>, Siva Durga
 Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v21 00/18] ARM Primecell PL35x support
In-Reply-To: <20210528100151.286662-1-miquel.raynal@bootlin.com>
References: <20210528100151.286662-1-miquel.raynal@bootlin.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a4be2fc7df0392ca286a7ea7ed8689c7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_135957_485090_D37C14E5 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

QW0gMjAyMS0wNS0yOCAxMjowMSwgc2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+IEhlbGxvLAo+IAo+
IEkgYW0gdGFraW5nIG92ZXIgTmFnYSdzIHNlcmllcywgaGVyZSBhcmUgdGhlIG1ham9yIGNoYW5n
ZXM6Cj4gKiBDbGVhbmluZyBvZiB0aGUgU01DIGJ1cyBiaW5kaW5nIGZpbGUgKGFuZCB5YW1sIGNv
bnZlcnNpb24pCj4gKiBTdXBlcmZpY2lhbCBjbGVhbmluZyBhbmQgZ3JlYXQgc2ltcGxpZmljYXRp
b24gb2YgdGhlIFNNQyBidXMgZHJpdmVyCj4gKiBBZGRpdGlvbiBvZiBhIHlhbWwgZmlsZSBkZXNj
cmliaW5nIHRoZSBOQU5EIGNvbnRyb2xsZXIKPiAqIEZ1bGwgcmV3b3JrIG9mIHRoZSBOQU5EIGNv
bnRyb2xsZXIgZHJpdmVyLgo+ICogQWRkaXRpb24gb2YgYSBjb3VwbGUgb2YgTUFJTlRBSU5FUlMg
ZW50cmllcy4KPiAKPiBBIEdpdGh1YiBicmFuY2ggbmFtZWQgcGwzNTMgaXMgYXZhaWxhYmxlIG9u
IG15IHJlcG9zaXRvcnk6Cj4gaHR0cHM6Ly9naXRodWIuY29tL21pcXVlbHJheW5hbC9saW51eC8K
PiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+IENoYW5nZXMgaW4gdjIxOgo+IC0gQWRkZWQgUm9i
J3MgQWNrZWQtYnkvUmV2aWV3ZWQtYnkgdGFncy4KPiAtIEFkZHJlc3NlZCBhbGwgY29tbWVudHMg
ZnJvbSBSb2IgYW5kIE1pY2hhZWwgYWJvdXQgdGhlIGJpbmQtaW5ncy4KPiAtIFRlc3RlZCBib3Ro
IEpGRlMyIGFuZCBVQklGUyB3aXRoIHNpbXBsZSBmaWxlIEkvTy4KCkZXSVcsCgpUZXN0ZWQtYnk6
IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+IFtvbiB6eW5xLTcwMDBdCgotbWljaGFl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
