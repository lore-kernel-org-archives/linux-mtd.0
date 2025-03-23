Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A063C28B30
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Mar 2025 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2E2VVB8XLLoZpvuM8nb9F3C/8wZOSH57yQ4mb8kIDI=; b=K6GroBVIlVpeUJ
	+0OCCPbC385cEwId0ZZ0a1HY7uDjvj5RK3b+0CUn1S98oFEit5rhlOGLD2NA0+jIQi62wX0Zndqh4
	SSz3AYrPePAWvUXo1gM0GKzr/3b5lof74zmY3HtYcDGZ/s6Ewe2dSAH3oUgl6wc+QXIp/NB1bCbfG
	9qWDsK4UF2f0a8Tb+kRg+Jd421DLdWweNqkrhboBtwXo75Jf8VZiRC5ZELdhZyDC2jQH1TqIACxbR
	Gy2G5J0BPJNaFdaaDOm8/w53SFfbQyZBdHrNpTuk6CGeKTc8vPQJMyp1My44H1YDKQvYvwpfopKIY
	Gncy5J4Pd5pn2AloA0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twN43-00000001OuZ-2kuo;
	Sun, 23 Mar 2025 15:16:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twN40-00000001Otv-2aXY
	for linux-mtd@lists.infradead.org;
	Sun, 23 Mar 2025 15:16:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224019ad9edso86857975ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Mar 2025 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742742995; x=1743347795; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8HAFSGGoHUlB/P//y8CRGPMxIiz2cZBE9oAiPUoftnU=;
        b=R6gU0NJMN30/0YSTcOF/XrnBwMv78aWKE7jsRNk5+ZffuTaMmyV/OuzeZRTTkx5i02
         7RJhHGunTRQeFu4s6rcD70/26Bl6trAvtR0iD/xCaqFMos5MoWh4+p5cjoNiKt7e0+GP
         ReHXcFlxzd8wX+YGksMOcIPHFuYgU7a3OrLWt0idCy0rwDBnbrKrP9ZXALStKTqkiCpt
         R6e/nGfMIKKdt1q+uwLnGXEexw9PWYLj3YLDnj0TGYLYnzfi0GlxEwwagqqdKmMKXctV
         SFeMmz302wtWBmIebIN0/fsspssewkmDAaowKk/9HVL2B3GLE3EqFWdMgSH3W7OzXdKf
         aU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742742995; x=1743347795;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HAFSGGoHUlB/P//y8CRGPMxIiz2cZBE9oAiPUoftnU=;
        b=Zw1Y2poZcWieoG6Z34akGRg2/Hp1g6j2rdbSyzUs0qtq9qvmmQsEizOxZg3uWR1cKv
         s3r9zvhgm2x/OknaZFPo5HuT2V0MCvwO/p3K8HY+NWtUZmSLJR3qqAJrG/GfGiKoXS+B
         lNvDCsX+4udp8o+iRubO6l4SY09Z3AYvHrotrUmvFAaNOKBuT7a9ST4cVKBhOvc85hwP
         SOdZNSTeX0c9fQnZk4RDqUApjJeVrt+5yqpq42vCTbs7ilsNVkwIBC/V9kGyZHUVqEDR
         RiEi8avZB4qD3iqhmCwnIQv0pXdw8LNG6aVOLPtMdJgHsseTCtESL6vVh8G540kuJVSY
         Z8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV3FSb5p50dXJHi9K4CfIFiWG5vZPUGpaEvh7fXz0itKGJYImk++Yr6AocKW8N3z/qdkpOkxSZ6IpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCmQ2sYbYXWziJnfbW1ePCQjY6EUvs/qh/7uGv2wLbpNtIaF52
	AyUT1wwKdmj5rwgNtLXDvdAiWpIVDoZpIG2+KnwKhl+yi9PprH6p
