Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266DAF428F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 06:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je+ywEp2IYVFz/crQUklsfWzcH4XtvuaogrYK8IyTUY=; b=ZuK1trqnUfRjT9
	Jahe6eY+XaWHgBnmmoqwb7zzp/5MC6nFAQMV9kKzHEmiBUDkMPtSTkStZXCmaypZVYvl1mYlBhJZo
	CvypIM33l+JxfwJFT73ye3wW6dVvbgL2E2IRI2LNnkmkdFHoL02jrLaImIL/UkAmxUDllexhl2/Jh
	K3K9OnyS7raPiiKxoowpsNw/+185C99fD0+KYjN5vCfwxf+uhfLr5KV/r/fBfoiIdFdiXu8LQQalT
	s2/huBzbWXNAF3HWaaOGcLjvZkXknyo+merp6TbA3M8aIZzVxByI8qe6jNubCsKWdnk4MLKo0rfzY
	PGeJUJizmrWdSPqR5JYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDFx7-0000000223r-098K;
	Thu, 16 Apr 2026 06:11:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDFwd-0000000222c-3DPg
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 06:11:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b458ca2296so29111055ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2026 23:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776319878; cv=none;
        d=google.com; s=arc-20240605;
        b=HUJvD4Q5+2qLb/28WSj7N1TTdkNzrjV/kWxELnq4qqrzJAMNG8QpsG5rLfRT3xtxFm
         I7HHd8oCEFGtwA0pVIblwm3jqif6y3AFTy7mVJUkFa/2gQTYkt37YgBCCqsM8jHbKU4M
         YkrUUtudaSI/Dg3Yy65tTBzoOBr1spX+AkfNXe/IzU1cQ8VIHlbwq3b/lOal9RyK0xqB
         IUpUWymZ5WNhBqHpDCkNGRxDGViL0HSNLJv5jmti4+5c5ZNmDbSmYsZWcxlo5IuCe8h5
         GuHN9n7RsgI/346WOvMFtJLJa6Abu12lmzi7SJ8kUKOdXsCVnodVhMTXft3aS5hdyVB2
         Jx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RnmNE6f2Oa5hoJyTy8/swdaTXU/uiMLTrm+DyC/Ycfw=;
        fh=7iQMCmvKL/8K4u7T1i0LslUO8mAK2+q2wyHVTpJLfQE=;
        b=QuknwzvhcZXfySnfkEA2sfUSwx0xh50j56uXGGX3loeXysZDEVuvg1O3iC1ClZtUcM
         G+nsQ4bRPcTTz1AqZugaRXjeYAEd/EMU2QhWMijuWGBVl5VBq31wl5jNdZIOen012IPt
         gdyvP1/5avdLaMQC10+Hhjxz2brxel4tkYncV9KA7gHBriiCdenP3ssrxphCmd2pIwp7
         t5tc43f9YxcsODUTdFHz9DwfQN3vpCO/coMpsvHvdouYBGv2WC38y7w0vtUUu96zKPgd
         2h8b1DUzoxirDH00SlzwHTrczD0ptqfSgyPyR/dTGqC/DH/uE4c3pTGA4pV9GX5fj7cy
         V4Hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776319878; x=1776924678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnmNE6f2Oa5hoJyTy8/swdaTXU/uiMLTrm+DyC/Ycfw=;
        b=ka24iITSEmDnGBtDYnSAwEtU13Fs2gmmYblMh0Or95FAWAQmNQiBNvt4BD7EasKBMJ
         Z8/1UY57z6ThYI298kqEv0PzoirTGTpY/B+29iZQEiPxo9zdagcHyOP+VfNSozZoU5AM
         RQhDSQNLrykt9Rwg9NjO/Zk9gFViK5wdHcLxzb5EDAYszfOSX/RSZLTVc+dAhEvlEHGY
         i08jm5Kt/4yItbJlrDh7Q1Qf0UCeTeQDdFCQUvuzTx+yElgDYdUVy65UwN2bNBD3AnrO
         bHa14bPp+k7gu0+wiwDBiUGGiMdyGeAq51pPoUPKTKCnbCE673FTSKPfREFB0MP3CwF8
         LOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776319878; x=1776924678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnmNE6f2Oa5hoJyTy8/swdaTXU/uiMLTrm+DyC/Ycfw=;
        b=X7RZtSk9bIey70RjxFQfslrxYAbxupM2o+9524NlSD4CF026MVOysk3qv78LeeLEOt
         33tFFJ1CCAvUdzrm1ni8N/FTM3jdTvsC0jeaqYKpMpa0+8bv37FjrKGLgH9FqmYxtny7
         PcWUuMrapNqnQllf/ww40dCANQdDaHlLJPz6AtzX8A7WAE3cW2v+QcHeJxQVLZJM6Ruo
         2sdo1GiVs4xpkuWmOyQ+5FGjiMdTQ5HDmJOs3eJzbjSZMGkcbZwgQkQWJyPN/4QLnVL3
         LAgu+if5flcu3w+GUe5pAYF63Bje7CdnVwHHw5oXihZYX0hdczHQBWjtR/8C80JlvRZ4
         d4aA==
