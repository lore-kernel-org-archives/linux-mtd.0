Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A7C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 00:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7yH9yCdZ5xpgw/1HKwyKXPHdVvNRlpk+aW2a5Z5S/A=; b=SKK7/JWLGzjw91
	k7rngVumPRODPIeoJZxS3wfZzPsmlfsp5C9meDzuztfxAKyZG2qgPqBP5gixBikYqkTAaZHwLlGOy
	SComonPyMn22vhvJ7N9TNUb2lz6n80j9xU5hbH2SNwizT3vVIY1dgIuDek4xw9QwWO2cZHZ9Cpc6e
	2chXRhT5yFQWhpl+vX+l39InCYj3QwK8MRPPBRa3vmyBM6DUzJl7BtsX9RDtPQFbRaQBmm246eQqF
	o5U3LLAzAesxAYaSE1OSaTQtSALlqCpPsBF7wypBxmq1UTjEWYHDC6TsZprKPx/Q5SMiAqalGtsB1
	K2e+yAgW5/+7mVLg42Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om2WU-00AYET-FQ; Sat, 22 Oct 2022 00:37:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om2WR-00AYCT-6R
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 00:37:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id c24so3785052plo.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2022 17:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06hJKxHnqJ1xBDKh32gs167oDbEPVS7g4B9VFoTQ0lc=;
        b=43RhBul7xQ0OxIKNggFHs/d9YIqGv9YO6jowfpYDmNhJNUUFD6AZ3ObfiT+UcqglD9
         RkxEdQIvtPJRK1tph3HALptzgD5tETKIapMPPe1iQgnrW6bfftiPrOEVA4E0tM59qf9J
         /tR5JaIQZCrLFA1GIgcoVzpY5kn9SBazjTGRlLY7tH10FRKrvFmeJdiuzHXbyS12Tmn1
         OaQVL/6F4Xv0N/eg760H0/XSLDDDiQuK7Hs2qrRW7XqvCmHNkdmbZdQ+87Bbz15e4dVd
         N/9+V+n13wFV6tGGgK8QXOMfZSX7DGYcq6AB/c5vuXn5cE0lxb/XoB3LdIToUoegN1nA
         Z8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06hJKxHnqJ1xBDKh32gs167oDbEPVS7g4B9VFoTQ0lc=;
        b=d3Yz9P0dEsJlCH1+nmbEMtBva8VBxKpIajiVSIWzvXUnq/l0AYBZokbNlxFpNECImx
         GipF1pvshc/dJKI2UX9tO9gWDcMZ1DFP79dnC3tVyN2BuZGzxLM4qEEEWJndGWLw3Rno
         1+M089+i5GQ0CXw4vVcUuSbNLn6bSQ40fg5PV5M4aS6ichdcPeQyycdaMeoB7X6cOA2T
         berB6pTZDnAfV9rydF5zW8no5VGQgY2G4mnUjXfaLJ3YY7hA3c60PNChA4YJRNRpf1Y2
         7QXHXHAwjmQYTtXQBcyqHCcexO8cbM0xIIaAvr5iZXYy/uXy55CfHVUc2wjSn1HXJ/Nf
         WDxA==
X-Gm-Message-State: ACrzQf2zDvtU4eAu7RqknKvw2zvzaBWOLPVGb5iNXemWvibWQS/t14sw
	qw9vj0X6KqN6GyMXkja3ywp9HOr4SaBUkNQAaDcEbg==
X-Google-Smtp-Source: AMsMyM5jSvEa2ZkBmmKOSrCpNQPQkaqHUp0zDNT/aZZOD3t4OarUnTrt2uiWTNzSZzJGsPvGD7RjT8upAIjwMSoELgE=
X-Received: by 2002:a17:902:eb8e:b0:17f:637b:9548 with SMTP id
 q14-20020a170902eb8e00b0017f637b9548mr22303069plg.158.1666399073916; Fri, 21
 Oct 2022 17:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
 <YtD/9KJZwlVj+6hS@kroah.com> <20220715074631.GA7333@pengutronix.de>
 <YtEdIujszEKSprbF@kroah.com> <770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
 <20220902090252.75285234@xps-13> <CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
