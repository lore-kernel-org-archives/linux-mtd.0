Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00432CAC58E
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWIP18lz+K1CEJU0bXSe41SMiebaTyVtRgJxBIQpiik=; b=j6FcTWhrvVYlA8
	u9I6H1R9xQzkNXuDmrPbcURyxc1tE8/PHAOI/en9+hmWBS0UboAK/NlB5Hsjn8eCiZabJbyuyipCj
	GLtqHg+3XhcMgXdxAbJlqs3HC7mKtdQN4JnmagO241Aq24eAjOByqKbMg9ubOhhpyaS8v3+Qk9k4F
	r+e9YtCCK0wOJzOxXwBV6YkHywzT6atdz68N/GsdKUt7QTRFBi5BZFw3Evxvd7TAjr6im6D+5EKxj
	giS9I8qaB3C+V9lNi02rJszkZbyhX20P2zKMzC/PCVfYibAjNREPsnZ08pRJH89FOawxWPMw/18Je
	2PsESIwF9kGYzA80Fb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhu5-00000003R8J-2xqA;
	Thu, 11 Sep 2025 14:04:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhu2-00000003R6e-1I3p
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 14:04:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B86E41A0E10;
	Thu, 11 Sep 2025 14:03:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 876D460630;
	Thu, 11 Sep 2025 14:03:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40340102F2833;
	Thu, 11 Sep 2025 16:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757599429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CDK2GVhKguRdAprpwq3TCBc/3qnYl+uGZ7pjzM5YAm0=;
	b=kahaefUbv/GwS3Tf82x07gIbaokOyyoAL8ctxaE9NVsC1xGcEeT6p0af1damiTMWd/F8uk
	rOSBSewqzHpSEnRVkrYge1mFKF+8t3vnJz+GK4tapukLMwrwtjpdC/yTzsyFUiDAuvyclB
	9emKDQqt7QnDMJmYamryPcpZk1MilFgpilabDDWceTuEZoElYRb2bg9CXKUFfHVI2W8eMd
	ndjbbiJT7MoVO18nOrjCeIrF/qW56ma7PjQRBm1R7EGiPx1SK6I0OvkhsZv2TjJmVNgAKI
	sVEm4/tFcYTE/UvCiJ4jRyEEqgMxUIaCnZijx3YxL8+47pKQ7U65S7phKN9HHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Santhosh Kumar K <s-k6@ti.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org,  Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
In-Reply-To: <a208824c-acf6-4a48-8fde-f9926a6e4db5@gmail.com> (Gabor Juhos's
	message of "Thu, 11 Sep 2025 10:33:48 +0200")
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
	<175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
	<454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com>
	<87348tbeqg.fsf@bootlin.com>
	<a208824c-acf6-4a48-8fde-f9926a6e4db5@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 16:03:39 +0200
Message-ID: <87frct9jd0.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_070358_481415_F4B88FC7 
X-CRM114-Status: UNSURE (   9.34  )
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

SGVsbG8sCgo+Pj4+IEFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKPj4+PiBbMS8xXSBtdGQ6
IGNvcmU6IGFsd2F5cyB2ZXJpZnkgT09CIG9mZnNldCBpbiBtdGRfY2hlY2tfb29iX29wcygpCj4+
Pj4gICAgICAgIGNvbW1pdDogYmY3ZDA1NDNiMjYwMmJlNWNiNDUwZDhlYzVhODcxMDc4NzgwNmY4
OAo+Pj4KPj4+IEknbSBzZWVpbmcgYSBmYWlsdXJlIGluIFNQSSBOT1IgZmxhc2hlcyBkdWUgdG8g
dGhpcyBwYXRjaDoKPj4+IChUZXN0ZWQgb24gQU02MnggU0sgd2l0aCBTMjhIUzUxMlQgT1NQSSBO
T1IgZmxhc2gpCj4KPiBTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UuCj4KPj4gR2Fib3IsIGNh
biB5b3UgY2hlY2sgd2hhdCBoYXBwZW5zIHdpdGggbXRkYmxvY2s/Cj4KPiBUaGUgc3RyYW5nZSB0
aGluZyBpcyB0aGF0IGl0IHdvcmtzIHdpdGggKFNQSSkgTkFORCBmbGFzaGVzOgo+Cj4gIyBjYXQg
L3N5cy9jbGFzcy9tdGQvbXRkMC90eXBlCj4gbmFuZAo+ICMgY2F0IC9zeXMvY2xhc3MvbXRkL210
ZDAvb29iYXZhaWwKPiAwCj4gIwo+ICMgaGV4ZHVtcCAtbiAyMDQ4IC9kZXYvbXRkMAoKVGhpcyBp
cyBub3QgbXRkYmxvY2ssIHRoZSByZXBvcnQgd2FzIHVzaW5nIG10ZGJsb2NrLCBub3QgbXRkIGRp
cmVjdGx5LiBJCmRvbid0IGtub3cgaWYgdGhhdCBhY3R1YWxseSBtYWtlcyBhIGRpZmZlcmVuY2Us
IGJ1dCBpdCBpcyB3b3J0aCB0aGUgdHJ5LgoKU2FudGhvc2gsIHBsZWFzZSBzZW5kIGEgcmV2ZXJ0
IGZvciBub3cuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