X-Gm-Gg: ASbGncsWNC663DIYbrpPJiKogiuE+ImcX41QvTtzvVOPjcnDqdvxU/26Hw3tQiztCNu
	eVFVFVrGeN8BPt9qyTI1dubzHYP1zVRI7A5MVVnrrR/93UjnvkRIPOgQ5ikE2xqrjs9+js6JRrs
	bUq9XEXk/1ejru5pJUpxI0GH8B80/VzGmy0FnRYm8Su5S2JidS//hqiaWqRkLKkz07rGGGfqSXr
	fq2g88lvV76q8w0jGkepmhA5jLVbde+Me/tZHwrNGhGD0xXcELVYzoiJH5AosoYBHEoW2WBiblD
	nr3yg0zhbGNg1rxQ7NlJ91f5/5JN5VOCnXNcaNIn3O56gX7jKrsDKNBaTp9dre65hss5hlkg
X-Google-Smtp-Source: AGHT+IFu7aSko21Sw2wxa8CSJ3BoLCLGU4XDLggoCqJDcaLIBubWzqHl2YbchxgGWLxoXzaA2oGt1A==
X-Received: by 2002:a17:902:db12:b0:216:3d72:1712 with SMTP id d9443c01a7336-22780e1a30emr184600615ad.48.1742742994925;
        Sun, 23 Mar 2025 08:16:34 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22781207f3csm52440875ad.247.2025.03.23.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 08:16:34 -0700 (PDT)
