Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0242C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:50:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4405564FC0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4405564FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IrOS/3eLmcbaQ5rQtGkYcNpqPCjqZSHpMANX6jtYrmQ=; b=BjRxDlyDcwhFyYi1vCRnVyLoB
	/2eR3sLKg/mOk047xWE67XqY1gK2ewP/JVsvzgexbJzxdETXfEPgFtIEsSj3D9cfWdcHfR+b46NzQ
	AWXr1eK9PQHc8GprDp50X2t3FZoHgRp45fkR/e0lq3U50RmtQI3wQqJb6q11W1unWz2XUNUjdTzw6
	M4KwI9B3Xev6vFhzXCGJBmF0ybL9z99jgLBgDpeErzmT08Hz2vXBrkEEhvm0YSupaOpW63f8kJvBC
	DawqWbLJ57jrIg2F2D7HtFZ6DJ0BsUEtcF7ByHf4QdbQfIfUHJAUKOK/q192JRB/b85XKfEXUBAbH
	anDwIlBSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81Uh-00033P-9v; Fri, 05 Feb 2021 13:49:55 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81Uc-00030q-Ou
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:49:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7360C6083244;
 Fri,  5 Feb 2021 14:49:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JPbxzYm3nNB6; Fri,  5 Feb 2021 14:49:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D2BC36083271;
 Fri,  5 Feb 2021 14:49:38 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TvL0LAil24Tx; Fri,  5 Feb 2021 14:49:38 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B68A66083244;
 Fri,  5 Feb 2021 14:49:38 +0100 (CET)
Date: Fri, 5 Feb 2021 14:49:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Message-ID: <1065601601.365300.1612532978692.JavaMail.zimbra@nod.at>
In-Reply-To: <YB1J53adyW4BBK3g@ArchLinux>
References: <20210205124151.1386271-1-unixbhaskar@gmail.com>
 <20210205142618.116852a0@xps13> <YB1J53adyW4BBK3g@ArchLinux>
Subject: Re: [PATCH] drivers: mtd: Better word replace a not so good word in
 the file mtd_blkdevs.c
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: drivers: mtd: Better word replace a not so good word in the file
 mtd_blkdevs.c
Thread-Index: M9XtEtP875AfB6QoNEmuhAuINOLBEw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_084950_927394_946D8A09 
X-CRM114-Status: UNSURE (   4.56  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkJoYXNrYXIgQ2hvd2RodXJ5
IiA8dW5peGJoYXNrYXJAZ21haWwuY29tPgo+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cj4gQ0M6ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmln
bmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJsaW51eC1tdGQiIDxsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sCj4gImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+LCAiUmFuZHkgRHVubGFwIiA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+
IEdlc2VuZGV0OiBGcmVpdGFnLCA1LiBGZWJydWFyIDIwMjEgMTQ6MzY6MzkKPiBCZXRyZWZmOiBS
ZTogW1BBVENIXSBkcml2ZXJzOiBtdGQ6IEJldHRlciB3b3JkIHJlcGxhY2UgYSBub3Qgc28gZ29v
ZCB3b3JkIGluIHRoZSBmaWxlIG10ZF9ibGtkZXZzLmMKCj4gT24gMTQ6MjYgRnJpIDA1IEZlYiAy
MDIxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PkhpIEJoYXNrYXIsCj4+Cj4+Qmhhc2thciBDaG93
ZGh1cnkgPHVuaXhiaGFza2FyQGdtYWlsLmNvbT4gd3JvdGUgb24gRnJpLCAgNSBGZWIgMjAyMQo+
PjE4OjExOjUxICswNTMwOgo+Pgo+Pj4gcy9mdWNraW5nL2ludml0ZS8KCklmIHlvdSBhcmUgYWZy
YWlkIG9mICJmdWNraW5nIiwgcGxlYXNlIHJlcGxhY2UgaXQgd2l0aCAiZipja2luZyIgb3Igc3Vj
aC4KImludml0ZSIgbWFrZXMgbm8gc2Vuc2UuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
