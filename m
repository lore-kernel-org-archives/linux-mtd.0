Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D95C19F32
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DuI0AVn2mkvYWC9fTmR6xpO7GURoDjTDjKKC3eCT1m4=; b=inWLNThq00reaQ
	9Bc4NX6ZaN39h9+FZXzV4XzMWfOTwAa6qIkZ/dk3iIUf7t6T7Hu+virXWYrB2RYSm1GekFNH1gh5m
	4IK06geXBuRdmRdRbuInIi1qziXk2yZc3277YlBKA6tYCV7Jfd8x+1LaWBu56SjFXbJtiWFfj5QOI
	thLlxF3Vsf3gAHQ6zlIxsaSdAjNJj+YBUDu408A0DR3xpuO7RUSqSevUvlIkwnnQCMSdA3zUDgXes
	I/XsJn5IoSKcf73+cGZA5wxf9dxqsgd/DMtZlEIlkdK2XBv5VG4ch5mevyIYThaxwmM19Q4c3V/8D
	4gXam5mW94VQMP7x2zjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkhB-00000007SSf-08jL;
	Wed, 05 Mar 2025 09:05:41 +0000
Received: from mail.commetrax.com ([141.95.18.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpka7-00000007Qwa-29OM
	for linux-mtd@lists.infradead.org;
	Wed, 05 Mar 2025 08:58:25 +0000
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 79A432470B; Wed,  5 Mar 2025 09:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1741165054;
	bh=5Ag/W9YjfbFJOGLdiTXWgO7Nle+kHbv1rgCfGcU2GBw=;
	h=Date:From:To:Subject:From;
	b=Evmvz1e3f4ZCocHsZIx3DloR9chLQMUVRh0/3/qPruI/uI9NCzxSZKVEkxgDzB4Ip
	 91NZ5cz7pX8LYZvAOrXu9rwleYsmJKf0TQrryiMT1uRsxgTYThGBIG6hpFKpBsmlDs
	 eW2emP3ylHnbcaVPqVPoVlOuOsgUldEw6WCOo/cwtDgZUTVEmL5zevjFVJGbOsT4Z4
	 imMqwuXPbUCepXbdRQm8922+8FjkrabFuDk52NtIimYO0SrSO/owas5ZumILNL9yrC
	 ziX8B7q7u5R3YEfd5ELEAl7r3YWrqQ7yMlEAYHF+SgcIRsq8iOzRM8fF3kibqQeVxf
	 GFS6hsDVTIAEw==
Received: by mail.commetrax.com for <linux-mtd@lists.infradead.org>; Wed,  5 Mar 2025 08:56:20 GMT
Message-ID: <20250305084500-0.1.88.nsf4.0.5awojr35bl@commetrax.com>
Date: Wed,  5 Mar 2025 08:56:20 GMT
From: "Vincenc Turek" <vincenc.turek@commetrax.com>
To: <linux-mtd@lists.infradead.org>
Subject: Message from production
X-Mailer: mail.commetrax.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_005824_266182_03FBF4D4 
X-CRM114-Status: UNSURE (   1.96  )
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

SGVsbG8sCgpXZSBzcGVjaWFsaXplIGluIG1hbnVmYWN0dXJpbmcgcGFja2FnaW5nIGZvciB0aGUg
Zm9vZCBpbmR1c3RyeSwgc3VjaCBhcyB0aG9zZSBmb3Iga2V0Y2h1cCwgbXVzdGFyZCwgYW5kIHNh
dWNlcy4KCldlIGFsc28gb2ZmZXIgc29sdXRpb25zIGZvciBob3VzZWhvbGQgYW5kIGNvbnN0cnVj
dGlvbiBjaGVtaWNhbHMg4oCTIHBhY2thZ2luZyBpbiB2YXJpb3VzIHNpemVzIGFuZCBzaGFwZXMg
dG8gbWVldCB5b3VyIHJlcXVpcmVtZW50cy4KCk91ciBwcm9kdWN0cyBhcmUgZHVyYWJsZSBhbmQg
cmVzaXN0YW50IHRvIGRhbWFnZSwgZW5zdXJpbmcgZmFzdGVyIGFuZCBoYXNzbGUtZnJlZSB0cmFu
c3BvcnRhdGlvbiBvZiB5b3VyIGdvb2RzLgoKSG93IGFib3V0IGEgc2hvcnQgcHJlc2VudGF0aW9u
IG9mIG91ciBvZmZlcj8KCgpCZXN0IHJlZ2FyZHMKVmluY2VuYyBUdXJlawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
