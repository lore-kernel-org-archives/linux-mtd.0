Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E6EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZINSAQFqnotdNXr/HbY3qmW2AXnhLz8ygJOtLoZveXA=; b=KmV0qyJ8nWfd+3
	Luq6nn0CBKbPL+VJnwrTeUM6Dgs1kxRT6rud6Pi6PjLuwcjU6layUJ22xRSjMne221rvPdk40xyNB
	/r4z/02G2WcvH7ftbfxtNOoGPypI3DCT2qnYOWTalDa5uyShNEpLt0nFf/HKPc/8r/cvd5VooxWxY
	1paIPaDep7S2xQeJ52a6Wp8iRIsV58A9BUp4ukcvhhuoCSGVrjz32QCizgYois/HFSf2VEo5pjBW+
	EknYjFrqwQEdQVQm2nOlW/f3Evbh6BzkZsw/2qo5xTCnWZmxWHtzpOP10QHoYviZoi87XpTHzcEmP
	aKx4syRlQY4Nf13yJfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGvK-00FnM2-4f; Wed, 02 Feb 2022 14:47:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGvG-00FnLD-LK
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:47:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99C0DC0006;
 Wed,  2 Feb 2022 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643813267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhJzaiYNWR/C/jKAoR07iQZdHHlPXBY0p/QefOnptbE=;
 b=eMvRCs3dxWSzKb5APVxq2at2KQw7PH8xjWVCmxCTqcLLf4ubY4w9QNI59Fnecw2J5oXUzo
 nv5tZpu+DNPW/L8CIcnBVIWWiBzmUnFcla3frh95QJdPd8YTdI6ijtO1xLmGu+Q0L24W+H
 PThVPRHjtNCO9q7JhF5aIEw0z/fr2XV9NVCy24ae9EO0Ej3BJddHMObGkZiv2HI1xWmauT
 4/fF+WrlNB5kheuEJzPUPSDMHmbNsIGmV7Regc4b1beXnSVcDbv6uMIFm6+J4Ch7OLRDdS
 Pk/1jax6eUuPLSMWz/Sv/oJyZa6XDvBCrE2zsGMyw2r7ttKUZV0pH9jiiOYtVQ==
Date: Wed, 2 Feb 2022 15:47:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael
 Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: nand: ecc: Rework Kconfig dependencies
Message-ID: <20220202154745.2752bb0a@xps13>
In-Reply-To: <20220131162256.24430-1-miquel.raynal@bootlin.com>
References: <20220131145032.17614-1-miquel.raynal@bootlin.com>
 <20220131162256.24430-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_064750_865073_E6BC0A28 
X-CRM114-Status: GOOD (  13.20  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgMzEgSmFuIDIw
MjIgMTc6MjI6NTYgKzAxMDA6Cgo+IE9uIE1vbiwgMjAyMi0wMS0zMSBhdCAxNDo1MDozMiBVVEMs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBVbmxpa2UgImRlcGVuZHMgb24iLCAic2VsZWN0IiBk
b2VzIG5vdCBlbmZvcmNlIGFueSB0eXBlICh5IG9yIG0pLCB3aGljaAo+ID4gY2FuIGxlYWQgdG8g
dGhlIGZvbGxvd2luZyBzaXR1YXRpb246Cj4gPiAqIFNQSV9NWElDPXkgZXhwZWN0cyB0aGUgTkFO
RCBzeW1ib2xzIHRvIGJlIGJ1aWx0IHN0YXRpY2FsbHkKPiA+ICogU1BJX01YSUMgZGVwZW5kcyBv
biBNVERfTkFORF9FQ0MKPiA+ICogTVREX05BTkRfRUNDIHNlbGVjdHMgTVREX05BTkRfQ09SRQo+
ID4gSW4gdGhpcyBjYXNlIE1URF9OQU5EX0NPUkU9bSBpcyAidmFsaWQiIGJ1dCB3aWxsIHRyaWdn
ZXIgJ3VuZGVmaW5lZAo+ID4gcmVmZXJlbmNlJyBsaW5rIGVycm9ycy4KPiA+IAo+ID4gVGhlIGNs
ZWFuZXN0IHdheSB0byBoYW5kbGUgdGhlIHNpdHVhdGlvbiBpcyB0byB1c2UgYSAiZGVwZW5kcyBv
biIKPiA+IGJldHdlZW4gTVREX05BTkRfRUNDIGFuZCBNVERfTkFORF9DT1JFIHRvIGF2b2lkIHN1
Y2ggc2l0dWF0aW9ucy4KPiA+IAo+ID4gV2hpbGUgYXQgbW9kaWZ5aW5nIHRoZSBNVERfTkFORF9F
Q0Mgc3ltYm9sLCBmaXggdGhlIHNwYWNpbmcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUHJh
dHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPiAgCj4gCj4gQXBwbGllZCB0byBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHNwaS1t
ZW0tZWNjLgoKVW5mb3J0dW5hdGVseSB0aGlzIHBhdGNoIGJyZWFrIG90aGVyIHVzZXJzIChsaWtl
IHNtX2Z0bCkgd2hpY2ggYXJlCnNwZWNpZmljIGNhc2VzIHdoaWNoIEkgZm9yZ290IHRvIHRha2Ug
aW50byBhY2NvdW50IHdoZW4gd3JpdGluZyB0aGlzCmNoYW5nZS4gSSd2ZSBmb3VuZCBhbm90aGVy
IHdheSB0byBoYW5kbGUgdGhlIHNpdHVhdGlvbiwgc2VlIHRoZSBwYXRjaApzZW50IGluIHBhcmFs
bGVsLCB2MTEgb2YgdGhlIGxhc3QgY2hhbmdlIG9mIHRoZSBzcGktbWVtLWVjYyBzZXJpZXMuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
