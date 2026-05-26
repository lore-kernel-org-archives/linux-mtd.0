Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FAFCD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cgRkmrDZI4tg86nkX8QMBLqc8N8Nc/QDnR0gdje1Ps=; b=2XrDV7mOBYTmcD
	q4jjjo5c6C/3PGc6SnxFAa+oteEAwE7Bwk7U0CMOpsIBqAeXqZ3FtKxueeeXJ0V2Oc95Wc5Nw73j5
	KobR1B7JhnKNwaMMRjsziEdT/T2AduxaOuUORMWxI3vIKlHi06khrxXrP5QrH9ldgM43GiKcvQPrw
	GmF5eAycJguNNNpds9deSM9+zakW5HGz35uJlbe3S3mp8Mcpd94CWfecela1EoMxUR0D4gd++BTna
	wOC6NDnLUaqA9oPDF8cB4RAsPK17ze1ThbmhMj6nZbIBhlutmUTNbD2x+yYlitdRHD3MM7YcYQ0AQ
	sJBWcKB/gWobJGpZw5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrrW-0000000246B-0vsE;
	Tue, 26 May 2026 13:30:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrrR-0000000244v-3i4u
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 13:30:24 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a8e33556c0so12933468e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 26 May 2026 06:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779802219; cv=none;
        d=google.com; s=arc-20240605;
        b=MkwJQT+DpiCuapDIAeUNDIGQc7OdN4zobIWoZzRgLNM7Uz7Gy6vbKvWgTXpDhHZAZW
         z2iIf+DE9IrYwwPuTo8MA8bckmzePWaX6VlpY3BVqePBaetNXJruPs3M3SOZWooAQivf
         /PPe3t70/HOaE1AprvjxnR/QkyNy/C1UtG1BbBIrus8CYo0LfnRXfTs0kTA1c0Hvcwg8
         yIx6WJh/Ip6fXEF6CDlRNUAjafdi1WGJRS/TYzyD9h7Br4i7ITa7v6R1EeQeAE4PjblR
         Uc7MV3HXGoyY6PmVTKq6IfKScs1awQI1e9dCaMd9p16lz8iDSh0UUyMCCNz8eBKczVNX
         8YGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8RS7iu0qfZRst+9W5HXp2Db0DRixtSicG4YHA1HKhU=;
        fh=fiV09c3z3mwlKbKE9lqva873AaxajHiMKnFjB+v7wR4=;
        b=Z6IsUxABAaZmBnChOq24JdkaLAf7+Ikb2k5nGQDDA59wdOq3kLfVAx9EbBcRSF4uQb
         5JMPsJcWqkdAGMIz+ndWuIFDNy27guAykMk6F2BZ83Ec1sDIZWBU0JfF+dM6pwcDzwXK
         dnPGkf770m/53UTT9p3YlPw2cSYdPhQoAkQecOjPd/e6fp217Ia1OMOwiNdrhGpn3BDD
         sAcgF4ONGTEu86Wp+Ucf1quXMFF3qe9Y3abhXFhi2wmQbj615U21KOg39a06MiWoPhHx
         YXvOgQlAIOVFUZlMyANFe0pfVh/Mb7KajgBENE5ihdWklo+ivUy7NscAWRxiA8JEslQz
         p/yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779802219; x=1780407019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8RS7iu0qfZRst+9W5HXp2Db0DRixtSicG4YHA1HKhU=;
        b=e1TlxgL0HIFomtOcX9zSOA88NH74iqWGvDTKfzj/JYKB4K90WtohbHbqJXJQHtXXr6
         b5KUYfSJGS3aKQNhIMIDPl7TI/6dx0p8ubDf3uZm6e1g5PdwwaLoIfniZLUbqn96pWS+
         jbf1hNUgVzHeQlRjFNQ1+QSASZkefX7hhI6VtW9usmMNF1QX9LaSJrf7IoBX79b6z/rk
         OEBUV05WSmO6Adg8BsCGe+mXJTHcnWZuv/eDIhSqIdwQyijZNaEL3IYNOO2holUeaE2F
         eK7YSDVCGKZbHlTPRkFi/GCNMQ3xKGfdbVh2jdZnCP0cAMpoLeoYfhGaX0rc/GB4y5+d
         rXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802219; x=1780407019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8RS7iu0qfZRst+9W5HXp2Db0DRixtSicG4YHA1HKhU=;
        b=QCKHDc6st+BMXTYGRMZQbEdtU9iVclXxjJL/+0U29ET+PQ96P9PcR7t/q7nHZ3ZVjB
         GVVosZvMA15qzYbWq+AtN+BeX/zzafJpD3oEv9ETrMWn/FgqNz6Pf9yMAzWLu/ayqqVt
         yqtbCrQpDspoY4U3lS7kO2aG3Y6sHzgEKutbs/KTTLRRiSy90xm354wDhDvA4YsPq6gz
         2IJyLm94zf8yyub+lJfkkBPv90XAuvprkTLZ6eGzdM+Uskzd9w/g6dcX7QFihSGV3gD5
         FQU/8DTYd2gBG/NLRKbCsHBlE3A83g8V2/ngbUgXC5CiBZmGbNcfI78HNtjekzkZYrbN
         mA9w==