In-Reply-To: <CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 21 Oct 2022 17:37:42 -0700
Message-ID: <CAJ+vNU03stcALHQEbyfB8vqSZ8EGo7arCNtH3P=oyhjPEirj4w@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
To: Sascha Hauer <s.hauer@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@camlingroup.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Richard Weinberger <richard@nod.at>, 
	Sasha Levin <sashal@kernel.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, torvalds <torvalds@linux-foundation.org>, 
	Han Xu <han.xu@nxp.com>, kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, 
	k drobinski <k.drobinski@camlintechnologies.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_173755_489242_DBB0250F 
X-CRM114-Status: GOOD (  24.95  )
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

T24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgMjo1NSBQTSBUaW0gSGFydmV5IDx0aGFydmV5QGdhdGV3
b3Jrcy5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMiwgMjAyMiBhdCAxMjowMyBBTSBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIZXkg
Zm9sa3MsCj4gPgo+ID4gcmljaGFyZEBub2QuYXQgd3JvdGUgb24gRnJpLCAxNSBKdWwgMjAyMiAw
OTo1OToxMCArMDIwMCAoQ0VTVCk6Cj4gPgo+ID4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWls
IC0tLS0tCj4gPiA+ID4+IE15IElSQyBoaXN0b3J5IGRvZXNuJ3QgZ28gYmFjayBmYXIgZW5vdWdo
LCBidXQgaWYgSSByZWNhbGwgY29ycmVjdGx5Cj4gPiA+ID4+IE1pcXVlbCBpcyBvbiB2YWNhdGlv
biwgaGUgd291bGQgaGF2ZSBwaWNrZWQgdXAgdGhpcyBwYXRjaCBmb3IgbGludXgtbmV4dAo+ID4g
PiA+PiBvdGhlcndpc2UuCj4gPiA+Cj4gPiA+IEV4YWN0bHkuCj4gPgo+ID4gSW5kZWVkLCBJIHdh
cyBvZmYgZm9yIGFuIGV4dGVuZGVkIHBlcmlvZCBvZiB0aW1lLCBJJ20gKHZlcnkpIHNsb3dseQo+
ID4gY2F0Y2hpbmcgdXAgbm93Lgo+ID4KPiA+ID4KPiA+ID4gPiBPaywgbGV0IG1lIGRvIGEgcm91
bmQgb2Ygc3RhYmxlIHJlbGVhc2VzIHNvIHRoYXQgcGVvcGxlIGRvbid0IGdldCBoaXQgYnkKPiA+
ID4gPiB0aGlzIG5vdy4uLgo+ID4gPgo+ID4gPiBUaGFua3MgYSBsb3QgZm9yIGRvaW5nIHNvLgo+
ID4gPgo+ID4gPiA+IEhvcGVmdWxseSB0aGlzIGdldHMgZml4ZWQgdXAgYnkgNS4xOS1maW5hbC4K
PiA+ID4KPiA+ID4gU3VyZSwgSSdsbCBwaWNrdXAgdGhpcyBwYXRjaC4KPiA+Cj4gPiBUaGFua3Mg
R3JlZyAmIFJpY2hhcmQgZm9yIHRoZSBoYW5kbGluZyBvZiB0aGlzIGlzc3VlLgo+ID4KPiA+IENo
ZWVycywKPiA+IE1pcXXDqGwKPiA+Cj4KPiBIZWxsbyBBbGwsCj4KPiBBcyBUb21hc3ogc3RhdGVk
IHByZXZpb3VzbHkgMDY3ODFhNTAyNjM1MCB3YXMgbWVyZ2VkIGluIHY1LjE5LXJjNCBhbmQKPiB0
aGVuIHdhcyBwaWNrZWQgdXAgYnkgc2V2ZXJhbCBzdGFibGUga2VybmVscy4gV2hpbGUgdGhpcyBt
YWRlIGl0IGludG8KPiB0aGUgNS4xNSBhbmQgNS4xOCBzdGFibGUgYnJhbmNoZXMgaXQgZGlkIG5v
dCBtYWtlIGl0IGludG8gdGhlCj4gZm9sbG93aW5nIHdoaWNoIGFyZSB0aHVzIHRoZSBhcmUgY3Vy
cmVudGx5IGJyb2tlbjoKPiA1LjEwLnkKPiA1LjE3LnkKPgo+IEhvdyBkbyB3ZSBnZXQgdGhpcyBw
YXRjaCBhcHBsaWVkIHRvIHRob3NlIHN0YWJsZSBicmFuY2hlcyBhcyB3ZWxsIHRvCj4gcmVzb2x2
ZSB0aGlzPwo+Cj4gQmVzdCByZWdhcmRzLAo+CgpTb21lIG1vcmUgZGV0YWlscyBoZXJlIGFzIEkg
YWxzbyBmaW5kIHRoYXQgc3RhYmxlIDUuNCBpcyBicm9rZW4gYXMKd2VsbCA1LjEwIGFuZCA1LjE3
OgoKVGhlIGlzc3VlIEkgc2VlIGhlcmUgaXMgb24gYSBHYXRld29ya3MgaW14NnEtZ3c1NHh4IGJv
YXJkIHdpdGggYSAyR2lCCkN5cHJlc3MgTkFORCBwYXJ0ClsgICAgMi43MDMzMjRdIG5hbmQ6IGRl
dmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweDAxLCBDaGlwIElEOiAweGQ1ClsgICAgMi43
MDk4MTVdIG5hbmQ6IEFNRC9TcGFuc2lvbiBTMzRNTDE2RzIKWyAgICAyLjcxMzc1OF0gbmFuZDog
MjA0OCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOgoyMDQ4LCBPT0Ig
c2l6ZTogMTI4ClsgICAgMi43MjE5OTBdIFNjYW5uaW5nIGRldmljZSBmb3IgYmFkIGJsb2Nrcwpb
ICAgIDIuNzI3MDI1XSBCYWQgZXJhc2VibG9jayAwIGF0IDB4MDAwMDAwMDAwMDAwClsgICAgMi43
MzE2MjhdIEJhZCBlcmFzZWJsb2NrIDEgYXQgMHgwMDAwMDAwMjAwMDAKWyAgICAyLjczNjE5MV0g
QmFkIGVyYXNlYmxvY2sgMiBhdCAweDAwMDAwMDA0MDAwMAouLi4KClRoZSBvcmlnaW5hbCByZWdy
ZXNzaW9uIHdhcyBmcm9tIGNvbW1pdCBkOTllN2ZlYWVkNGM6ICgibXRkOiByYXduYW5kOgpncG1p
OiBmaXggY29udHJvbGxlciB0aW1pbmdzIHNldHRpbmciKSB3aGljaCB3YXMgZml4ZWQgYnkgY29t
bWl0CjE1NjQyN2IzMTIzYyAoIm10ZDogcmF3bmFuZDogZ3BtaTogRml4IHNldHRpbmcgYnVzeSB0
aW1lb3V0IHNldHRpbmciKQpidXQgbGF0ZXIgZGVlbWVkIHRvIGJlIGFuIGludmFsaWQgZml4IHNv
IHRoYXQgZ290IHJldmVydGVkICh0aHVzCmJyZWFraW5nIHRoaW5ncyBhZ2FpbikgYW5kIGZpeGVk
IGluc3RlYWQgd2l0aCBjb21taXQgMGZkZGY5YWQwNmZkCigibXRkOiByYXduYW5kOiBncG1pOiBT
ZXQgV0FJVF9GT1JfUkVBRFkgdGltZW91dCBiYXNlZCBvbgpwcm9ncmFtL2VyYXNlIHRpbWVzIikg
d2hpY2ggZGlkIG5vdCBtYWtlIGl0IGludG8gYWxsIHRoZSBzdGFibGUKYnJhbmNoZXMgdGhhdCBo
YWQgdGhlIG9yaWdpbmFsIGNvbW1pdCBvciB0aGUgcmV2ZXJ0IG9mIHRoZSBwb3RlbnRpYWwKZml4
LgoKSGVyZSBpcyBoaXN0b3J5IG9mIGVhY2ggc3RhYmxlIGJyYW5jaCBhZmZlY3RlZCBhcyBiZXN0
IEkgY2FuIHRlbGwKKEkndmUgYWN0dWFsbHkgYnVpbHQvYm9vdGVkIGFsbCBvZiB0aGVzZSB0cnlp
bmcgdG8gdW5kZXJzdGFuZCB0aGlzIHNvCmZpeGVkL2Jyb2tlbiByZWZlcnMgdG8gdGhlIGlzc3Vl
IEkgc2VlIGFib3ZlKToKCnY1LjQ6CiAtIHY1LjQuMTg5IGJyb2tlbiB3aXRoIGNvbW1pdCAwZDBl
ZTY1MWU3MmM6ICgibXRkOiByYXduYW5kOiBncG1pOiBmaXgKY29udHJvbGxlciB0aW1pbmdzIHNl
dHRpbmciKQogLSB2NS40LjIwMiBmaXhlZCB3aXRoIGNvbW1pdCA3MWM3NmY1NmI5N2M6ICgibXRk
OiByYXduYW5kOiBncG1pOiBGaXgKc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0dGluZyIpCiAtIHY1
LjQuMjA2IGJyb2tlbiB3aXRoIGNvbW1pdCAxNWEzYWRmZTc1OTM6ICgiUmV2ZXJ0ICJtdGQ6IHJh
d25hbmQ6CmdwbWk6IEZpeCBzZXR0aW5nIGJ1c3kgdGltZW91dCBzZXR0aW5nIiIpCiAqKiogc3Rp
bGwgYnJva2VuIGFzIG9mIHY1LjQuMjE5IGJ1dCBjYW4gYmUgZml4ZWQgYnkgY29tbWl0CjBmZGRm
OWFkMDZmZCAoIm10ZDogcmF3bmFuZDogZ3BtaTogU2V0IFdBSVRfRk9SX1JFQURZIHRpbWVvdXQg
YmFzZWQgb24KcHJvZ3JhbS9lcmFzZSB0aW1lcyIpCgp2NS4xMDoKIC0gdjUuMTAuMTEwIGJyb2tl
biB3aXRoIGNvbW1pdCBkOTllN2ZlYWVkNGM6ICgibXRkOiByYXduYW5kOiBncG1pOgpmaXggY29u
dHJvbGxlciB0aW1pbmdzIHNldHRpbmciKQogLSB2NS4xMC4xMjcgZml4ZWQgd2l0aCBjb21taXQg
MTU2NDI3YjMxMjNjICgibXRkOiByYXduYW5kOiBncG1pOiBGaXgKc2V0dGluZyBidXN5IHRpbWVv
dXQgc2V0dGluZyIpCiAtIHY1LjEwLjEzMSBicm9rZW4gd2l0aCBjb21taXQgY2M1ZWUwZTBlZWQw
IFJldmVydCAibXRkOiByYXduYW5kOgpncG1pOiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0
dGluZyIKICoqKiBzdGlsbCBicm9rZW4gYXMgb2YgdjUuMTAuMTQ5IGJ1dCBjYW4gYmUgZml4ZWQg
YnkgY29tbWl0CjBmZGRmOWFkMDZmZCAoIm10ZDogcmF3bmFuZDogZ3BtaTogU2V0IFdBSVRfRk9S
X1JFQURZIHRpbWVvdXQgYmFzZWQgb24KcHJvZ3JhbS9lcmFzZSB0aW1lcyIpCgp2NS4xNToKIC0g
djUuMTUuMzMgYnJva2VuIHdpdGggY29tbWl0IDg0ODBlZmU4MTVlNTogKCJtdGQ6IHJhd25hbmQ6
IGdwbWk6IGZpeApjb250cm9sbGVyIHRpbWluZ3Mgc2V0dGluZyIpCiAtIHY1LjE1LjUxIGZpeGVk
IHdpdGggY29tbWl0IDBhZjY3NGU3YTc2NDogKCJtdGQ6IHJhd25hbmQ6IGdwbWk6IEZpeApzZXR0
aW5nIGJ1c3kgdGltZW91dCBzZXR0aW5nIikKIC0gdjUuMTUuNTUgYnJva2VuIHdpdGggY29tbWl0
IGM4MGIxNTEwNWEwOCAoIlJldmVydCAibXRkOiByYXduYW5kOgpncG1pOiBGaXggc2V0dGluZyBi
dXN5IHRpbWVvdXQgc2V0dGluZyIiKQogLSB2NS4xNS41OCBmaXhlZCB3aXRoIGNvbW1pdCAyMTJh
NTM2MGVmNDAgKCJtdGQ6IHJhd25hbmQ6IGdwbWk6IFNldApXQUlUX0ZPUl9SRUFEWSB0aW1lb3V0
IGJhc2VkIG9uIHByb2dyYW0vZXJhc2UgdGltZXMiKQoKdjUuMTc6CiAtIHY1LjE3LjIgYnJva2Vu
IHdpdGggY29tbWl0IDRiMmVlZDFkMWVlOCAoIm10ZDogcmF3bmFuZDogZ3BtaTogZml4CmNvbnRy
b2xsZXIgdGltaW5ncyBzZXR0aW5nIikKICoqKiBzdGlsbCBicm9rZW4gYXMgb2YgdjUuMTcuMTUg
YnV0IGNhbiBiZSBmaXhlZCBieSBjb21taXQKMGZkZGY5YWQwNmZkICgibXRkOiByYXduYW5kOiBn
cG1pOiBTZXQgV0FJVF9GT1JfUkVBRFkgdGltZW91dCBiYXNlZCBvbgpwcm9ncmFtL2VyYXNlIHRp
bWVzIikKCnY1LjE4OgogLSB2NS4xOC1yYzIgYnJva2VuIHdpdGggY29tbWl0IDI5NzBiZjVhMzJm
MCBtdGQ6IHJhd25hbmQ6IGdwbWk6IGZpeApjb250cm9sbGVyIHRpbWluZ3Mgc2V0dGluZwogLSB2
NS4xOC44IGZpeGVkIHdpdGggY29tbWl0IDhkNDViMDVmN2VhZjogKCJtdGQ6IHJhd25hbmQ6IGdw
bWk6IEZpeApzZXR0aW5nIGJ1c3kgdGltZW91dCBzZXR0aW5nIikKIC0gdjUuMTguMTIgYnJva2Vu
IHdpdGggY29tbWl0IGY4ZDAxZTBmMDA0YTogKCJSZXZlcnQgIm10ZDogcmF3bmFuZDoKZ3BtaTog
Rml4IHNldHRpbmcgYnVzeSB0aW1lb3V0IHNldHRpbmciIikKIC0gdjUuMTguMTUgZml4ZWQgd2l0
aCBjb21taXQgYzI4MzIyM2U3NjlkOiAoIm10ZDogcmF3bmFuZDogZ3BtaTogU2V0CldBSVRfRk9S
X1JFQURZIHRpbWVvdXQgYmFzZWQgb24gcHJvZ3JhbS9lcmFzZSB0aW1lcyIpCgp2NS4xOToKLSB2
NS4xOS1yYzMgYnJva2VuIGJ5IGNvbW1pdCAwNjc4MWE1MDI2MzU6ICgibXRkOiByYXduYW5kOiBn
cG1pOiBGaXgKc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0dGluZyIpCi0gdjUuMTktcmM3IGZpeGVk
IGJ5IGNvbW1pdCAwZmRkZjlhZDA2ZmQ6ICgibXRkOiByYXduYW5kOiBncG1pOiBTZXQKV0FJVF9G
T1JfUkVBRFkgdGltZW91dCBiYXNlZCBvbiBwcm9ncmFtL2VyYXNlIHRpbWVzIikKCkJlc3QgUmVn
YXJkcywKClRpbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
