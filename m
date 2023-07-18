Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ADEC001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+suOrBCKl7RU29aoKQ4aUQRiKNv/1H00Ixh0mgf7ygs=; b=Oe+N6N3ZPPjCU5
	wfuE90ARN5O58kj5h1tTJu+XH1O6O3HIs43fWK+ybXMaVUVhk5kHeloHkn8FY226IKMRf3ejOYW3J
	J9VPFOai+L36qdLOuRWqzjHdczm9pIRNeQSDfRV0fKXYRaI4MljHvVAlReVxz1cFtdVGCFliSpQae
	ji4Bj0GJ12A1kqd5J8dPLZBfsRMkJpBBlW97Vp2d18zRTC5P9QUFA8z+1MXqtZOO7ZNlioa9AnbTJ
	PINVOxn9su3/mEmNx9LZywHrkClG6i7xxitqTSQMy6osRphPwUFPvtcoqausjKD21a7VO94ykDa+f
	VlrpVPTecpbZHIAl+JQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0gA-005kAW-2R;
	Wed, 19 Jul 2023 06:28:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0g9-005kA5-0q
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aTPofZ1ZJMozXM9xuYylxZAFKDQ+GXqBH86SLLNpiNg=; b=X2qGgIAs5luJ7dij6QRP9poE2+
	s9mpkctn2fkPBbQBlHTWwcAd/q1XCGNCaY9NpqKl6uXRczEJrjPnomjYyf2bHPu/xgaMwCP5ZgKUK
	IQ9NW4+Fp34COq976M2ed+c5NRLWgoJpnStQsBvkemD+9W6b+KZqhtiXGlMmgTCgCe74FkXsQmRnq
	llalCwe8Oww/W/W4YG21t0bl1qgekRSZhza+xUs5hVdSR6FHddy9aUl3VCcJu4C26VxaPHDlWasqh
	Ot+2ieKzhga5y5TRoVbGEMsO2dJ5cqVqgynx7k8FNqjmkQm44G8zlDRW0eyG4ENFDA9NWALEXgr6w
	43FfEPyA==;
Received: from mga14.intel.com ([192.55.52.115])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLn9I-00BkDB-10
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 16:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689696124; x=1721232124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mUwkx+Z+OnBhUQnTeyRwIWiZ6PuW3K2DI61uIPt6feY=;
  b=hFQHKYPAlxXjQeZL0IsglucxcAiWw6dvUapth77b/jPSCbaPPIxhGe8z
   Pll7LjYBl7iwcoGawl3ZjGwhYKyIR8K1UfrqbFjeh/Y2dTF0YUdZKk6QE
   lM8RQw/vt3oCqfuVrtp3q84vI+9DnDRWuqzdy8vz7RF0Y2cpFr5Xx0BB2
   wJPhI65xa3JFM0cGRFDgH2dsLcqiRbINYBJOyTNukZbvPMsTS4wjnPKhe
   cjgQvy4yL9z+tyNSI1Zi66qjmX2du4gSRwPKAaUx4QwOogRkWPRRdSkeX
   Gt+lCHFJjwx95g6LVL2LkZiYBg2oCK/uk+878H6Pk47lZ+6rmXmBRoH2E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366285341"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="366285341"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 09:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837330266"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="837330266"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2023 09:00:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLn82-0000hd-0g;
	Tue, 18 Jul 2023 16:00:46 +0000
Date: Wed, 19 Jul 2023 00:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] Revert "nvmem: add new config option"
Message-ID: <202307182316.AVNL1wNs-lkp@intel.com>
References: <20230718084804.20139-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718084804.20139-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_170204_964980_E8D17ECF 
X-CRM114-Status: GOOD (  13.72  )
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

