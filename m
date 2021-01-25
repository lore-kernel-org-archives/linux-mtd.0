Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C08C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C5222CF6
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C5222CF6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UnDIolpAGlsrJrM+P15ZjY2jbTlrYnfes9R8Ti/YhZk=; b=isYKG2jK6fAWXg7OFcs9Epbgs
	x9co7msVyvPgGMM6FLX/ugoUXUUSXy6y5lxcd/uOvLt3n/Zb6XHoL8GEv48ceuhDuQzc2/xHhecW2
	5y0IMaKK9cACxG3yZwMYUGoNSFEQt0TsW8MjEopWzGPyZdVgOSWjI/06MVNaC+lnMvFKR9QzD5Hj1
	I6150a01+tk3m7if0J2ZUSU3DmsBvjMkTfB+75nVdVYObwTGCNTS5+Qc27js6lGjeSpqZkc34CPKr
	+x6PSButfvXw5w8U7nCaUJ8RW/ef4mW239Iu97CXfPUvC8K1QfWOFG/ClpVzVMK4tNLs7hQLqBXzp
	c+Xc4p1wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3xFB-0001Mq-2E; Mon, 25 Jan 2021 08:29:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3xF8-0001MP-E8
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 08:29:03 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 28B702000C;
 Mon, 25 Jan 2021 08:28:53 +0000 (UTC)
Date: Mon, 25 Jan 2021 09:28:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: yangerkun <yangerkun@huawei.com>
Subject: Re: [PATCH] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
Message-ID: <20210125092852.504f082f@xps13>
In-Reply-To: <01746715-84dc-cd7a-508a-52ba3172e339@huawei.com>
References: <20210104101830.3036-1-miquel.raynal@bootlin.com>
 <01746715-84dc-cd7a-508a-52ba3172e339@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_032902_575928_2A1B3B6D 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: patrick@baymotion.com, zhongguohua1@huawei.com, joern@lazybastard.org,
 linux-mtd@lists.infradead.org, richard@nod.at
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgeWFuZ2Vya3VuLAoKeWFuZ2Vya3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4gd3JvdGUgb24g
TW9uLCAyNSBKYW4gMjAyMSAxMzo0ODozMgorMDgwMDoKCj4gSGksCj4gCj4gUmVjaGVjayB0aGUg
cGF0Y2gsIGFuZCBpdCBzZWVtcyB3ZSBuZWVkIGNoZWNrIGVyYXNlc2l6ZSB0byBwcmV2ZW50IERJ
Vi8wLi4uCgpDYW4geW91IGVsYWJvcmF0ZSBhIGxpdHRsZSBiaXQ/CgpUaGUgZG9fZGl2KCkgIT0g
MCBoYXMgYmVlbiByZXBsYWNlZCBieSB0aGUgJ3JlbScgY29uZGl0aW9uIGFuZCBpdCBzZWVtcwpn
b29kIHRvIG1lLiBTbyBwbGVhc2UgdGVsbCBtZSB3aGF0IGRpdmlzaW9uIGJ5IHplcm8geW91IGFy
ZSB0YWxraW5nCmFib3V0IGJlY2F1c2UgdGhlIGJlZ2lubmluZyBvZiB0aGUgaWYgY29uZGl0aW9u
IGlzICJsZW4gPT0gMCB8fAplcmFzZXNpemUgPT0gMCB8fCBlcmFzZXNpemUgPiBsZW4iLCBzbyBp
dCBkb2VzIGFscmVhZHkgdGFrZSBjYXJlIG9mCnRoaXMgc2l0dWF0aW9uLgoKPiAKPiBTb3JyeSBm
b3IgdGhlIG1pc3Rha2UuIENhbiB5b3UgYWRkIGEgZml4IHBhdGNoIGZvciB0aGlzPwoKSW4gYW55
IGNhc2UgaWYgdGhlIHBhdGNoIHR1cm5zIG91dCB0byBiZSB3cm9uZyBJJ2xsIGFzayB5b3UgdG8g
ZWl0aGVyCnNlbmQgYSBmaXggb3Igc2VuZCBhIHYyIGFuZCBJJ2xsIGRyb3AgdjEuCgo+IOWcqCAy
MDIxLzEvNCAxODoxOCwgTWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gPiBPbiBXZWQsIDIwMjAtMTIt
MzAgYXQgMDI6MTc6MTggVVRDLCB5YW5nZXJrdW4gd3JvdGU6ICAKPiA+PiBXZSBub3cgc3VwcG9y
dCB1c2VyIHRvIHNldCBlcmFzZSBwYWdlIHNpemUsIGFuZCB1c2UgZG9fZGl2IGJldHdlZW4gbGVu
Cj4gPj4gYW5kIGVyYXNlIHNpemUgdG8gZGV0ZXJtaW5lIHRoZSByZWFzb25hYmxlbmVzcyBmb3Ig
dGhlIGVyYXNlIHNpemUuCj4gPj4gSG93ZXZlciwgZG9fZGl2IGlzIGEgbWFjcm8gYW5kIHdpbGwg
b3ZlcndyaXRlIHRoZSB2YWx1ZSBvZiBsZW4uIFdoaWNoCj4gPj4gcmVzdWx0cyBhIG10ZCBkZXZp
Y2Ugd2l0aCB1bmV4Y2VwdGVkIHNpemUuIEZpeCBpdCBieSB1c2UgZGl2X3U2NF9yZW0uCj4gPj4K
PiA+PiBGaXhlczogZmZhZDU2MDM5NGRlICgibXRkOiBwaHJhbTogQWxsb3cgdGhlIHVzZXIgdG8g
c2V0IHRoZSBlcmFzZSBwYWdlIHNpemUuIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiB5YW5nZXJrdW4g
PHlhbmdlcmt1bkBodWF3ZWkuY29tPiAgCj4gPiAKPiA+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4
dCwgdGhhbmtzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