X-Forwarded-Encrypted: i=1; AFNElJ+JSSU7bbGEek4pQ4f2FTBWQ9nf3CUHBDs7BO914w/dRhYF4hVwGq0v1p9dkGq9CRS8hDyN31Ub4lU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmVrsyTDanV8Dfqra8UQRoofY44YZByc+D1tD85sAeH5Z5MmS5
	eK0Dgv2hBKLcKC5FNZMP5fw9fexXzO19C5oyHzhkK8oXJwKMnOCfum5uHWZ0foCsjDuPcEUvxOB
	1lginFsfD641G9TH0zzyplG9TIBR0kl0=
X-Gm-Gg: AeBDietUvZiJyJi04Uw9/34qIpyBFeI/Dyx4ZBOS1BgnDYXm8kgk0hhD5nW4sgXYQbg
	X9mWLnEeNiuq2E/JFAnu9KqH23NGOxj1GDrT81kAIT6hPyd9t94Wr4mFNUeAuJ7TH/2mk0ZwUYr
	HkB4PjqXI6SL8j7gJ6SDaja0q3dwEctZEGtugTiLEuwWZ3400tUvcM8+2QSEnb0Y6uO+8l5SzR8
	XSYc4pngx3DYFqjNQF5xCQFGSeNPjkU7uHReULfXxW37SRIKWtiDxmcEqa4MniaGWwgaZqSbiec
	PwSu2MTXHycu6U1myN+rGpJHOUko
X-Received: by 2002:a17:902:ea0a:b0:2b4:5d0c:7a26 with SMTP id
 d9443c01a7336-2b45d0c7e71mr160988895ad.30.1776319877975; Wed, 15 Apr 2026
 23:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260410091039.389911-1-linchengming884@gmail.com> <DHTODRW66PEH.3O3564LPS4D6D@kernel.org>
