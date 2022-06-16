Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDDCC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sFmWeLujqH2RZjszKhcuhNqY58I1DcIWIJGp0NxIdE=; b=aVYQOvq3UYqebL
	lw8IxvCwzSeisfTCBZfcQqp3euzQ7DqMozd3kNB+zN3ViVimiOqYge2i67SntfDLhC6LbfkaeHGKz
	/tf9ZE16/Ipoyw+fdSvlY/Y69RyOpvU7Uyk3G6eILJ9RZuz0+umNHVWz8MiG/9LsyRdvjRoWOnyiQ
	fw3ySKeUB1xYwBICA1tC5mGx2PNqGcc/VppTwv3re4vtg3D+W1Sn3qZLOk/7+Z6Bm65wWou0l3ldq
	VTmA+SQLAdsObzzqckPtdpCn4FFWK4L0it1FpkSE8fvFAHxk+WnZVRi/bVB8ZQ0ci4VhSHTT2OxDW
	YvaRo/akUzrpwT8lgZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mqp-001ti7-TZ; Thu, 16 Jun 2022 10:35:47 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mql-001tgt-Ju
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 10:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655375743; x=1686911743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bfn7Kr/6Mg81QIsDd2mRVCMs364rPZOp5AMz87j7Fog=;
  b=lMzypovoHSMG5W3a5fV+LsHyxWdTBrCwGtH7zgiHUJZf7RubDZJO/Djx
   mF6EIoUfTcb7x+xaUv2xXOeKO8/dEn5+Z1VDXVkbHTZtORpENgVTLZk2f
   QrHdq+EaRLHqUUyFDWDnLX6OxkAH14wbHNxe5gNW78N80+oIMmooNls1K
   mSrmN9xaKGbYNPeuqZv2xcUnT1rHveeYH1MG5pxhC0P3v95/OjPPJU8ia
   kbzHMany296XEdXJANn8BsnPop0nhqkfOmE2glruMqxITiOFAXTx8KW0N
   p9wzet0qyTTI/UQJKZTJSYwocP0GYFduCd4z+z2i7QJvxOsYFZ8DFccxq
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259073413"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="259073413"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 03:35:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="727840496"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 03:35:31 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 16 Jun 2022 13:35:28 +0300
Date: Thu, 16 Jun 2022 13:35:28 +0300
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
Message-ID: <YqsHcL5NPcZ4De77@lahna>
References: <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
 <20220615191153.3017939-1-oocheret@cisco.com>
 <YqrAGKLUazeNH1XK@lahna>
 <BYAPR11MB2757B1146457E3860389F4D1CDAC9@BYAPR11MB2757.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2757B1146457E3860389F4D1CDAC9@BYAPR11MB2757.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_033543_713632_4DEDE2B8 
X-CRM114-Status: GOOD (  28.01  )
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

