Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB2EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38PGrsr4N1pUZA0p5qOfb9NHtqb+cSW9Eo0UQkspDew=; b=DhCZYBOjw+zuR/
	VhwDKILv4hNscwB4oioRVYJls51zAylDcHARCaYlK0R8rxMmXC5Wi44bPuRW+x85u8ioSqI53+t2z
	HH6amBitl+/ZFIBekSist0eg3TzE4Penzf5u+8LQtCT/HoBoIjM5vkAFyYmM+UUGQpZm52Tw8bKu6
	nYfGCQrZrS4lythqwkrlheFMgJDsAICZF+an5ck8TaALebVpVI2ChC26nBIqQsGPlkHLKcV7XT+9y
	/XZLwX6/eDB9U3DSc1E8RTdvVoVl/NB3pZx3SmmELSZ+0vdcL3ImEmO/b8ej+/gGi1Vf5PWgVKImF
	bbtVea7kW0f3QtDCZbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24A7-005WjZ-Gl; Fri, 17 Jun 2022 05:04:51 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24A5-005Wj1-32
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 05:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655442289; x=1686978289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KlkNvpHU3FLlFN/0ZiH/YdtckeEa9++ioBrEqdPOl1k=;
  b=GC5Ynbz1VeUyLP+FWMbuh98IvGEQH3N3d3tjvQCOlsvPp2RRFV70Sm4X
   ma+8A+rvH/lpv8j6WPoQArgp3DYtlPRB4dHi2IAKxAwoapBuAH0BTJZJO
   1Q5KfUZzAGZHP//SyuoSTjjS7Nmg5Rvp6cCW6Kk6ZP69XKjURPXD1TNmO
   94hqxBLdJ66soOdSL5OLlpjNBwy2tqEBNRGSz6qwwl5esoYTjnfq3ig9g
   E8VzJvCMTQD7FpPnYyXfTrXLVKb3pKucE4GA3MuoJlnDaDTDsAYIBWGkU
   70IFrqxgPBinq+MrhQX9+3sss1rx7FWYEkOgLVkHyKk3TQE1OcQtf3y95
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268109528"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="268109528"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 22:04:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="619145570"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 22:04:43 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 17 Jun 2022 08:04:40 +0300
Date: Fri, 17 Jun 2022 08:04:40 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco)" <oocheret@cisco.com>
Cc: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>,
	"michael@walle.cc" <michael@walle.cc>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"mauro.lima@eclypsium.com" <mauro.lima@eclypsium.com>,
	"lee.jones@linaro.org" <lee.jones@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH v2] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <YqwLaIvjdRBsNRuU@lahna>
References: <YqsHcL5NPcZ4De77@lahna>
 <20220616121446.293408-1-oocheret@cisco.com>
 <YqsjGx54+Gd8Aws/@lahna>
 <BYAPR11MB2757CEBE99C3A0861928CD43CDAC9@BYAPR11MB2757.namprd11.prod.outlook.com>
 <YqspM2Sw+Fu9y56Z@lahna>
 <BYAPR11MB2757BD90C63B9F6A31E0600ACDAC9@BYAPR11MB2757.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2757BD90C63B9F6A31E0600ACDAC9@BYAPR11MB2757.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_220449_247608_E8D033C6 
X-CRM114-Status: GOOD (  19.77  )
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

SGksCgpPbiBUaHUsIEp1biAxNiwgMjAyMiBhdCAwODoyNjozM1BNICswMDAwLCBPbGVrc2FuZHIg
T2NoZXJldG55aSAtWCAob29jaGVyZXQgLSBHTE9CQUxMT0dJQyBJTkMgYXQgQ2lzY28pIHdyb3Rl
Ogo+ICAgIEhpIE1pa2EsCj4gCj4gICAgPiAgICDigItIb3dldmVyIEkgcmVtZW1iZXIgeW91IGNh
dWdodCBzaXR1YXRpb24gd2hlcmUKPiAgICBtaWNyb25fc3Rfbm9yX3JlYWRfZnNyKCkKPiAgICA+
ICAgIHJldHVybnMgLUVPUE5PVFNVUFAKPiAgICA+ICAgIChpbnRlbF9zcGlfZXhlY19tZW1fb3Ag
Y2FsbGJhY2sgcmV0dXJucyAtRU9QTk9UU1VQUCksIGFjY29yZGluZyB0bwo+ICAgIHlvdXIKPiAg
ICA+ICAgIHBhdGNoCj4gICAgPgo+ICAgIFszXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW10ZC8yMDIyMDUwNjEwNTE1OC40MzYxMy0xLW1pa2Eud2VzdGVyCj4gICAgPiAgICBiZXJnQGxp
bnV4LmludGVsLmNvbS8gSSd2ZSBub3RlZCBpbiBkZXNjcmlwdGlvbiBib2R5LiBTbyBJIHRoaW5r
IEkKPiAgICBoYXZlCj4gICAgPiAgICB0byBjb3ZlciBib3RoIGVycm9yY29kZXMsIGhhdmVuJ3Qg
ST8KPiAgICBJIHdhcyB0aGlua2luZyB0aGF0IHlvdSBjaGFuZ2UgdGhlIGJvdGggZnVuY3Rpb25z
IGluIEludGVsIFNQSSB0bwo+ICAgIHJldHVybgo+IAo+ICAgIC1FTk9UU1VQUCwgbm90IGp1c3Qg
b25lLgo+IAo+ICAgIOKAi3lvdSBrbm93ICdkcml2ZXJzL210ZC9zcGktbm9yJyBzb3VyY2VzIHVz
ZSAtRU9QTk9UU1VQUCBlcnJvcmNvZGUgb25seSwKPiAgICBob3dldmVyCj4gCj4gICAgJ2RyaXZl
cnMvc3BpJyBtb2R1bGVzICh3aGVyZSBpbnRlbCBkcml2ZXIgaXMgbG9jYXRlZCBhcyB3ZWxsIGFz
Cj4gICAgc3BpLW1lbS5jKSB1c2UgYm90aCBlcnJvcmNvZGVzIG1hbnkgdGltZXMKPiAKPiAgICAo
LUVPUE5PVFNVUFAgYW5kIC1FTk9UU1VQUCkuCgpPaCwgaW5kZWVkLiBJIHJlbWVtYmVyZWQgdGhh
dCBTUEktTk9SIGNvcmUgd2FzIHVzaW5nIEVOT1RTVVAgYnV0IGl0IHdhcwpTUEktTUVNIGluc3Rl
YWQuCgo+ICAgIFNvIG1heWJlIGl0IGlzIGJldHRlciB0byB1c2UgLUVPUE5PVFNVUFAgZm9yIGlu
dGVsIGRyaXZlciBmaWxlICh3aGF0Cj4gICAgdXNlcyAtRU9QTk9UU1VQUCBldmVyeXdoZXJlKSBh
bmQKPiAKPiAgICB1cGRhdGUgdGhlIHNwaS1tZW0uYyB3aXRoIC1FT1BOT1RTVVBQIGFzIHJldHVy
biB2YWx1ZSwgaG93IGRvIHlvdQo+ICAgIHRoaW5rPwoKWWVzLCBJIHRoaW5rIHRoaXMgaXMgdGhl
IGNvcnJlY3QgYXBwcm9hY2guIFlvdSBuZWVkIHRvIGJlIGNhcmVmdWwgdGhvdWdoCnRvIG1ha2Ug
c3VyZSB0aGUgY2FsbGVycyBvZiBTUEktTUVNIGZ1bmN0aW9ucyBkbyBub3QgZ2V0IHVuZXhwZWN0
ZWQKdmFsdWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
