Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0E1C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 14:37:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94C1600D3
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 14:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94C1600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o1gmziOaTAXFKsVsvSR/FBHYz389syFW2K+6rDTkXa8=; b=ow7qs8xAjZss7KqVWcQ1mCUOk
	7MhjHNuUyXVzzR19XHePg+mGLBANdRei0fIXxKOEf902BWALP+CoA9pjb4ZqGpQ36sH2DQE+gU4/P
	PSALXqqejdYHub7lkvMjXHwThbMMlzuovcep8qLT6I1tPW2/Bp3kgMH1P6LgvneAlkaG2+SUkgyOt
	U42zYZGupbWGDgeu+NPiaXame/oio8YWKmCRvTZ5J3mKn2xkf8qF+fagjs/5OqgY9PSqca7iFkucN
	B0XLwEXG0AQ1Ba5oKSya8rRTQYi/ONyx1W45dpnC+B3QDHxVyTCPXDJgAmdHDr1dbTXccKDx3bpPg
	LCqYMRi3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWK9n-009Wo4-SI; Tue, 13 Apr 2021 14:36:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWK9T-009Wjo-6p
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 14:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=K8Ko2DKzzY9EqkfF4UTVU38dDMLyni2qiaowVjA/4dw=; b=gOHqVdFO/pN2pjj0ZJQGsK/DlN
 KR2DbMPKfuMRNAADNJcANoz1MEd6ms89AiijR2HkH7oOY35tvRla4Al/TP25vrdqVE82IgKETWTRU
 RB/iSyIyz4snSE9pUjMo05hd6LSfIONwMh0kcprE5/jDZWiGzZphvwFN97tu5nAWA0IXREC7bTnXz
 ndBGUTUwGCcu8NXxKwn5MoLJtuipnZDnBaeBIHADtPfe1Gq05poJ53vcedqeCCHC5ecCUs5nTwWJM
 TGThF8NAfSLFtpCS7cGyzjsQ6zxaIK0JLxHwEmhPDgcIBj5Clj4na2x0/iqjzaZSXOhgy9D2bU7GX
 215s+hnA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWK9Q-0076pH-6m
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 14:36:25 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 46FF6240016;
 Tue, 13 Apr 2021 14:36:20 +0000 (UTC)
Date: Tue, 13 Apr 2021 16:36:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI issues with lpc32xx  Was: UBI issues with 5.11.11
Message-ID: <20210413163619.62ab4ffe@xps13>
In-Reply-To: <20210413124839.GA34377@localhost>
References: <20210407190302.GA12280@localhost>
 <20210407202356.GA31407@localhost>
 <20210412022946.GA38534@localhost> <20210412180233.3c7148d0@xps13>
 <20210412180531.GA27730@localhost> <20210413120034.50dbe7d0@xps13>
 <20210413124839.GA34377@localhost>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_073624_399277_8FCDD39A 
X-CRM114-Status: GOOD (  10.18  )
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

SGkgVHJldm9yLAoKVHJldm9yIFdvZXJuZXIgPHR3b2VybmVyQGdtYWlsLmNvbT4gd3JvdGUgb24g
VHVlLCAxMyBBcHIgMjAyMSAwODo0ODozOQotMDQwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIFR1
ZSAyMDIxLTA0LTEzIEAgMTI6MDA6MzQgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBJIHRy
aWVkIGFub3RoZXIgdmVyc2lvbiBvZiB0aGUgcGF0Y2gsIHBsZWFzZSB0ZWxsIG1lIGlmIGl0IHdv
cmtzCj4gPiBiZXR0ZXIgZm9yIHlvdS4gSWYgeWVzLCBJIHdpbGwgaGF2ZSB0byBjb3B5IHRoaXMg
Zml4IGZvciA0IG90aGVyCj4gPiBkcml2ZXJzIGluIHRoZSBzYW1lIHNpdHVhdGlvbi4gIAo+IAo+
IFN1Y2Nlc3MhIFRoYW5rIHlvdSA6LSkKPiBZb3VyIHYyIHBhdGNoIHdvcmtzIHBlcmZlY3RseS4K
CkdyZWF0ISBUaGFua3MgZm9yIHRlc3RpbmchCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
