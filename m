Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA59DC11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 10:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B31A761C9F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 10:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B31A761C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0LHBvV1pD9z8IjspUARZVFLCHx/vd6DcxHggKN5HEg=; b=0X3EHMW8H/AhQT
	MlA7v4twoD+/HuYv2oF0pitXeSPqyNAvUjDWoKgIAmls+kgMOCWqbrrkOXLDvBR5ePbsaLV/gQk2L
	2jLHRj0uz2P2FBq2ErXmvSgn8Jx/nDESK+NIJCvQ1jocZb8BsC4ckewHbRX19C9XEGpMPA5qrPKZu
	s4vEEBaHRBTllH/XtG4Hvq+wHD43IvIuVrNBcBLEGzpcWX5rtJh3BZLIKqHJMMpyuROT4mFxSLzWb
	L2NH+fwg3hhbJtQoVGW8heiSB9M0yp8kDsjsYwwHz//Uo+OxMDwIicj0h/yGOE2Vvg8Wbr264jIN/
	49b3uKbAGjef6d/WG7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyXtv-00DfPh-P6; Wed, 30 Jun 2021 10:57:03 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyXtt-00DfOV-7G
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 10:57:02 +0000
Received: by mail-qt1-x833.google.com with SMTP id v10so1133157qto.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jun 2021 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2hawPu4Sjd9mReHd/H+7YmDThmECPcHlbmIxKx31uKg=;
 b=CfmpZFFov7wL6dOlAotpdTpcU5R4RBpdYC9wRzIzKhc9hlTF3JkA6m9BbFmACEzkBm
 THPHlosnGEn4OX8xCxy5SUusf0OfiN/1PgLp0YB7bQKburhV66EsJOucWpec7pYVAz1i
 Z4ntL/xebzM1Mlg5Zs7o81yJb+vyCBUS0tvLkVFNUOrWSdrSeKkjCek8ppdOJltavhwg
 AGCF2dESLFLSYBWpA4/1TvZQijQKGkQpEz7VENdP1EtBut7zOCtH0ReTDieLKI5vSiU/
 sRQbrQoe9zHwaTnEAMupi7Davbqp0FQNL0NbguZ6GHOvHuGiEG+/XmCJGPVeNt7ai5OH
 UNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2hawPu4Sjd9mReHd/H+7YmDThmECPcHlbmIxKx31uKg=;
 b=smA05kPT+PX1o+XGRM88IhHbI5mv7waZebeAcfD3bBGNnXZp0o2cX6PolJ2uiB25Ts
 W4b9yN3NITOYmDB3XYnMjIC+44xAHyxrTmKK8MtHdtfqWQxkorMCMg2HQ9B1OCyOLRIR
 4dWz8IvAeOe4RQYDm3Xu3YGE65HAMecFpGWWL0GGE8IVoZ8nn8h0ufTaiTqMq5u9lS+C
 u4cb3mMTtLSaKiDlbmEUCYnbKaEoHrnEHCIUVcjS6XJ9sLm9olLiPeTP/ml+N9zeAoZm
 fWCFigJW6r0PGKwdlxXvOtihVJmu0paCEHL85sXRqNvIl9wKHeyquAS/Uv408m8mMu0i
 3/6Q==
X-Gm-Message-State: AOAM533omCutTef1t7KPXaJm/HM9U0uAtFDj8O1X3Do7GycbgPGALfIi
 qTM3jJ/gKxnPunOUbZ28Fj0hgK5h7KWP4MO7HTU=
X-Google-Smtp-Source: ABdhPJybFN9hIeT+pcE0MN/LCVoEQs2tdmbXgXkJ0Qv1vb509XEJ6UMAZXzK1jfpEk5QVtdBoda1XjE4MtATnY/RW/8=
X-Received: by 2002:ac8:5c14:: with SMTP id i20mr22884209qti.170.1625050617534; 
 Wed, 30 Jun 2021 03:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210623120125.1f02792e@xps13>
In-Reply-To: <20210623120125.1f02792e@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 30 Jun 2021 12:56:43 +0200
Message-ID: <CAFLxGvxpKwW6X8whe-FBGfPW6sSTF6N9FgU4-BXeWygLdTRJrg@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.14
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_035701_330844_049996F6 
X-CRM114-Status: GOOD (  18.61  )
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

