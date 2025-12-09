Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A829D3B7E2
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Dec 2025 02:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nh8ozBc3j6tlDlY5iDFpaebg56CeEnxHxmHThc0bo5Q=; b=VHxTqxSsWpl0+lOAxyYBSzsroJ
	mvtUyk8MAwalBR8NAXUsrkY+eoOAcr22yCZTsrU/6bupmiKLv9sUPqPH/dHwQD+HTJKsNJ0Wtu+hJ
	9WOZq5oyHD7jbKLEoEFS8c3XZHJRRNfBK/Eu/MnZfHM86FnAazPqqCJ6fdTtxGxU/Sfb4YZjhcSw2
	OMJvHJNdX3ulSBvUb/BulT5ePOa6JxrlrYohkxshOf0nrKAiiFUtXnujbPCKvRPDh8ESFzknuxjVl
	1nmz6NtdCOipLYFvAkCpCyPflWJTxDh8t/Vi7STq8NZ6SCNwQdxu/R4TeOwLjv0Y3Uq/mGq1RUQqE
	HYdX25rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSnWJ-0000000DjuB-19QO;
	Tue, 09 Dec 2025 02:32:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSnWG-0000000Djtk-1J2J
	for linux-mtd@lists.infradead.org;
	Tue, 09 Dec 2025 02:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53282416B4;
	Tue,  9 Dec 2025 02:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5133C4CEF1;
	Tue,  9 Dec 2025 02:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765247521;
	bh=PFVA+zI/bstNK1jQzv4pqwneP+Zt6w13hC5OvKuRyxA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ssDBAeTbczZcFBMVwJmnbc5qTq4e3er8CMp8YHSBZeSJNJCRRehCBlaX69b4xM6CC
	 RTGORQ7hpxfny+Pl46rv5Ho5XD7fE9sxwtE+8iGu+LpGLS5y43jXc+I1xI3yGWwBKB
	 qieu9pYrgpQvy4Rz0Hs+hjeoyyL0dwjgyMPBtG4emJgKch6f4c2LxE7cRkYqI/fQyZ
	 FXK2+X3C6JBp3QC48q5xf8EsOmpTSQQPfqjb5b4lDhvQ6qVaEk1a9RgkEiZsepnrpp
	 aqnzSnBXjs11ueplVPkabxSpSHDArAaqUTQYXkvXXETtteAKFperbM9o3uSONI7B9X
	 prSg9e6ertUPQ==
Message-ID: <e1aae851-4031-4b5c-a807-7a61ecfe6af1@kernel.org>
Date: Mon, 8 Dec 2025 20:31:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add dma-coherent property
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1764717960.git.khairul.anuar.romli@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_183204_372614_ABD29119 
X-CRM114-Status: GOOD (  16.50  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi8yLzI1IDE3OjQ3LCBLaGFpcnVsIEFudWFyIFJvbWxpIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggc2VyaWVzIGFkZHMgZG1hLWNvaGVyZW50IHByb3BlcnR5IGZvciB0aGUgQWdpbGV4NSBwbGF0
Zm9ybSBieToKPiAKPiAtIFVwZGF0aW5nIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3I6Cj4g
ICAgLSBDYWRlbmNlIEhQIE5BTkQgY29udHJvbGxlciAoYGNkbnMsaHAtbmZjYCkKPiAgICAtIFN5
bm9wc3lzIERlc2lnbldhcmUgQVhJIERNQSBjb250cm9sbGVyIChgc25wcyxkdy1heGktZG1hY2Ap
Cj4gICAgdG8gYWNjZXB0IHRoZSBgZG1hLWNvaGVyZW50YCBwcm9wZXJ0eS4KPiAKPiAtIEFkZGlu
ZyB0aGUgZG1hLWNvaGVyZW50IHByb3BlcnR5IHRvIHRoZSBBZ2lsZXg1IGRldmljZSB0cmVlIGFu
ZCB3aXJpbmcgdXAKPiAgICB0aGUgcHJvcGVydHkgdG8gdGhlIHN1cHBvcnRlZCBwZXJpcGhlcmFs
czoKPiAgICAtIE5BTkQgY29udHJvbGxlcgo+ICAgIC0gRE1BIGNvbnRyb2xsZXIKPiAKPiBUaGlz
IGRtYS1jb2hlcmVudCBhZGRpdGlvbiBhbGlnbnMgdGhlIEFnaWxleDUgcGxhdGZvcm0gd2l0aCBB
Uk3igJlzCj4gYXJjaGl0ZWN0dXJhbCByZXF1aXJlbWVudHMgZm9yIGNvaGVyZW50IGludGVyY29u
bmVjdHMuCj4gCj4gLS0tCj4gTm90ZXM6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYXBwbGllZCBh
bmQgdmFsaWRhdGVkIG9uIHNvY2ZwZ2EgZHRzIG1haW50YWluZXIncwo+IGJyYW5jaAo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Rpbmd1eWVuL2xpbnV4
LmdpdC9sb2cvP2g9c29jZnBnYV9kdHNfZm9yX3Y2LjE5Cj4gCj4gVGhpcyBjaGFuZ2VzIGlzIHZh
bGlkYXRlZCBvbjoKPiAJLSBpbnRlbC9zb2NmcGdhX2FnaWxleDVfc29jZGsuZHRiCj4gCS0gc25w
cyxkdy1heGktZG1hYy55YW1sCj4gCS0gc25wcyxkdy1heGktZG1hYy55YW1sIGludGVsL3NvY2Zw
Z2FfYWdpbGV4NV9zb2Nkay5kdGIKPiAJLSBjZG5zLGhwLW5mYy55YW1sCj4gCS0gY2RucyxocC1u
ZmMueWFtbCBpbnRlbC9zb2NmcGdhX2FnaWxleDVfc29jZGsuZHRiCj4gCj4gQ2hhbmdlcyBpbiB2
MjoKPiAJLSBSZXBocmFzZSBnaXQgY29tbWl0IG1lc3NhZ2UgdG8gZGVzY3JpYmUgd2h5IHRoZSBw
cm9wZXJ0eSBpcwo+IAkgIG5lZWRlZCBub3cuCj4gCS0gUmVtb3ZlIHJlZHVuZGFudCBzdGF0ZW1l
bnQgaW4gdGhlIGdpdCBjb21taXQgbWVzc2FnZS4KPiAJLSBDb3JyZWN0IHRoZSB2ZXJzaW9uIGlu
IHBhdGNoIHNlcmllcyB0aXRsZSB0byB2Mi4KPiAtLS0KPiBLaGFpcnVsIEFudWFyIFJvbWxpICgz
KToKPiAgICBkdC1iaW5kaW5nczogbXRkOiBjZG5zLGhwLW5mYzogQWRkIGRtYS1jb2hlcmVudCBw
cm9wZXJ0eQo+ICAgIGR0LWJpbmRpbmdzOiBkbWE6IHNucHMsZHctYXhpLWRtYWM6IGFkZCBkbWEt
Y29oZXJlbnQgcHJvcGVydHkKPiAgICBhcm02NDogZHRzOiBzb2NmcGdhOiBhZ2lsZXg1OiBBZGQg
ZG1hLWNvaGVyZW50IHByb3BlcnR5Cj4gCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZG1hL3NucHMsZHctYXhpLWRtYWMueWFtbCB8IDIgKysKPiAgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY2RucyxocC1uZmMueWFtbCAgICAgIHwgMiArKwo+ICAg
YXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleDUuZHRzaSAgICAgICAgICAg
ICAgfCAzICsrKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKCkFwcGxp
ZWQhCgpUaGFua3MsCkRpbmgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
