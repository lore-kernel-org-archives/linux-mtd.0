Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BFFC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyLJoekUd5ewoR1hQVjp2R8lL+x55H7ggKYjcZRKuSw=; b=A51HGJ7A0mc8hL
	rG2JhdJ9se2DJK/StU3c89nM69+FmRPMWPN8VBgBV0tQFyyDTbOQON6hMHkg+z9Cf7MvTMZe9eFr6
	+kSVVSknaR8VhzoJvH89krrMlhXO5N78TSFvm7061n9WWL+UIjNRG8hZ/jM3TVDIkFptxvJpIfmJB
	5tsi6wl5IpW3hcoAy4yqqbzLKUlOeQQZa7tfelo4S/tXoMfqjqeFWH6P8+A+GtsV83MRNrK2VVfld
	muu181skiHFHJ4o+YUVm9Utg93w9at8RScbk3QLEHYNEmyPj4+MtzdcaBi2zQbro/5b62eRO1HVPN
	bhwMzDTSg+9xpzE6h1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OtW-008Jvw-1D;
	Fri, 10 Nov 2023 10:37:46 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OtU-008Juw-1M
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 10:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699612664; x=1731148664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jVszzgOebbHsDy73geqqJTXfu/Fq2n8OkHo7zcBEU74=;
  b=FSFHOZc0rVfSD1B8D5PSFtHutlSy8Zggm9VzVP+GiS9c1AyB1iruf+/u
   DL6ksE8+olpAjXmifWD7APoaYgbCbdw7MCPIEH9NwilPMxN+rmxsKUXLj
   Wm7BZDMXIc2oTg4HR8ym4/WVeVygzNM3cnY8JlbqLiwUnfoz9J7hznaoZ
   TDXdokJBUP7CLAN0lsE1U9LgcY4QOkM+pT1vpjzRqo0SZUlcF+Xf5jcn7
   G6KfPZSWmUHqhMVKtqmu71EzVon3d0gHSuxVRYX/j5ZPx2cuXNBAnBm/g
   H0bZeT2OOC8azxu/rHUx6ITsYy4lxgUbzitdYVJYFsyjq8BBiPeqxReMV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3152240"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="3152240"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 02:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907437432"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="907437432"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2023 02:37:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1616914F; Fri, 10 Nov 2023 12:37:34 +0200 (EET)
Date: Fri, 10 Nov 2023 12:37:34 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op
 checking
Message-ID: <20231110103734.GJ17433@black.fi.intel.com>
References: <20231108094303.46303-1-acelan.kao@canonical.com>
 <20231110053721.GG17433@black.fi.intel.com>
 <CAFv23QnbG0QX=cGjVYA1GnQFf9HFd7M7gXuAxBDO4o-POvO9yg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFv23QnbG0QX=cGjVYA1GnQFf9HFd7M7gXuAxBDO4o-POvO9yg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_023744_471337_28C0E644 
X-CRM114-Status: GOOD (  19.62  )
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

T24gRnJpLCBOb3YgMTAsIDIwMjMgYXQgMDY6MjU6NDFQTSArMDgwMCwgQWNlTGFuIEthbyB3cm90
ZToKPiBIaSBNaWthLAo+IAo+IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4
LmludGVsLmNvbT4g5pa8IDIwMjPlubQxMeaciDEw5pelIOmAseS6lCDkuIvljYgxOjM35a+r6YGT
77yaCj4gPgo+ID4gSGksCj4gPgo+ID4gT24gV2VkLCBOb3YgMDgsIDIwMjMgYXQgMDU6NDM6MDJQ
TSArMDgwMCwgQWNlTGFuIEthbyB3cm90ZToKPiA+ID4gRnJvbTogIkNoaWEtTGluIEthbyAoQWNl
TGFuKSIgPGFjZWxhbi5rYW9AY2Fub25pY2FsLmNvbT4KPiA+ID4KPiA+ID4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzIGFyZSBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2g7IGl0J3MgYSBjb2RlIGNsZWFu
dXAKPiA+ID4gdG8gdXNlIHRoZSBjb3JyZWN0IGVycm9yIGNvZGUuCj4gPgo+ID4gUHJvYmFibHkg
Z29vZCB0byBtZW50aW9uIGhlcmUgdGhhdCB0aGlzIGFmZmVjdCBvbmx5IHRoZSAiU1BJIE1FTSIK
PiA+IGRyaXZlcnMgYW5kIHRoZSBjb3JlIHBhcnRzLiBBbHNvIHlvdSBjb3VsZCBleHBsYWluIGhl
cmUgdGhhdCB0aGUgcmVhb3NuCj4gPiBmb3IgdGhpcyBpcyB0byBtYWtlIHN1cmUgd2UgdXNlIHVu
aWZpZWQgIm9wZXJhdGlvbiBub3Qgc3VwcG9ydGVkIiByZXR1cm4KPiA+IGNvZGUgYWNjcm9zcyB0
aGVzZS4KPiBHb3QgaXQuCj4gPgo+ID4gRG9lcyBzb21lIGtlcm5lbC1kb2MgbmVlZCB1cGRhdGlu
ZyBhcyB3ZWxsIHRvIG1ha2Ugc3VyZSB0aGUgZnV0dXJlCj4gPiBkcml2ZXJzIHdpbGwgcmV0dXJu
IHRoZSBjb3JyZWN0IG9uZSBpZiB0aGV5IGRvIG5vdCBzdXBwb3J0IGdpdmVuCj4gPiBvcHRpb25h
bCBvcGVyYXRpb25zPwo+IEkgaGF2ZSBubyBpZGVhIHdoZXJlIHRvIGFkZCB0aGlzLCBkbyB5b3Ug
bWVhbiBhZGQgYSBzZWN0aW9uIGluCj4gRG9jdW1lbnRhdGlvbi9zcGkvc3BpLXN1bW1hcnkucnN0
PwoKSSBtZWFuIGluIGluY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaCBrZXJuZWwtZG9jIG9mIHN0
cnVjdApzcGlfY29udHJvbGxlcl9tZW1fb3BzIHBlcmhhcHM/IE9yIGtlcm5lbC1kb2Mgb2Ygc3Bp
X21lbV9leGVjX29wKCk/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
