Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B22CC021B8
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYZAdwYFRHlVviLi6osHmcwWokUyyXye4WpWJs1MblM=; b=QcUsR9e8GPxE1C
	fDB7DllZWvjDCeyhcuQk3z3vpcZlA+3NcO75uRoyQhO1D9G3kKvZWrc/9qIHz63B8ew4jdEWHffg5
	Q1J7UZoNjeZUj2k0d0dVEEQ3b9rHBlyQx1D2xhjCMA0mHrqLJaZAGiHd34H+oq+ccVxP8+YuIp5dJ
	AVj1Aurz+MmOeDqVdygMItkGHZ35WDZDXkP5VIn/W4CJYaA/4AjA+MPiMSvmIZ7DvvrU5BnNFoR0n
	opeO8rxa31UUPkFXwOpKftaBQ+uuo+VGtq7WhsMbFiujEelhFyYWhXk7scq0sshhY7wR8c22btD9R
	LaPJQlaACc6/AkOUI41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgqd-0000000FLtR-0RgA;
	Mon, 24 Feb 2025 22:22:47 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgps-0000000FLp2-2JGi
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 22:22:01 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51OMLFn9936187
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 24 Feb 2025 14:21:15 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51OMLFn9936187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740435678;
	bh=5y6QG8ugMZ9OSeEQQS3XKHClehNKu6IU395FCDCL8FQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ozIDGTPsS/eMemS9AsjAyI4wW35RmD+flU4K02cgRllCs1/EXoq/zU8D0Tj+XR7s7
	 MZg8YLCegaqa2yDyfMJvQGv6t1kOvN+0q04sz5ZxYB9YM677zH/ZIZY6vdUkX4NcwW
	 oWm3ILA+YRJqBweAX9swGouBRul9ocwk3Q4qIuvrww8+7C/Rb1K/Ta0mh5A75CR1rh
	 llGqPQI+Pf0RG87x37cpP0mls9qUS/4UTdrDt6e6zhpWuYAFbE/uu9ouHgosTRW+LS
	 bO/GR8jYaz6trMtVFpY/lvVshl8fmlaN9/CCCKUp5lafSOK9eftKm/xvIxMal4//D3
	 SjMlyohWFvQfg==
Date: Mon, 24 Feb 2025 14:21:13 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Yury Norov <yury.norov@gmail.com>
CC: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
        tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, akpm@linux-foundation.org, mingo@kernel.org,
        alistair@popple.id.au, linux@rasmusvillemoes.dk,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/17=5D_x86=3A_Replace_open-c?=
 =?US-ASCII?Q?oded_parity_calculation_with_parity8=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z7zv-c4A76jeMAKf@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com> <20250223164217.2139331-4-visitorckw@gmail.com> <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com> <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com> <Z7zv-c4A76jeMAKf@thinkpad>
Message-ID: <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_142200_594240_02723294 
X-CRM114-Status: GOOD (  11.73  )
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

