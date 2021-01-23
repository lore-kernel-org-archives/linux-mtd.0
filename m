Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42C7C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 10:06:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5085B22273
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 10:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5085B22273
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gx4JUsfG0QgaLbEqJcRP3ImITm839bGdbnhd1CpSI0g=; b=1ufWfOe9bggq6Ctwhcw5Keve7
	zQDzdvPazKaW9hVQcTPnYPIoK/bQioWhdA3bv2w3HK6ImGdoC8/s1mLUdvCROmV/tpWZatY+5JPds
	Hb/mG7VULG4TXQBphcUt5BM+ySzcIGgZZAaVyQ2Ocj3vgWLlF/5FUZcwLemcwwpt40HZGHejhP9Wk
	+N4+Bj2kAZ4Ka0F9aDSoVcvtRumE2iEWh1IWKnZhnUw6+8DcTkQNliRWe9MWRR/lh/xUXHcvLonMb
	MrnEl1nP40fCfTRoyc4ALkbWkcl/xydo9po+d1z4MZveMuWWOY1/GZZi0yCwEmpBfLVO0RaWEGb0B
	u8IRUkRZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3FnO-0000vo-Qe; Sat, 23 Jan 2021 10:05:30 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3FnJ-0000vS-W2
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 10:05:27 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B54DA6074007;
 Sat, 23 Jan 2021 11:05:22 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iF0YWO0cr0Iq; Sat, 23 Jan 2021 11:05:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0006C625DE06;
 Sat, 23 Jan 2021 11:05:20 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Artg8sMjyD81; Sat, 23 Jan 2021 11:05:20 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id CF7986074007;
 Sat, 23 Jan 2021 11:05:20 +0100 (CET)
Date: Sat, 23 Jan 2021 11:05:20 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <311070065.273732.1611396320672.JavaMail.zimbra@nod.at>
In-Reply-To: <5b51ff9c-8f5e-c348-5195-c0a0bf60b746@huawei.com>
References: <20210122212229.17072-1-richard@nod.at>
 <20210122212229.17072-4-richard@nod.at>
 <5b51ff9c-8f5e-c348-5195-c0a0bf60b746@huawei.com>
Subject: Re: [PATCH 3/4] ubifs: Update directory size when creating whiteouts
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Update directory size when creating whiteouts
Thread-Index: lBYr5nCGsjlO2WH9TnqNoD/UEPd7gA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_050526_739352_C805E5A9 
X-CRM114-Status: UNSURE (   3.67  )
X-CRM114-Notice: Please train this message.
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
Cc: david <david@sigma-star.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
ImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IENDOiAiZGF2aWQi
IDxkYXZpZEBzaWdtYS1zdGFyLmF0PiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+LCAic3RhYmxlIiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRl
dDogU2Ftc3RhZywgMjMuIEphbnVhciAyMDIxIDAzOjQ1OjE1Cj4gQmV0cmVmZjogUmU6IFtQQVRD
SCAzLzRdIHViaWZzOiBVcGRhdGUgZGlyZWN0b3J5IHNpemUgd2hlbiBjcmVhdGluZyB3aGl0ZW91
dHMKCj4g5ZyoIDIwMjEvMS8yMyA1OjIyLCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+PiBB
bHRob3VnaCB3aGl0ZW91dHMgYXJlIHVubGlua2VkIGZpbGVzIHRoZXkgd2lsbCBnZXQgcmUtbGlu
a2VkIGxhdGVyLAo+IEkganVzdCB3YW50IHRvIG1ha2Ugc3VyZSwgaXMgdGhpcyB3aGVyZSB0aGUg
Y291bnQgaXMgaW5jcmVhc2VkPwo+IGRvX3JlbmFtZSAtPiBpbmNfbmxpbmsod2hpdGVvdXQpCgpF
eGFjdGx5LiBUaGUgbG9naWMgaXMgYSBsaXR0bGUgd2lja2VkLCBJIGFncmVlLgpMZXQgbWUgdGhp
bmsgYWdhaW4gd2hldGhlciB0aGVyZSBpc24ndCBhIGJldHRlciB3YXkgdG8gYWRkcmVzcyAKdGhl
IHByb2JsZW0uCgpUaGFua3MsCi8vcmljaGFyZAoKUC5zOiBUaGFua3MgYSBsb3QgZm9yIHJldmll
d2luZyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