SGksCgpPbiBUaHUsIEp1biAxNiwgMjAyMiBhdCAwNzo0MDoxOEFNICswMDAwLCBPbGVrc2FuZHIg
T2NoZXJldG55aSAtWCAob29jaGVyZXQgLSBHTE9CQUxMT0dJQyBJTkMgYXQgQ2lzY28pIHdyb3Rl
Ogo+ICAgIEhpIE1pa2EsCj4gCj4gICAgICA+IE9yaWdpbmFsbHkgY29tbWl0IDA5NGQzYjkgKCJt
dGQ6IHNwaS1ub3I6IEFkZCBVU0VfRlNSIGZsYWcgZm9yCj4gICAgICBuMjVxKgo+ICAgICAgPiBl
bnRyaWVzIikgYW5kIGZvbGxvd2luZyBvbmUgOGY5MzgyNiAoIm10ZDogc3BpLW5vcjogbWljcm9u
LXN0Ogo+ICAgICAgY29udmVydAo+ICAgICAgPiBVU0VfRlNSIHRvIGEgbWFudWZhY3R1cmVyIGZs
YWciKSBlbmFibGVkIFNQSU5PUl9PUF9SREZTUiBvcGNvZGUKPiAgICAgIGhhbmRsaW5nCj4gICAg
ICA+IGFiaWxpdHksIGhvd2V2ZXIgc29tZSBjb250cm9sbGVyIGRyaXZlcnMgc3RpbGwgY2Fubm90
IGhhbmRsZSBpdAo+ICAgICAgcHJvcGVybHkKPiAgICAgID4gaW4gdGhlIG1pY3Jvbl9zdF9ub3Jf
cmVhZHkoKSBjYWxsIHdoYXQgYnJlYWtzIHNvbWUgbXRkIGNhbGxiYWNrcwo+ICAgICAgd2l0aAo+
ICAgICAgPiBuZXh0IGVycm9yIGxvZ3M6Cj4gICAgICA+Cj4gICAgICA+IG10ZGJsb2NrOiBlcmFz
ZSBvZiByZWdpb24gW2FkZHJlc3MxLCBzaXplMV0gb24gIkJJT1MiIGZhaWxlZAo+ICAgICAgPiBt
dGRibG9jazogZXJhc2Ugb2YgcmVnaW9uIFthZGRyZXNzMiwgc2l6ZTJdIG9uICJCSU9TIiBmYWls
ZWQKPiAgICAgID4KPiAgICAgID4gVGhlIEludGVsIFNQSSBjb250cm9sbGVyIGRvZXMgbm90IHN1
cHBvcnQgbG93IGxldmVsIG9wZXJhdGlvbnMsCj4gICAgICBsaWtlCj4gICAgICA+IHJlYWRpbmcg
dGhlIGZsYWcgc3RhdHVzIHJlZ2lzdGVyIChGU1IpLiBJdCBvbmx5IGV4cG9zZXMgYSBzZXQgb2YK
PiAgICAgIGhpZ2gKPiAgICAgID4gbGV2ZWwgb3BlcmF0aW9ucyBmb3Igc29mdHdhcmUgdG8gdXNl
LiBGb3IgdGhpcyByZWFzb24gY2hlY2sgdGhlCj4gICAgICByZXR1cm4KPiAgICAgID4gdmFsdWUg
b2YgbWljcm9uX3N0X25vcl9yZWFkX2ZzcigpIGFuZCBpZiB0aGUgb3BlcmF0aW9uIHdhcyBub3QK
PiAgICAgID4gc3VwcG9ydGVkLCB1c2UgdGhlIHN0YXR1cyByZWdpc3RlciB2YWx1ZSBvbmx5LiBU
aGlzIGFsbG93cyB0aGUKPiAgICAgIGNoaXAgdG8KPiAgICAgID4gd29yayBldmVuIHdoZW4gYXR0
YWNoZWQgdG8gSW50ZWwgU1BJIGNvbnRyb2xsZXIgKHRoZXJlIGFyZSBzdWNoCj4gICAgICBzeXN0
ZW1zCj4gICAgICA+IG91dCB0aGVyZSkuCj4gICAgICA+Cj4gCj4gICAgPiBTaWduZWQtb2ZmLWJ5
OiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+Cj4gCj4g
ICAgICBJIGRvbid0IHRoaW5rIEkgc2lnbmVkIHRoaXMgb2ZmLgo+IAo+ICAgIEkgdGhvdWdodCBp
ZiBJIHRha2UgeW91ciBjYXNlICgtRU9QTk9UU1VQUCkgYW5kIHVwZGF0ZSBpdCB3aXRoCj4gICAg
KC1FTk9UU1VQUCkgSSBuZWVkIHRvIGtlZXAKPiAKPiAgICB5b3VyIFNpZ2hlZC1vZmYtYnk6IG5v
dGUgYXMgd2VsbC4KClRoYXQncyBub3QgaG93IGl0IHR5cGljYWxseSB3b3Jrcy4gUGVvcGxlIHdp
bGwgZ2l2ZSB0aGVpciB0YWcgZXhwbGljaXRseQphbmQgdGhlbiB5b3UgY2FuIGFkZCB0aG9zZS4K
Cj4gICAgPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgT2NoZXJldG55aSA8b29jaGVyZXRAY2lz
Y28uY29tPgo+ICAgID4gTGluazogWzFdaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZbVpV
Q0lFJTJGTkQ4MkJsTmhAbGFobmEvCj4gICAgPiAtLS0KPiAKPiAgICBXaGF0IGNoYW5nZWQgYmV0
d2VlbiB2MSBhbmQgdjI/Cj4gCj4gICAg4oCLSSB1cGRhdGVkIHYxIHBhdGNoIHRha2luZyBpbnRv
IGFjY291bnQgeW91ciBjaGFuZ2VzCj4gICAgWzJdaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtbXRkLzIwMjIwNTA2MTA1MTU4LjQzNjEzLTEtbWlrYS53ZXN0ZXIKPiAgICBiZXJnQGxpbnV4
LmludGVsLmNvbSB0byBjaGVjayAtRU9QTk9UU1VQUCBjYXNlIGFzIHdlbGwuIEFmdGVyIEkKPiAg
ICBjb21iaW5lZCBib3RoIHBhdGNoZXMgSSd2ZSBnb3QgdjIuCgpQbGVhc2UgcHV0IHRoYXQgaW5m
b3JtYXRpb24gYWZ0ZXIgdGhlICctLS0nIGluIHRoZSBwYXRjaC4KCj4gICAgQW5kIGRpZCB5b3Ug
dGFrZSBpbnRvIGNvbnNpZGVyYXRpb24gdGhlIGNvbW1lbnRzIEkgZ2F2ZT8KPiAKPiAgICDigItJ
ZiB5b3Ugc2F5IGFib3V0IGtlZXBpbmcgLUVOT1RTVVBQIGFzIGludGVsIGRyaXZlciBlcnJvcmNv
ZGUgLSBJIHRvb2sKPiAgICBpdCBob3dldmVyIGRvdWJ0ZWQgdG8gdXNlIGl0IGhlcmUgYmVjYXVz
ZSBvZiBub3RlIGFib3V0IG5mcyBhYm92ZS4KPiAgICBUaGVyZSBpcyBubyBwcm9ibGVtIHRvIHJl
c3RvcmUgcHJldmlvdXMgdmFyaWFudCB3aXRoIC1FTk9UU1VQUCBpbiBpbnRlbAo+ICAgIGRyaXZl
ciBlcnJvcmNvZGUuCgpXZWxsIHdlIHdvdWxkIG5lZWQgdG8gZ2V0IHNvbWUgZmVlZGJhY2sgZnJv
bSBTUEktTk9SIG1haW50YWluZXJzLiBJCndvdWxkIHBlcnNvbmFsbHkga2VlcCB1c2luZyBFTk9U
U1VQUCB0byBiZSBjb25zaXN0ZW50IHdpdGggdGhlIHJlc3Qgb2YKdGhlIGNvZGUgaW4gU1BJLU5P
UiBjb2RlIChvciBjb252ZXJ0IGl0IHRvIHVzZSBFT1BOT1RTVVBQIGV2ZXJ5d2hlcmUpCmJ1dCBp
dCBpcyBub3QgdXAgdG8gbWUgOy0pCgpGb3IgSW50ZWwgZHJpdmVyIGl0IGlzIGZpbmUgdG8gdXNl
IGVpdGhlciAod2hldGV2ZXIgdGhlIGRlY2lzaW9uIG9mClNQSS1OT1IgbWFpbnRhaW5lcnMnIGlz
KS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
