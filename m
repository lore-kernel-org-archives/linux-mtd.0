Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AD7C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Nov 2022 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnYcIiNRmleMLeG6FU49D44FxqIoxPdMhN8pquHelCU=; b=HVxQS1HqQ5dccS
	OMTfyD51KlGyLSqZRgD+lFSFCmUMkruj9iLVi9aK9B/aEuGZ6qkoJGXxrf7AKxcrWMH5XVYvEbfGW
	cp4h00ueFPemXyO1YPGm1fRb1lffoOFc2fw5m80NRnZ54+6g0Va7uI50DeUc2LjKAEOlz+epD4U9c
	nViwHtaJCqrCSh3C3ND03pAz/yFXEvMo+nlmUqQJQC2b6tf6BMmMuS17ygGdhsj4+NlIvebgGYuok
	DS+PJSy7iUvTW56WWPcxfA5HLgHEgVMiLmE9yF2FpnLjpuM0TDAJln+9rOKja4llU7K9GSUq81qoT
	jL2KCneyByX4ZfpaFoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZhS-00H2em-J6; Fri, 25 Nov 2022 14:29:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZfg-00H1ko-H6; Fri, 25 Nov 2022 14:27:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 168EEB82B02;
	Fri, 25 Nov 2022 14:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59CBC433D6;
	Fri, 25 Nov 2022 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669386434;
	bh=flrWhKxQcLgnkz5HWwKc3eGDBXHd2DZVGZMjdcPc5hY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CyHabUYcBi83iBg+IXQCXTmWKh/Vsse6jNqtBrOcjWNjpEEPUkYxmD/0nZ5c5ugKO
	 jo6Z8/gl+MgvM2sAwEq6RdlT5vgN1k6ZJ+hqcP93CQj09ymCKeE30N8oa3t0Dyb2ta
	 8+lhrsfn7LySe/twThGMfi4tdsvHPQplnQuaeGcZds17fbxEN/133XbiwZ446jPLS9
	 1J6PAAF8g/44RhMnx0oz0XFgtuVlOhD80/f7Dhydm3vHtZMKjn7bF0j0c8/R2UsycZ
	 cywT0qiXBo9L2PFUprEkr+T5u7/lhadYuK2q+CTR0j12IAxjD6y0soSJBSn9D8biJo
	 PV6iVB08gZr+A==
From: Mark Brown <broonie@kernel.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Purism Kernel Team <kernel@puri.sm>, kernel@pengutronix.de, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rtc@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com,
 openipmi-developer@lists.sourceforge.net, linux-staging@lists.linux.dev, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-input@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-actions@lists.infradead.org
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166938642447.506633.10798171870515262916.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:27:04 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_062716_897298_417F0D86 
X-CRM114-Status: GOOD (  14.02  )
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

T24gRnJpLCAxOCBOb3YgMjAyMiAyMzozNTozNCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gc2luY2UgY29tbWl0IGI4YTFhNGNkNWE5OCAoImkyYzogUHJvdmlkZSBhIHRlbXBvcmFy
eSAucHJvYmVfbmV3KCkKPiBjYWxsLWJhY2sgdHlwZSIpIGZyb20gMjAxNiB0aGVyZSBpcyBhICJ0
ZW1wb3JhcnkiIGFsdGVybmF0aXZlIHByb2JlCj4gY2FsbGJhY2sgZm9yIGkyYyBkcml2ZXJzLgo+
IAo+IFRoaXMgc2VyaWVzIGNvbXBsZXRlcyBhbGwgZHJpdmVycyB0byB0aGlzIG5ldyBjYWxsYmFj
ayAodW5sZXNzIEkgbWlzc2VkCj4gc29tZXRoaW5nKS4gSXQncyBiYXNlZCBvbiBjdXJyZW50IG5l
eHQvbWFzdGVyLgo+IEEgcGFydCBvZiB0aGUgcGF0Y2hlcyBkZXBlbmQgb24gY29tbWl0IDY2MjIz
MzczMWQ2NiAoImkyYzogY29yZToKPiBJbnRyb2R1Y2UgaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lk
IGhlbHBlciBmdW5jdGlvbiIpLCB0aGVyZSBpcyBhIGJyYW5jaCB0aGF0Cj4geW91IGNhbiBwdWxs
IGludG8geW91ciB0cmVlIHRvIGdldCBpdDoKPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zb3Vu
ZC5naXQgZm9yLW5leHQKClRoYW5rcyEKCls2MDEvNjA2XSBBU29DOiBjb2RlY3M6IGVzODMyNjog
Q29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogNzg0MjUyYmFj
ODM1YzgzMWUxMGM0OGJlNjMzY2QxZmYwZDY5NzMyNgpbNjAyLzYwNl0gQVNvQzogbWF4OTgzOTY6
IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDJmZjg1MDIw
ZWM1ZGI0YWYzYjU1ZDM1ZjViODM4NWU4MzBjMzlmZGQKWzYwMy82MDZdIEFTb0M6IGNvZGVjczog
c3JjNHh4eC1pMmM6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21t
aXQ6IDgzMGEzNWFhMjEyMTI1OGQwYzgyODNhYmU0NWViYjVjM2QyZmQ3OTEKWzYwNC82MDZdIEFT
b0M6IGNvZGVjczogdGFzMjc4MDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAg
ICAgIGNvbW1pdDogODhhZGUyYWJiYTFlNDZmZTU4MTYxMDkxMTI0MDA1NDUzOGY4ZGI4OAoKQWxs
IGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRo
ZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91cnMp
IGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25l
ciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVk
IHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBnZXQg
ZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGlu
ZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9y
dGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55IGlz
c3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUgcmVx
dWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3VsZCBi
ZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3Rp
bmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2YW50
IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhpcyBt
YWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
