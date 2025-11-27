Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD65CFD2F6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Nov 2025 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmyfbAdnDmP5Y7alaTlActJYqW476GBCSEfzZPOv0MY=; b=VJAhbHho/h/HhX
	2B3r/He6SRWroB3qLH9xu+trcAWxLANDnMPnygmuGdIR6r1T4EDzad6k5JcsP/fpTKf4xumuDhhkV
	jR3cqxe95PA2qLD2+j/vhG2IZttHbFFBm3KyjZoS8uhKd7uFZ8/v+zVrjEGLgIapVpRoFRTBTd6TZ
	KP8qF36H2sca6Tvo9WElyxKs4qVmEDEq4v1o0taGUcjKdXRCuiyfwQQQmtUzKT5x6/2DiQeqaePbe
	6z6Z419MxzWqKkWYCWHfFsT3975PmS0nTEeKStFMSbk0v8TMUY5Ilr4OAQYCrDLY2yRTj+ZnCuBkj
	6Esv+PHSwQl6Ik6gNVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWjc-0000000G9VV-207g;
	Thu, 27 Nov 2025 07:48:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWjY-0000000G9V9-3pcn
	for linux-mtd@lists.infradead.org;
	Thu, 27 Nov 2025 07:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B3C143FB0;
	Thu, 27 Nov 2025 07:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2A6C4CEF8;
	Thu, 27 Nov 2025 07:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764229688;
	bh=/Qr2YmhnCABhQkXWrs0mkP1C3iyMiGCgJI+FA1RUxxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERnlZ02DZtcomfDUwdOPNDbq2+IAQhnC5+D+aG07Pst/ssaq5yf4iwefopb2l1IYJ
	 LRRo71fdopoXg+6DbBz3PQ2efaOJC81Z4Hr+PQYVR5FFANJ1TgEbUvd8herlOwRhjW
	 tS5te/acaTNLUwdANynhx+0gLDHfTe6+dxUWPl+GorMuDaqJnI+fFJ1tZMjA8UNk/z
	 KzC3um+Fzuq8xMV1+UxvkFRuROQGRucG9d+Sl5XGVLaxLP3iQ9ngPkMl8JC7x+qdyK
	 /rp7inSy0f4gvHMqHVBCqkAsmEaxu87PEXUxdlUaDNOLJEBN8Qwzu9Y30iDzx+UEnr
	 15sz9WYYaGURg==
Date: Thu, 27 Nov 2025 08:48:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Niravkumar L Rabara <niravkumar.l.rabara@intel.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent
 property
Message-ID: <20251127-logical-gerbil-of-destiny-bd6d4f@kuoka>
References: <cover.1764143105.git.khairul.anuar.romli@altera.com>
 <af528a83b4749fb3e6062bbc75bcb4fd5a6fec23.1764143105.git.khairul.anuar.romli@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af528a83b4749fb3e6062bbc75bcb4fd5a6fec23.1764143105.git.khairul.anuar.romli@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_234808_993364_E589BA31 
X-CRM114-Status: UNSURE (   8.00  )
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

T24gV2VkLCBOb3YgMjYsIDIwMjUgYXQgMDQ6MDY6MjJQTSArMDgwMCwgS2hhaXJ1bCBBbnVhciBS
b21saSB3cm90ZToKPiBUaGUgQ2FkZW5jZSBIUCBOQU5EIEZsYXNoIENvbnRyb2xsZXIgb24gQWdp
bGV4NSBkZXZpY2UgcGVyZm9ybXMgRE1BCj4gdHJhbnNhY3Rpb25zIHRocm91Z2ggYSBjb2hlcmVu
dCBpbnRlcmNvbm5lY3QuIGRtYS1jb2hlcmVudCBwcm9wZXJ0eQo+IHByZXNlbnRzIGluIGRldmlj
ZSB0cmVlIHdpbGwgYWxsb3cgdGhlIGtlcm5lbOKAmXMgRE1BIHN1YnN5c3RlbQo+IGNvbnRyb2xs
ZXLigJlzIHRvIHBlcmZvcm1zIERNQSB0cmFuc2FjdGlvbiBpbiBkbWEgY29oZXJlbnQgbW9kZS4K
Ckxhc3Qgc2VudGVuY2UgaXMgcmVkdW5kYW50LiBZb3Ugc2F5IGJhc2ljYWxseSAiZG1hLWNvaGVy
ZW50IG1lYW5zCmRtYSBjb2hlcmVudCIuIFdyaXRlIGluZm9ybWF0aXZlIGNvbW1pdCBtc2dzLCBz
byBzb21ldGhpbmcgd2hpY2ggaXMgbm90Cm9idmlvdXMsIGUuZy4gd2h5IHRoaXMgaXMgZG1hIGNv
aGVyZW50IE5PVyBidXQgd2Fzbid0IGJlZm9yZT8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
