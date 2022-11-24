Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DACC43217
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2zAj8BpGO7igF+xCINnwFJd5ai6ksA9ipFFazYxc2s=; b=tF/NSNOt6CzyPt
	8nj+4rv8QDpp5m1p9eiTDHuQjVZ3dWTkdG7PtAKbT/JkoKLcCBybIQcKffhgmiOxUZzQwe295TO/2
	Hpoy9ds1ga9FBwcFCJgzZhNpNDm1QBssx3WO1ugpvUdaI+vcrqa+ezNVjkzOek+rz9cCtT/HN9mvx
	hCYWIkBotJicGPgEXU3a14aNDbD8IfP7U9lzHQMJ+4qp9XL34rDLYEMdMmf0DiCCAAxsZotkQPR/Z
	u1pbbFPTeR9TV9K2PsHO3RVivyGPownd5c8RxuKFXWXZrvu1tf8OXe3t4fhOMRfOu/+86CSEy2S4z
	nz1SbQ1A55qiu858OzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyDDm-009J14-TY; Thu, 24 Nov 2022 14:28:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyDDa-009Iwj-7F; Thu, 24 Nov 2022 14:28:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92F026216D;
	Thu, 24 Nov 2022 14:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2079CC433D6;
	Thu, 24 Nov 2022 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669300124;
	bh=vSDY92xmrOtkiq1FJrC4dGUzlqSkjlYU9twgxHBDx1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KTze8bCUgXVbYusj8LQGIka1dvsWB2I+DkxRW3Bbcfc8fJfFo5dmxKpg3PKgAjpOn
	 9avnZIur+o74XnCh3gVsMyELrZAQdXd6HCNoIUgHIirXltRyICOLVj51DmDrx0f04w
	 1AGD2KJyVMrzfgVJIQqdI4TdGPyqtrMb3yZ5g1UXHX19YLP72lEiTCyPJzQ9GIumj3
	 G3fEEXxlkAwuCO4fSjFARpiJpt2qdApa9WD0+DjEZ9l7DrBoB8kOlNXSTVKeBIgAoU
	 YJdQi+vG0JQnptu7goXssC91yOy/6Nbeg2WpJcQ9bEaBSQmawOISfd+9Ye4sBXr523
	 UQ93Sgymq7UOw==
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org, kernel@pengutronix.de, linux-rtc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-actions@lists.infradead.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166930011683.316126.16580193554056109830.b4-ty@kernel.org>
Date: Thu, 24 Nov 2022 14:28:36 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_062846_346771_B3715F3B 
X-CRM114-Status: GOOD (  14.22  )
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
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9yZWd1
bGF0b3IuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbNTM4LzYwNl0gcmVndWxhdG9yOiBhY3Q4ODY1
LXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBj
b21taXQgaW5mbykKWzUzOS82MDZdIHJlZ3VsYXRvcjogYWQ1Mzk4OiBDb252ZXJ0IHRvIGkyYydz
IC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiA3ZjY5ZWRiYTk2MGJiZGNiYzgyOWQ4ZDA5
OTViMTExN2NlMjllOGIxCls1NDAvNjA2XSByZWd1bGF0b3I6IGRhOTEyMS1yZWd1bGF0b3I6IENv
bnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDAyMGNmNzNiNDc0
MTRhODRiNjY2ZDNlNjczNmE2YWU5NTdlMjc4NDAKWzU0MS82MDZdIHJlZ3VsYXRvcjogZmFuNTM1
NTU6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGlu
Zm8pCls1NDIvNjA2XSByZWd1bGF0b3I6IGlzbDYyNzFhLXJlZ3VsYXRvcjogQ29udmVydCB0byBp
MmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzU0My82MDZdIHJl
Z3VsYXRvcjogbHAzOTcyOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAg
Y29tbWl0OiAyNTMyZDVmOGQ1YzIwZDVhMGE4YTBkNTdhMzExYmM1ZGYwMGRlYTA0Cls1NDQvNjA2
XSByZWd1bGF0b3I6IGxwODcyeDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAg
ICAgIGNvbW1pdDogODdmZWNjYjM0N2IyNWY1ZGM2ZmY0NTExMjNiODMyYzlhZDVkZGRmZQpbNTQ1
LzYwNl0gcmVndWxhdG9yOiBscDg3NTU6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAg
ICAgICAgICBjb21taXQ6IGNiMjhmNzRiNDgwOWEwMGI0MGZkZjBjNDRjY2Y1MWFiOTUwNTgxZDMK
WzU0Ni82MDZdIHJlZ3VsYXRvcjogbHRjMzU4OTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3
KCkKICAgICAgICAgIGNvbW1pdDogNzhjOGY2Y2RiNTFkNDcxOTI4ZDQ4MWVkM2IyYzgyZGJjMTEw
YTFlZApbNTQ3LzYwNl0gcmVndWxhdG9yOiBtYXgxNTg2OiBDb252ZXJ0IHRvIGkyYydzIC5wcm9i
ZV9uZXcoKQogICAgICAgICAgY29tbWl0OiAzZDU0ZjdiYTI0OGIwYWQxNzkxYmMzNTZlOWFkM2Q5
MDIwYTFjNDcyCls1NDgvNjA2XSByZWd1bGF0b3I6IG1heDg2NDk6IENvbnZlcnQgdG8gaTJjJ3Mg
LnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDNjZjQ0MTczODVkMGFjOGYwMmYyMjg4OGUx
MmE2ZDIxZDk3ZDg5ZmMKWzU0OS82MDZdIHJlZ3VsYXRvcjogbWF4ODY2MDogQ29udmVydCB0byBp
MmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogZGJmMzFkYWM3MDMwMDkxNzQyMjZi
Yjg3YjM5MTRiZDA5MjA0MDMyNwpbNTUwLzYwNl0gcmVndWxhdG9yOiBtYXg4OTUyOiBDb252ZXJ0
IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiBjMjBjMzY3MzU5NDliM2I3
OTg0NjkyZmJhYjNkOTJiMGU4YTg0NWVjCls1NTEvNjA2XSByZWd1bGF0b3I6IG1heDg5NzMtcmVn
dWxhdG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiA0
ZTg1ZTVkNjRmNjZhYzVlNGIwMjg2ZWU0YjZmOGU4Y2UxMDQ0ZDQyCls1NTIvNjA2XSByZWd1bGF0
b3I6IHBjYTk0NTAtcmVndWxhdG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAg
ICAgICAgY29tbWl0OiBlZDU2ZmE2ZTgwNGNiMTNiYmUyOWU5MjE0NzkyMzA4ODE3ZjZlNTUzCls1
NTMvNjA2XSByZWd1bGF0b3I6IHBmdXplMTAwLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAu
cHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzU1NC82MDZdIHJlZ3VsYXRv
cjogcHY4ODA4MC1yZWd1bGF0b3I6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAg
ICAgICAobm8gY29tbWl0IGluZm8pCls1NTUvNjA2XSByZWd1bGF0b3I6IHJwaS1wYW5lbC1hdHRp
bnktcmVndWxhdG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29t
bWl0OiBkODVkMDJkMTdhNjA4YjU1OGQ0NDUxMGU5ODI0NjY4YzVkNGZlNWQ4Cls1NTYvNjA2XSBy
ZWd1bGF0b3I6IHRwczUxNjMyLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3
KCkKICAgICAgICAgIGNvbW1pdDogZDQ4ODVmMzA2MzA0ZmYyOWVlYzA2YjlhZDVmNTI2YTEwOTll
MDQxOApbNTU3LzYwNl0gcmVndWxhdG9yOiB0cHM2MjM2MC1yZWd1bGF0b3I6IENvbnZlcnQgdG8g
aTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDE4ODA0MTYwMjc3ZWMyYWI5OTIz
NzMzODVmODZjNmFmMjMyMmIyOGIKWzU1OC82MDZdIHJlZ3VsYXRvcjogdHBzNjI4NngtcmVndWxh
dG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiBlMzQ3
ODIzMTYyODFjNzhjNTkxMWY4NmQ0Njk5ZDRmMzVhNjA3YzlkCls1NTkvNjA2XSByZWd1bGF0b3I6
IHRwczY1MDIzLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAg
ICAgIGNvbW1pdDogM2I1YjA3ZGRlOTk4ZjZhZGU3NDMzYThkYjAxOWNmODE2YzdlMzVhZgoKQWxs
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