X-Forwarded-Encrypted: i=1; AFNElJ/iOmTDmQuIhkb1plnY4f1FXdiN4v58s4yNL6170MWpog/CbF5M34UGw6APd6iM0bkpFoh6a5DWtKI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGyOtP1qBqAvVXYtaY3uuhl3y5Uv9xPL/2gaIojHakU0trHRQM
	CsySGhux698WnXYCeycKiTXmw3wP8Do5SQZu2lqZbB+vxQzVdGL2ssBz3r0A3o8JpXNpitFZR58
	geYXMELfvw6+1N59H3uiKof1K8kCPwCwE/qyXmR2TFw==
X-Gm-Gg: Acq92OEIKhJXXm2MH0IGcRXqz2K3ixkaGnYkqgnBVIbcwRUYfEql1c31+k3TmdHlGGL
	p8pIqv2wbJdy951dJxGJ+TgbmpzCTaLUxz4yDSM3QbOqJH35jfwbnnP06gqErHszbua4zH0dtlF
	B965hDk2zcyBESyw3Js0nHfOSwNptB6Ztx23GMU8KBiid4q0EQe8jnkYI6/SyWiMir4p5bverya
	UG5NCETBmYYb8Jjac5sCk+ndZPL6LQwtdRGcDIK4S9vzWeuXp/UlzDfpDClkxXf1IomQFobqjtj
	SocZ8Mc5sYKfmRiUW9Q=
X-Received: by 2002:a05:6512:23c6:b0:5a3:e7f1:5946 with SMTP id
 2adb3069b0e04-5aa2ba6cda1mr4919448e87.9.1779802218820; Tue, 26 May 2026
 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
 <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org> <792c09f5ae754bf899693f110ef1dbe0@infineon.com>
 <DHXX61QRBDVA.2VIO2J63UKZC3@kernel.org>
In-Reply-To: <DHXX61QRBDVA.2VIO2J63UKZC3@kernel.org>
From: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
Date: Tue, 26 May 2026 21:30:07 +0800
X-Gm-Features: AVHnY4KIS0cZSR2UrYwYguTBkIEi_ybiamgc59s9g5ugXgMzHrUxtuOFdUrs9Xk
Message-ID: <CAB2WukQjU=ik5fom=5B=C_R-Tsxwcx+Y78ON5qZt6zAtV7sjhg@mail.gmail.com>
Subject: Re: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for GD25LQ255E
To: Michael Walle <mwalle@kernel.org>
Cc: Takahiro.Kuwano@infineon.com, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_063021_958099_7012E494 
X-CRM114-Status: GOOD (  25.23  )
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

SGksIHNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KCkkgY29uc3VsdGVkIEdEJ3MgZW5naW5lZXJz
LCBhbmQgdGhleSByZXBsaWVkIHRoYXQgamVkZWNfaWQ9MHhDODYwMTkKY29ycmVzcG9uZHMgdG8g
c2V2ZXJhbCBGbGFzaFJPTSBtb2RlbHM6IEdEMjVMUTI1NUUsIEdEMjVMQjI1NkYsCkdEMjVMUTI1
NkgsIEdEMjVMRTI1NkgsIGFuZCBHRDI1TFIyNTZGLiBJdCBoYXMgYmVlbiBjb25maXJtZWQgdGhh
dCB3ZQphcmUgY3VycmVudGx5IHVzaW5nIHRoZSBHRDI1TFEyNTZIWUlHUiBjaGlwLCBhbmQgdGhl
IGNvcnJlc3BvbmRpbmcKZGF0YXNoZWV0IGlzIGh0dHBzOi8vZG93bmxvYWQuZ2lnYWRldmljZS5j
b20vRGF0YXNoZWV0L0RTLTAxMDg1LUdEMjVMUTI1NkgtUmV2MS4zLnBkZi4KSXQgc2VlbXMgdGhh
dCB0aGUgbW9kZWwgSSBwcmV2aW91c2x5IHJlYWQgYXMgR0QyNUxRMjU1RSB1c2luZyBHb29nbGUn
cwp0b29sIHdhcyBpbmNvcnJlY3QuIEkgdXNlZCAuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwg
U1BJX05PUl80QklUX0JQCnwgU1BJX05PUl9IQVNfVEIgfCBUaGUgU1BJX05PUl9UQl9TUl9CSVQ2
IGNvbmZpZ3VyYXRpb24gdmVyaWZpY2F0aW9uCnBhc3NlZCBHb29nbGUncyBmbGFzaHJvbV90ZXN0
ZXIgcHJvZ3JhbSB0ZXN0LCBpbmRpY2F0aW5nIHRoYXQKcmVhZC93cml0ZSBhbmQgd3JpdGUgcHJv
dGVjdGlvbiBtZWV0IHRoZSByZXF1aXJlbWVudHMuIEZvciB0aGVzZQpyZWFzb25zLCBJIHdpbGwg
bW9kaWZ5IHRoZSB0aXRsZSBhbmQgcmVtb3ZlIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUKbmFtZTsg
dGhlcmVmb3JlLCBJIHdpbGwgc3VibWl0IGEgc2VwYXJhdGUgcGF0Y2ggdjQgdXBkYXRlLiBUaGFu
a3MuCgpPbiBNb24sIEFwciAyMCwgMjAyNiBhdCA2OjQ04oCvUE0gTWljaGFlbCBXYWxsZSA8bXdh
bGxlQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uIEFwciAyMCwgMjAyNiBhdCAxMTo1MSBB
TSBDRVNULCBUYWthaGlyby5LdXdhbm8gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPj4KPiA+PiBPbiBT
YXQgQXByIDE4LCAyMDI2IGF0IDEwOjQyIEFNIENFU1QsIFdlaW1pbiBXdSB3cm90ZToKPiA+PiA+
IEFkZCBzdXBwb3J0IGZvciB0aGUgR2lnYURldmljZSBHRDI1TFEyNTVFIChKRURFQyBJRCBjOCA2
MCAxOSksCj4gPj4gPiBhIDI1Nk1iaXQgKDMyTUIpIFNQSSBOT1IgZmxhc2ggY2hpcCB3aGljaCBz
dXBwb3J0cyBTRkRQLgo+ID4+ID4KPiA+PiA+IFRoZSBjaGlwIHN1cHBvcnRzIDRLIHNlY3RvciBl
cmFzZSwgZHVhbCByZWFkLCBhbmQgcXVhZCByZWFkIG1vZGVzLgo+ID4+ID4KPiA+PiA+IExpbms6
IGh0dHBzOi8vZG93bmxvYWQuZ2lnYWRldmljZS5jb20vRGF0YXNoZWV0L0RTLTAwNTYyLUdEMjVM
UTI1NUUtUmV2MS4yLnBkZgo+ID4+Cj4gPj4gUGxlYXNlIG1vdmUgdGhlIExpbms6IHRhZyBhYm92
ZSB5b3VyIFNvQiBsaW5lLgo+ID4+Cj4gPj4gLi4KPiA+Pgo+ID4+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9naWdh
ZGV2aWNlLmMKPiA+PiA+IGluZGV4IGVmMWVkZDBhZC4uMjJhNDMwNzk4IDEwMDY0NAo+ID4+ID4g
LS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMKPiA+PiA+ICsrKyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jCj4gPj4gPiBAQCAtODIsNiArODIsMTAgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGdpZ2FkZXZpY2Vfbm9yX3BhcnRzW10gPSB7Cj4g
Pj4gPiAgICAgICAgICAgIC5zaXplID0gU1pfMTZNLAo+ID4+ID4gICAgICAgICAgICAuZmxhZ3Mg
PSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIsCj4gPj4gPiAgICAgICAgICAgIC5u
b19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFE
X1JFQUQsCj4gPj4gPiArICB9LCB7Cj4gPj4gPiArICAgICAgICAgIC8qIGdkMjVsYjI1NiAqLwo+
ID4+ID4gKyAgICAgICAgICAuaWQgPSBTTk9SX0lEKDB4YzgsIDB4NjAsIDB4MTkpLAo+ID4+ID4g
KyAgICAgICAgICAuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl80QklUX0JQIHwg
U1BJX05PUl9IQVNfVEIgfCBTUElfTk9SX1RCX1NSX0JJVDYsCj4gPj4KPiA+PiBSZXZpZXdlZC1i
eTogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+Cj4gPj4KPiA+IFRoZSBkYXRhc2hl
ZXQgZXhwbGFpbnMgKGluIFRhYmxlIDUpIHRoYXQgQlAyLUJQMCBjb250cm9sIHRoZSBsZW5ndGgK
PiA+IG9mIHByb3RlY3Rpb24gYXJlYSAoYWxsLCAxLzIgLi4uIDEvNjQsIDApIGFuZCBCUDMgY29u
dHJvbHMgdXBwZXIvbG93ZXIuCj4gPiBJdCBsb29rcyAzIEJQIGFuZCAxIFRCIHNvIFNQSV9OT1Jf
SEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiBzaG91bGQgd29yay4KPiA+IEJQNCBwcm90ZWN0cyB0
b3Agb3IgYm90dG9tIDRLQiB0byAzMktCIGFuZCBjdXJyZW50IFNXUCBkb2Vzbid0IHN1cHBvcnQK
PiA+IHRoYXQgcHJvdGVjdGlvbiBtZWNoYW5pc20sIHJpZ2h0PyBTb3JyeSBpZiBJIG1pc3NlZCBz
b21ldGhpbmcuLi4KPgo+IEhhLCB5b3UgYXJlIHJpZ2h0LCB0aGFua3MgZm9yIHBvaW50aW5nIHRo
YXQgb3V0LiBJIGFjdHVhbGx5IGZlbGwgZm9yCj4gdGhlIHdyb25nIGNvbW1lbnQgYW5kIGxvb2tl
ZCBhdCB0aGF0IGRhdGFzaGVldCBpbiB0aGUgZW5kLi4gZm9yCj4gd2hpY2ggdGhlIGZsYWdzIGFy
ZSBjb3JyZWN0LiBBbmQgd2hhdCB3ZWlyZCBuYW1lIGlzIHRoYXQgZ2QyNWxxMjU1Li4KPiBBbnl3
YXkuIFRoZSBJRCBtYXRjaGVzIHRoZSBsaW5rZWQgZGF0YXNoZWV0LiBTbyBzb21ldGhpbmcgaXMg
d3JvbmcKPiBoZXJlLiBXZWltaW4sIHBsZWFzZSB0ZXN0IHRoZSBsb2NraW5nIHByb3Blcmx5IGFu
ZCB1cGRhdGUgdGhlCj4gY29tbWVudCBhcyBUdWRvciBhbHJlYWR5IHBvaW50ZWQgb3V0Lgo+Cj4g
VGhhbmtzLAo+IC1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
