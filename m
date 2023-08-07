Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E3FC001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoqMxzCr5jgrpsEeHJi+ULjE5VWP5hpIx41h7KrfR14=; b=BJy2uOeygC7cQS
	VoGA26Z0pOqPdalDXz7y6kpbz9LmGpltLYXl1evJ5XgQzd1XM5CHB0p/4F2Q9UfhE06w+a4gEApfo
	tBozy7SvUnQaei8CMH2h6uh6ROqXmIOViso/OejQMCzSkVffj7v+fSaJvX9EaPR4mUyPCCyUd6bUI
	jXIROffOcBO8lkQwt0+BCqp4uUvCGUMCQwfxLBOaRHn+GSSvTnTtdtxQWvLajqww7f3XWjxT7xdMW
	aCshKjV4AhVD4oNxBbe+wXeTiqTen5E/SHLFqHIecFMaxlf+vK0abqxeZcJKT8XsOdisM5sLZ90nm
	FE6SQOm/tNayyTX1aN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT1Is-00HYFC-2G;
	Mon, 07 Aug 2023 14:33:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT1Ip-00HYEL-20
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 14:33:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E5B924000F;
	Mon,  7 Aug 2023 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691418822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKtPqCM9+PIHJAxQ6f/YY0Vlrdo6mUPL0xywZvSmixY=;
	b=BDO2Q8+lXkOMXUgTtXk/UEu8dkash/Xkd+nezxKkrHwcqwSNMz3Q3+gE+5tEHgQpxeZ8nj
	YwO5aK7c76jY4Ft0Fax7z7fiE8YXdbcOF8qGuI39iMjI5cf+EqeaCa0x/pS7sYgkaxJjXv
	+YhDlw60Pm8nV6w/B2o82WATYTkwDn1z9dsE2j38dvgliOaslcwpRqSOiZJPj6of6yqmeZ
	ChgKT/FxZxD8HwUZf1FtwrN5kMu2Vsz1RYvag6vDPeEvY7W6pXSPOqNZhAnctuMN5F2Qe1
	ryt6Ec4/n8qoLj2vX6r2X8P8elBecMtioEeFACBblfDv2W/ktPEuP0kMbCKAtA==
Date: Mon, 7 Aug 2023 16:33:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Michael Walle <mwalle@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 06/41] mtd: spi-nor: default page_size to 256 bytes
Message-ID: <20230807163340.1ebe1e15@xps-13>
In-Reply-To: <cebd793208c9956e0c7be1b528e16627@walle.cc>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
	<20230807-mtd-flash-info-db-rework-v1-6-3d3d5bef4ba4@kernel.org>
	<20230807154754.70e994fa@xps-13>
	<cebd793208c9956e0c7be1b528e16627@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_073347_795255_A9831181 
X-CRM114-Status: GOOD (  12.65  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gTW9uLCAwNyBBdWcgMjAyMyAx
NjoyOTozOCArMDIwMDoKCj4gSGkgTWlxdWVsLAo+IAo+ID4+ICsJcGFyYW1zLT5wYWdlX3NpemUg
PSBpbmZvLT5wYWdlX3NpemUgPzogU1BJX05PUl9ERUZBVUxUX1BBR0VfU0laRTsgIAo+ID4gCj4g
PiBXb3VsZCB5b3UgbWluZCBjbGFyaWZ5aW5nIHRoaXM/IEl0IGRvZXMgbm90IGxvb2sgcmlnaHQs
IHdoaWxlCj4gPiBwZXJoYXBzIGl0IGlzLiBCdXQgVEJILCBJIGhhdmUgbm8gaWRlYSB3aGF0IHBh
cmFtcy0+cGFnZV9zaXplIHdpbGwgYmUKPiA+IGFmdGVyIHRoaXMgYXNzaWdubWVudC4gIAo+IAo+
IEl0J3MgaW5mby0+cGFnZV9zaXplLCBpdCdzIGEgc2hvcnRjdXQgWzFdLgoKRWx2aXMgb3BlcmF0
b3IgOicpCgo+IEknbSBub3QgdGhlIGZpcnN0IG9uZSB1c2luZyBpdCAoaW4gZmFjdCBJIHdhcyBl
eHBsaWNpdGx5IGFza2VkIHRvIHVzZSBpdCwKPiBlLmcuIGluIGdwaW8gc3Vic3lzKToKPiAKPiAk
IGdyZXAgLXIgIj86IiAqKi8qLmMgfHdjIC1sCj4gMTI2OAoKT2theSB0aGVuLi4uIEkgZGlkbid0
IGtub3cgdGhpcyB3YXMgZW5jb3VyYWdlZC4KCj4gLW1pY2hhZWwKPiAKPiBbMV0gaHR0cHM6Ly9l
bi53aWtpcGVkaWEub3JnL3dpa2kvRWx2aXNfb3BlcmF0b3IKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