Date: Sun, 23 Mar 2025 23:16:24 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
References: <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_081636_661205_5A80A74B 
X-CRM114-Status: GOOD (  54.66  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMDM6NDE6NDlQTSArMDgwMCwgS3Vhbi1XZWkgQ2hpdSB3
cm90ZToKPiBPbiBUaHUsIE1hciAxMywgMjAyNSBhdCAxMjoyOToxM0FNICswODAwLCBLdWFuLVdl
aSBDaGl1IHdyb3RlOgo+ID4gT24gV2VkLCBNYXIgMTIsIDIwMjUgYXQgMTE6NTE6MTJBTSAtMDQw
MCwgWXVyeSBOb3JvdiB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXIgMTEsIDIwMjUgYXQgMDM6MjQ6
MTRQTSAtMDcwMCwgSC4gUGV0ZXIgQW52aW4gd3JvdGU6Cj4gPiA+ID4gT24gTWFyY2ggMTEsIDIw
MjUgMzowMTozMCBQTSBQRFQsIFl1cnkgTm9yb3YgPHl1cnkubm9yb3ZAZ21haWwuY29tPiB3cm90
ZToKPiA+ID4gPiA+T24gU3VuLCBNYXIgMDksIDIwMjUgYXQgMTE6NDg6MjZQTSArMDgwMCwgS3Vh
bi1XZWkgQ2hpdSB3cm90ZToKPiA+ID4gPiA+PiBPbiBGcmksIE1hciAwNywgMjAyNSBhdCAxMjow
NzowMlBNIC0wODAwLCBILiBQZXRlciBBbnZpbiB3cm90ZToKPiA+ID4gPiA+PiA+IE9uIE1hcmNo
IDcsIDIwMjUgMTE6NTM6MTAgQU0gUFNULCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51
eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4+ID4gPk9uIEZyaSwgMDcgTWFyIDIwMjUgMTE6
MzA6MzUgLTA4MDAKPiA+ID4gPiA+PiA+ID4iSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29t
PiB3cm90ZToKPiA+ID4gPiA+PiA+ID4KPiA+ID4gPiA+PiA+ID4+IE9uIE1hcmNoIDcsIDIwMjUg
MTA6NDk6NTYgQU0gUFNULCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PiB3cm90ZToKPiA+ID4gPiA+PiA+ID4+ID4+IChpbnQpdHJ1ZSBtb3N0IGRlZmluaXRlbHkgaXMg
Z3VhcmFudGVlZCB0byBiZSAxLiAgCj4gPiA+ID4gPj4gPiA+PiA+Cj4gPiA+ID4gPj4gPiA+PiA+
VGhhdCdzIG5vdCB0ZWNobmljYWxseSBjb3JyZWN0IGFueSBtb3JlLgo+ID4gPiA+ID4+ID4gPj4g
Pgo+ID4gPiA+ID4+ID4gPj4gPkdDQyBoYXMgaW50cm9kdWNlZCBoYXJkZW5lZCBib29scyB0aGF0
IGludGVudGlvbmFsbHkgaGF2ZSBiaXQgcGF0dGVybnMKPiA+ID4gPiA+PiA+ID4+ID5vdGhlciB0
aGFuIDAgYW5kIDEuCj4gPiA+ID4gPj4gPiA+PiA+Cj4gPiA+ID4gPj4gPiA+PiA+aHR0cHM6Ly9n
Y2MuZ251Lm9yZy9nY2MtMTQvY2hhbmdlcy5odG1sCj4gPiA+ID4gPj4gPiA+PiA+Cj4gPiA+ID4g
Pj4gPiA+PiA+fkFuZHJldyAgCj4gPiA+ID4gPj4gPiA+PiAKPiA+ID4gPiA+PiA+ID4+IEJpdCBw
YXR0ZXJucyBpbiBtZW1vcnkgbWF5YmUgKG5vdCB0aGF0IEkgY2FuIHNlZSB0aGUgTGludXgga2Vy
bmVsIHVzaW5nIHRoZW0pIGJ1dAo+ID4gPiA+ID4+ID4gPj4gZm9yIGNvbXBpbGVyLWdlbmVyYXRl
ZCBjb252ZXJzYXRpb25zIHRoYXQncyBzdGlsbCBhIGdpdmVuLCBvciB0aGUgbWFuYWdlciBpc24n
dCBDCj4gPiA+ID4gPj4gPiA+PiBvciBhbnl0aGluZyBldmVuIHJlbW90ZWx5IGxpa2UgaXQuCj4g
PiA+ID4gPj4gPiA+PiAKPiA+ID4gPiA+PiA+ID4KPiA+ID4gPiA+PiA+ID5UaGUgd2hvbGUgaWRl
YSBvZiAnYm9vbCcgaXMgcHJldHR5IG11Y2ggYnJva2VuIGJ5IGRlc2lnbi4KPiA+ID4gPiA+PiA+
ID5UaGUgdW5kZXJseWluZyBwcm9ibGVtIGlzIHRoYXQgdmFsdWVzIG90aGVyIHRoYW4gJ3RydWUn
IGFuZCAnZmFsc2UnIGNhbgo+ID4gPiA+ID4+ID4gPmFsd2F5cyBnZXQgaW50byAnYm9vbCcgdmFy
aWFibGVzLgo+ID4gPiA+ID4+ID4gPgo+ID4gPiA+ID4+ID4gPk9uY2UgdGhhdCBoYXMgaGFwcGVu
ZWQgaXQgaXMgYWxsIGZ1YmFyLgo+ID4gPiA+ID4+ID4gPgo+ID4gPiA+ID4+ID4gPlRyeWluZyB0
byBzYW5pdGlzZSBhIHZhbHVlIHdpdGggKHNheSk6Cj4gPiA+ID4gPj4gPiA+aW50IGYoYm9vbCB2
KQo+ID4gPiA+ID4+ID4gPnsKPiA+ID4gPiA+PiA+ID4JcmV0dXJuIChpbnQpdiAmIDE7Cj4gPiA+
ID4gPj4gPiA+fSAgICAKPiA+ID4gPiA+PiA+ID5qdXN0IGRvZXNuJ3Qgd29yayAoc2VlIGh0dHBz
Oi8vd3d3LmdvZGJvbHQub3JnL3ovTUVuZFAzcTlqKQo+ID4gPiA+ID4+ID4gPgo+ID4gPiA+ID4+
ID4gPkkgcmVhbGx5IGRvbid0IHNlZSBob3cgdXNpbmcgKHNheSkgMHhhYSBhbmQgMHg1NSBoZWxw
cy4KPiA+ID4gPiA+PiA+ID5XaGF0IGhhcHBlbnMgaWYgdGhlIHZhbHVlIGlzIHdyb25nPyBhIHRy
YXAgb3IgZXhjZXB0aW9uPywgZ29vZCBsdWNrIHJlY292ZXJpbmcKPiA+ID4gPiA+PiA+ID5mcm9t
IHRoYXQuCj4gPiA+ID4gPj4gPiA+Cj4gPiA+ID4gPj4gPiA+CURhdmlkCj4gPiA+ID4gPj4gPiAK
PiA+ID4gPiA+PiA+IERpZCB5b3UganVzdCBkaXNjb3ZlciBHSUdPPwo+ID4gPiA+ID4+IAo+ID4g
PiA+ID4+IFRoYW5rcyBmb3IgYWxsIHRoZSBzdWdnZXN0aW9ucy4KPiA+ID4gPiA+PiAKPiA+ID4g
PiA+PiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB0aGUgbmFtaW5nIG9yIHJldHVy
biB0eXBlLiBJJ20gc3RpbGwgYQo+ID4gPiA+ID4+IGJpdCBjb25mdXNlZCBhYm91dCB3aGV0aGVy
IEkgY2FuIGFzc3VtZSB0aGF0IGNhc3RpbmcgYm9vbCB0byBpbnQgYWx3YXlzCj4gPiA+ID4gPj4g
cmVzdWx0cyBpbiAwIG9yIDEuCj4gPiA+ID4gPj4gCj4gPiA+ID4gPj4gSWYgdGhhdCdzIHRoZSBj
YXNlLCBzaW5jZSBtb3N0IHBlb3BsZSBwcmVmZXIgYm9vbCBvdmVyIGludCBhcyB0aGUKPiA+ID4g
PiA+PiByZXR1cm4gdHlwZSBhbmQgc29tZSBhcmUgYWdhaW5zdCBpbnRyb2R1Y2luZyB1MSwgbXkg
Y3VycmVudCBwbGFuIGlzIHRvCj4gPiA+ID4gPj4gdXNlIHRoZSBmb2xsb3dpbmcgaW4gdGhlIG5l
eHQgdmVyc2lvbjoKPiA+ID4gPiA+PiAKPiA+ID4gPiA+PiBib29sIHBhcml0eV9vZGQodTY0IHZh
bCk7Cj4gPiA+ID4gPj4gCj4gPiA+ID4gPj4gVGhpcyBrZWVwcyB0aGUgYm9vbCByZXR1cm4gdHlw
ZSwgcmVuYW1lcyB0aGUgZnVuY3Rpb24gZm9yIGJldHRlcgo+ID4gPiA+ID4+IGNsYXJpdHksIGFu
ZCBhdm9pZHMgZXh0cmEgbWFpbnRlbmFuY2UgYnVyZGVuIGJ5IGhhdmluZyBqdXN0IG9uZQo+ID4g
PiA+ID4+IGZ1bmN0aW9uLgo+ID4gPiA+ID4+IAo+ID4gPiA+ID4+IElmIEkgY2FuJ3QgYXNzdW1l
IHRoYXQgY2FzdGluZyBib29sIHRvIGludCBhbHdheXMgcmVzdWx0cyBpbiAwIG9yIDEsCj4gPiA+
ID4gPj4gd291bGQgaXQgYmUgYWNjZXB0YWJsZSB0byBrZWVwIHRoZSByZXR1cm4gdHlwZSBhcyBp
bnQ/Cj4gPiA+ID4gPj4gCj4gPiA+ID4gPj4gV291bGQgdGhpcyB3b3JrIGZvciBldmVyeW9uZT8K
PiA+ID4gPiA+Cj4gPiA+ID4gPkFscmlnaHQsIGl0J3MgY2xlYXJseSBhIHNwbGl0IG9waW5pb24u
IFNvIHdoYXQgSSB3b3VsZCBkbyBteXNlbGYgaW4KPiA+ID4gPiA+c3VjaCBjYXNlIGlzIHRvIGxv
b2sgYXQgZXhpc3RpbmcgY29kZSBhbmQgc2VlIHdoYXQgcGVvcGxlIHdobyByZWFsbHkKPiA+ID4g
PiA+bmVlZCBwYXJpdHkgaW52ZW50IGluIHRoZWlyIGRyaXZlcnM6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCAgICAgIHBhcml0eV9v
ZGQKPiA+ID4gPiA+c3RhdGljIGlubGluZSBpbnQgcGFyaXR5OCh1OCB2YWwpICAgICAgIC0gICAg
ICAgICAgICAgICAtCj4gPiA+ID4gPnN0YXRpYyB1OCBjYWxjX3Bhcml0eSh1OCB2YWwpICAgICAg
ICAgICAtICAgICAgICAgICAgICAgLQo+ID4gPiA+ID5zdGF0aWMgaW50IG9kZF9wYXJpdHkodTgg
YykgICAgICAgICAgICAgLSAgICAgICAgICAgICAgICsKPiA+ID4gPiA+c3RhdGljIGludCBzYWE3
MTF4X29kZF9wYXJpdHkgICAgICAgICAgIC0gICAgICAgICAgICAgICArCj4gPiA+ID4gPnN0YXRp
YyBpbnQgbWF4MzEwMF9kb19wYXJpdHkgICAgICAgICAgICAtICAgICAgICAgICAgICAgLQo+ID4g
PiA+ID5zdGF0aWMgaW5saW5lIGludCBwYXJpdHkodW5zaWduZWQgeCkgICAgLSAgICAgICAgICAg
ICAgIC0KPiA+ID4gPiA+c3RhdGljIGludCBiaXRfcGFyaXR5KHUzMiBwa3QpICAgICAgICAgIC0g
ICAgICAgICAgICAgICAtCj4gPiA+ID4gPnN0YXRpYyBpbnQgb2FfdGM2X2dldF9wYXJpdHkodTMy
IHApICAgICAtICAgICAgICAgICAgICAgLQo+ID4gPiA+ID5zdGF0aWMgdTMyIHBhcml0eTMyKF9f
bGUzMiBkYXRhKSAgICAgICAgLSAgICAgICAgICAgICAgIC0KPiA+ID4gPiA+c3RhdGljIHUzMiBw
YXJpdHkodTMyIHNhbXBsZSkgICAgICAgICAgIC0gICAgICAgICAgICAgICAtCj4gPiA+ID4gPnN0
YXRpYyBpbnQgZ2V0X3Bhcml0eShpbnQgbnVtYmVyLCAgICAgICAtICAgICAgICAgICAgICAgLQo+
ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgaW50IHNpemUpCj4gPiA+ID4gPnN0YXRpYyBi
b29sIGkyY3JfY2hlY2tfcGFyaXR5MzIodTMyIHYsICArICAgICAgICAgICAgICAgLQo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICBib29sIHBhcml0eSkKPiA+ID4gPiA+c3RhdGljIGJv
b2wgaTJjcl9jaGVja19wYXJpdHk2NCh1NjQgdikgICsgICAgICAgICAgICAgICAtCj4gPiA+ID4g
PnN0YXRpYyBpbnQgc3dfcGFyaXR5KF9fdTY0IHQpICAgICAgICAgICAtICAgICAgICAgICAgICAg
LQo+ID4gPiA+ID5zdGF0aWMgYm9vbCBwYXJpdHkodTY0IHZhbHVlKSAgICAgICAgICAgKyAgICAg
ICAgICAgICAgIC0KPiA+ID4gPiA+Cj4gPiA+ID4gPk5vdyB5b3UgY2FuIHJlZmVyIHRvIHRoYXQg
dGFibGUgc2F5IHRoYXQgaW50IHBhcml0eSh1WFgpIGlzIHdoYXQKPiA+ID4gPiA+cGVvcGxlIHdh
bnQgdG8gc2VlIGluIHRoZWlyIGRyaXZlcnMuCj4gPiA+ID4gPgo+ID4gPiA+ID5XaGljaGV2ZXIg
aW50ZXJmYWNlIHlvdSBjaG9vc2UsIHBsZWFzZSBkaXNjdXNzIGl0J3MgcHJvcyBhbmQgY29ucy4K
PiA+ID4gPiA+V2hhdCBibG9hdC1vLW1ldGVyIHNheXMgZm9yIGVhY2ggb3B0aW9uPyBXaGF0J3Mg
bWFpbnRlbmFuY2UgYnVyZGVuPwo+ID4gPiA+ID5QZXJmIHRlc3Q/IExvb2sgYXQgZ2VuZXJhdGVk
IGNvZGU/Cj4gPiA+ID4gPgo+ID4gPiA+ID5JIHBlcnNvbmFsbHkgZm9yIGEgbWFjcm8gcmV0dXJu
aW5nIGJvb2xlYW4sIHNvbWV0aGluZyBsaWtlIEkKPiA+ID4gPiA+cHJvcG9zZWQgYXQgdGhlIHZl
cnkgYmVnaW5uaW5nLgo+ID4gPiA+ID4KPiA+ID4gPiA+VGhhbmtzLAo+ID4gPiA+ID5ZdXJ5Cj4g
PiA+ID4gCj4gPiA+ID4gQWxzbywgcGxlYXNlIGF0IGxlYXN0IHByb3ZpZGUgYSB3YXkgZm9yIGFu
IGFyY2ggdG8gb3B0IGluIHRvIHVzaW5nIHRoZSBidWlsdGlucywgd2hpY2ggc2VlbSB0byBwcm9k
dWNlIGFzIGdvb2QgcmVzdWx0cyBvciBiZXR0ZXIgYXQgbGVhc3Qgb24gc29tZSBhcmNoaXRlY3R1
cmVzIGxpa2UgeDg2IGFuZCBwcm9iYWJseSB3aXRoIENQVSBvcHRpb25zIHRoYXQgaW1wbHkgZmFz
dCBwb3BjbnQgaXMgYXZhaWxhYmxlLgo+ID4gPiAKPiA+ID4gWWVhaC4gQW5kIGJlY2F1c2UgbGlu
dXgvYml0b3BzLmggYWxyZWFkeSBpbmNsdWRlcyBhc20vYml0b3BzLmgKPiA+ID4gdGhlIHNpbXBs
ZXN0IHdheSB3b3VsZCBiZSB3cmFwcGluZyBnZW5lcmljIGltcGxlbWVudGF0aW9uIHdpdGgKPiA+
ID4gdGhlICNpZm5kZWYgcGFyaXR5LCBzaW1pbGFybHkgdG8gaG93IHdlIGhhbmRsZSBmaW5kX25l
eHRfYml0IGNhc2UuCj4gPiA+IAo+ID4gPiBTbzoKPiA+ID4gMS4gS3Vhbi1XZWksIHBsZWFzZSBk
b24ndCBpbnZlbnQgc29tZXRoaW5nIGxpa2UgQVJDSF9IQVNfUEFSSVRZOwo+ID4gPiAyLiBUaGlz
IG1heSwgYW5kIHByb2JhYmx5IHNob3VsZCwgYmUgYSBzZXBhcmF0ZSBmb2xsb3ctdXAgc2VyaWVz
LAo+ID4gPiAgICBsaWtlbHkgY3JlYXRlZCBieSBjb3JyZXNwb25kaW5nIGFyY2ggZXhwZXJ0cy4K
PiA+ID4gCj4gPiBJIHNhdyBkaXNjdXNzaW9ucyBpbiB0aGUgcHJldmlvdXMgZW1haWwgdGhyZWFk
IGFib3V0IGJvdGgKPiA+IF9fYnVpbHRpbl9wYXJpdHkgYW5kIHg4Ni1zcGVjaWZpYyBpbXBsZW1l
bnRhdGlvbnMuIEhvd2V2ZXIsIGZyb20gdGhlCj4gPiBkaXNjdXNzaW9uLCBJIGxlYXJuZWQgdGhh
dCBiZWZvcmUgY29uc2lkZXJpbmcgYW55IG9wdGltaXphdGlvbiwgd2UKPiA+IHNob3VsZCBmaXJz
dCBhc2s6IHdoaWNoIGRyaXZlciBvciBzdWJzeXN0ZW0gYWN0dWFsbHkgY2FyZXMgYWJvdXQgcGFy
aXR5Cj4gPiBlZmZpY2llbmN5PyBJZiBzb21lb25lIGRvZXMsIEkgY2FuIGhlbHAgd2l0aCBhIG1p
Y3JvLWJlbmNobWFyayB0bwo+ID4gcHJvdmlkZSBwZXJmb3JtYW5jZSBudW1iZXJzLCBidXQgSSBk
b24ndCBoYXZlIGVub3VnaCBkb21haW4ga25vd2xlZGdlCj4gPiB0byBpZGVudGlmeSBob3QgcGF0
aHMgd2hlcmUgcGFyaXR5IGVmZmljaWVuY3kgbWF0dGVycy4KPiA+IAo+IElNSE8sCj4gCj4gSWYg
cGFyaXR5IGlzIG5ldmVyIHVzZWQgaW4gYW55IGhvdCBwYXRoIGFuZCB3ZSBkb24ndCBjYXJlIGFi
b3V0IHBhcml0eToKPiAKPiBUaGVuIGJlbmNobWFya2luZyBpdHMgcGVyZm9ybWFuY2Ugc2VlbXMg
bWVhbmluZ2xlc3MuIEluIHRoaXMgY2FzZSwgYQo+IGZ1bmN0aW9uIHdpdGggYSB1NjQgYXJndW1l
bnQgd291bGQgc3VmZmljZSwgYW5kIHdlIG1pZ2h0IG5vdCBldmVuIG5lZWQKPiBhIG1hY3JvIHRv
IG9wdGltaXplIGZvciBkaWZmZXJlbnQgdHlwZXPigJRlc3BlY2lhbGx5IHNpbmNlIHRoZSBtYWNy
bwo+IHJlcXVpcmVzIHNwZWNpYWwgaGFja3MgdG8gYXZvaWQgY29tcGlsZXIgd2FybmluZ3MuIEFs
c28sIEkgZG9uJ3QgdGhpbmsKPiBjb2RlIHNpemUgbWF0dGVycyBoZXJlLiBJZiBpdCBkb2VzLCB3
ZSBzaG91bGQgZmlyc3QgY29uc2lkZXIgbWFraW5nCj4gcGFyaXR5IGEgbm9uLWlubGluZSBmdW5j
dGlvbiBpbiBhIC5jIGZpbGUgcmF0aGVyIHRoYW4gYW4gaW5saW5lCj4gZnVuY3Rpb24vbWFjcm8g
aW4gYSBoZWFkZXIuCj4gCj4gSWYgcGFyaXR5IGlzIHVzZWQgaW4gYSBob3QgcGF0aDoKPiAKPiBX
ZSBuZWVkIGRpZmZlcmVudCBoYW5kbGluZyBmb3IgZGlmZmVyZW50IHR5cGUgc2l6ZXMuIEFzIHBy
ZXZpb3VzbHkKPiBkaXNjdXNzZWQsIHg4NiBhc3NlbWJseSBtaWdodCB1c2UgZGlmZmVyZW50IGlu
c3RydWN0aW9ucyBmb3IgdTggYW5kCj4gdTE2LiBUaGlzIG1heSBzb3VuZCBzdHViYm9ybiwgYnV0
IEkgd2FudCB0byBhc2sgYWdhaW46IHNob3VsZCB3ZQo+IGNvbnNpZGVyIHVzaW5nIHBhcml0eTgv
MTYvMzIvNjQgaW50ZXJmYWNlcz8gTGlrZSBpbiB0aGUgaTNjIGRyaXZlcgo+IGV4YW1wbGUsIGlm
IHdlIG9ubHkgaGF2ZSBhIHNpbmdsZSBwYXJpdHkgbWFjcm8gdGhhdCBzZWxlY3RzIGFuCj4gaW1w
bGVtZW50YXRpb24gYmFzZWQgb24gdHlwZSBzaXplLCB1c2VycyBtdXN0IGV4cGxpY2l0bHkgY2Fz
dCB0eXBlcy4KPiBJZiBmdXR1cmUgdXNlcnMgYWxzbyBuZWVkIHBhcml0eSBpbiBhIGhvdCBwYXRo
LCB0aGV5IG1pZ2h0IG5vdCBiZSBhd2FyZQo+IG9mIHRoaXMgcmVxdWlyZW1lbnQgYW5kIGVuZCB1
cCBnZW5lcmF0aW5nIHN1Ym9wdGltYWwgY29kZS4gU2luY2Ugd2UKPiBjYXJlIGFib3V0IGVmZmlj
aWVuY3kgYW5kIGdlbmVyYXRlZCBjb2RlLCB3aHkgbm90IGZvbGxvdyBod2VpZ2h0KCkgYW5kCj4g
cHJvdmlkZSBzZXBhcmF0ZSBpbXBsZW1lbnRhdGlvbnMgZm9yIGRpZmZlcmVudCBzaXplcz8KPiAK
SXQgc2VlbXMgbm8gb25lIHdpbGwgcmVwbHkgdG8gbXkgdHdvIGVtYWlscy4gU28sIEkgaGF2ZSBz
dW1tYXJpemVkCmRpZmZlcmVudCBpbnRlcmZhY2UgYXBwcm9hY2hlcy4gSWYgdGhlcmUgaXMgYSBu
ZXh0IHZlcnNpb24sIEkgd2lsbCBzZW5kCml0IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cgY2xvc2Vz
LgoKSW50ZXJmYWNlIDE6IFNpbmdsZSBGdW5jdGlvbgpEZXNjcmlwdGlvbjogYm9vbCBwYXJpdHlf
b2RkKHU2NCkKUHJvczogTWluaW1hbCBtYWludGVuYW5jZSBjb3N0CkNvbnM6IERpZmZpY3VsdCB0
byBpbnRlZ3JhdGUgd2l0aCBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgaW1wbGVtZW50YXRpb25zCiAg
ICAgIGR1ZSB0byB0aGUgaW5hYmlsaXR5IHRvIG9wdGltaXplIGZvciBkaWZmZXJlbnQgYXJndW1l
bnQgc2l6ZXMKT3BpbmlvbnM6IEppcmkgc3VwcG9ydHMgdGhpcyBhcHByb2FjaAoKSW50ZXJmYWNl
IDI6IFNpbmdsZSBNYWNybwpEZXNjcmlwdGlvbjogcGFyaXR5X29kZCgpIG1hY3JvClByb3M6IEFs
bG93cyB0eXBlLXNwZWNpZmljIGltcGxlbWVudGF0aW9uCkNvbnM6IFJlcXVpcmVzIGhhY2tzIHRv
IGF2b2lkIHdhcm5pbmdzOyB1c2VycyBtYXkgbmVlZCBleHBsaWNpdAogICAgICBjYXN0aW5nOyBw
b3RlbnRpYWwgc3ViLW9wdGltYWwgY29kZSBvbiAzMi1iaXQgeDg2Ck9waW5pb25zOiBZdXJ5IHN1
cHBvcnRzIHRoaXMgYXBwcm9hY2gKCkludGVyZmFjZSAzOiBNdWx0aXBsZSBGdW5jdGlvbnMKRGVz
Y3JpcHRpb246IGJvb2wgcGFyaXR5X29kZDgvMTYvMzIvNjQoKQpQcm9zOiBObyBuZWVkIGZvciBl
eHBsaWNpdCBjYXN0aW5nOyBlYXN5IHRvIGludGVncmF0ZQogICAgICBhcmNoaXRlY3R1cmUtc3Bl
Y2lmaWMgb3B0aW1pemF0aW9uczsgZXhjZXB0IGZvciBwYXJpdHk4KCksIGFsbAogICAgICBmdW5j
dGlvbnMgYXJlIG9uZS1saW5lcnMgd2l0aCBubyBzaWduaWZpY2FudCBjb2RlIGR1cGxpY2F0aW9u
CkNvbnM6IE1vcmUgZnVuY3Rpb25zIG1heSBpbmNyZWFzZSBtYWludGVuYW5jZSBidXJkZW4KT3Bp
bmlvbnM6IE9ubHkgSSBzdXBwb3J0IHRoaXMgYXBwcm9hY2gKClJlZ2FyZHMsCkt1YW4tV2VpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
