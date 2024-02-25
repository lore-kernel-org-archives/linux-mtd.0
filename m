Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE93C54E41
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Feb 2024 20:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=egLTbnjgCfg/FIv/NolS28NnuZWxURsPDjefS4zFIRQ=; b=eoUngUB8OvqLTGq+hbqQWqDjy1
	Cd7Y95be6eSxGMehUAeva0z5cqEzrdmcSFMfQZFWtBjYboAbLJdFEIk5pYcD30mj5mgcRUHF/q3Wx
	ApC+DG//q4f0HDD/9yq8luxhaeCN7l+ZjkXQxXMmwj/R87NL8jIee79cg3JZOx7OK8sA7+4RtI+4+
	TnlARy8yEK1+TdPtvbYtUN1LPiDiejVeNjiZDT+uXw9cMnr5wl8GaFWfGpF3A+NiP1KgbTD4R/uOt
	3zaeryHM8LnCT4xqVMWX+CAbClcUTx3uoVP387Owk5alMfkebAGq5yCUS8dRHe/cfmZ54db0tyFnu
	jzh2VzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reLEv-0000000Ffqd-406N;
	Sun, 25 Feb 2024 20:36:49 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reLEs-0000000FfpX-0wiM
	for linux-mtd@lists.infradead.org;
	Sun, 25 Feb 2024 20:36:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 31EB96340E18;
	Sun, 25 Feb 2024 21:36:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 3qNwxpp1w0yq; Sun, 25 Feb 2024 21:36:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DAEFC626FAF3;
	Sun, 25 Feb 2024 21:36:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tQZ0bj8G_Pvz; Sun, 25 Feb 2024 21:36:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 994C664507DE;
	Sun, 25 Feb 2024 21:36:39 +0100 (CET)
Date: Sun, 25 Feb 2024 21:36:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengming zhou <chengming.zhou@linux.dev>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, vbabka@suse.cz, 
	roman gushchin <roman.gushchin@linux.dev>, 
	Xiongwei Song <Xiongwei.Song@windriver.com>, 
	Chengming Zhou <zhouchengming@bytedance.com>
Message-ID: <1319891481.98257.1708893399313.JavaMail.zimbra@nod.at>
In-Reply-To: <20240224135217.830331-1-chengming.zhou@linux.dev>
References: <20240224135217.830331-1-chengming.zhou@linux.dev>
Subject: Re: [PATCH] ubifs: remove SLAB_MEM_SPREAD flag usage
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: remove SLAB_MEM_SPREAD flag usage
Thread-Index: BV6LRmY6creq3OFHfuv/zJQa5hNMcA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_123646_445909_1B237387 
X-CRM114-Status: UNSURE (   3.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nbWluZyB6aG91IiA8
Y2hlbmdtaW5nLnpob3VAbGludXguZGV2Pgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1tbSIKPiA8
bGludXgtbW1Aa3ZhY2sub3JnPiwgdmJhYmthQHN1c2UuY3osICJyb21hbiBndXNoY2hpbiIgPHJv
bWFuLmd1c2hjaGluQGxpbnV4LmRldj4sICJYaW9uZ3dlaSBTb25nIgo+IDxYaW9uZ3dlaS5Tb25n
QHdpbmRyaXZlci5jb20+LCAiY2hlbmdtaW5nIHpob3UiIDxjaGVuZ21pbmcuemhvdUBsaW51eC5k
ZXY+LCAiQ2hlbmdtaW5nIFpob3UiCj4gPHpob3VjaGVuZ21pbmdAYnl0ZWRhbmNlLmNvbT4KPiBH
ZXNlbmRldDogU2Ftc3RhZywgMjQuIEZlYnJ1YXIgMjAyNCAxNDo1MjoxNwo+IEJldHJlZmY6IFtQ
QVRDSF0gdWJpZnM6IHJlbW92ZSBTTEFCX01FTV9TUFJFQUQgZmxhZyB1c2FnZQoKPiBGcm9tOiBD
aGVuZ21pbmcgWmhvdSA8emhvdWNoZW5nbWluZ0BieXRlZGFuY2UuY29tPgo+IAo+IFRoZSBTTEFC
X01FTV9TUFJFQUQgZmxhZyBpcyBhbHJlYWR5IGEgbm8tb3AgYXMgb2YgNi44LXJjMSwgcmVtb3Zl
Cj4gaXRzIHVzYWdlIHNvIHdlIGNhbiBkZWxldGUgaXQgZnJvbSBzbGFiLiBObyBmdW5jdGlvbmFs
IGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZ21pbmcgWmhvdSA8emhvdWNoZW5nbWlu
Z0BieXRlZGFuY2UuY29tPgoKQXBwbGllZC4KTmV4dCB0aW1lIHBsZWFzZSBhZGQgYSByZWZlcmVu
Y2UgdGhhdCBtYWtlcyB2ZXJ5IGNsZWFyIHdoeSBzdWNoIGEgZmxhZwppcyBubyBsb25nZXIgbmVl
ZGVkLgpJdCB0b29rIG1lIGEgZmV3IG1pbnV0ZXMgdG8gZmlndXJlIHdoeSBTTEFCX01FTV9TUFJF
QUQgaXMKbm93IGEgbm8tb3AuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
