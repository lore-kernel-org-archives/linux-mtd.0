Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91849C4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 23:05:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9BB22509
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 23:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9BB22509
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8HX9WVLwv8f8toOcGT/2U/RHfg1CYgMUjTbySMfDOis=; b=zyrzMliBc00uKxd+WCfky1jwl
	BG4AZGmzJXso9F15ooAhyaNrgTd0pe/dd1CUV1ibE8xsWjvdVXfIKDpVdgQgKWg9zCZxHBF6ZiF1S
	tdatG12FCivEuU+8xDUPOCsZYfpCb0q4aR4PP3tbvD0Qog39BiVLWO88y0OI/jzNGfS4zb0fh3f0l
	DfWn98DUW9A5BrltWRbD0tm99Psz+VndJYQNQbT0A+SW3docHC3XxqkjLlvnyCf8ScAsUjqU21hYE
	eJSxmAxX4XeUF3fKb8PW+3enOLSbXowTt1Jr2rYtQFjuo2p3IcQ77dVfJwmm8Psje+QziT300B7mG
	OZqjQYBmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kowsw-0001RG-4q; Mon, 14 Dec 2020 23:04:06 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kowss-0001QJ-CZ
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 23:04:03 +0000
X-Originating-IP: 90.89.139.205
Received: from xps13 (lfbn-tou-1-1326-205.w90-89.abo.wanadoo.fr
 [90.89.139.205]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E3920FF802;
 Mon, 14 Dec 2020 23:03:56 +0000 (UTC)
Date: Tue, 15 Dec 2020 00:03:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
Message-ID: <20201215000355.760d3a95@xps13>
In-Reply-To: <CAFLxGvx4eZ3ZrciBLpF6qiQ7Srev=jGtyf50sC-qN9Q=z+xDQQ@mail.gmail.com>
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
 <CAFLxGvx4eZ3ZrciBLpF6qiQ7Srev=jGtyf50sC-qN9Q=z+xDQQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_180402_539817_95E639AC 
X-CRM114-Status: GOOD (  12.69  )
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
Cc: David Schaefer <david.tillmann.schaefer@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmQud2VpbmJlcmdlckBnbWFpbC5jb20+
IHdyb3RlIG9uIE1vbiwgMTQgRGVjCjIwMjAgMjI6MjQ6MjQgKzAxMDA6Cgo+IE9uIE1vbiwgRGVj
IDE0LCAyMDIwIGF0IDY6MjIgUE0gRGF2aWQgU2NoYWVmZXIKPiA8ZGF2aWQudGlsbG1hbm4uc2No
YWVmZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBJZiB0aGlzIGlzIGEgcmVncmVzc2lvbiwg
aG93IGNhbiB3ZSBjb250aW51ZSBoZXJlPyBDYW4gSSBnaXZlIGhhcmR3YXJlCj4gPiBzcGVjcyBh
bmQgbG9ncz8gSSBoYXZlIHNvbGRlcmVkIG9uIHRoZSBib2FyZCB0byBhY2Nlc3MgVUFSVC4gSSBj
YW4KPiA+IHByb3ZpZGUgZS5nLiBib290IGxvZ3MuICAKPiAKPiBObyBuZWVkIHRvIHdvcnJ5LiBM
ZXQncyB3YWl0IGZvciBNaXF1ZWwsIEknbSBzdXJlIGhlIGhhcyBhbiBpZGVhLgo+IEluIHRoZSBh
YnNvbHV0ZSB3b3JzdCBjYXNlIHdlIHJlY29uc3RydWN0IHRoZSBvbGQgZHJpdmVyLgo+IAoKWWVz
IGluZGVlZCwgdGhpcyBsb29rcyBsaWtlIGEgcmVncmVzc2lvbiBidXQgSSBiZXQgd2UgYWxyZWFk
eSBmaXhlZCBpdC4KUGVyaGFwcyB0aGVyZSBoYXMgYmVlbiBhIGJhY2twb3J0aW5nIGlzc3VlIGFu
ZCB3ZSBkaWQgbm90IHNwb3QgaXQuCkNhbiB5b3UgcGxlYXNlIHRyeSB0aGUgZm9sbG93aW5nIGZp
eGVzIChpbiB0aGlzIG9yZGVyKToKZjY5OTdiZWM2YWY0IG10ZDogcmF3bmFuZDogbWFydmVsbDog
Zml4IHRoZSBjaGlwLXNlbGVjdCBEVCBwYXJzaW5nIGxvZ2ljCmI3NjQwMWZjNGJhNyBtdGQ6IHJh
d25hbmQ6IG1hcnZlbGw6IHBhc3MgbXMgZGVsYXkgdG8gd2FpdF9vcAphMmVlNDFmZDk1M2UgbXRk
OiByYXduYW5kOiBtYXJ2ZWxsOiBmaXggY29tbWFuZCB4dHlwZSBpbiBCQ0ggd3JpdGUgaG9vawo5
MGQ2MTc2MzMzNjggbXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBGaXggcmVhZCBsb2dpYyBmb3IgbGF5
b3V0cyB3aXRoIC0+bmNodW5rcyA+IDIKN2ZkMTMwZjc0MTZmIG10ZDogcmF3bmFuZDogbWFydmVs
bDogc3VwcG9ydCA4Yi81MTJCIHN0cmVuZ3RoIGZvciAya2lCIHBhZ2VzIGxheW91dAo1M2M4M2I1
OTc1OWMgbXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBmaXggdGhlIElSUSBoYW5kbGVyIGNvbXBsZXRl
KCkgY29uZGl0aW9uCmNhZmI1NmRkNzQxZSBtdGQ6IHJhd25hbmQ6IG1hcnZlbGw6IHByZXZlbnQg
dGltZW91dHMgb24gYSBsb2FkZWQgbWFjaGluZQpjMjcwNzU3NzJkMWYgbXRkOiByYXduYW5kOiBt
YXJ2ZWxsOiBGaXggdGhlIGNvbmRpdGlvbiBvbiBhIHJldHVybiBjb2RlCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
