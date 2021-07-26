Return-Path: <SRS0=DmD4=MS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA342C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jul 2021 08:00:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABDC560F55
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jul 2021 08:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABDC560F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZnzup2PIBq8IL0t9vViVdw4DXJpF5U6TAXsr41RPcI=; b=BsmW8eSsOr1hlC
	gJaHsuH3ViP86Dd9pGNUTtoRTV4lODzXMGJXlqbOqG2Sv5CTC7mdM1uGoM/lvNXkV++4lC6y/2WWS
	JfB/vDtubOiRhLhyZ1G+a+SshVh8KhmBthcrvW1xR19y6TLAQ/mJnZSqpNNwpMQjKAWT2CXyY9YhV
	zCFxldmN2rS2zJZkZXiqmjv9QZwPjjreMKv3esIa2cDZ0MAv/9aiWLDwADSOZDf1475F5qN1A18Mj
	kNZfOu+SZgtzXZLMeS+47RmlGiwDQkKlapee5Dqfjq05YQReuUKjiGF5uyJfmD8SHE6BmikFFGf+P
	o0vALZVsPuVClEEpGe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vVb-00A3GO-O1; Mon, 26 Jul 2021 07:58:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vVX-00A3EG-Px
 for linux-mtd@lists.infradead.org; Mon, 26 Jul 2021 07:58:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3F4401C0003;
 Mon, 26 Jul 2021 07:58:30 +0000 (UTC)
Date: Mon, 26 Jul 2021 09:58:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Martin Kaiser <martin@kaiser.cx>, Dan Carpenter
 <dan.carpenter@oracle.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <20210726095829.63af18b2@xps13>
In-Reply-To: <20210724160308.GA62321@thinkpad>
References: <YMtQFXE0F1w7mUh+@mwanda>
 <20210715225045.66185-1-miquel.raynal@bootlin.com>
 <20210724142712.GA24036@martin-debian-1.paytec.ch>
 <20210724160308.GA62321@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_005840_026609_7F08528D 
X-CRM114-Status: GOOD (  28.84  )
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

SGkgTWFuaSwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiB3cm90ZSBv
biBTYXQsIDI0IEp1bCAyMDIxCjIxOjMzOjA4ICswNTMwOgoKPiBPbiBTYXQsIEp1bCAyNCwgMjAy
MSBhdCAwNDoyNzozMFBNICswMjAwLCBNYXJ0aW4gS2Fpc2VyIHdyb3RlOgo+ID4gSGkgYWxsLAo+
ID4gCj4gPiBUaHVzIHdyb3RlIE1pcXVlbCBSYXluYWwgKG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20pOgo+ID4gICAKPiA+ID4gT24gVGh1LCAyMDIxLTA2LTE3IGF0IDEzOjM3OjI1IFVUQywgRGFu
IENhcnBlbnRlciB3cm90ZTogIAo+ID4gPiA+IENoZWNrIGZvciB3aGV0aGVyIG9mX3Byb3BlcnR5
X2NvdW50X2VsZW1zX29mX3NpemUoKSByZXR1cm5zIGEgbmVnYXRpdmUKPiA+ID4gPiBlcnJvciBj
b2RlLiAgCj4gPiAgIAo+ID4gPiA+IEZpeGVzOiAxM2I4OTc2ODI3NWQgKCJtdGQ6IHJhd25hbmQ6
IEFkZCBzdXBwb3J0IGZvciBzZWN1cmUgcmVnaW9ucyBpbiBOQU5EIG1lbW9yeSIpCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+
ID4gPiA+IFJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9y
Zz4gIAo+ID4gICAKPiA+ID4gQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9maXhlcywgdGhhbmtzLiAgCj4g
PiAKPiA+IEknbSBydW5uaW5nIGxpbnV4LW5leHQgb24gYW4gaW14MjUgc3lzdGVtIHdpdGggdGhl
IGZvbGxvd2luZyBmbGFzaCBjaGlwCj4gPiAKPiA+IFsgICAgMS45OTc1MzldIG5hbmQ6IGRldmlj
ZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweDk4LCBDaGlwIElEOiAweGFhCj4gPiBbICAgIDIu
MDA0MTM0XSBuYW5kOiBUb3NoaWJhIE5BTkQgMjU2TWlCIDEsOFYgOC1iaXQKPiA+IFsgICAgMi4w
MDg5MTddIG5hbmQ6IDI1NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXpl
OiAyMDQ4LCBPT0Igc2l6ZTogMTI4Cj4gPiAKPiA+IFRoZSBzeXN0ZW0gaXMgdXNpbmcgdGhlIGRy
aXZlcnMvbXRkL25hbmQvcmF3L214Y19uYW5kLmMgZHJpdmVyLgo+ID4gCj4gPiBTaW5jZSB0aGlz
IGNvbW1pdCBhcHBlYXJlZCBpbiBsaW51eC1uZXh0LCBteGNfbmFuZCdzIHByb2JlIGZ1bmN0aW9u
IGZhaWxzCj4gPiB3aXRoIC1FSU5WQUwsIHRha2luZyB0aGlzIHBhdGgKPiA+IAo+ID4gbXhjbmRf
cHJvYmUKPiA+ICAgIG5hbmRfc2Nhbgo+ID4gICAgICAgbmFuZF9zY2FuX3dpdGhfaWRzCj4gPiAg
ICAgICAgICBuYW5kX3NjYW5fdGFpbAo+ID4gICAgICAgICAgICAgb2ZfZ2V0X25hbmRfc2VjdXJl
X3JlZ2lvbnMKPiA+IAo+ID4gbnJfZWxlbSA9IG9mX3Byb3BlcnR5X2NvdW50X2VsZW1zX29mX3Np
emUoZG4sICJzZWN1cmUtcmVnaW9ucyIsIHNpemVvZih1NjQpKTsKPiA+IHJldHVybnMgLUVJTlZB
TCBhcyB0aGVyZSdzIG5vIHNlY3VyZS1yZWdpb25zIHByb3BlcnR5IGluIG15IGRldmljZSB0cmVl
Lgo+ID4gICAKPiAKPiBEb2ghIFNvcnJ5IGZvciBtaXNzaW5nIHRoaXMuCj4gCj4gPiBXZSBzaG91
bGQgY2VydGFpbmx5IGhhbmRsZSBuZWdhdGl2ZSBlcnJvciBjb2RlcyBiZWZvcmUgd2UgY2FsY3Vs
YXRlCj4gPiBjaGlwLT5ucl9zZWN1cmVfcmVnaW9ucyA9IG5yX2VsZW0gLyAyCj4gPiBidXQgYSBt
aXNzaW5nIHNlY3VyZS1yZWdpb25zIHByb3BlcnR5IGlzIGEgdmFsaWQgY2FzZSBhbmQgc2hvdWxk
IG5vdCBtYWtlCj4gPiB0aGUgcHJvYmUgZmFpbC4KPiA+ICAgCj4gCj4gQWJzb2x1dGVseSEKPiAK
PiA+IElmIHRoZSBwcm9wZXJ0eSBleGlzdHMsIGJ1dCB0aGUgZGV2aWNlLXRyZWUgZW50cnkgaXMg
aW5jb3JyZWN0Cj4gPiBhbmQgb2ZfcHJvcGVydHlfY291bnRfZWxlbXNfb2Zfc2l6ZSByZXR1cm5z
IC1FTk9EQVRBLCB3ZSBtaWdodCBwcmludCBhCj4gPiB3YXJuaW5nIGFuZCBpZ25vcmUgdGhlIGVu
dHJ5Lgo+ID4gICAKPiAKPiBIbW0sIEkgdGhpbmsgaXQgaXMgYmVzdCB0byBlcnJvciBvdXQgaW4g
dGhpcyBjYXNlIGFzIHRoZSB1c2VyIGhhcyBnb3QgRFQgd3JvbmcuCj4gCj4gPiBXaGF0IGRvIHlv
dSB0aGluaz8KPiA+ICAgCj4gCj4gU2luY2Ugb2ZfcHJvcGVydHlfY291bnRfZWxlbXNfb2Zfc2l6
ZSgpIHJldHVybnMgLUVJTlZBTCBpZiB0aGUgbGVuZ3RoIGlzIG5vdAo+IGEgbXVsdGlwbGUgb2Yg
c2l6ZW9mKHU2NCksIHdlIGNhbid0IGp1c3QgaWdub3JlIC1FSU5WQUwuCj4gCj4gU28gSSB0aGlu
ayB3ZSBjYW4ganVzdCBjaGVjayBmb3IgdGhlIGV4aXN0ZW5jZSBvZiB0aGUgcHJvcGVydHkgYmVm
b3JlIGludm9raW5nCj4gb2ZfZ2V0X25hbmRfc2VjdXJlX3JlZ2lvbnMoKS4gTWlxdWVsLCB3aGF0
IGRvIHlvdSB0aGluaz8KClllcyBwbGVhc2UgYWRkIHRoaXMgY2hlY2sgYW5kIHdlIHNob3VsZCBi
ZSBnb29kLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
