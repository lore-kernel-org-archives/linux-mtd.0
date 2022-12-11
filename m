Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD62C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Dec 2022 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUva4H/VTNKIIxVXmetsUOjIsONtPcsnqO/Fm2pc4g0=; b=w3/yqI2KohE9ZT
	PQpNvEIa4/gjWo2jseG8T81Gf4Qc3yVR5knorP6rPBcbwNpAUgIQvuB0A/C7wXV2xz1be0aAB/qka
	Fzp57JoEplgC2r5bLak6flQj7NzLDxvJwZ9KGaGzHUOhP8RmyFoY9UF7fQcjBfoMLV0wGMk7U2W1+
	DZVnn3D2yfuHjgCU8UCigeziOeK4jSbefNkj7WhM6RwUno38nwIfWVjIG5FH7rtvrooTizPhzSfPJ
	uUZg0eWb3AzH7c31wlgqHqnq8UavTdEsMfN359YonaWcctbdF+z+4mY6PKR4LwpvPYPJ+runtLgvl
	l0sQ6OGJoZQY7pDd4T0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Hfc-00Endf-2T; Sun, 11 Dec 2022 08:26:48 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4HfX-00EnYi-JD
	for linux-mtd@lists.infradead.org; Sun, 11 Dec 2022 08:26:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id n20so21040810ejh.0
        for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2022 00:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df12UQhWiYTYmdTCUvBoHsOBYTq2DGnQpQX0Hny7LVU=;
        b=iH+2AItbsTINdOr0Cj28qQmO2p56KfxkOIyQJl/yjKRAmjwb9acWJh/+Vd0E6Ahoeb
         mMq8nEb2WmHUcXwcQE2oY8N3FBbbMDwT4iuXyZV9ACkXkH2LCEBCsZ1XNOHOWKiX9VlT
         eAUshl7Bj+PG6ouRCLGKRhdgEsP6ykJvCnIDMW5gl2h7PHFrZsccJSm9kbBQ2SfwuSQy
         j8/dMUbcUIhYJ9noiW4E7jhX++Xkk2yUCfyeqiZ1zpOFYZ9kuQ8bahEUuU6amf+q0gOT
         oLOW4eBsfY8FX3clPot4jSlbDaOqN801X/wBsrUsiyBPllp+Ti4m8gWLCQI9Jx6+mc1m
         D4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df12UQhWiYTYmdTCUvBoHsOBYTq2DGnQpQX0Hny7LVU=;
        b=6SYKed8ZrIZxYRzM47vx7QSEmTsX49VtzsdoJz2TViHYGoHD1FrSfSu+LRTQTnN0FO
         HRMd2w2O6cDRiCZmpv0diOOFYIEomgEAc6HgqnpGsQvfhId2ctfmth6MSbITXEksyD6b
         gNXEgsOW3PqJqMzynixAbERiue0fPTrQy49ky1lln5pZGULomJZ/HGSsNX4JUVyeacch
         kqqfaqVgN7VPOL7nOs8fAhH5fcW1KPcOSIMCT9AYGuJ4U3KYHMhyYqJmDMQiHC+6FSoA
         cOQ+lJe9PIBCT/ExfOY5sIjMf5AOlpGUfte8dFfcLnBDr3cZfQRBZnJ1kPJ2Ckv8j7b6
         yZkQ==
X-Gm-Message-State: ANoB5pkd0yBJir/owPcpJhNNj6xAB1xh+t/0rkqpxMk3dmWTZycZJYCH
	UhqsLCX42b4p6s4+W6+Lh+xSnI9bwuJDQvDhcjQ=
X-Google-Smtp-Source: AA0mqf7ZMdYKNktXbDEDsUat0++lY1WTIOMpXUb/tlsZdsovERwynkwAvgxd5PA7NHNObE1yohlrO37VKDTfvyH6zNQ=
X-Received: by 2002:a17:906:6d03:b0:78d:9d0b:a9f6 with SMTP id
 m3-20020a1709066d0300b0078d9d0ba9f6mr34394004ejr.661.1670747200885; Sun, 11
 Dec 2022 00:26:40 -0800 (PST)
