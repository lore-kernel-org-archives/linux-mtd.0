Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5CBC4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77A520728
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nGtXMI4F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77A520728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIoL3vzljyC2NYK+VD5hFH5M8n1XdnMdsFBMWhJzsvE=; b=nGtXMI4FPI1Jip
	fbXclYjsCjcC3HD5W8vxpnWxH37A+2DmJPTUHYhk2UKOsgOE+nfriwOPms1SaSndc6npZ2Y+btXAs
	v3P/985Zh3EPkiA2VXzapCBcNCkJbPQLtyb1sgzOMvH7wcikwMpRLwcO6oqhA+Si25wcvKgnOs/7p
	VFE8oslqZgOQDN448/Le2sqBL94E8F/83+v9GYvoFatKc7ztizsWoenmw9gvlzbcrjBkbI28bTGTm
	kcf4fx2Fbb9ms9RB5Uysb1YKsHGgMplOkF2VvfbfUI9xf7p5kSHWZerdhvx/6tPrMCP9a23pII5jw
	K6QF9mmDrpafId/d0W9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8qF-00040v-Hf; Mon, 27 Apr 2020 18:50:55 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8qC-0003zV-O7
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:50:53 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C56C7240007;
 Mon, 27 Apr 2020 18:50:48 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:50:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 08/12] mtd: rawnand: stm32_fmc2: use
 FIELD_PREP/FIELD_GET macros
Message-ID: <20200427205047.2da8b3c2@xps13>
In-Reply-To: <20200416214513.43b7b6e1@collabora.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-9-git-send-email-christophe.kerello@st.com>
 <20200416214513.43b7b6e1@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_115052_915516_06B41424 
X-CRM114-Status: UNSURE (   7.71  )
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
Cc: mark.rutland@arm.com, marex@denx.de,
 Christophe Kerello <christophe.kerello@st.com>, vigneshr@ti.com,
 devicetree@vger.kernel.org, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3
cm90ZSBvbiBUaHUsIDE2IEFwcgoyMDIwIDIxOjQ1OjEzICswMjAwOgoKPiBPbiBXZWQsIDE1IEFw
ciAyMDIwIDE3OjU3OjMyICswMjAwCj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtl
cmVsbG9Ac3QuY29tPiB3cm90ZToKPiAKPiA+IFRoaXMgcGF0Y2ggcmVtb3ZlcyBjdXN0b20gbWFj
cm9zIGFuZCB1c2VzIEZJRUxEX1BSRVAgYW5kIEZJRUxEX0dFVCBtYWNyb3MuICAKPiAKPiBPaCwg
bmljZS4gSSBkaWRuJ3Qga25vdyBhYm91dCB0aGVzZSBtYWNyb3MuIFRoaXMgY291bGQgaGF2ZSBz
YXZlZCBtZQo+IGZyb20gZGVmaW5pbmcgYSB3aG9sZSBidW5jaCBvZiBzZXR0ZXJzL2dldHRlcnMg
aW4gZHJpdmVyIGNvZGUuLi4KPiAKPiAKCkxvdmUgdGhlc2UgdG9vISBJIHdpbGwgZGVmaW5pdGVs
eSB1c2UgdGhlbSBpbiB0aGUgZnV0dXJlLgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