T24gRmVicnVhcnkgMjQsIDIwMjUgMjoxNzoyOSBQTSBQU1QsIFl1cnkgTm9yb3YgPHl1cnkubm9y
b3ZAZ21haWwuY29tPiB3cm90ZToKPk9uIE1vbiwgRmViIDI0LCAyMDI1IGF0IDAxOjU1OjI4UE0g
LTA4MDAsIEguIFBldGVyIEFudmluIHdyb3RlOgo+PiBPbiAyLzI0LzI1IDA3OjI0LCBVcm9zIEJp
emphayB3cm90ZToKPj4gPiAKPj4gPiAKPj4gPiBPbiAyMy4gMDIuIDI1IDE3OjQyLCBLdWFuLVdl
aSBDaGl1IHdyb3RlOgo+PiA+ID4gUmVmYWN0b3IgcGFyaXR5IGNhbGN1bGF0aW9ucyB0byB1c2Ug
dGhlIHN0YW5kYXJkIHBhcml0eTgoKSBoZWxwZXIuIFRoaXMKPj4gPiA+IGNoYW5nZSBlbGltaW5h
dGVzIHJlZHVuZGFudCBpbXBsZW1lbnRhdGlvbnMgYW5kIGltcHJvdmVzIGNvZGUKPj4gPiA+IGVm
ZmljaWVuY3kuCj4+ID4gCj4+ID4gVGhlIHBhdGNoIGltcHJvdmVzIHBhcml0eSBhc3NlbWJseSBj
b2RlIGluIGJvb3RmbGFnLm8gZnJvbToKPj4gPiAKPj4gPiAgwqAgNTg6wqDCoMKgIDg5IGRlwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW92wqDCoMKgICVlYngsJWVzaQo+
PiA+ICDCoCA1YTrCoMKgwqAgYjkgMDggMDAgMDAgMDDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bC
oMKgwqAgJDB4OCwlZWN4Cj4+ID4gIMKgIDVmOsKgwqDCoCAzMSBkMsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhvcsKgwqDCoCAlZWR4LCVlZHgKPj4gPiAgwqAgNjE6wqDC
oMKgIDg5IGYwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW92wqDCoMKg
ICVlc2ksJWVheAo+PiA+ICDCoCA2MzrCoMKgwqAgODkgZDfCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAgJWVkeCwlZWRpCj4+ID4gIMKgIDY1OsKgwqDCoCA0
MCBkMCBlZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNocsKgwqDCoCAlc2lsCj4+
ID4gIMKgIDY4OsKgwqDCoCA4MyBlMCAwMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGFuZMKgwqDCoCAkMHgxLCVlYXgKPj4gPiAgwqAgNmI6wqDCoMKgIDMxIGMywqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeG9ywqDCoMKgICVlYXgsJWVkeAo+PiA+ICDCoCA2
ZDrCoMKgwqAgODMgZTkgMDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdWLCoMKg
wqAgJDB4MSwlZWN4Cj4+ID4gIMKgIDcwOsKgwqDCoCA3NSBlZsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGpuZcKgwqDCoCA2MSA8c2JmX2luaXQrMHg1MT4KPj4gPiAgwqAg
NzI6wqDCoMKgIDM5IGM3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21w
wqDCoMKgICVlYXgsJWVkaQo+PiA+ICDCoCA3NDrCoMKgwqAgNzQgN2bCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBqZcKgwqDCoMKgIGY1IDxzYmZfaW5pdCsweGU1Pgo+PiA+
ICDCoCA3NjoKPj4gPiAKPj4gPiB0bzoKPj4gPiAKPj4gPiAgwqAgNTQ6wqDCoMKgIDg5IGQ4wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW92wqDCoMKgICVlYngsJWVheAo+
PiA+ICDCoCA1NjrCoMKgwqAgYmEgOTYgNjkgMDAgMDDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bC
oMKgwqAgJDB4Njk5NiwlZWR4Cj4+ID4gIMKgIDViOsKgwqDCoCBjMCBlOCAwNMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNocsKgwqDCoCAkMHg0LCVhbAo+PiA+ICDCoCA1ZTrCoMKg
wqAgMzEgZDjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4b3LCoMKgwqAg
JWVieCwlZWF4Cj4+ID4gIMKgIDYwOsKgwqDCoCA4MyBlMCAwZsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGFuZMKgwqDCoCAkMHhmLCVlYXgKPj4gPiAgwqAgNjM6wqDCoMKgIDBmIGEz
IGMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnTCoMKgwqDCoCAlZWF4LCVlZHgK
Pj4gPiAgwqAgNjY6wqDCoMKgIDczIDY0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgamFlwqDCoMKgIGNjIDxzYmZfaW5pdCsweGJjPgo+PiA+ICDCoCA2ODoKPj4gPiAKPj4g
PiB3aGljaCBpcyBmYXN0ZXIgYW5kIHNtYWxsZXIgKC0xMCBieXRlcykgY29kZS4KPj4gPiAKPj4g
Cj4+IE9mIGNvdXJzZSwgb24geDg2LCBwYXJpdHk4KCkgYW5kIHBhcml0eTE2KCkgY2FuIGJlIGlt
cGxlbWVudGVkIHZlcnkgc2ltcGx5Ogo+PiAKPj4gKEFsc28sIHRoZSBwYXJpdHkgZnVuY3Rpb25z
IHJlYWxseSBvdWdodCB0byByZXR1cm4gYm9vbCwgYW5kIGJlIGZsYWdnZWQKPj4gX19hdHRyaWJ1
dGVfY29uc3RfXy4pCj4KPlRoZXJlIHdhcyBhIGRpc2N1c3Npb24gcmVnYXJkaW5nIHJldHVybiB0
eXBlIHdoZW4gcGFyaXR5OCgpIHdhcyBhZGRlZC4KPlRoZSBpbnRlZ2VyIHR5cGUgd2FzIHRha2Vu
IG92ZXIgYm9vbCB3aXRoIGEgc29ydCBvZiBjb25zaWRlcmF0aW9uIHRoYXQKPmJvb2wgc2hvdWxk
IGJlIHJldHVybmVkIGFzIGFuIGFuc3dlciB0byBzb21lIHF1ZXN0aW9uLCBsaWtlIHBhcml0eV9v
ZGQoKS4KPgo+VG8gbWUgaXQncyBub3QgYSBiaWcgZGVhbC4gV2UgY2FuIHN3aXRjaCB0byBib29s
ZWFuIGFuZCBkZXNjcmliZSBpbgo+Y29tbWVudCB3aGF0IHRoZSAndHJ1ZScgbWVhbnMgZm9yIHRo
ZSBwYXJpdHkoKSBmdW5jdGlvbi4KCkJvb2wgaXMgcmVhbGx5IHRoZSBzaW5nbGUtYml0IHR5cGUs
IGFuZCBnaXZlcyB0aGUgY29tcGlsZXIgbW9yZSBpbmZvcm1hdGlvbi4gWW91IGNvdWxkIGFyZ3Vl
IHRoYXQgdGhlIGZ1bmN0aW9uIHJlYWxseSBzaG91bGQgYmUgY2FsbGVkIHBhcml0eV9vZGQqKCkg
aW4gZ2VuZXJhbCwgYnV0IHRoYXQncyBraW5kIG9mIGV4Y2Vzc2l2ZSBJTU8uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
