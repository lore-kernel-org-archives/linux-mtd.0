Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E06C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mrATPKBXKg+0bQpXZeuZ6RxuhfBTqzur1X2vljlP++U=; b=H3cP3/ban1BlUtZVty7TIzpCb1
	T3rZDBF0bOOYq5Tiw+A4m7Jy014US62P6iZDJOTqYJM+25fbEDtqShPQhiS6ApRCd4gREc6DE/t++
	7/6ctwV07PWX6fUrLzmRPySi1jK6xTTrHxp/iePzL43kNO/Yr5k1PwpcPdg6pxxHwmj8UJStsFiHa
	JEUy5FwyGvXTMwScGw2iH1qNISMudA814ffrHa9PePqdaV6caXcuFe1iAHNBYI2emWl6baeTeWtw4
	ctgiUftKSyjgqdlm9XS6oQzrb7rpOTrU81e4EHbq/3i3pkINtYDCUicqB8WeChyETvG8GGlzwBSit
	qn+8hvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryw28-0000000EC8Z-1yjK;
	Mon, 22 Apr 2024 15:56:44 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryw24-0000000EC2D-3s7F
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 15:56:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0794A647A80A;
	Mon, 22 Apr 2024 17:56:23 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SFHviUkNw3uX; Mon, 22 Apr 2024 17:56:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4C5EB647A826;
	Mon, 22 Apr 2024 17:56:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K_Bb7Bo__69m; Mon, 22 Apr 2024 17:56:22 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 24B77647A80A;
	Mon, 22 Apr 2024 17:56:22 +0200 (CEST)
Date: Mon, 22 Apr 2024 17:56:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Matthew Wilcox <willy@infradead.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <244721678.14228.1713801381992.JavaMail.zimbra@nod.at>
In-Reply-To: <75dbe998-231a-4dd3-70de-d98bf8ee3349@huawei.com>
References: <20240420025029.2166544-1-willy@infradead.org> <20240420025029.2166544-15-willy@infradead.org> <75dbe998-231a-4dd3-70de-d98bf8ee3349@huawei.com>
Subject: Re: [PATCH 14/30] jffs2: Remove calls to set/clear the folio error
 flag
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: Remove calls to set/clear the folio error flag
Thread-Index: um/sGrkRiOSYuM6dehxH/fnGn/zIhQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_085641_223218_6C744F5B 
X-CRM114-Status: GOOD (  11.84  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiTWF0dGhldyBXaWxjb3giIDx3aWxseUBpbmZy
YWRlYWQub3JnPiwgImxpbnV4LWZzZGV2ZWwiIDxsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9y
Zz4KPiBDQzogIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVhZC5vcmc+LCAicmljaGFy
ZCIgPHJpY2hhcmRAbm9kLmF0PiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRl
YWQub3JnPgo+IEdlc2VuZGV0OiBNb250YWcsIDIyLiBBcHJpbCAyMDI0IDE2OjQ2OjM3Cj4gQmV0
cmVmZjogUmU6IFtQQVRDSCAxNC8zMF0gamZmczI6IFJlbW92ZSBjYWxscyB0byBzZXQvY2xlYXIg
dGhlIGZvbGlvIGVycm9yIGZsYWcKCj4g5ZyoIDIwMjQvNC8yMCAxMDo1MCwgTWF0dGhldyBXaWxj
b3ggKE9yYWNsZSkg5YaZ6YGTOgo+PiBOb2JvZHkgY2hlY2tzIHRoZSBlcnJvciBmbGFnIG9uIGpm
ZnMyIGZvbGlvcywgc28gc3RvcCBzZXR0aW5nIGFuZAo+PiBjbGVhcmluZyBpdC4gIFdlIGNhbiBh
bHNvIHJlbW92ZSB0aGUgY2FsbCB0byBjbGVhciB0aGUgdXB0b2RhdGUKPj4gZmxhZzsgaXQgd2ls
bCBhbHJlYWR5IGJlIGNsZWFyLgo+PiAKPj4gQ29udmVydCBvbmUgb2YgdGhlc2UgaW50byBhIGNh
bGwgdG8gbWFwcGluZ19zZXRfZXJyb3IoKSB3aGljaCB3aWxsCj4+IGFjdHVhbGx5IGJlIGNoZWNr
ZWQgYnkgb3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbC4KPj4gCj4+IENjOiBEYXZpZCBXb29kaG91
c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+Cj4+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0Pgo+PiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4+
IC0tLQo+PiAgIGZzL2pmZnMyL2ZpbGUuYyB8IDE0ICsrKy0tLS0tLS0tLS0tCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4geGZzdGVzdHMg
cGFzc2VkLiBMb29rcyBsaWtlIHRoZSBjaGFuZ2UgaXMgaGFybWxlc3MuCj4gCj4gVGVzdGVkLWJ5
OiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCkFj
a2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
