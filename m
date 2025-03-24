Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465DEC36002
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Mar 2025 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6yf6x43IEAuzMrh5zGFMVndXkUX9naFqN5zurKiLR4=; b=sVp9VEcnKoKA21
	lEJEXpMHw7Hyu+Hk60fsX+QzfKs+hJzu+UfWnnJ/ErWMqeSyJ3eRVawd2Mf9ySSp+WUx8haRc5oUl
	oqT5I/nT6dPAuyq0RsBxqeSrCe7UNKAY58lwMeuwQjzyIXTa2Csp3bklm6Hre8s9vFwnKvi/iw19a
	+b8ssG+Z7lU0pn3ffqf9IZFrb/GJgFHxfWT962Xjjqb6vXFvQrHuJcw33tyq1AfSMgyC0j0cpbVCQ
	VTwhUh9S1q/jsI0l77BDuW5VkG7iEc0g+4FhncrWpfxrgFqx5JOXiTqon+EUgI81W49poxo3m5tVJ
	T5ybYZMU6BV2wSe2xBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twk7R-00000003ZGf-3mdE;
	Mon, 24 Mar 2025 15:53:41 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twk7O-00000003ZFz-38mS
	for linux-mtd@lists.infradead.org;
	Mon, 24 Mar 2025 15:53:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-223fd89d036so88602425ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Mar 2025 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742831618; x=1743436418; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lnK90d9tJkBMNCcbTrjmAdHYPBfyopuTDuiHWu7djtw=;
        b=ggrlrvujE3wH4iznzfFoUUhoVv6Z2d1TXROyC9Xz9at30GICwpiBCY7uEqxNC9v9s1
         6/RWjyjVKOipZKODK4M520Y+LyUszo/44577tYgYX+2ZJGZzjSNlE531WSU1fwQk0N6i
         bDc7ZMedNr6KwbeQSP5vjkAAqM5VAPVBkbWrLbG4JTbWiJ/tN24Z3AGvW2yfO266/zOd
         bSZA/YgYkYSvNDyaPP0XlmjiEk2TzKrM58sdlWcA8fuoDEeOb0RsPYeKmMqh9kRgJh1A
         uRUlS/pnNU8y613v+YyuN/UFFamjlUqckiH29MTs6n+ssCcJvDEip7PO6l2Tyq7V8UlO
         oefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831618; x=1743436418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnK90d9tJkBMNCcbTrjmAdHYPBfyopuTDuiHWu7djtw=;
        b=py+Qiw6M/dnmnTPg6X/7Roz7zEhjg2VWJwCtXwTZPc24YQYlargOCmvxfS3pc+hzY7
         n5iklOJxfTYptuCHZE9R5h4vM0sPQZ4Cp18CAIMIt9q9uV7IOfDJGcEABZlRbfiabFBL
         W8JMW+1jeBqDhhzuUPaqa8unamMrSXvJbvq3X6e8Ct1FzE9uz9fH7n8wk8Qh9OU5GcMz
         VjCC+Z1zOygt+MJbvJSs/69HJ4K9PiZZuuc3I3sTSQdOGsqIwDenCGj6v7EE8w32KuLp
         FcPnhxclY4J9itN8UHT/n6nfM30XoO8L6lQ99k78Lg/5mNqM4uDzj2qIFQiDDF3p/mVa
         XM9A==
X-Forwarded-Encrypted: i=1; AJvYcCW1fHiDNDQHSrrMPvv4DkYnlOdgXIQRvUCMw4tJU58M+XEKuzhw2onCopSoxnqPEdZDllBqmyES5w8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsSWNl7dPP+4YNWk+GmKwRD9ObBUB/f78uJ0NmXxmq7toqgdDB
	lMp8N+2gSkS0BT9v09n43mALAUURGKxIDTiY4Dr5LA2rwm9oCRDF
X-Gm-Gg: ASbGncsn1OZIsnKjRsbd4vl9nDkHpWvcGwZTTLJtmp/F/Swk+0u2lkhTWyUMEylPBFY
	ShJZ6fLEu0ma2s2PQH5pHUj5R+oaLAd132Lc4Y3Pj6mICALt/YU1DkzOdeJzDaE9EqSTegRYi//
	Bamz8ICWyDnzpx0orfxUFAiB4Vxtlg8pEjrezQVCKt9J+z8t+tIrmNlVRotIVj9lBXOX/K6Fy0A
	kfHPvAJRQnAuwzvlaF0EowbzxdJhdnL5SKnu3wMbNYN5UUiG/RrJEAdDRCYcYXaBqfyYDoCixWa
	RFPcpZIr5IhnL5KmVQgD5++eEAP9gxiwK7mocN9sjrXjNBMWgaZJDwwrjX3NNIcupSGqWhfr1ir
	ZyIk=