In-Reply-To: <DHTODRW66PEH.3O3564LPS4D6D@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 16 Apr 2026 14:10:26 +0800
X-Gm-Features: AQROBzCfRXhi32v5my4Yycq7lxNfGwfX9f1cI_8XIkf4HxV_J80sP11ViQanMdA
Message-ID: <CAAyq3SbUS2JcO5o3uamMpZD1Btf9N8GzamzvSfnQAY9U=rsqAw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Document support for additional
 flash aliases
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_231119_864722_69ABD9A3 
X-CRM114-Status: GOOD (  26.96  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNuW5
tDTmnIgxNeaXpemAseS4iSDkuIvljYg3OjAx5a+r6YGT77yaCj4KPiBIaSBDaGVuZywKPgo+IE9u
IEZyaSBBcHIgMTAsIDIwMjYgYXQgMTE6MTAgQU0gQ0VTVCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6
Cj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4K
PiA+IFNldmVyYWwgTWFjcm9uaXggU1BJIE5PUiBmbGFzaCBkZXZpY2VzIHNoYXJlIHRoZSBzYW1l
IElELgo+ID4gRm9yIGluc3RhbmNlLCB0aGUgTVgyNUw1MTI0NUcgYW5kIE1YMjVMNTEyNzNHIHNo
YXJlIHRoZSBzYW1lIElECj4gPiAoMHhjMjIwMWEpIHdpdGggdGhlIGN1cnJlbnRseSBsaXN0ZWQg
TVg2Nkw1MTIzNUYuCj4gPgo+ID4gQWRkIHRoZXNlIGVxdWl2YWxlbnQgcGFydCBudW1iZXJzIHRv
IHRoZSBjb21tZW50cyBhYm92ZSB0aGVpcgo+ID4gY29ycmVzcG9uZGluZyBmbGFzaF9pbmZvIGVu
dHJpZXMuCj4gPgo+ID4gV2hpbGUgdGhpcyBjaGFuZ2UgZG9lcyBub3QgYWZmZWN0IHRoZSBmdW5j
dGlvbmFsIGRyaXZlciBsb2dpYywgaXQKPiA+IHNpZ25pZmljYW50bHkgaW1wcm92ZXMgdGhlIHNl
YXJjaGFiaWxpdHkgb2YgdGhlIGtlcm5lbCBzb3VyY2UgdHJlZS4KPiA+IFRoaXMgaGVscHMgdXNl
cnMgZWFzaWx5IHZlcmlmeSB0aGF0IHRoZWlyIHNwZWNpZmljIHBoeXNpY2FsIHBhcnQgaXMKPiA+
IGZ1bGx5IHN1cHBvcnRlZCwgcHJldmVudGluZyBjb25mdXNpb24gYW5kIGRldGVycmluZyByZWR1
bmRhbnQgcGF0Y2gKPiA+IHN1Ym1pc3Npb25zIHRoYXQgYXR0ZW1wdCB0byBhZGQgZHVwbGljYXRl
IGVudHJpZXMgZm9yIHRoZXNlIGFsaWFzIHBhcnRzLgo+Cj4gSG9uZXN0bHksIHRoaXMgc291bmRz
IGEgYml0IGh5cGVyYm9saWMuIE1hY3Jvbml4IGlzIG5vdG9yaW91c2x5IGJhZAo+IHdpdGggcmV1
c2luZyBmbGFzaCBpZHMgd2hlcmUgeW91IGFjdHVhbGx5IGhhdmUgdG8gYmUgYWJsZSB0byB0ZWxs
Cj4gdGhlbSBhcGFydCBmcm9tIGVhY2ggb3RoZXIgaW4gc29mdHdhcmUuCj4KPiBTbywgaWYgeW91
IHJlYWxseSBoYXZlIHRvIHJldXNlIHlvdXIgZmxhc2ggaWRzLCBob3cgYWJvdXQgaGF2aW5nIGFu
Cj4gdW5pcXVlIGlkIGluIHRoZSBTRkRQIHRhYmxlcywgbGlrZSBpbiBhIG1hbnVmYWN0dXJlciBz
cGVjaWZpYyB0YWJsZT8KPiBUaGF0IHdvdWxkIHJlYWxseSBoZWxwIHVzLiBDb3VsZCB5b3UgcGxl
YXNlIGRpc2N1c3MgdGhhdCB3aXRoIHlvdXIKPiBwcm9kdWN0IG1hbmFnZW1lbnQ/Cj4KPiBBbnl3
YXksCj4KPiBSZXZpZXdlZC1ieTogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+CgpG
YWlyIHBvaW50LiBJIGFncmVlIHRoYXQgc2ltcGx5IGFkZGluZyBjb21tZW50cyBpbiB0aGUgY29k
ZSBpcyBqdXN0IGEKZG9jdW1lbnRhdGlvbiBpbXByb3ZlbWVudCBhbmQgZG9lc24ndCBzb2x2ZSB0
aGUgYWN0dWFsIHNvZnR3YXJlIGJ1cmRlbgpjYXVzZWQgYnkgc2hhcmVkIEpFREVDIElEcy4KCllv
dXIgc3VnZ2VzdGlvbiB0byBlbWJlZCBhIHVuaXF1ZSBJRCBpbiB0aGUgbWFudWZhY3R1cmVyLXNw
ZWNpZmljIFNGRFAKdGFibGVzIHRvIHByb2dyYW1tYXRpY2FsbHkgZGlzdGluZ3Vpc2ggdGhlc2Ug
ZGlmZmVyZW50IHBhcnQgbnVtYmVycyBpcwphIG11Y2ggYmV0dGVyIHNvbHV0aW9uLiBJIHdpbGwg
ZGVmaW5pdGVseSB0YWtlIHRoaXMgc3BlY2lmaWMgcmVxdWVzdCBiYWNrCnRvIG91ciBwcm9kdWN0
IG1hbmFnZW1lbnQgdG8gc2VlIGhvdyB3ZSBjYW4gaW1wbGVtZW50IHRoaXMgaW4gZnV0dXJlCnBy
b2R1Y3QgcGxhbm5pbmcuCgpUaGFua3MgZm9yIHRoZSBSLWIgYW5kIHRoZSBmZWVkYmFjay4KCj4K
PiBUaGFua3MsCj4gLW1pY2hhZWwKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW5nIE1pbmcg
TGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9z
cGktbm9yL21hY3Jvbml4LmMgfCA2ICsrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4g
aW5kZXggZTk3ZjVjYmQ5Li5jNTU3NTI1YjAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL21hY3Jvbml4LmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXgu
Ywo+ID4gQEAgLTEzOCw3ICsxMzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8g
bWFjcm9uaXhfbm9yX3BhcnRzW10gPSB7Cj4gPiAgICAgICAgICAgICAgIC5pZCA9IFNOT1JfSUQo
MHhjMiwgMHgyMCwgMHgxOSksCj4gPiAgICAgICAgICAgICAgIC5maXh1cHMgPSAmbXgyNWwyNTYz
NV9maXh1cHMKPiA+ICAgICAgIH0sIHsKPiA+IC0gICAgICAgICAgICAgLyogTVg2Nkw1MTIzNUYg
Ki8KPiA+ICsgICAgICAgICAgICAgLyogTVgyNUw1MTI0NUcsIE1YMjVMNTEyNzNHLCBNWDY2TDUx
MjM1RiAqLwo+ID4gICAgICAgICAgICAgICAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4MjAsIDB4MWEp
LAo+ID4gICAgICAgICAgICAgICAuZml4dXBfZmxhZ3MgPSBTUElfTk9SXzRCX09QQ09ERVMsCj4g
PiAgICAgICAgICAgICAgIC5maXh1cHMgPSAmbWFjcm9uaXhfcXBwNGJfZml4dXBzLAo+ID4gQEAg
LTE4NiwxMSArMTg2LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBtYWNyb25p
eF9ub3JfcGFydHNbXSA9IHsKPiA+ICAgICAgICAgICAgICAgLnNpemUgPSBTWl8xNk0sCj4gPiAg
ICAgICAgICAgICAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFE
IHwgU1BJX05PUl9RVUFEX1JFQUQsCj4gPiAgICAgICB9LCB7Cj4gPiAtICAgICAgICAgICAgIC8q
IE1YMjVVNTEyNDVHICovCj4gPiArICAgICAgICAgICAgIC8qIE1YMjVVNTEyNDVHLCBNWDI1VTUx
MjkzRyAqLwo+ID4gICAgICAgICAgICAgICAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4MjUsIDB4M2Ep
LAo+ID4gICAgICAgICAgICAgICAuZml4dXBzID0gJm1hY3Jvbml4X3FwcDRiX2ZpeHVwcywKPiA+
ICAgICAgIH0sIHsKPiA+IC0gICAgICAgICAgICAgLyogTVg2NlUxRzQ1RyAqLwo+ID4gKyAgICAg
ICAgICAgICAvKiBNWDY2VTFHNDVHLCBNWDY2VTFHOTNHICovCj4gPiAgICAgICAgICAgICAgIC5p
ZCA9IFNOT1JfSUQoMHhjMiwgMHgyNSwgMHgzYiksCj4gPiAgICAgICAgICAgICAgIC5maXh1cHMg
PSAmbWFjcm9uaXhfcXBwNGJfZml4dXBzLAo+ID4gICAgICAgfSwgewo+CgpUaGFua3MsCkNoZW5n
IE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
