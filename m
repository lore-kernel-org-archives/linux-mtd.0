Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7188CD58D5E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UrG1mqENS68zIne6oq6rWMGILOgsnF0fF+taQsf1Z6g=; b=eedlAhgzoq17Z/uDf0UZ5ish5t
	FY/UCNmiPXA7wfMRy3yAQUxdj0gxwtkgD+zhatw84sA2/hnv29RldfW4j+Mq0+yzWqKXDMNznmd71
	KDpPBiIhaCe28k27J+BxoxdYUvsoyg+Go5hOo1bFgqvas8YytLGgdpFnnN9eetX2/TdX+/vyj+ihi
	ki3TckX/ojTRR+280gSPh0clUFzeLt5nFuyb15N6eclIFstVh41PhZ7KC/pz2yAr1hFgJr90ch4YC
	ycYe3yXortIwPksBK4frTZKCmiGf8m8Pj1Zn5+GkcHtujkkWnpnJlo68d2CkE6gy6I8cxzpgZf22h
	OvbloU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbHb-00000008YEF-3OKt;
	Mon, 25 Nov 2024 15:45:51 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbHZ-00000008YDf-2ATL
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 15:45:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4FEB22E6144;
	Mon, 25 Nov 2024 16:45:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HNGQ_g1XfVhQ; Mon, 25 Nov 2024 16:45:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C77C92E6147;
	Mon, 25 Nov 2024 16:45:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hXuFEPYHrYnn; Mon, 25 Nov 2024 16:45:47 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A20A12E612D;
	Mon, 25 Nov 2024 16:45:47 +0100 (CET)
Date: Mon, 25 Nov 2024 16:45:47 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <rickard.andersson@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <1565292518.70981056.1732549547543.JavaMail.zimbra@nod.at>
In-Reply-To: <1924178924.70981051.1732549494294.JavaMail.zimbra@nod.at>
References: <20241125134820.560648-1-rickard.andersson@axis.com> <1924178924.70981051.1732549494294.JavaMail.zimbra@nod.at>
Subject: Re: [PATCH 1/2] ubi: Expose interface for detailed erase counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Expose interface for detailed erase counters
Thread-Index: 48qeH/Yt0zKh2IEt9pOD12QbbL+YPsvvEtHB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_074549_692887_85F9AD16 
X-CRM114-Status: GOOD (  11.10  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4KPiBBbjogIlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVyc3NvbkBh
eGlzLmNvbT4KPiBDQzogImNoZW5nemhpaGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiwg
ImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgInJpY2thcmQzMTQg
YW5kZXJzc29uIgo+IDxyaWNrYXJkMzE0LmFuZGVyc3NvbkBnbWFpbC5jb20+LCAia2VybmVsIiA8
a2VybmVsQGF4aXMuY29tPgo+IEdlc2VuZGV0OiBNb250YWcsIDI1LiBOb3ZlbWJlciAyMDI0IDE2
OjQ0OjU0Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCAxLzJdIHViaTogRXhwb3NlIGludGVyZmFjZSBm
b3IgZGV0YWlsZWQgZXJhc2UgY291bnRlcnMKCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAt
LS0tLQo+PiBWb246ICJSaWNrYXJkIFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhp
cy5jb20+Cj4+ICsvKioKPj4gKyAqIHN0cnVjdCB1YmlfZWNpbmZvX3JlcSAtIGEgZGF0YSBzdHJ1
Y3R1cmUgdXNlZCBpbiBVQkkgZGV2aWNlIGVyYXNlIGNvdW50Cj4+ICsgKiBpbmZvcm1hdGlvbiBy
ZXF1ZXN0cyBhbmQgcmVzcG9uc2VzLgo+PiArICoKPj4gKyAqIEBzdGFydF9lY19yZXE6IGZpcnN0
IGVyYXNlIGNvdW50ZXIgYmxvY2sgaW4gcmFuZ2UgdG8gcmVhZAo+PiArICogQGVuZF9lY19yZXE6
IGxhc3QgZXJhc2UgY291bnRlciBibG9jayBpbiB0aGUgaGFsZi1vcGVuIHJhbmdlCj4+ICsgKiBA
ZW5kX2VjX3JlczogbGFzdCBlcmFzZSBjb3VudGVyIGJsb2NrIHRoYXQgd2FzIGFjdHVhbGx5IHJl
YWQKPj4gKyAqIEBlcmFzZV9jb3VudGVyczogYXJyYXkgb2YgZXJhc2UgY291bnRlciB2YWx1ZXMK
Pj4gKyAqIEBwYWRkaW5nOiByZXNlcnZlZCBmb3IgZnV0dXJlLCBub3QgdXNlZCwgaGFzIHRvIGJl
IHplcm9lZAo+PiArICoKPj4gKyAqIEVyYXNlIGNvdW50ZXJzIGFyZSByZWFkIGluIHJhbmdlIEBz
dGFydF9lY19yZXEgdG8gQGVuZF9lY19yZXEuIFJhbmdlIGlzCj4+IGhhbGYtb3Blbgo+PiArICog
aS5lIGVyYXNlIGNvdW50ZXIgb2YgZW5kX2VjX3JlcSBpcyBub3QgYWN0dWFsbHkgaW5jbHVkZWQu
Cj4+ICsgKiBUaGUgcmVhZCBlcmFzZSBjb3VudGVycyBhcmUgcGxhY2VkIGluIEBlcmFzZV9jb3Vu
dGVycy4gSWYgYSBibG9jayBpcyBiYWQgb3IKPj4gaWYgdGhlCj4+ICsgKiBlcmFzZSBjb3VudGVy
IGlzIHVua25vd24gdGhlIHZhbHVlIG9mIHRoZSBibG9jayB3aWxsIGJlIHNldCB0byAtMS4KPj4g
KyAqLwo+PiArc3RydWN0IHViaV9lY2luZm9fcmVxIHsKPj4gKwlfX3MzMiBzdGFydF9lY19yZXE7
Cj4+ICsJX19zMzIgZW5kX2VjX3JlcTsKPj4gKwlfX3MzMiBlbmRfZWNfcmVzOwo+PiArCV9fczMy
IGVyYXNlX2NvdW50ZXJzWzEwMDBdOwo+IAo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZSBhIGxp
bWl0ZWQgbnVtYmVyLiBKdXN0IHVzZSBhIGZsZXhpYmxlIGFycmF5Lgo+IElmIHVzZXJzcGFjZSBh
c2tzIGZvciBtb3JlIGVudHJpZXMgdGhhbiB0aGUgcHJvdmlkZWQgYnVmZmVyIGNhbiBob2xkLAo+
IF9fcHV0X3VzZXIoKQo+IHdpbGwgZmFpbCBhbnl3YXlzLgo+IAo+IEhhdmUgYSBsb29rIGF0IGZp
Ym1hcCwgSSB0aGluayB5b3UgY2FuIHRoZSBtb2RlbCB0aGUgQVBJIHRoZSBzYW1lIHdheS4KCipm
aWVtYXAKIApUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
