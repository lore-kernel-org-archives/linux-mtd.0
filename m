Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34034C43334
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 00:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87w11tDH7cXZffb4Gh3ufFg1BtSmd0drYq9+WRmhi9E=; b=3PAMo5bY8Sp+ON
	TemlmMYTArgXtyIqzvZK4Efx3LSagMhfjei2qeuXw062H66PIt5toOr3dHXieOxaiPAGi21e8Oadj
	hiKZnZKWvkFG85EwHJoXKmc/bj46AyoTD1uhL+Oz/zMpph8HjNsozmgssvhtvgVEs+U0nxvetH/17
	azJa3GUkckN4Q7AXimzzK+y0qOwYEgRj/7EQfaOAUV/y+EGwWJcVmjTpP7/gT+9sWA5WgySDChWYE
	21oq1EEYbcgFI1JZYmBmx8J1FIGg4TVshyu3jSVmFx9+IprWwB7M9ijJQ0+yeMhBwuX/8NdCfvVtM
	vImxP/Q5tIdq703UB7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFPjQ-008yUX-TO; Sun, 24 Jul 2022 00:44:28 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFPjN-008yRX-TJ
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 00:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658623465; x=1690159465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=p8OqWEFGhu6pLUfSsWTBU7kSxbLrZ2r0vLX0FImwX1o=;
  b=CyU/HSqdft+sftujnDW17nm4DLgDumHLUojd7bgIN6qz6PKzCHRDi/Sn
   cgzdd9eCfgkSRDZPDpgyKMW2SbTsSyK7A2/BWF3PvGiLLTelNmMSYuNR+
   RYZqnyjCEfBdBgcdld2omqjdhliOww7450IWcV62HVXbJ36BSF7zwCHVg
   OGxefq8ufUmR6E5tYBZ3cfig9E5jSe2Ypaimaya+ZiMenNw7ya234e5cv
   KCFIZmXZqJZxhttSYjnbICa/yI4ZY35AYHzAaH1bup11jgwuuVKBy1P/P
   ckvi4H4kvb7QbF5MkWUi5qdaMqyjpdyLmFIqZtQaly1kjSjYPvkZv+S/Q
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10417"; a="274362160"
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="274362160"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2022 17:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="845131504"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2022 17:44:15 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFPjC-0003Iz-1A;
	Sun, 24 Jul 2022 00:44:14 +0000
Date: Sun, 24 Jul 2022 08:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
	tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: kbuild-all@lists.01.org, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
	paul@crapouillou.net, dongsheng.qiu@ingenic.com,
	aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
	jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
	reimu@sudomaker.com
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Message-ID: <202207240839.YeZ8uQ0T-lkp@intel.com>
References: <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_174426_014521_ECAE8497 
X-CRM114-Status: GOOD (  13.83  )
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

SGkgIuWRqOeQsOadsCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoISBQZXJoYXBzIHNvbWV0aGlu
ZyB0byBpbXByb3ZlOgoKW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIGJyb29uaWUtc3BpL2Zv
ci1uZXh0XQpbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbXRkL3NwaS1ub3IvbmV4dCBsaW51
cy9tYXN0ZXIgdjUuMTktcmM3IG5leHQtMjAyMjA3MjJdCltJZiB5b3VyIHBhdGNoIGlzIGFwcGxp
ZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuCkFuZCB3aGVu
IHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIGFzIGRvY3VtZW50
ZWQgaW4KaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJl
ZV9pbmZvcm1hdGlvbl0KCnVybDogICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3Av
bGludXgvY29tbWl0cy9aaG91LVlhbmppZS9BZGQtU0ZDLXN1cHBvcnQtZm9yLUluZ2VuaWMtU29D
cy8yMDIyMDcyMy0wMDUwMTEKYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKY29uZmlnOiBhbHBoYS1h
bGx5ZXNjb25maWcgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIy
MDcyNC8yMDIyMDcyNDA4MzkuWWVaOHVRMFQtbGtwQGludGVsLmNvbS9jb25maWcpCmNvbXBpbGVy
OiBhbHBoYS1saW51eC1nY2MgKEdDQykgMTIuMS4wCnJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBi
dWlsZCk6CiAgICAgICAgd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50
ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcwog
ICAgICAgIGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MKICAgICAgICAjIGh0dHBzOi8vZ2l0aHVi
LmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdC8wZDlkMGU2MDIzODAyNWEwNGQ0MjhlNjRl
MTgyMTFjMDM3MjI5Mjg0CiAgICAgICAgZ2l0IHJlbW90ZSBhZGQgbGludXgtcmV2aWV3IGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4CiAgICAgICAgZ2l0IGZldGNoIC0tbm8t
dGFncyBsaW51eC1yZXZpZXcgWmhvdS1ZYW5qaWUvQWRkLVNGQy1zdXBwb3J0LWZvci1Jbmdlbmlj
LVNvQ3MvMjAyMjA3MjMtMDA1MDExCiAgICAgICAgZ2l0IGNoZWNrb3V0IDBkOWQwZTYwMjM4MDI1
YTA0ZDQyOGU2NGUxODIxMWMwMzcyMjkyODQKICAgICAgICAjIHNhdmUgdGhlIGNvbmZpZyBmaWxl
CiAgICAgICAgbWtkaXIgYnVpbGRfZGlyICYmIGNwIGNvbmZpZyBidWlsZF9kaXIvLmNvbmZpZwog
ICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy0xMi4x
LjAgbWFrZS5jcm9zcyBXPTEgTz1idWlsZF9kaXIgQVJDSD1hbHBoYSBTSEVMTD0vYmluL2Jhc2gg
ZHJpdmVycy9zcGkvCgpJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcg
dGFnIHdoZXJlIGFwcGxpY2FibGUKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPgoKQWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6CgogICBk
cml2ZXJzL3NwaS9zcGktaW5nZW5pYy1zZmMuYzogSW4gZnVuY3Rpb24gJ2luZ2VuaWNfc2ZjX2V4
ZWNfb3BfcGlvJzoKPj4gZHJpdmVycy9zcGkvc3BpLWluZ2VuaWMtc2ZjLmM6Mjk5OjE2OiB3YXJu
aW5nOiBjb252ZXJzaW9uIGZyb20gJ2xvbmcgdW5zaWduZWQgaW50JyB0byAndTMyJyB7YWthICd1
bnNpZ25lZCBpbnQnfSBjaGFuZ2VzIHZhbHVlIGZyb20gJzE4NDQ2NzQ0MDczNzA5NTUxNTk1JyB0
byAnNDI5NDk2NzI3NScgWy1Xb3ZlcmZsb3ddCiAgICAgMjk5IHwgICAgICAgICB3cml0ZWwofihJ
TlRDX01BU0tfRU5EIHwgSU5UQ19NQVNLX1JSRVEpLCBzZmMtPmJhc2UgKyBTRkNfUkVHX0lOVEMp
OwogICAgICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgogICBkcml2ZXJzL3NwaS9zcGktaW5nZW5pYy1zZmMuYzogSW4gZnVuY3Rpb24gJ2luZ2Vu
aWNfc2ZjX2V4ZWNfb3BfZG1hJzoKICAgZHJpdmVycy9zcGkvc3BpLWluZ2VuaWMtc2ZjLmM6MzU2
OjE2OiB3YXJuaW5nOiBjb252ZXJzaW9uIGZyb20gJ2xvbmcgdW5zaWduZWQgaW50JyB0byAndTMy
JyB7YWthICd1bnNpZ25lZCBpbnQnfSBjaGFuZ2VzIHZhbHVlIGZyb20gJzE4NDQ2NzQ0MDczNzA5
NTUxNTk5JyB0byAnNDI5NDk2NzI3OScgWy1Xb3ZlcmZsb3ddCiAgICAgMzU2IHwgICAgICAgICB3
cml0ZWwofklOVENfTUFTS19FTkQsIHNmYy0+YmFzZSArIFNGQ19SRUdfSU5UQyk7CiAgIGRyaXZl
cnMvc3BpL3NwaS1pbmdlbmljLXNmYy5jOiBJbiBmdW5jdGlvbiAnaW5nZW5pY19zZmNfcG9sbF9z
dGF0dXMnOgogICBkcml2ZXJzL3NwaS9zcGktaW5nZW5pYy1zZmMuYzo0Njk6MTY6IHdhcm5pbmc6
IGNvbnZlcnNpb24gZnJvbSAnbG9uZyB1bnNpZ25lZCBpbnQnIHRvICd1MzInIHtha2EgJ3Vuc2ln
bmVkIGludCd9IGNoYW5nZXMgdmFsdWUgZnJvbSAnMTg0NDY3NDQwNzM3MDk1NTE1OTknIHRvICc0
Mjk0OTY3Mjc5JyBbLVdvdmVyZmxvd10KICAgICA0NjkgfCAgICAgICAgIHdyaXRlbCh+SU5UQ19N
QVNLX0VORCwgc2ZjLT5iYXNlICsgU0ZDX1JFR19JTlRDKTsKCgp2aW0gKzI5OSBkcml2ZXJzL3Nw
aS9zcGktaW5nZW5pYy1zZmMuYwoKICAgMjY3CQogICAyNjgJc3RhdGljIGludCBpbmdlbmljX3Nm
Y19leGVjX29wX3BpbyhzdHJ1Y3QgaW5nZW5pY19zZmMgKnNmYywgY29uc3Qgc3RydWN0IHNwaV9t
ZW1fb3AgKm9wKQogICAyNjkJewogICAyNzAJCWludCByZXQsIHZhbDsKICAgMjcxCQogICAyNzIJ
CXZhbCA9IHJlYWRsKHNmYy0+YmFzZSArIFNGQ19SRUdfR0xCKTsKICAgMjczCQl1MzJwX3JlcGxh
Y2VfYml0cygmdmFsLCBHTEJfVFJBTl9ESVJfUkVBRCwgR0xCX1RSQU5fRElSX01BU0spOwogICAy
NzQJCXUzMnBfcmVwbGFjZV9iaXRzKCZ2YWwsIEdMQl9PUF9NT0RFX1NMQVZFLCBHTEJfT1BfTU9E
RV9NQVNLKTsKICAgMjc1CQl3cml0ZWwodmFsLCBzZmMtPmJhc2UgKyBTRkNfUkVHX0dMQik7CiAg
IDI3NgkKICAgMjc3CQl2YWwgPSBUUkFOX0NPTkZfQ01EX0VOIHwgb3AtPmNtZC5vcGNvZGU7CiAg
IDI3OAkKICAgMjc5CQlpZiAob3AtPmFkZHIubmJ5dGVzID4gMCkgewogICAyODAJCQl2YWwgfD0g
RklFTERfUFJFUChUUkFOX0NPTkZfQUREUl9XSURUSF9NQVNLLCBvcC0+YWRkci5uYnl0ZXMpOwog
ICAyODEJCiAgIDI4MgkJCXdyaXRlbChvcC0+YWRkci52YWwgJiAweGZmZmZmZmZmLCBzZmMtPmJh
c2UgKyBTRkNfUkVHX0RFVl9BRERSKDApKTsKICAgMjgzCQkJd3JpdGVsKG9wLT5hZGRyLnZhbCA+
PiAzMiwgc2ZjLT5iYXNlICsgU0ZDX1JFR19ERVZfQUREUl9QTFVTKDApKTsKICAgMjg0CQl9CiAg
IDI4NQkKICAgMjg2CQlpZiAob3AtPmR1bW15Lm5ieXRlcyA+IDApCiAgIDI4NwkJCXZhbCB8PSBG
SUVMRF9QUkVQKFRSQU5fQ09ORl9ETVlfQklUU19NQVNLLAogICAyODgJCQkJCW9wLT5kdW1teS5u
Ynl0ZXMgKiA4IC8gb3AtPmR1bW15LmJ1c3dpZHRoKTsKICAgMjg5CQogICAyOTAJCWlmIChvcC0+
ZGF0YS5uYnl0ZXMgPiAwKQogICAyOTEJCQl2YWwgfD0gVFJBTl9DT05GX0RBVEFfRU47CiAgIDI5
MgkKICAgMjkzCQl3cml0ZWwodmFsLCBzZmMtPmJhc2UgKyBTRkNfUkVHX1RSQU5fQ09ORigwKSk7
CiAgIDI5NAkJd3JpdGVsKG9wLT5kYXRhLm5ieXRlcywgc2ZjLT5iYXNlICsgU0ZDX1JFR19UUkFO
X0xFTik7CiAgIDI5NQkKICAgMjk2CQlpbmdlbmljX3NmY19zZXRfdHJhbnNmZXJfbW9kZShzZmMs
IG9wKTsKICAgMjk3CQogICAyOTgJCXdyaXRlbCgweDFmLCBzZmMtPmJhc2UgKyBTRkNfUkVHX1ND
Uik7CiA+IDI5OQkJd3JpdGVsKH4oSU5UQ19NQVNLX0VORCB8IElOVENfTUFTS19SUkVRKSwgc2Zj
LT5iYXNlICsgU0ZDX1JFR19JTlRDKTsKICAgMzAwCQogICAzMDEJCXdyaXRlbCgwLCBzZmMtPmJh
c2UgKyBTRkNfUkVHX01FTV9BRERSKTsKICAgMzAyCQogICAzMDMJCXdyaXRlbChUUklHX0ZMVVNI
LCBzZmMtPmJhc2UgKyBTRkNfUkVHX1RSSUcpOwogICAzMDQJCXdyaXRlbChUUklHX1NUQVJULCBz
ZmMtPmJhc2UgKyBTRkNfUkVHX1RSSUcpOwogICAzMDUJCiAgIDMwNgkJcmV0ID0gd2FpdF9mb3Jf
Y29tcGxldGlvbl90aW1lb3V0KCZzZmMtPmNvbXBsZXRpb24sCiAgIDMwNwkJCQltc2Vjc190b19q
aWZmaWVzKElOR0VOSUNfU0ZDX1RSQU5TRkVSX1RJTUVPVVQpKTsKICAgMzA4CQlpZiAoIXJldCkg
ewogICAzMDkJCQl3cml0ZWwoMHgxZiwgc2ZjLT5iYXNlICsgU0ZDX1JFR19JTlRDKTsKICAgMzEw
CQkJd3JpdGVsKDB4MWYsIHNmYy0+YmFzZSArIFNGQ19SRUdfU0NSKTsKICAgMzExCQkJZGV2X2Vy
cihzZmMtPmRldiwgImxpbmU6JWQgVGltZW91dCBmb3IgQUNLIGZyb20gU0ZDIGRldmljZVxuIiwg
X19MSU5FX18pOwogICAzMTIJCQlyZXR1cm4gLUVUSU1FRE9VVDsKICAgMzEzCQl9CiAgIDMxNAkK
ICAgMzE1CQlpbmdlbmljX3NmY19yZWFkX3J4ZmlmbyhzZmMsIG9wLT5kYXRhLmJ1Zi5pbiwgb3At
PmRhdGEubmJ5dGVzKTsKICAgMzE2CQlyZWFkbF9wb2xsX3RpbWVvdXQoc2ZjLT5iYXNlICsgU0ZD
X1JFR19TUiwgdmFsLCB2YWwgJiBTUl9FTkQsIDEwLCAwKTsKICAgMzE3CQogICAzMTgJCXdyaXRl
bChJTlRDX01BU0tfRU5EIHwgSU5UQ19NQVNLX1JSRVEsIHNmYy0+YmFzZSArIFNGQ19SRUdfU0NS
KTsKICAgMzE5CQl3cml0ZWwoVFJJR19TVE9QLCBzZmMtPmJhc2UgKyBTRkNfUkVHX1RSSUcpOwog
ICAzMjAJCiAgIDMyMQkJcmV0dXJuIDA7CiAgIDMyMgl9CiAgIDMyMwkKCi0tIAowLURBWSBDSSBL
ZXJuZWwgVGVzdCBTZXJ2aWNlCmh0dHBzOi8vMDEub3JnL2xrcAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