MIME-Version: 1.0
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com> <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
In-Reply-To: <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 11 Dec 2022 11:26:29 +0300
Message-ID: <CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
Subject: Re: Fwd: nvmem-cells regression after adding 'call
 of_platform_populate() for MTD partitions'
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_002643_703936_84E4A921 
X-CRM114-Status: GOOD (  35.49  )
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

Pk9uIDEwLjEyLjIyIDEwOjUyLCBNYXhpbSBLaXNlbGV2IHdyb3RlOgo+Pgo+PiBBZnRlciBhcHBs
eWluZwo+Cj5UaGlzIG1ha2VzIG1lIHdvbmRlcjogImFwcGx5aW5nIiBhcyBpbiAiYXBwbHlpbmcg
aXQgdG8gc29tZSB2ZXJzaW9uIHRoYXQKPmRvZXNuJ3QgY29udGFpbiB0aGlzIGNoYW5nZSBub3Jt
YWxseSIgb3IgYXMgaXQgImFmdGVyIGl0IHdhcyBhcHBsaWVkIHRvCj5tYWlubGluZSBJIGhhdmUg
dGhlIGZvbGxvd2luZyBwcm9ibGVtIHdpdGggdmFuaWxsYSBrZXJuZWwgdmVyc2lvbiA8Pz8/PiI/
CgpTb3JyeSBmb3IgY29uZnVzaW5nIHlvdSwgSSBtZWFuICJhZnRlciBpdCB3YXMgYXBwbGllZCB0
byBtYWlubGluZSIuCkkgaGF2ZSB0aGlzIHByb2JsZW0gd2l0aCB2YW5pbGxhIGtlcm5lbCB2ZXJz
aW9uIDYuMC4KCj4+PiBJIGZhY2VkIHdpdGggYSBwcm9ibGVtIHRoYXQgbXkgZXRoZXJuZXQgZGV2
aWNlIGNhbid0IGJlIHByb2JlZCBiZWNhdXNlIGl0Cj4+PiB3YWl0IHdoZW4gJ252bWVtLWNlbGxz
JyBkZXZpY2Ugd2lsbCBiZSBwcm9iZWQgZmlyc3QuCj4+Cj4+RldJVywgdGhlcmUgaXMgYSBkaXNj
dXNzaW9uIGFib3V0IGEgcHJvYmxlbXMgdGhhdCBhdCBsZWFzdCB0byBteQo+PnVudHJhaW5lZCBl
eWVzIGxvb2tzIHNpbWlsYXI6Cj4+aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1l5ajd3Smxx
SmtDd09iUm5AbHgyay8KClllcyBpdCBsb29rcyBsaWtlIHRoZSBzYW1lIGlzc3VlLgoKCkkgdGhp
bmsgdGhlIHJvb3Qgb2YgdGhlIHByb2JsZW0gd2FzIHRoZSBjaG9pY2Ugb2YgJ2NvbXBhdGlibGUn
CmRldmljZSB0cmVlIHByb3BlcnR5IHRvIG1hcmsgdGhlIG10ZCBwYXJ0aXRpb24gbm9kZSBhcyBh
IG52bWVtIHByb3ZpZGVyLgoKSSdtIHRhbGtpbmcgYWJvdXQgdGhpcyBwYXJ0IGluICdtdGRfbnZt
ZW1fYWRkJyBmdW5jdGlvbi4KPiBjb25maWcubm9fb2Zfbm9kZSA9ICFvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShub2RlLCAibnZtZW0tY2VsbHMiKTsKCk1heWJlIHdlIHNob3VsZCBjaGFuZ2UgdGhl
ICdjb21wYXRpYmxlJyBwcm9wZXJ0eSB0byBzb21ldGhpbmcgZWxzZT8KCtGB0LEsIDEwINC00LXQ
ui4gMjAyMiDQsy4g0LIgMTU6MzUsIFRob3JzdGVuIExlZW1odWlzIDxyZWdyZXNzaW9uc0BsZWVt
aHVpcy5pbmZvPjoKPgo+IFtDQ2luZyB0aGUgcmVncmVzc2lvbiBtYWlsaW5nIGxpc3QsIGFzIGl0
IHNob3VsZCBiZSBpbiB0aGUgbG9vcCBmb3IgYWxsCj4gcmVncmVzc2lvbnMsIGFzIGV4cGxhaW5l
ZCBpbgo+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2FkbWluLWd1aWRlL3JlcG9ydGluZy1yZWdy
ZXNzaW9ucy5odG1sIF0KPgo+IEhpLCB0aGlzIGlzIHlvdXIgTGludXgga2VybmVsIHJlZ3Jlc3Np
b24gdHJhY2tlci4gVGh4IGZvciB0aGUgcmVwb3J0Lgo+Cj4gT24gMTAuMTIuMjIgMTA6NTIsIE1h
eGltIEtpc2VsZXYgd3JvdGU6Cj4gPgo+ID4gQWZ0ZXIgYXBwbHlpbmcKPgo+IFRoaXMgbWFrZXMg
bWUgd29uZGVyOiAiYXBwbHlpbmciIGFzIGluICJhcHBseWluZyBpdCB0byBzb21lIHZlcnNpb24g
dGhhdAo+IGRvZXNuJ3QgY29udGFpbiB0aGlzIGNoYW5nZSBub3JtYWxseSIgb3IgYXMgaXQgImFm
dGVyIGl0IHdhcyBhcHBsaWVkIHRvCj4gbWFpbmxpbmUgSSBoYXZlIHRoZSBmb2xsb3dpbmcgcHJv
YmxlbSB3aXRoIHZhbmlsbGEga2VybmVsIHZlcnNpb24gPD8/Pz4iPwo+Cj4gPiB0aGlzIGNvbW1p
dCAnbXRkOiBjYWxsIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkgZm9yIE1URAo+ID4gcGFydGl0aW9u
cycgKGJjZGYwMzE1KSwKPgo+IENDaW5nIFJhZmHFgiwgd2hvIGF1dGhvcmVkIGJjZGYwMzE1Lgo+
Cj4gPiBJIGZhY2VkIHdpdGggYSBwcm9ibGVtIHRoYXQgbXkgZXRoZXJuZXQgZGV2aWNlIGNhbid0
IGJlIHByb2JlZCBiZWNhdXNlIGl0Cj4gPiB3YWl0IHdoZW4gJ252bWVtLWNlbGxzJyBkZXZpY2Ug
d2lsbCBiZSBwcm9iZWQgZmlyc3QuCj4KPiBGV0lXLCB0aGVyZSBpcyBhIGRpc2N1c3Npb24gYWJv
dXQgYSBwcm9ibGVtcyB0aGF0IGF0IGxlYXN0IHRvIG15Cj4gdW50cmFpbmVkIGV5ZXMgbG9va3Mg
c2ltaWxhcjoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWXlqN3dKbHFKa0N3T2JSbkBs
eDJrLwo+Cj4gUmFmYcWCLCBoYXMgc29tZSBwcm9ncmVzcyBiZWVuIG1hZGUgdG8gcmVzb2x2ZSB0
aGlzPwo+Cj4gVG8gbWUgaXQgc291bmRzIGxpa2UgdGhpcyBtaWdodCB3YXJyYW50IGEgInJldmVy
dCwgYW5kIHJlYXBwbHkgbGF0ZXIKPiB3aGVuIHRoZSBjYXVzZSBmb3IgdGhlIHJlZ3Jlc3Npb24g
d2FzIGFkZHJlc3NlZCIuIFJhZmHFgiwgaXQgc2VlbXMgeW91Cj4gc3VnZ2VzdGVkIHNvbWV0aGlu
ZyBsaWtlIHRoYXQsIGJ1dCBpdCBkb2Vzbid0IGxvb2sgbGlrZSB0aGF0IGhhcHBlbmVkCj4gZm9y
IG9uZSByZWFzb24gb3IgYW5vdGhlci4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPgo+IENp
YW8sIFRob3JzdGVuICh3ZWFyaW5nIGhpcyAndGhlIExpbnV4IGtlcm5lbCdzIHJlZ3Jlc3Npb24g
dHJhY2tlcicgaGF0KQo+Cj4gUC5TLjogQXMgdGhlIExpbnV4IGtlcm5lbCdzIHJlZ3Jlc3Npb24g
dHJhY2tlciBJIGRlYWwgd2l0aCBhIGxvdCBvZgo+IHJlcG9ydHMgYW5kIHNvbWV0aW1lcyBtaXNz
IHNvbWV0aGluZyBpbXBvcnRhbnQgd2hlbiB3cml0aW5nIG1haWxzIGxpa2UKPiB0aGlzLiBJZiB0
aGF0J3MgdGhlIGNhc2UgaGVyZSwgZG9uJ3QgaGVzaXRhdGUgdG8gdGVsbCBtZSBpbiBhIHB1Ymxp
Ywo+IHJlcGx5LCBpdCdzIGluIGV2ZXJ5b25lJ3MgaW50ZXJlc3QgdG8gc2V0IHRoZSBwdWJsaWMg
cmVjb3JkIHN0cmFpZ2h0Lgo+Cj4gPiBCdXQgdGhlcmUgaXMgbm8gc3VjaCBkcml2ZXIgd2hpY2gg
aXMgY29tcGF0aWJsZSB3aXRoICdudm1lbS1jZWxscycgYmVjYXVzZQo+ID4gJ252bWVtLWNlbGxz
JyBpcyBqdXN0IGEgbWFyayB1c2VkIGJ5IHRoZSAnbXRkX252bWVtX2FkZCcgZnVuY3Rpb24uCj4g
Pgo+ID4gU28gdGhpcyBsZWFkcyB0byBhcHBlYXRpbmcgb2YgdW5yZXNvbHZlZCBkZXBlbmRlbmN5
IGZvciB0aGUgZXRoZXJuZXQgZGV2aWNlLgo+ID4gQW5kIHRoYXQncyB3aHkgdGhlIGV0aGVybmV0
IGRldmljZSBjYW4ndCBiZSBhZGRlZCBhbmQgcHJvYmVkLgo+ID4KPiA+IEhlcmUgaXMgYSBwYXJ0
IG9mIGtlcm5lbCBsb2cgd2hlbiBzcGkgZmxhc2ggcHJvYmUgc3RhcnQ6Cj4gPgo+ID4+IGRldmlj
ZTogJ3NwaTAnOiBkZXZpY2VfYWRkCj4gPj4gZGV2aWNlOiAnc3BpMC4wJzogZGV2aWNlX2FkZAo+
ID4+IHNwaS1ub3Igc3BpMC4wOiBteDY2bDUxMjM1ZiAoNjU1MzYgS2J5dGVzKQo+ID4+IDcgZml4
ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2Ugc3BpMC4wCj4gPgo+
ID4gQWZ0ZXIgJ20yNXA4MCcgcHJvYmUgJ2YxMDcwMDAwLmV0aGVybmV0JyBsaW5rZWQgdG8gJ3Bh
cnRpdGlvbkAxJyA6Cj4gPgo+ID4+IGRldmljZTogJ2YxMDEwNjAwLnNwaTptMjVwODBAMDoKPiA+
IHBhcnRpdGlvbnM6cGFydGl0aW9uQDEnOiBkZXZpY2VfYWRkCj4gPj4gZGV2aWNlOiAncGxhdGZv
cm06ZjEwMTA2MDAuc3BpOm0yNXA4MEAwOnBhcnRpdGlvbnM6cGFydGl0aW9uQDEtLXBsYXRmb3Jt
OmYxMDcwMDAwLmV0aGVybmV0JzogZGV2aWNlX2FkZAo+ID4+IGRldmljZXNfa3NldDogTW92aW5n
IGYxMDcwMDAwLmV0aGVybmV0IHRvIGVuZCBvZiBsaXN0Cj4gPj4gcGxhdGZvcm0gZjEwNzAwMDAu
ZXRoZXJuZXQ6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIGYxMDEwNjAwLnNwaTptMjVwODBAMDpw
YXJ0aXRpb25zOnBhcnRpdGlvbkAxCj4gPj4gZXRoZXJuZXRANzAwMDAgRHJvcHBpbmcgdGhlIGZ3
bm9kZSBsaW5rIHRvIHBhcnRpdGlvbkAxCj4gPgo+ID4gQW5kIGFzIGEgcmVzdWx0IEkgZ290IGAt
RVBST0JFX0RFRkVSYCBmb3IgYGYxMDcwMDAwLmV0aGVybmV0YAo+ID4KPiA+PiBwbGF0Zm9ybSBm
MTA3MDAwMC5ldGhlcm5ldDogZXJyb3IgLUVQUk9CRV9ERUZFUjogc3VwcGxpZXIgZjEwMTA2MDAu
c3BpOm0yNXA4MEAwOnBhcnRpdGlvbnM6cGFydGl0aW9uQDEgbm90IHJlYWR5Cj4gPgo+ID4gSGVy
ZSBpcyBhIHBhcnQgb2YgbXkgZGV2aWNlIHRyZWU6Cj4gPgo+ID4gICAgIGVuZXQxOiBldGhlcm5l
dEA3MDAwMCB7Cj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICAgICAgICAgbnZtZW0t
Y2VsbHMgPSA8Jm1hY2FkZHI+Owo+ID4gICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gIm1hYy1h
ZGRyZXNzIjsKPiA+ICAgICAgICAgcGh5LW1vZGUgPSAicmdtaWkiOwo+ID4gICAgICAgICBwaHkg
PSA8JnBoeTA+Owo+ID4gICAgIH07Cj4gPgo+ID4gICAgIHNwaUAxMDYwMCB7Cj4gPiAgICAgICAg
IHN0YXR1cyA9ICJva2F5IjsKPiA+Cj4gPiAgICAgICAgIG0yNXA4MEAwIHsKPiA+ICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAibXg2Nmw1MTIzNWwiOwo+ID4gICAgICAgICAgICAgcmVnID0gPDA+
Owo+ID4gICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwxPjsKPiA+Cj4gPiAgICAgICAgICAgICBwYXJ0aXRpb25zIHsKPiA+ICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gICAgICAg
ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gICAgICAgICAgICAgICAgICNzaXpl
LWNlbGxzID0gPDE+Owo+ID4KPiA+ICAgICAgICAgICAgICAgICBwYXJ0aXRpb25AMCB7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDAwMDgwMDAwPjsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiU1BJLlVfQk9PVCI7Cj4gPiAgICAgICAgICAgICAg
ICAgfTsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgcGFydGl0aW9uQDEgewo+ID4gICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gIm52bWVtLWNlbGxzIjsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MDAwQTAwMDAgMHgwMDAyMDAwMD47Cj4gPiAgICAgICAgICAgICAgICAg
ICAgIGxhYmVsID0gIlNQSS5JTlZfSU5GTyI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Owo+ID4gICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwx
PjsKPiA+ICAgICAgICAgICAgICAgICAgICAgcmFuZ2VzID0gPDAgMHgwMDBBMDAwMCAweDAwMDIw
MDAwPjsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgIG1hY2FkZHI6IG1hY0A2IHsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDYgMHg2PjsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgfTsKPiA+ICAgICAgICAgICAgICAgICB9Owo+ID4KPiA+ICAgICAgICAgICAgIH07Cj4g
PiAgICAgICAgIH07Cj4gPiAgICAgfTsKPiA+Cj4gPiBJbiB0aGUgZXhhbXBsZSBhYm92ZSAnZXRo
ZXJuZXRANzAwMDAnIHJlcXVpcmVzICdtYWNhZGRyOiBtYWNANicgd2hpY2ggaXMKPiA+IGxvY2F0
ZWQgaW5zaWRlIG10ZCAncGFydGl0aW9uQDEnIG9mICdtMjVwODBAMCcgc3BpIGZsYXNoLgo+Cj4g
UC5QLlMuOiBsZXQgbWUgYWRkIHRoaXMgdG8gdGhlIHJlZ3Jlc3Npb24gdHJhY2tpbmc6Cj4KPiAj
cmVnemJvdCBeaW50cm9kdWNlZCBiY2RmMDMxNQo+ICNyZWd6Ym90IHRpdGxlIG10ZDogZXRoZXJu
ZXQgZGV2aWNlIGNhbid0IGJlIHByb2JlZCBhbnltb3JlIGR1ZSB0bwo+IGJyb2tlbiBudm1lbS1j
ZWxscyBkZXAKPiAjcmVnemJvdCBtb25pdG9yOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
WXlqN3dKbHFKa0N3T2JSbkBseDJrLwo+ICNyZWd6Ym90IGlnbm9yZS1hY3Rpdml0eQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
