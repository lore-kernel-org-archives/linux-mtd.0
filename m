Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308C5C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:21:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFDCB60233
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFDCB60233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t0KuXJHLEv2I78O46HxjagBRmVkyIlzla4E6Eu876mY=; b=YqHp3lGE2QWDx9Iz/8yEqXV+w
	QAhVDI4zx6dhbegh4x1xtxcVOgbbrgZrbutuCtRpJ0af640FNZZcjSpbED+0TZCUI2PUcbYR8ErYR
	LCbyrJH18o6xkeFwlqwZyeDmCM8u4iO8h8jTTol8kJ058CpK8yP94TcSsa9rRjx44nvekwQcTEv6Z
	pUccVpRAeevKgPzfBh7jGsS5u4VYpq38eKUnvztDZtq9P5eqy4LLrxYBSXG/+hn2wflbNZSO/Tvu6
	5DS/cbW7UWso6N/9h2muY59efvMCx4cYrvRO8nc+tNuXOpjMc/IN5lbzqGrKExnA8EhrYjTivsJLM
	0gWJC1kkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVB7-005mHR-R7; Wed, 03 Mar 2021 17:20:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSuU-005FHj-NU
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=7W4ZpoOKNMCe/VIwbnjgShODpnfk5mttv0NxsLG51CY=; b=a2M6TRp2I1bDvGc4jNdInoCFMt
 aKOzK5PcfJW7OY8RqxatidD4rRhFRtkIEUZpWSZ7+LRcLtWxCxG6GiV5TJ3P3Av72whuakMYVuAD/
 VviB11CaHL6JtqiFVD5/Gw0zLhNXAHK9h/c4ByIqGnSbc4gzBSukQVjxBfe2ovWaeBWPwEodcvA2F
 5IOrVZGaw6lAKXjAOdH7GF83PFPyfNrP6Djgs1aJ3hjxV5PO00QeiagdVwH2ne3UVg0ekSuZu0baX
 BAYBjcryaTdHHkaPf5HG6LY9Ywulve9l6AI31Dd0TKXlwKvaeTKLtYvsM1hs5+tOE7RXd4iUYtfph
 nW59RZ9Q==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHO6A-0023mk-AI
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 09:47:19 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 87D3BE0003;
 Wed,  3 Mar 2021 09:46:52 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:46:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: nand: Fix error handling in nand_prog_page_op
Message-ID: <20210303104651.2d49fb2c@xps13>
In-Reply-To: <20210303094246.5724-1-colin.king@canonical.com>
References: <20210303094246.5724-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_094719_968118_58265C17 
X-CRM114-Status: UNSURE (   9.75  )
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

SGkgQ29saW4sCgpDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9u
IFdlZCwgIDMgTWFyIDIwMjEKMDk6NDI6NDYgKzAwMDA6Cgo+IEZyb206IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gVGhlIGxlc3MgdGhhbiB6ZXJvIGNvbXBh
cmlzb24gd2l0aCBzdGF0dXMgaXMgYWx3YXlzIGZhbHNlIGJlY2F1c2Ugc3RhdHVzCj4gaXMgYSB1
OC4gRml4IHRoaXMgYnkgdXNpbmcgcmV0IGFzIHRoZSByZXR1cm4gY2hlY2sgZm9yIHRoZSBjYWxs
IHRvCj4gY2hpcC0+bGVnYWN5LndhaXRmdW5jKCkgYW5kIGNoZWNraW5nIG9uIHRoaXMgYW5kIGFz
c2lnbmluZyBzdGF0dXMgdG8gcmV0Cj4gaWYgaXQgaXMgT0suCj4gCj4gQWRkcmVzc2VzLUNvdmVy
aXR5OiAoIlVuc2lnbmVkIGNvbXBhcmVkIGFnYWluc3QgMCIpCj4gRml4ZXM6IDUyZjY3ZGVmOTdm
MSAoIm10ZDogbmFuZDogZml4IGVycm9yIGhhbmRsaW5nIGluIG5hbmRfcHJvZ19wYWdlX29wKCkg
IzEiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNh
bC5jb20+CgpUaGFua3MgZm9yIHRoZSBmaXgsIGJ1dCB0aGlzIGhhcyBiZWVuIGhhbmRsZWQganVz
dCBhbiBob3VyIGFnbyA6KQoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
