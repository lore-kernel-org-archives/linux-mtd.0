Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6C2CE7A89
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTSDQ90Ut91uNO9rJlm2bu4mzQocnTqozlY7yBMeoh8=; b=fOwzFp5thdPova
	qqSAqC1/J2FgSPUAzbAC67r05VfuiUp+KO5ORHr7I6gCCL9fgIdKJ83nWpfO5iGVbSjwKu8CqG6Kd
	tpbz28ExnMoswkCPLjzh5hngjtN0cAe+ighT6sd5INdAy4q05lUN7Iau6W0ceu5SXYGUPu25H2Fql
	MWaeDthRT+w+rBYFowUjHaQmKs8rBmJLm3FE5I8B4cL3TG4w28Dj0W90htq+B7GV2oyMvq2ig6GXI
	562561eZ3GrCd60Cx8ewcBKriqZUTnGdfp6KHotoI37+i6QhlwjLZyLnbWlBUR8ULQpv0zk+Z9gv1
	k7HlgjGVvH7GI8RCeLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpDq-0000000Bocg-0xMI;
	Fri, 14 Nov 2025 08:31:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpDo-0000000BocD-1Iv1
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 08:31:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 63F261A1A9E;
	Fri, 14 Nov 2025 08:31:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A9666060E;
	Fri, 14 Nov 2025 08:31:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1C46102F29CE;
	Fri, 14 Nov 2025 09:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763109112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6PpAftnPCjZrCB5oWldRnnnZnYTJ9d955gTmWsXKxsI=;
	b=mPqF3wiDb3hiEXablEkO+FbWqrMXoQvr4Z2nIWlAP5Y+OlfwiEnItF0/n3SmpGNspg/vH7
	U2uvtvHn4fDSCy3Kf6xzhmMbpCZHC5VvzX2wc3BS7bIFT9RJiDHXDTNf89+vggA6pO6eBP
	BKWXlCW6dQanxtkogIL5oM0yZL3xNYyTfchfaNWDxVJQpv1PLDlP7itWoDTHjltxMs2CYE
	bSI9NLPshgTcYxAw+xXy/2PlfkvDuEoLujjeLE5CbH7VscEq4YTzHnLgeyTdQiiTR4+i98
	54OojWhBuRRNFwGOMB2D8qh1rmQA71zmOvNxFsFBK5vn8K6YuEUE4NvRtXuqkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  chengzhihao1@huawei.com,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/1] mtd: ubi: skip programming unused bits in ubi
 headers
In-Reply-To: <20251114024452.2927429-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Fri, 14 Nov 2025 10:44:52 +0800")
References: <20251114024452.2927429-1-linchengming884@gmail.com>
	<20251114024452.2927429-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 14 Nov 2025 09:31:47 +0100
Message-ID: <87qzu1f218.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_003156_480510_E72F898F 
X-CRM114-Status: UNSURE (   6.57  )
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

SGkgQ2hlbmcgTWluZywKCj4gQEAgLTExNTAsNiArMTE1MiwxNCBAQCBpbnQgdWJpX2lvX3dyaXRl
X3ZpZF9oZHIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0sCj4gIAkJcmV0dXJuIC1F
Uk9GUzsKPiAgCX0KPiAgCj4gKwlpZiAodWJpLT52aWRfaGRyX3NoaWZ0KSB7Cj4gKwkJbWVtc2V0
KChjaGFyICopcCwgMHhGRiwgdWJpLT52aWRfaGRyX3NoaWZ0KTsKPiArCQltZW1zZXQoKGNoYXIg
KilwICsgdWJpLT52aWRfaGRyX3NoaWZ0ICsgVUJJX1ZJRF9IRFJfU0laRSwgMHhGRiwKPiArCQkg
ICAgICAgdWJpLT52aWRfaGRyX2Fsc2l6ZSAtICh1YmktPnZpZF9oZHJfc2hpZnQgKyBVQklfVklE
X0hEUl9TSVpFKSk7Cj4gKwl9IGVsc2Ugewo+ICsJCW1lbXNldCgoY2hhciAqKXAgKyBVQklfVklE
X0hEUl9TSVpFLCAweEZGLCB1YmktPnZpZF9oZHJfYWxzaXplIC0gVUJJX1ZJRF9IRFJfU0laRSk7
Cj4gKwl9Cj4gKwoKSXMgaXQgbm90IHBvc3NpYmxlIHRvIG1lbXNldCgpIHRoZSBidWZmZXIgYmVm
b3JlIHdyaXRpbmcgdGhlIFZJRCBoZWFkZXI/CkkgaGF2ZW4ndCBmb3VuZCBxdWlja2x5IGEgZ29v
ZCBwbGFjZSB0byBkbyB0aGF0LCBzbyBpbiBhbnkgY2FzZSwKClJldmlld2VkLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