SGkgUmFmYcWCLAoKa2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxk
IHdhcm5pbmdzOgoKW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIG10ZC9tdGQvbmV4dF0KW2Fs
c28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIG10ZC9tdGQvZml4ZXMgbGludXMvbWFzdGVyIHY2LjUt
cmMyIG5leHQtMjAyMzA3MThdCltJZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25n
IGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuCkFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0
Y2gsIHdlIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIGFzIGRvY3VtZW50ZWQgaW4KaHR0cHM6Ly9n
aXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0K
CnVybDogICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9S
YWZhLU1pLWVja2kvUmV2ZXJ0LW52bWVtLWFkZC1uZXctY29uZmlnLW9wdGlvbi8yMDIzMDcxOC0x
NzA0NDEKYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0CnBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyMzA3MTgwODQ4MDQuMjAxMzktMS16YWplYzUlNDBnbWFpbC5jb20KcGF0
Y2ggc3ViamVjdDogW1BBVENIXSBSZXZlcnQgIm52bWVtOiBhZGQgbmV3IGNvbmZpZyBvcHRpb24i
CmNvbmZpZzogaTM4Ni1yYW5kY29uZmlnLWkwMDItMjAyMzA3MTggKGh0dHBzOi8vZG93bmxvYWQu
MDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMDcxOC8yMDIzMDcxODIzMTYuQVZOTDF3TnMtbGtw
QGludGVsLmNvbS9jb25maWcpCmNvbXBpbGVyOiBnY2MtMTIgKERlYmlhbiAxMi4yLjAtMTQpIDEy
LjIuMApyZXByb2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUv
MjAyMzA3MTgvMjAyMzA3MTgyMzE2LkFWTkwxd05zLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQoK
SWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90
IGp1c3QgYSBuZXcgdmVyc2lvbiBvZgp0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRk
IGZvbGxvd2luZyB0YWdzCnwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPgp8IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8y
MDIzMDcxODIzMTYuQVZOTDF3TnMtbGtwQGludGVsLmNvbS8KCkFsbCB3YXJuaW5ncyAobmV3IG9u
ZXMgcHJlZml4ZWQgYnkgPj4pOgoKICAgZHJpdmVycy9tdGQvbXRkY29yZS5jOiBJbiBmdW5jdGlv
biAnbXRkX252bWVtX2FkZCc6Cj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzo1NDI6Mjk6IHdhcm5p
bmc6IHVudXNlZCB2YXJpYWJsZSAnbm9kZScgWy1XdW51c2VkLXZhcmlhYmxlXQogICAgIDU0MiB8
ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gbXRkX2dldF9vZl9ub2RlKG10ZCk7
CiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KCgp2aW0gKy9ub2Rl
ICs1NDIgZHJpdmVycy9tdGQvbXRkY29yZS5jCgpjNGRmYTI1YWIzMDdhMiBBbGJhbiBCZWRlbCAg
ICAgICAgMjAxOC0xMS0xMyAgNTM5ICAKYzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwgICAgICAg
IDIwMTgtMTEtMTMgIDU0MCAgc3RhdGljIGludCBtdGRfbnZtZW1fYWRkKHN0cnVjdCBtdGRfaW5m
byAqbXRkKQpjNGRmYTI1YWIzMDdhMiBBbGJhbiBCZWRlbCAgICAgICAgMjAxOC0xMS0xMyAgNTQx
ICB7CjY1OGM0NDQ4YmJiZjAyIENocmlzdGlhbiBNYXJhbmdpICAyMDIxLTAzLTEyIEA1NDIgIAlz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBtdGRfZ2V0X29mX25vZGUobXRkKTsKYzRkZmEyNWFi
MzA3YTIgQWxiYW4gQmVkZWwgICAgICAgIDIwMTgtMTEtMTMgIDU0MyAgCXN0cnVjdCBudm1lbV9j
b25maWcgY29uZmlnID0ge307CmM0ZGZhMjVhYjMwN2EyIEFsYmFuIEJlZGVsICAgICAgICAyMDE4
LTExLTEzICA1NDQgIAo3NWYzMmY0YjlkNTI2MyBNaXF1ZWwgUmF5bmFsICAgICAgMjAyMy0wMy0w
NyAgNTQ1ICAJY29uZmlnLmlkID0gTlZNRU1fREVWSURfTk9ORTsKYzRkZmEyNWFiMzA3YTIgQWxi
YW4gQmVkZWwgICAgICAgIDIwMTgtMTEtMTMgIDU0NiAgCWNvbmZpZy5kZXYgPSAmbXRkLT5kZXY7
CjdiMDFiNzIzOWQwZGM5IFJpY2FyZG8gUmliYWxkYSAgICAyMDIwLTA0LTMwICA1NDcgIAljb25m
aWcubmFtZSA9IGRldl9uYW1lKCZtdGQtPmRldik7CmM0ZGZhMjVhYjMwN2EyIEFsYmFuIEJlZGVs
ICAgICAgICAyMDE4LTExLTEzICA1NDggIAljb25maWcub3duZXIgPSBUSElTX01PRFVMRTsKYzRk
ZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwgICAgICAgIDIwMTgtMTEtMTMgIDU0OSAgCWNvbmZpZy5y
ZWdfcmVhZCA9IG10ZF9udm1lbV9yZWdfcmVhZDsKYzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwg
ICAgICAgIDIwMTgtMTEtMTMgIDU1MCAgCWNvbmZpZy5zaXplID0gbXRkLT5zaXplOwpjNGRmYTI1
YWIzMDdhMiBBbGJhbiBCZWRlbCAgICAgICAgMjAxOC0xMS0xMyAgNTUxICAJY29uZmlnLndvcmRf
c2l6ZSA9IDE7CmM0ZGZhMjVhYjMwN2EyIEFsYmFuIEJlZGVsICAgICAgICAyMDE4LTExLTEzICA1
NTIgIAljb25maWcuc3RyaWRlID0gMTsKYzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwgICAgICAg
IDIwMTgtMTEtMTMgIDU1MyAgCWNvbmZpZy5yZWFkX29ubHkgPSB0cnVlOwpjNGRmYTI1YWIzMDdh
MiBBbGJhbiBCZWRlbCAgICAgICAgMjAxOC0xMS0xMyAgNTU0ICAJY29uZmlnLnJvb3Rfb25seSA9
IHRydWU7CjZjNzYyMTg5MDk5NWQwIENocmlzdG9waGUgS2VyZWxsbyAyMDIyLTAyLTIwICA1NTUg
IAljb25maWcuaWdub3JlX3dwID0gdHJ1ZTsKYzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwgICAg
ICAgIDIwMTgtMTEtMTMgIDU1NiAgCWNvbmZpZy5wcml2ID0gbXRkOwpjNGRmYTI1YWIzMDdhMiBB
bGJhbiBCZWRlbCAgICAgICAgMjAxOC0xMS0xMyAgNTU3ICAKYzRkZmEyNWFiMzA3YTIgQWxiYW4g
QmVkZWwgICAgICAgIDIwMTgtMTEtMTMgIDU1OCAgCW10ZC0+bnZtZW0gPSBudm1lbV9yZWdpc3Rl
cigmY29uZmlnKTsKYzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwgICAgICAgIDIwMTgtMTEtMTMg
IDU1OSAgCWlmIChJU19FUlIobXRkLT5udm1lbSkpIHsKYzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVk
ZWwgICAgICAgIDIwMTgtMTEtMTMgIDU2MCAgCQkvKiBKdXN0IGlnbm9yZSBpZiB0aGVyZSBpcyBu
byBOVk1FTSBzdXBwb3J0IGluIHRoZSBrZXJuZWwgKi8KNWNhYjA2MTU2YWFkZTEgTWlxdWVsIFJh
eW5hbCAgICAgIDIwMjMtMDMtMDcgIDU2MSAgCQlpZiAoUFRSX0VSUihtdGQtPm52bWVtKSA9PSAt
RU9QTk9UU1VQUCkKYzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwgICAgICAgIDIwMTgtMTEtMTMg
IDU2MiAgCQkJbXRkLT5udm1lbSA9IE5VTEw7CjVjYWIwNjE1NmFhZGUxIE1pcXVlbCBSYXluYWwg
ICAgICAyMDIzLTAzLTA3ICA1NjMgIAkJZWxzZQo1Y2FiMDYxNTZhYWRlMSBNaXF1ZWwgUmF5bmFs
ICAgICAgMjAyMy0wMy0wNyAgNTY0ICAJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmbXRkLT5kZXYs
IFBUUl9FUlIobXRkLT5udm1lbSksCjVjYWIwNjE1NmFhZGUxIE1pcXVlbCBSYXluYWwgICAgICAy
MDIzLTAzLTA3ICA1NjUgIAkJCQkJICAgICAiRmFpbGVkIHRvIHJlZ2lzdGVyIE5WTUVNIGRldmlj
ZVxuIik7CmM0ZGZhMjVhYjMwN2EyIEFsYmFuIEJlZGVsICAgICAgICAyMDE4LTExLTEzICA1NjYg
IAl9CmM0ZGZhMjVhYjMwN2EyIEFsYmFuIEJlZGVsICAgICAgICAyMDE4LTExLTEzICA1NjcgIApj
NGRmYTI1YWIzMDdhMiBBbGJhbiBCZWRlbCAgICAgICAgMjAxOC0xMS0xMyAgNTY4ICAJcmV0dXJu
IDA7CmM0ZGZhMjVhYjMwN2EyIEFsYmFuIEJlZGVsICAgICAgICAyMDE4LTExLTEzICA1NjkgIH0K
YzRkZmEyNWFiMzA3YTIgQWxiYW4gQmVkZWwgICAgICAgIDIwMTgtMTEtMTMgIDU3MCAgCgotLSAK
MC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQpodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtw
LXRlc3RzL3dpa2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
