Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ECBC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYPYdN5HndNO0Ml2dAflUJ3udemvdK5RwU/R+JX3TPE=; b=ygs5ZvpFELJged
	Tf6cwo38LOTj40+DxgNMkDuSZkNPeC0/tjwyggnRpVOXhMlpyYJzPvNscmyB033WjH7ArqjFb2WmB
	Nj17RPkCT5KyarZznWStUuN5Dm+xpwVuqGcXsUsIcZibER68vutswqZaGLSesmZmx37Bbv4VClo5F
	CGPO6YfQgpRFU1dA9VwtrP/sNXgHReZoNKNOTw0kY07RQQuFVAym6d4c/7cegulo4rv9AEGrtoAY/
	ILifgqB/yt20jEeK7rnjVm/73IOg7cEkiAB2MRz56MwWUJEank5gRpUCengXnum1NcpBCJj5aLnWM
	kCqzoXVjGVR+CHEhSZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r90HL-00D9WV-33;
	Fri, 01 Dec 2023 09:57:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r90HI-00D9U7-0J;
	Fri, 01 Dec 2023 09:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 87921B84776;
	Fri,  1 Dec 2023 09:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37BAC433C9;
	Fri,  1 Dec 2023 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701424661;
	bh=ccXiUANYmPCB8NhMfkOx6I/A0dGnOoIhG/1n4IleSEM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nN6G/CmkDMIyNYHBFUEVMe6YyKjeJeDlcTkISZVgbTI/pqNUsFklKLjjSBgAOK7ww
	 F+Z2KwQWVong0wXXQ8+V0ZSGFvWiaDZ5h4sS4XJxLIbZ2fFZIxPTaoxOuGtDiqqk2p
	 5POm7Fu6D+GW5UvL7JwKYwMpdLwg7Fk9VuapkM9/kKP1TSnKEolwx2DF7Si7mSRIrd
	 sOsKsJcq3KHr3/WfnhQjoqUbxvkfzKhwu5tV0eQub0nvw/FciJHAai10aBfmejDR80
	 AtrxvFKdZX8LBzEx5XRqDkXsRxFcCYz4AbrgoAwnqroScmdHvFihxmVOAjnqug+A/B
	 0tyQAf6oAtP6g==
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 sbinding@opensource.cirrus.com, lee@kernel.org, james.schulman@cirrus.com, 
 david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz, 
 tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 michael@walle.cc, linux-mtd@lists.infradead.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, michal.simek@amd.com, 
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com, 
 amitrkcian2002@gmail.com
In-Reply-To: <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
Subject: Re: (subset) [PATCH v11 01/10] mfd: tps6594: Use set/get APIs to
 access spi->chip_select
Message-Id: <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 09:57:36 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_015744_276708_757F66A1 
X-CRM114-Status: UNSURE (   5.12  )
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

T24gU2F0LCAyNSBOb3YgMjAyMyAxNDo1MToyOCArMDUzMCwgQW1pdCBLdW1hciBNYWhhcGF0cmEg
d3JvdGU6Cj4gSW4gcHJlcGFyYXRpb24gZm9yIGFkZGluZyBtdWx0aXBsZSBDUyBzdXBwb3J0IGZv
ciBhIGRldmljZSwgc2V0L2dldAo+IGZ1bmN0aW9ucyB3ZXJlIGludHJvZHVjZXMgYWNjZXNzaW5n
IHNwaS0+Y2hpcF9zZWxlY3QgaW4KPiAnY29tbWl0IDMwM2ZlYjNjYzA2YSAoInNwaTogQWRkIEFQ
SXMgaW4gc3BpIGNvcmUgdG8gc2V0L2dldAo+IHNwaS0+Y2hpcF9zZWxlY3QgYW5kIHNwaS0+Y3Nf
Z3Bpb2QiKScuCj4gUmVwbGFjZSBzcGktPmNoaXBfc2VsZWN0IHdpdGggc3BpX2dldF9jaGlwc2Vs
ZWN0KCkgQVBJLgo+IAo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMDEvMTBdIG1mZDog
dHBzNjU5NDogVXNlIHNldC9nZXQgQVBJcyB0byBhY2Nlc3Mgc3BpLT5jaGlwX3NlbGVjdAogICAg
ICAgIGNvbW1pdDogZGQ2MzY2Mzg0NDZjODdjOTVjNWJlZGRjZDM2N2Q5NWFjNjc2NGM2YwoKLS0K
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