T24gV2VkLCBKdW4gMjMsIDIwMjEgYXQgMTI6MDggUE0gTWlxdWVsIFJheW5hbAo8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBSaWNoYXJkLAo+Cj4gVGhpcyBpcyB0aGUg
TkFORCBQUiBmb3IgNS4xNC4KPgo+IFRoaXMgUFIgaW5jbHVkZXMgcGF0Y2hlcyBmcm9tIHRoZSBt
ZW1vcnkgYnVzIHRyZWUgYWZ0ZXIgbWVyZ2Ugb2YgYW4KPiBpbW11dGFibGUgYnJhbmNoIHByb3Zp
ZGVkIGJ5IEtyenlzenRvZiBLb3psb3dza2k7IEkgaG9wZSB0aGlzIGlzIHRoZQo+IHJpZ2h0IHdh
eSB0byBoYW5kbGUgc3VjaCBzaXR1YXRpb24uCj4KPiBUaGVyZSBpcyBhbHNvIGEga25vd24gY29u
ZmxpY3Qgd2l0aCB0aGUgZGV2aWNldHJlZSB0cmVlIHdoaWNoIGlzIHRyaXZpYWwKPiB0byByZXNv
bHZlOgo+Cj4gICAgICAgICA5YjM1OGFmN2M4MTggKCJkdC1iaW5kaW5nczogbXV4OiBDb252ZXJ0
IG11eCBjb250cm9sbGVyCj4gICAgICAgICBiaW5kaW5ncyB0byBzY2hlbWEiKSAtPiBVcGRhdGVz
IGFsbCB0aGUgZmlsZXMgcmVmZXJlbmNpbmcgdGhlIG11eC1jb250cm9sbGVyLnR4dAo+ICAgICAg
ICAgYmluZGluZyBhcyB0aGUgZmlsZSBuYW1lIGNoYW5nZWQgKHMvdHh0L3lhbWwvKS4KPgo+ICAg
ICAgICAgNjk0N2FkNjc0OTQ0ICgiZHQtYmluZGluZ3M6IG10ZDogQ29udmVydCB0aSwgYW02NTQt
aGJtYy50eHQgdG8KPiAgICAgICAgIFlBTUwgc2NoZW1hIikKPiAgICAgICAgIC0+IENvbnZlcnRz
IG9uZSBvZiB0aGVzZSBmaWxlcyB0byB5YW1sLCB0aGUgcmVmZXJlbmNlIHRvCj4gICAgICAgICBt
dXgtY29udHJvbGxlci57dHh0LHlhbWx9IGJlaW5nIGRyb3BwZWQgZHVyaW5nIHRoZSBjb252ZXJz
aW9uLgo+Cj4gSXQgaXMgdGhlbiBvbmx5IG5lZWRlZCB0byBqdXN0IHRha2UgdGhlIHRpLGFtNjU0
LWhibWMgeWFtbCBjb252ZXJzaW9uCj4gYXMgaXQgaXMuCj4KPiBUaGFua3MsCj4gTWlxdcOobAo+
Cj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDZlZmI5NDNiODYxNmVjNTNh
NWU0NDQxOTNkY2NmMWFmOWFkNjI3YjU6Cj4KPiAgIExpbnV4IDUuMTMtcmMxICgyMDIxLTA1LTA5
IDE0OjE3OjQ0IC0wNzAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6Cj4KPiAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9t
dGQvbGludXguZ2l0IHRhZ3MvbmFuZC9mb3ItNS4xNAo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIGMwNmRkNDlmZDU5YTBhYmQ2ZmEzZDlmYzVmNmViMTc3NmFmNGU1ZTQ6Cj4KPiAg
IG10ZDogcmF3bmFuZDogb21hcDogQWRkIGxhcmdlciBwYWdlIE5BTkQgY2hpcHMgc3VwcG9ydCAo
MjAyMS0wNi0xOCAwOTo0NToyMSArMDIwMCkKClB1bGxlZCwgdGhhbmtzIQoKLS0gClRoYW5rcywK
Ly9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
