Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A56C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 18:09:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAAFA64DAE
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 18:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAAFA64DAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQILWPrGIZaRbLmALioeYtOHlDgxYKPpBE4IGFn4bwE=; b=XcCbEedN+TFjTx4wWAAyvv+Uft
	lqvDlvI7RJIgFvN37Mzh/WoJXw7ZbMRFN3JWlwyIezxjBrQyidpaAkFU8ySDwvEvQAQerNC+bJThx
	RkB+u97NsySC46VWUpmJMKuZrqxxSUtlQvGHpwpAwiRznNTMHAsG9zZdIJ+uqueYoZjy7k/9PBk5n
	u/bJn60GKWx+xYDC+r8bWDMoCW9lRMoUuEu5vqArVOt5oGNq/ykF8OhJ8PIQ7EPhojiOJcisFfvJU
	Kmg37S8+nM8o8f/G9P0nzN6CE36AcbOcY6VjSD7/KmeO87j8NCwUsIXPis7lmCN3W4JBlpiOJevLt
	1LX+tSGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6dcE-00029h-AI; Mon, 01 Feb 2021 18:07:58 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6dcB-00028h-9E
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 18:07:56 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 68FFC60002;
 Mon,  1 Feb 2021 18:07:51 +0000 (UTC)
Date: Mon, 1 Feb 2021 19:07:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] mtd: nand: Changes for 5.12
Message-ID: <20210201190749.537fd891@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_130755_435211_34F86CB1 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgZm9sa3MsCgpUaGlzIGlzIHRoZSBOQU5EIFBSIGZvciB2NS4xMi4KClBsZWFzZSBub3RlIHRo
YXQgSSBtZXNzZWQgdXAgKGFnYWluKSB3aGVuIGFwcGx5aW5nIHBhdGNoZXMgc28gSSBqdXN0Cm1v
dmVkIGEgZmV3IHBhdGNoZXMgb3V0IG9mIHRoZSBuYW5kL25leHQgYnJhbmNoIGFuZCBhcHBsaWVk
IHRoZW0gdG8KbXRkL25leHQuIEFsbCBwYXRjaGVzIHRoZXJlIGhhdmUgYmVlbiBsYXlpbmcgaW4g
bmV4dCBmb3IgYXQgbGVhc3QgYQp3ZWVrIGFscmVhZHkgYW5kIHlvdSBjYW4gc2FmZWx5IGlnbm9y
ZSB0aGUgdGltZXN0YW1wIG9mIHRoZSBsYXN0IHBhdGNoCigyMDIxLTAyLTAxIDE4OjU5OjE5ICsw
MTAwKS4KClRoYW5rcywKTWlxdcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCA1YzhmZTU4M2NjZTU0MmFhMGI4NGFkYzkzOWNlODUyOTNkZTM2ZTVlOgoKICBMaW51eCA1LjEx
LXJjMSAoMjAyMC0xMi0yNyAxNTozMDoyMiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdzL25hbmQvZm9yLTUuMTIKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byAwNzNhYmZhN2VhOWE1YjA1MzdkNmY5MmI0MmJhZWRhZjgyYTA0YzUz
OgoKICBtdGQ6IHJhd25hbmQ6IGludGVsOiBGaXggYW4gZXJyb3IgaGFuZGxpbmcgcGF0aCBpbiAn
ZWJ1X2RtYV9zdGFydCgpJyAoMjAyMS0wMi0wMSAxODo1OToxOSArMDEwMCkKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmF3
IE5BTkQgY29udHJvbGxlciBkcml2ZXJzOgoqIEludGVsOiBGaXggYW4gZXJyb3IgaGFuZGxpbmcg
cGF0aCBpbiAnZWJ1X2RtYV9zdGFydCgpJwoqIFRhbmdvOiBSZW1vdmUgdGhlIGRyaXZlcgoqIE1h
cnZlbGw6IENvbnZlcnQgY29tbWEgdG8gc2VtaWNvbG9uCiogTVhDOiBDb252ZXJ0IGNvbW1hIHRv
IHNlbWljb2xvbgoqIFFjb206IEFkZCBzdXBwb3J0IGZvciBRY29tIFNNRU0gcGFyc2VyCgpSZWxh
dGVkIE1URCBjaGFuZ2VzOgoqIHBhcnNlcnM6IEFkZCBRY29tIFNNRU0gcGFyc2VyCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkFybmQgQmVyZ21hbm4gKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IHRhbmdvOiBSZW1vdmUgdGhl
IGRyaXZlcgoKQ2hyaXN0b3BoZSBKQUlMTEVUICgxKToKICAgICAgbXRkOiByYXduYW5kOiBpbnRl
bDogRml4IGFuIGVycm9yIGhhbmRsaW5nIHBhdGggaW4gJ2VidV9kbWFfc3RhcnQoKScKCk1hbml2
YW5uYW4gU2FkaGFzaXZhbSAoMyk6CiAgICAgIGR0LWJpbmRpbmdzOiBtdGQ6IHBhcnRpdGlvbnM6
IEFkZCBiaW5kaW5nIGZvciBRY29tIFNNRU0gcGFyc2VyCiAgICAgIG10ZDogcGFyc2VyczogQWRk
IFFjb20gU01FTSBwYXJzZXIKICAgICAgbXRkOiByYXduYW5kOiBxY29tOiBBZGQgc3VwcG9ydCBm
b3IgUWNvbSBTTUVNIHBhcnNlcgoKWmhlbmcgWW9uZ2p1biAoMik6CiAgICAgIG10ZDogcmF3bmFu
ZDogbXhjOiBDb252ZXJ0IGNvbW1hIHRvIHNlbWljb2xvbgogICAgICBtdGQ6IHJhd25hbmQ6IG1h
cnZlbGw6IGNvbnZlcnQgY29tbWEgdG8gc2VtaWNvbG9uCgogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvcWNvbSxzbWVtLXBhcnQueWFtbCAgICAgICAgIHwgIDMzICsrCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDcgLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2ludGVsLW5hbmQtY29udHJvbGxlci5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCAr
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvdGFuZ29fbmFuZC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNzI3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy9tdGQvcGFyc2Vycy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICA4ICsKIGRyaXZlcnMvbXRkL3BhcnNlcnMvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL210ZC9wYXJzZXJzL3Fjb21z
bWVtcGFydC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNzAgKysrKysrKwog
MTEgZmlsZXMgY2hhbmdlZCwgMjIxIGluc2VydGlvbnMoKyksIDc0MCBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvcWNvbSxzbWVtLXBhcnQueWFtbAogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
bXRkL25hbmQvcmF3L3RhbmdvX25hbmQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRk
L3BhcnNlcnMvcWNvbXNtZW1wYXJ0LmMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