X-Google-Smtp-Source: AGHT+IF0G/P2idoIFxvn1IOSBSyy+/lpGPgy71fA+n6lIv43FiatMDA7/IWCIIb00BiyzdXZ3fQN0Q==
X-Received: by 2002:aa7:9317:0:b0:736:a682:deb8 with SMTP id d2e1a72fcca58-7390596685bmr25612682b3a.8.1742831617683;
        Mon, 24 Mar 2025 08:53:37 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600a5f6sm8119083b3a.82.2025.03.24.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:53:36 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:53:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
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
Message-ID: <Z-F_96AECHpsCXsL@thinkpad>
References: <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <05F7AC70-E8E7-4D14-A4EB-880D92A96534@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05F7AC70-E8E7-4D14-A4EB-880D92A96534@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_085338_795232_DF4B8896 
X-CRM114-Status: GOOD (  57.46  )
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

T24gU3VuLCBNYXIgMjMsIDIwMjUgYXQgMDM6NDA6MjBQTSAtMDcwMCwgSC4gUGV0ZXIgQW52aW4g
d3JvdGU6Cj4gT24gTWFyY2ggMjMsIDIwMjUgODoxNjoyNCBBTSBQRFQsIEt1YW4tV2VpIENoaXUg
PHZpc2l0b3Jja3dAZ21haWwuY29tPiB3cm90ZToKPiA+T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQg
MDM6NDE6NDlQTSArMDgwMCwgS3Vhbi1XZWkgQ2hpdSB3cm90ZToKPiA+PiBPbiBUaHUsIE1hciAx
MywgMjAyNSBhdCAxMjoyOToxM0FNICswODAwLCBLdWFuLVdlaSBDaGl1IHdyb3RlOgo+ID4+ID4g
T24gV2VkLCBNYXIgMTIsIDIwMjUgYXQgMTE6NTE6MTJBTSAtMDQwMCwgWXVyeSBOb3JvdiB3cm90
ZToKPiA+PiA+ID4gT24gVHVlLCBNYXIgMTEsIDIwMjUgYXQgMDM6MjQ6MTRQTSAtMDcwMCwgSC4g
UGV0ZXIgQW52aW4gd3JvdGU6Cj4gPj4gPiA+ID4gT24gTWFyY2ggMTEsIDIwMjUgMzowMTozMCBQ
TSBQRFQsIFl1cnkgTm9yb3YgPHl1cnkubm9yb3ZAZ21haWwuY29tPiB3cm90ZToKPiA+PiA+ID4g
PiA+T24gU3VuLCBNYXIgMDksIDIwMjUgYXQgMTE6NDg6MjZQTSArMDgwMCwgS3Vhbi1XZWkgQ2hp
dSB3cm90ZToKPiA+PiA+ID4gPiA+PiBPbiBGcmksIE1hciAwNywgMjAyNSBhdCAxMjowNzowMlBN
IC0wODAwLCBILiBQZXRlciBBbnZpbiB3cm90ZToKPiA+PiA+ID4gPiA+PiA+IE9uIE1hcmNoIDcs
IDIwMjUgMTE6NTM6MTAgQU0gUFNULCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51eEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4+ID4gPiA+ID4+ID4gPk9uIEZyaSwgMDcgTWFyIDIwMjUgMTE6
MzA6MzUgLTA4MDAKPiA+PiA+ID4gPiA+PiA+ID4iSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3Iu
Y29tPiB3cm90ZToKPiA+PiA+ID4gPiA+PiA+ID4KPiA+PiA+ID4gPiA+PiA+ID4+IE9uIE1hcmNo
IDcsIDIwMjUgMTA6NDk6NTYgQU0gUFNULCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPiB3cm90ZToKPiA+PiA+ID4gPiA+PiA+ID4+ID4+IChpbnQpdHJ1ZSBtb3N0IGRl
ZmluaXRlbHkgaXMgZ3VhcmFudGVlZCB0byBiZSAxLiAgCj4gPj4gPiA+ID4gPj4gPiA+PiA+Cj4g
Pj4gPiA+ID4gPj4gPiA+PiA+VGhhdCdzIG5vdCB0ZWNobmljYWxseSBjb3JyZWN0IGFueSBtb3Jl
Lgo+ID4+ID4gPiA+ID4+ID4gPj4gPgo+ID4+ID4gPiA+ID4+ID4gPj4gPkdDQyBoYXMgaW50cm9k
dWNlZCBoYXJkZW5lZCBib29scyB0aGF0IGludGVudGlvbmFsbHkgaGF2ZSBiaXQgcGF0dGVybnMK
PiA+PiA+ID4gPiA+PiA+ID4+ID5vdGhlciB0aGFuIDAgYW5kIDEuCj4gPj4gPiA+ID4gPj4gPiA+
PiA+Cj4gPj4gPiA+ID4gPj4gPiA+PiA+aHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTQvY2hhbmdl
cy5odG1sCj4gPj4gPiA+ID4gPj4gPiA+PiA+Cj4gPj4gPiA+ID4gPj4gPiA+PiA+fkFuZHJldyAg
Cj4gPj4gPiA+ID4gPj4gPiA+PiAKPiA+PiA+ID4gPiA+PiA+ID4+IEJpdCBwYXR0ZXJucyBpbiBt
ZW1vcnkgbWF5YmUgKG5vdCB0aGF0IEkgY2FuIHNlZSB0aGUgTGludXgga2VybmVsIHVzaW5nIHRo
ZW0pIGJ1dAo+ID4+ID4gPiA+ID4+ID4gPj4gZm9yIGNvbXBpbGVyLWdlbmVyYXRlZCBjb252ZXJz
YXRpb25zIHRoYXQncyBzdGlsbCBhIGdpdmVuLCBvciB0aGUgbWFuYWdlciBpc24ndCBDCj4gPj4g
PiA+ID4gPj4gPiA+PiBvciBhbnl0aGluZyBldmVuIHJlbW90ZWx5IGxpa2UgaXQuCj4gPj4gPiA+
ID4gPj4gPiA+PiAKPiA+PiA+ID4gPiA+PiA+ID4KPiA+PiA+ID4gPiA+PiA+ID5UaGUgd2hvbGUg
aWRlYSBvZiAnYm9vbCcgaXMgcHJldHR5IG11Y2ggYnJva2VuIGJ5IGRlc2lnbi4KPiA+PiA+ID4g
PiA+PiA+ID5UaGUgdW5kZXJseWluZyBwcm9ibGVtIGlzIHRoYXQgdmFsdWVzIG90aGVyIHRoYW4g
J3RydWUnIGFuZCAnZmFsc2UnIGNhbgo+ID4+ID4gPiA+ID4+ID4gPmFsd2F5cyBnZXQgaW50byAn
Ym9vbCcgdmFyaWFibGVzLgo+ID4+ID4gPiA+ID4+ID4gPgo+ID4+ID4gPiA+ID4+ID4gPk9uY2Ug
dGhhdCBoYXMgaGFwcGVuZWQgaXQgaXMgYWxsIGZ1YmFyLgo+ID4+ID4gPiA+ID4+ID4gPgo+ID4+
ID4gPiA+ID4+ID4gPlRyeWluZyB0byBzYW5pdGlzZSBhIHZhbHVlIHdpdGggKHNheSk6Cj4gPj4g
PiA+ID4gPj4gPiA+aW50IGYoYm9vbCB2KQo+ID4+ID4gPiA+ID4+ID4gPnsKPiA+PiA+ID4gPiA+
PiA+ID4JcmV0dXJuIChpbnQpdiAmIDE7Cj4gPj4gPiA+ID4gPj4gPiA+fSAgICAKPiA+PiA+ID4g
PiA+PiA+ID5qdXN0IGRvZXNuJ3Qgd29yayAoc2VlIGh0dHBzOi8vd3d3LmdvZGJvbHQub3JnL3ov
TUVuZFAzcTlqKQo+ID4+ID4gPiA+ID4+ID4gPgo+ID4+ID4gPiA+ID4+ID4gPkkgcmVhbGx5IGRv
bid0IHNlZSBob3cgdXNpbmcgKHNheSkgMHhhYSBhbmQgMHg1NSBoZWxwcy4KPiA+PiA+ID4gPiA+
PiA+ID5XaGF0IGhhcHBlbnMgaWYgdGhlIHZhbHVlIGlzIHdyb25nPyBhIHRyYXAgb3IgZXhjZXB0
aW9uPywgZ29vZCBsdWNrIHJlY292ZXJpbmcKPiA+PiA+ID4gPiA+PiA+ID5mcm9tIHRoYXQuCj4g
Pj4gPiA+ID4gPj4gPiA+Cj4gPj4gPiA+ID4gPj4gPiA+CURhdmlkCj4gPj4gPiA+ID4gPj4gPiAK
PiA+PiA+ID4gPiA+PiA+IERpZCB5b3UganVzdCBkaXNjb3ZlciBHSUdPPwo+ID4+ID4gPiA+ID4+
IAo+ID4+ID4gPiA+ID4+IFRoYW5rcyBmb3IgYWxsIHRoZSBzdWdnZXN0aW9ucy4KPiA+PiA+ID4g
PiA+PiAKPiA+PiA+ID4gPiA+PiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB0aGUg
bmFtaW5nIG9yIHJldHVybiB0eXBlLiBJJ20gc3RpbGwgYQo+ID4+ID4gPiA+ID4+IGJpdCBjb25m
dXNlZCBhYm91dCB3aGV0aGVyIEkgY2FuIGFzc3VtZSB0aGF0IGNhc3RpbmcgYm9vbCB0byBpbnQg
YWx3YXlzCj4gPj4gPiA+ID4gPj4gcmVzdWx0cyBpbiAwIG9yIDEuCj4gPj4gPiA+ID4gPj4gCj4g
Pj4gPiA+ID4gPj4gSWYgdGhhdCdzIHRoZSBjYXNlLCBzaW5jZSBtb3N0IHBlb3BsZSBwcmVmZXIg
Ym9vbCBvdmVyIGludCBhcyB0aGUKPiA+PiA+ID4gPiA+PiByZXR1cm4gdHlwZSBhbmQgc29tZSBh
cmUgYWdhaW5zdCBpbnRyb2R1Y2luZyB1MSwgbXkgY3VycmVudCBwbGFuIGlzIHRvCj4gPj4gPiA+
ID4gPj4gdXNlIHRoZSBmb2xsb3dpbmcgaW4gdGhlIG5leHQgdmVyc2lvbjoKPiA+PiA+ID4gPiA+
PiAKPiA+PiA+ID4gPiA+PiBib29sIHBhcml0eV9vZGQodTY0IHZhbCk7Cj4gPj4gPiA+ID4gPj4g
Cj4gPj4gPiA+ID4gPj4gVGhpcyBrZWVwcyB0aGUgYm9vbCByZXR1cm4gdHlwZSwgcmVuYW1lcyB0
aGUgZnVuY3Rpb24gZm9yIGJldHRlcgo+ID4+ID4gPiA+ID4+IGNsYXJpdHksIGFuZCBhdm9pZHMg
ZXh0cmEgbWFpbnRlbmFuY2UgYnVyZGVuIGJ5IGhhdmluZyBqdXN0IG9uZQo+ID4+ID4gPiA+ID4+
IGZ1bmN0aW9uLgo+ID4+ID4gPiA+ID4+IAo+ID4+ID4gPiA+ID4+IElmIEkgY2FuJ3QgYXNzdW1l
IHRoYXQgY2FzdGluZyBib29sIHRvIGludCBhbHdheXMgcmVzdWx0cyBpbiAwIG9yIDEsCj4gPj4g
PiA+ID4gPj4gd291bGQgaXQgYmUgYWNjZXB0YWJsZSB0byBrZWVwIHRoZSByZXR1cm4gdHlwZSBh
cyBpbnQ/Cj4gPj4gPiA+ID4gPj4gCj4gPj4gPiA+ID4gPj4gV291bGQgdGhpcyB3b3JrIGZvciBl
dmVyeW9uZT8KPiA+PiA+ID4gPiA+Cj4gPj4gPiA+ID4gPkFscmlnaHQsIGl0J3MgY2xlYXJseSBh
IHNwbGl0IG9waW5pb24uIFNvIHdoYXQgSSB3b3VsZCBkbyBteXNlbGYgaW4KPiA+PiA+ID4gPiA+
c3VjaCBjYXNlIGlzIHRvIGxvb2sgYXQgZXhpc3RpbmcgY29kZSBhbmQgc2VlIHdoYXQgcGVvcGxl
IHdobyByZWFsbHkKPiA+PiA+ID4gPiA+bmVlZCBwYXJpdHkgaW52ZW50IGluIHRoZWlyIGRyaXZl
cnM6Cj4gPj4gPiA+ID4gPgo+ID4+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYm9vbCAgICAgIHBhcml0eV9vZGQKPiA+PiA+ID4gPiA+c3RhdGljIGlubGluZSBp
bnQgcGFyaXR5OCh1OCB2YWwpICAgICAgIC0gICAgICAgICAgICAgICAtCj4gPj4gPiA+ID4gPnN0
YXRpYyB1OCBjYWxjX3Bhcml0eSh1OCB2YWwpICAgICAgICAgICAtICAgICAgICAgICAgICAgLQo+
ID4+ID4gPiA+ID5zdGF0aWMgaW50IG9kZF9wYXJpdHkodTggYykgICAgICAgICAgICAgLSAgICAg
ICAgICAgICAgICsKPiA+PiA+ID4gPiA+c3RhdGljIGludCBzYWE3MTF4X29kZF9wYXJpdHkgICAg
ICAgICAgIC0gICAgICAgICAgICAgICArCj4gPj4gPiA+ID4gPnN0YXRpYyBpbnQgbWF4MzEwMF9k
b19wYXJpdHkgICAgICAgICAgICAtICAgICAgICAgICAgICAgLQo+ID4+ID4gPiA+ID5zdGF0aWMg
aW5saW5lIGludCBwYXJpdHkodW5zaWduZWQgeCkgICAgLSAgICAgICAgICAgICAgIC0KPiA+PiA+
ID4gPiA+c3RhdGljIGludCBiaXRfcGFyaXR5KHUzMiBwa3QpICAgICAgICAgIC0gICAgICAgICAg
ICAgICAtCj4gPj4gPiA+ID4gPnN0YXRpYyBpbnQgb2FfdGM2X2dldF9wYXJpdHkodTMyIHApICAg
ICAtICAgICAgICAgICAgICAgLQo+ID4+ID4gPiA+ID5zdGF0aWMgdTMyIHBhcml0eTMyKF9fbGUz
MiBkYXRhKSAgICAgICAgLSAgICAgICAgICAgICAgIC0KPiA+PiA+ID4gPiA+c3RhdGljIHUzMiBw
YXJpdHkodTMyIHNhbXBsZSkgICAgICAgICAgIC0gICAgICAgICAgICAgICAtCj4gPj4gPiA+ID4g
PnN0YXRpYyBpbnQgZ2V0X3Bhcml0eShpbnQgbnVtYmVyLCAgICAgICAtICAgICAgICAgICAgICAg
LQo+ID4+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgaW50IHNpemUpCj4gPj4gPiA+ID4g
PnN0YXRpYyBib29sIGkyY3JfY2hlY2tfcGFyaXR5MzIodTMyIHYsICArICAgICAgICAgICAgICAg
LQo+ID4+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICBib29sIHBhcml0eSkKPiA+PiA+
ID4gPiA+c3RhdGljIGJvb2wgaTJjcl9jaGVja19wYXJpdHk2NCh1NjQgdikgICsgICAgICAgICAg
ICAgICAtCj4gPj4gPiA+ID4gPnN0YXRpYyBpbnQgc3dfcGFyaXR5KF9fdTY0IHQpICAgICAgICAg
ICAtICAgICAgICAgICAgICAgLQo+ID4+ID4gPiA+ID5zdGF0aWMgYm9vbCBwYXJpdHkodTY0IHZh
bHVlKSAgICAgICAgICAgKyAgICAgICAgICAgICAgIC0KPiA+PiA+ID4gPiA+Cj4gPj4gPiA+ID4g
Pk5vdyB5b3UgY2FuIHJlZmVyIHRvIHRoYXQgdGFibGUgc2F5IHRoYXQgaW50IHBhcml0eSh1WFgp
IGlzIHdoYXQKPiA+PiA+ID4gPiA+cGVvcGxlIHdhbnQgdG8gc2VlIGluIHRoZWlyIGRyaXZlcnMu
Cj4gPj4gPiA+ID4gPgo+ID4+ID4gPiA+ID5XaGljaGV2ZXIgaW50ZXJmYWNlIHlvdSBjaG9vc2Us
IHBsZWFzZSBkaXNjdXNzIGl0J3MgcHJvcyBhbmQgY29ucy4KPiA+PiA+ID4gPiA+V2hhdCBibG9h
dC1vLW1ldGVyIHNheXMgZm9yIGVhY2ggb3B0aW9uPyBXaGF0J3MgbWFpbnRlbmFuY2UgYnVyZGVu
Pwo+ID4+ID4gPiA+ID5QZXJmIHRlc3Q/IExvb2sgYXQgZ2VuZXJhdGVkIGNvZGU/Cj4gPj4gPiA+
ID4gPgo+ID4+ID4gPiA+ID5JIHBlcnNvbmFsbHkgZm9yIGEgbWFjcm8gcmV0dXJuaW5nIGJvb2xl
YW4sIHNvbWV0aGluZyBsaWtlIEkKPiA+PiA+ID4gPiA+cHJvcG9zZWQgYXQgdGhlIHZlcnkgYmVn
aW5uaW5nLgo+ID4+ID4gPiA+ID4KPiA+PiA+ID4gPiA+VGhhbmtzLAo+ID4+ID4gPiA+ID5ZdXJ5
Cj4gPj4gPiA+ID4gCj4gPj4gPiA+ID4gQWxzbywgcGxlYXNlIGF0IGxlYXN0IHByb3ZpZGUgYSB3
YXkgZm9yIGFuIGFyY2ggdG8gb3B0IGluIHRvIHVzaW5nIHRoZSBidWlsdGlucywgd2hpY2ggc2Vl
bSB0byBwcm9kdWNlIGFzIGdvb2QgcmVzdWx0cyBvciBiZXR0ZXIgYXQgbGVhc3Qgb24gc29tZSBh
cmNoaXRlY3R1cmVzIGxpa2UgeDg2IGFuZCBwcm9iYWJseSB3aXRoIENQVSBvcHRpb25zIHRoYXQg
aW1wbHkgZmFzdCBwb3BjbnQgaXMgYXZhaWxhYmxlLgo+ID4+ID4gPiAKPiA+PiA+ID4gWWVhaC4g
QW5kIGJlY2F1c2UgbGludXgvYml0b3BzLmggYWxyZWFkeSBpbmNsdWRlcyBhc20vYml0b3BzLmgK
PiA+PiA+ID4gdGhlIHNpbXBsZXN0IHdheSB3b3VsZCBiZSB3cmFwcGluZyBnZW5lcmljIGltcGxl
bWVudGF0aW9uIHdpdGgKPiA+PiA+ID4gdGhlICNpZm5kZWYgcGFyaXR5LCBzaW1pbGFybHkgdG8g
aG93IHdlIGhhbmRsZSBmaW5kX25leHRfYml0IGNhc2UuCj4gPj4gPiA+IAo+ID4+ID4gPiBTbzoK
PiA+PiA+ID4gMS4gS3Vhbi1XZWksIHBsZWFzZSBkb24ndCBpbnZlbnQgc29tZXRoaW5nIGxpa2Ug
QVJDSF9IQVNfUEFSSVRZOwo+ID4+ID4gPiAyLiBUaGlzIG1heSwgYW5kIHByb2JhYmx5IHNob3Vs
ZCwgYmUgYSBzZXBhcmF0ZSBmb2xsb3ctdXAgc2VyaWVzLAo+ID4+ID4gPiAgICBsaWtlbHkgY3Jl
YXRlZCBieSBjb3JyZXNwb25kaW5nIGFyY2ggZXhwZXJ0cy4KPiA+PiA+ID4gCj4gPj4gPiBJIHNh
dyBkaXNjdXNzaW9ucyBpbiB0aGUgcHJldmlvdXMgZW1haWwgdGhyZWFkIGFib3V0IGJvdGgKPiA+
PiA+IF9fYnVpbHRpbl9wYXJpdHkgYW5kIHg4Ni1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMuIEhv
d2V2ZXIsIGZyb20gdGhlCj4gPj4gPiBkaXNjdXNzaW9uLCBJIGxlYXJuZWQgdGhhdCBiZWZvcmUg
Y29uc2lkZXJpbmcgYW55IG9wdGltaXphdGlvbiwgd2UKPiA+PiA+IHNob3VsZCBmaXJzdCBhc2s6
IHdoaWNoIGRyaXZlciBvciBzdWJzeXN0ZW0gYWN0dWFsbHkgY2FyZXMgYWJvdXQgcGFyaXR5Cj4g
Pj4gPiBlZmZpY2llbmN5PyBJZiBzb21lb25lIGRvZXMsIEkgY2FuIGhlbHAgd2l0aCBhIG1pY3Jv
LWJlbmNobWFyayB0bwo+ID4+ID4gcHJvdmlkZSBwZXJmb3JtYW5jZSBudW1iZXJzLCBidXQgSSBk
b24ndCBoYXZlIGVub3VnaCBkb21haW4ga25vd2xlZGdlCj4gPj4gPiB0byBpZGVudGlmeSBob3Qg
cGF0aHMgd2hlcmUgcGFyaXR5IGVmZmljaWVuY3kgbWF0dGVycy4KPiA+PiA+IAo+ID4+IElNSE8s
Cj4gPj4gCj4gPj4gSWYgcGFyaXR5IGlzIG5ldmVyIHVzZWQgaW4gYW55IGhvdCBwYXRoIGFuZCB3
ZSBkb24ndCBjYXJlIGFib3V0IHBhcml0eToKPiA+PiAKPiA+PiBUaGVuIGJlbmNobWFya2luZyBp
dHMgcGVyZm9ybWFuY2Ugc2VlbXMgbWVhbmluZ2xlc3MuIEluIHRoaXMgY2FzZSwgYQo+ID4+IGZ1
bmN0aW9uIHdpdGggYSB1NjQgYXJndW1lbnQgd291bGQgc3VmZmljZSwgYW5kIHdlIG1pZ2h0IG5v
dCBldmVuIG5lZWQKPiA+PiBhIG1hY3JvIHRvIG9wdGltaXplIGZvciBkaWZmZXJlbnQgdHlwZXPi
gJRlc3BlY2lhbGx5IHNpbmNlIHRoZSBtYWNybwo+ID4+IHJlcXVpcmVzIHNwZWNpYWwgaGFja3Mg
dG8gYXZvaWQgY29tcGlsZXIgd2FybmluZ3MuIEFsc28sIEkgZG9uJ3QgdGhpbmsKPiA+PiBjb2Rl
IHNpemUgbWF0dGVycyBoZXJlLiBJZiBpdCBkb2VzLCB3ZSBzaG91bGQgZmlyc3QgY29uc2lkZXIg
bWFraW5nCj4gPj4gcGFyaXR5IGEgbm9uLWlubGluZSBmdW5jdGlvbiBpbiBhIC5jIGZpbGUgcmF0
aGVyIHRoYW4gYW4gaW5saW5lCj4gPj4gZnVuY3Rpb24vbWFjcm8gaW4gYSBoZWFkZXIuCj4gPj4g
Cj4gPj4gSWYgcGFyaXR5IGlzIHVzZWQgaW4gYSBob3QgcGF0aDoKPiA+PiAKPiA+PiBXZSBuZWVk
IGRpZmZlcmVudCBoYW5kbGluZyBmb3IgZGlmZmVyZW50IHR5cGUgc2l6ZXMuIEFzIHByZXZpb3Vz
bHkKPiA+PiBkaXNjdXNzZWQsIHg4NiBhc3NlbWJseSBtaWdodCB1c2UgZGlmZmVyZW50IGluc3Ry
dWN0aW9ucyBmb3IgdTggYW5kCj4gPj4gdTE2LiBUaGlzIG1heSBzb3VuZCBzdHViYm9ybiwgYnV0
IEkgd2FudCB0byBhc2sgYWdhaW46IHNob3VsZCB3ZQo+ID4+IGNvbnNpZGVyIHVzaW5nIHBhcml0
eTgvMTYvMzIvNjQgaW50ZXJmYWNlcz8gTGlrZSBpbiB0aGUgaTNjIGRyaXZlcgo+ID4+IGV4YW1w
bGUsIGlmIHdlIG9ubHkgaGF2ZSBhIHNpbmdsZSBwYXJpdHkgbWFjcm8gdGhhdCBzZWxlY3RzIGFu
Cj4gPj4gaW1wbGVtZW50YXRpb24gYmFzZWQgb24gdHlwZSBzaXplLCB1c2VycyBtdXN0IGV4cGxp
Y2l0bHkgY2FzdCB0eXBlcy4KPiA+PiBJZiBmdXR1cmUgdXNlcnMgYWxzbyBuZWVkIHBhcml0eSBp
biBhIGhvdCBwYXRoLCB0aGV5IG1pZ2h0IG5vdCBiZSBhd2FyZQo+ID4+IG9mIHRoaXMgcmVxdWly
ZW1lbnQgYW5kIGVuZCB1cCBnZW5lcmF0aW5nIHN1Ym9wdGltYWwgY29kZS4gU2luY2Ugd2UKPiA+
PiBjYXJlIGFib3V0IGVmZmljaWVuY3kgYW5kIGdlbmVyYXRlZCBjb2RlLCB3aHkgbm90IGZvbGxv
dyBod2VpZ2h0KCkgYW5kCj4gPj4gcHJvdmlkZSBzZXBhcmF0ZSBpbXBsZW1lbnRhdGlvbnMgZm9y
IGRpZmZlcmVudCBzaXplcz8KPiA+PiAKPiA+SXQgc2VlbXMgbm8gb25lIHdpbGwgcmVwbHkgdG8g
bXkgdHdvIGVtYWlscy4gU28sIEkgaGF2ZSBzdW1tYXJpemVkCj4gPmRpZmZlcmVudCBpbnRlcmZh
Y2UgYXBwcm9hY2hlcy4gSWYgdGhlcmUgaXMgYSBuZXh0IHZlcnNpb24sIEkgd2lsbCBzZW5kCj4g
Pml0IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cgY2xvc2VzLgo+ID4KPiA+SW50ZXJmYWNlIDE6IFNp
bmdsZSBGdW5jdGlvbgo+ID5EZXNjcmlwdGlvbjogYm9vbCBwYXJpdHlfb2RkKHU2NCkKPiA+UHJv
czogTWluaW1hbCBtYWludGVuYW5jZSBjb3N0Cj4gPkNvbnM6IERpZmZpY3VsdCB0byBpbnRlZ3Jh
dGUgd2l0aCBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgaW1wbGVtZW50YXRpb25zCj4gPiAgICAgIGR1
ZSB0byB0aGUgaW5hYmlsaXR5IHRvIG9wdGltaXplIGZvciBkaWZmZXJlbnQgYXJndW1lbnQgc2l6
ZXMKCkhvdyBkaWZmaWN1bHQ/IEl0J3MganVzdCBhcyBzaW1wbGUgYXMgZmluZF9uZXh0X2JpdCgp
LiBJIGFscmVhZHkKcG9pbnRlZCB0aGF0LgoKPiA+T3BpbmlvbnM6IEppcmkgc3VwcG9ydHMgdGhp
cyBhcHByb2FjaAo+ID4KPiA+SW50ZXJmYWNlIDI6IFNpbmdsZSBNYWNybwo+ID5EZXNjcmlwdGlv
bjogcGFyaXR5X29kZCgpIG1hY3JvCj4gPlByb3M6IEFsbG93cyB0eXBlLXNwZWNpZmljIGltcGxl
bWVudGF0aW9uCj4gPkNvbnM6IFJlcXVpcmVzIGhhY2tzIHRvIGF2b2lkIHdhcm5pbmdzOyB1c2Vy
cyBtYXkgbmVlZCBleHBsaWNpdAoKU28gaWYgdGhlIGhhY2sgaXMgZG9jdW1lbnRlZCwgaXQncyBP
Sy4gSSBkb24ndCBrbm93IHRoZSBvdGhlciB3YXkgdG8KbW90aXZhdGUgY29tcGlsZXJzIHRvIGdl
dCBiZXR0ZXIgb3RoZXIgdGhhbiBwb2ludGluZyB0aGVtIHRvIHRoZWlyCmJ1Z3MuCgo+ID4gICAg
ICBjYXN0aW5nOyBwb3RlbnRpYWwgc3ViLW9wdGltYWwgY29kZSBvbiAzMi1iaXQgeDg2CgpBbnkg
YXNtIGxpc3RpbmdzPyBBbnkgcmVhbCBpbXBhY3Q/Cgo+ID5PcGluaW9uczogWXVyeSBzdXBwb3J0
cyB0aGlzIGFwcHJvYWNoCj4gPgo+ID5JbnRlcmZhY2UgMzogTXVsdGlwbGUgRnVuY3Rpb25zCj4g
PkRlc2NyaXB0aW9uOiBib29sIHBhcml0eV9vZGQ4LzE2LzMyLzY0KCkKPiA+UHJvczogTm8gbmVl
ZCBmb3IgZXhwbGljaXQgY2FzdGluZzsgZWFzeSB0byBpbnRlZ3JhdGUKCkV4cGxpY2l0IGNhc3Rp
bmdzIGFyZSBzb21ldGltZXMgYmV0dGVyIHRoYW4gaW1wbGljaXQgb25lcy4KCj4gPiAgICAgIGFy
Y2hpdGVjdHVyZS1zcGVjaWZpYyBvcHRpbWl6YXRpb25zOyBleGNlcHQgZm9yIHBhcml0eTgoKSwg
YWxsCj4gPiAgICAgIGZ1bmN0aW9ucyBhcmUgb25lLWxpbmVycyB3aXRoIG5vIHNpZ25pZmljYW50
IGNvZGUgZHVwbGljYXRpb24KPiA+Q29uczogTW9yZSBmdW5jdGlvbnMgbWF5IGluY3JlYXNlIG1h
aW50ZW5hbmNlIGJ1cmRlbgoKcy9tYXkvd2lsbC8KCj4gPk9waW5pb25zOiBPbmx5IEkgc3VwcG9y
dCB0aGlzIGFwcHJvYWNoCj4gPgo+ID5SZWdhcmRzLAo+ID5LdWFuLVdlaQo+IAo+IFlvdSBjYW4g
YWRkIG1lIHRvIHRoZSBmaW5hbCBvcHRpb24uIEkgdGhpbmsgaXQgbWFrZXMgbW9zdCBzZW5zZQoK
VGhpcyBpcyBub3QgYSBkZW1vY3JhY3ksIGFuZCB3ZSBhcmUgbm90IHZvdGluZyBoZXJlLiBXZSBh
cmUgZW5naW5lZXJzLgpXZSBzaGFyZSBvdXIgZXhwZXJ0IG9waW5pb25zIGFuZCBjaG9vc2UgdGhl
IGJlc3Qgb25lLiBJJ2xsIGJlIGhhcHB5IHRvCmdvIHdpdGggYW55IHNvbHV0aW9uLCBpZiB3ZSBh
bGwgbWFrZSBzdXJlIGl0J3MgdGhlIGJlc3QuCgpJJ20gZm9yICMyIGJlY2F1c2UgaXQgCiAtIGdl
bmVyYXRlcyBiZXR0ZXIgY29kZSB0aGFuICMxOwogLSBlYXNpZXIgdG8gdXNlIHRoYW4gIzM7IGFu
ZAogLSBoYXMgbGVzcyBtYWludGVuYW5jZSBidXJkZW4gdGhhbiAjMy4KCldoeSBleGFjdGx5ICMz
IG1ha2VzIHRoZSBtb3N0IHNlbnNlIHRvIHlvdT8gTW9zdCB2YXJpYWJsZXMgYXJlIGludHMKYW5k
IGxvbmdzLiBIb3cgYXJlIHlvdSBnb2luZyB0byBoYW5kbGUgdGhvc2Ugd2l0aCBmaXhlZC10eXBl
cyBwYXJpdHkoKXM/CgpUaGFua3MsCll1cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
