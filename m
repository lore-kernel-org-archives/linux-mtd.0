Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B385EE209F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPVkEJwtG4vfAg1ATDgsSe69snXQccHmtALzfDzCe0I=; b=dHGlgPDOjSkEGs
	rLz8PDOhvAlDrWqJDrndZ3uxuu8+KNnoarK75ACRT/dZD0bLBkffK2a8aQRbVDsadPBOB1Ci/SIAu
	4VPWs5fkPDw5qD5EHtlo9nrFghhMewLBsUshx3dG1mMapoquPnJZ+H6JBLanMuOWdVkMle7O304Zb
	ZjC9rfcJmIgoFSNAi2+hfZYcN8hxs2xwfPgtyHDIKTfTuwUmFJPDTlGo+ouxaT3NgoSepBb3wn2JQ
	QvAHLEDs5E+v1qpqDNg5QCeL+hEcRdo38A1DtULDssoCMbHoeyaTAxN4dWJ2TZoEkVm9pcE4wKJ7U
	6j9Enk8/s6oSxIIHASTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLpV-0000000BMI4-0tW8;
	Fri, 06 Feb 2026 13:25:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLpT-0000000BMHS-14dE
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 13:25:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a94450ae14so5076075ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 05:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770384298; x=1770989098; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=audt1bhzlbWJNu+E4Hs4q9HV/Q+C1B7bvIjnmHdJn3Y=;
        b=dxpyBTj6M6ErmIdNBOd7PvIdMGdS4MjvP3hBj7iwUjc7RX3SvD8lr+KlCRf7nT8udT
         hm1IGYzpJT3M3MosrYrXpkQzNamAjkyc8Qep5rsZF6D7xz8DoXYHcQJiXo+7WPHXJAFW
         Xi7YAevJiOIynL1OaU7YB4sfx9j7g3fsrYvVeDHwb4yLW0DBFF6T+xDLh+F5m9P+SfLM
         +1seWfSfIGq17e7E9I7gsE4BfVeCcsTkDdk8YbbKkF+61sk0TGa9hJ6pT9+vpBXbYjoZ
         2Yi4Npm2MQBVSwDQr+SiyxY97PVAgi4JwA/eaO9Nk0CB++bT2M0j1tkaW/0aJInr0Z/D
         sJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384298; x=1770989098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=audt1bhzlbWJNu+E4Hs4q9HV/Q+C1B7bvIjnmHdJn3Y=;
        b=uuiKliVG85Me5RN7xNTXKL5q7du7zhW3dTGrbfGEh0UVHNx4i+tvuFsLbsjk/MPUtz
         zO7MvoJb0Eh9TJOCBoMPGyG9HYp4GxJLb8iM5nfstZBrbKSsZDFiT7njW5m0MHxEsnke
         UD280ppoUamXw3j5hHU8aREyDCa1tr7YokIy2lk6mL0/PKMurxClT0e1EWf8uJCE2QaK
         N4ezdV4TRL+8w6d0JzvpFSp4O0jPyAhYHR9NnodwdlLdU0VI+7s6CVa26mUmQWPlW/EJ
         lBJgDJ9fqzVrOJMXuGkR9MPx2P1H7gZ5fc2asOBv1BRbM3+lbf6Hx5HVQlae946NSFDw
         287A==
X-Forwarded-Encrypted: i=1; AJvYcCUaagjj3xdDeRCgVs3JyxcnDLaBiQJSU2mS+E5HPl0VuQwtDWG31Lk7ZsChpENjfmSZSXuJChv6PL0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOsI41i5AZm0E/26EYt8/70y8k5DCm9KEQMS3sVV9oY8m2NB02
	Tb8GplS8sDIkJD8zMJaM4bv5IwGWklc7BIgHI0x1Acx4tJWcBuk1TUTf
X-Gm-Gg: AZuq6aKVuuWmkSmVVfdPiAzA2g9i53XUpsx92JBJP0+KeWXM7+9CYZ0dDfTYn84ipxf
	UJP3RFLtj5+mwlRCMFhsztiFbazihOqf2slwAZcSPOkXUoUYVQJmPX4HSHyQp4Q3AraEjg/gifu
	wJ0ilZNkyW2QS1c7pLpWI+jVD13tx034m9UuAgC9ndngyKVsjhDIz5oiePsbZmEEtEqMOKBUSyY
	qUHMQ8FCLu7FF8zxTf4fHGttTeJgbksE2w/14vzt2n99NfTP4u9m/GHjlF53+wnL10ERd6AhsaW
	WxZxkEktjjwsHVdD5v3SKtkeKvmMGCAABk1Ep/DnsygQkcl5BgVCZUifKvb76YpTDKGv1/z/cY8
	WWLtL1j3A5tNY2IdmxpVjspvglFtW5YZ96Jq8+b47h9JHwxVslkXcDKOdRHm5hgb3Y/ugVdVXay
	zAp8FUmEhbQIQMlmh8OEyll5bBTfsZ
X-Received: by 2002:a17:903:984:b0:2a0:c58b:ed6 with SMTP id d9443c01a7336-2a95180f910mr27185555ad.29.1770384298041;
        Fri, 06 Feb 2026 05:24:58 -0800 (PST)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c71edasm25291185ad.22.2026.02.06.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:24:57 -0800 (PST)
Date: Fri, 6 Feb 2026 17:23:44 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: markus.stockhausen@gmx.de
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: realtek-ecc: relax OOB size check to minimum
Message-ID: <aYXrYC06slPu1EUJ@DESKTOP-TIT0J8O.localdomain>
References: <028201dc9759$52e364f0$f8aa2ed0$@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <028201dc9759$52e364f0$f8aa2ed0$@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_052459_295600_FAC8FED2 
X-CRM114-Status: GOOD (  19.47  )
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

T24gRnJpLCBGZWIgMDYsIDIwMjYgYXQgMTI6MTE6MjBQTSArMDEwMCwgbWFya3VzLnN0b2NraGF1
c2VuQGdteC5kZSB3cm90ZToKCkhpIE1hcmt1cywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCj4g
SGkgQWhtZWQsCj4gCj4gdGhhbmtzIGZvciB0aGF0IGZpbmRpbmcuCj4gCj4gPiBWb246IEFobWVk
IE5hc2VlZiA8bmFzZWVma21AZ21haWwuY29tPiAKPiA+IEdlc2VuZGV0OiBGcmVpdGFnLCA2LiBG
ZWJydWFyIDIwMjYgMTE6NTgKPiA+IEJldHJlZmY6IFtQQVRDSF0gbXRkOiBuYW5kOiByZWFsdGVr
LWVjYzogcmVsYXggT09CIHNpemUgY2hlY2sgdG8gbWluaW11bQo+ID4KPiA+IC4uLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEFobWVkIE5hc2VlZiA8bmFzZWVma21AZ21haWwuY29tPgo+ID4gU3Vn
Z2VzdGVkLWJ5OiBNYXJrdXMgU3RvY2toYXVzZW4gPG1hcmt1cy5zdG9ja2hhdXNlbkBnbXguZGU+
Cj4gCj4gSUlSQyB0aGlzIHNob3VsZCBiZSB0aGUgb3RoZXIgd2F5IHJvdW5kLgo+IApDb3VsZCB5
b3UgY2xhcmlmeSB3aGF0IHlvdSBtZWFudCBieSAidGhlIG90aGVyIHdheSByb3VuZCIg4oCUIGRv
IHlvdQptZWFuIHRoZSBvcmRlcmluZyBvZiB0aGUgU3VnZ2VzdGVkLWJ5L1NpZ25lZC1vZmYtYnkg
dGFncywgb3IgdGhlCmF0dHJpYnV0aW9uIGl0c2VsZj8KPiA+IC4uLgo+ID4gICogYXJlIG9ubHkg
dHdvIGtub3duIGRldmljZXMgaW4gdGhlIHdpbGQgdGhhdCBoYXZlIE5BTkQgZmxhc2ggYW5kIG1h
a2UgdXNlIG9mIHRoaXMgRUNDIGVuZ2luZQo+ID4gICogKExpbmtzeXMgTEdTMzI4QyAmIExHUzM1
MkMpLiBUbyBrZWVwIGNvbXBhdGliaWxpdHkgd2l0aCB2ZW5kb3IgZmlybXdhcmUsIG5ldyBtb2Rl
cyBjYW4gb25seQo+IAo+IE5vdyBpdCBpcyBtb3JlIHRoYW4gdGhlc2UgdHdvIGRldmljZXMuIFBs
ZWFzZSBhZGFwdCB0aGUgd2hvbGUgZGVzY3JpcHRpb24gc28gaXQKPiBnaXZlcyBhIGNvbnNpc3Rl
bnQgZXhwbGFuYXRpb24uCj4gClJlZ2FyZGluZyB0aGUgY29tbWVudCBhYm91dCB0aGUgdHdvIGtu
b3duIGRldmljZXMg4oCUIEkgd2FzIHBsYW5uaW5nCnRvIHVwZGF0ZSBpdCB0byBzb21ldGhpbmcg
bGlrZToKCiAgICAqIEl0IGNhbiBydW4gZm9yIGFyYml0cmFyeSBOQU5EIGZsYXNoIGNoaXBzIHdp
dGggZGlmZmVyZW50IGJsb2NrIGFuZCBPT0Igc2l6ZXMuIEN1cnJlbnRseSB0aGVyZQogICAgKiBh
cmUgYSBmZXcga25vd24gZGV2aWNlcyBpbiB0aGUgd2lsZCB0aGF0IGhhdmUgTkFORCBmbGFzaCBh
bmQgbWFrZSB1c2Ugb2YgdGhpcyBFQ0MgZW5naW5lCiAgICAqIChMaW5rc3lzIExHUzMyOEMsIExH
UzM1MkMgJiBOZXRsaW5rIEhHMzIzREFDKS4gVG8ga2VlcCBjb21wYXRpYmlsaXR5IHdpdGggdmVu
ZG9yIGZpcm13YXJlLAogICAgKiBuZXcgbW9kZXMgY2FuIG9ubHkgYmUgYWRkZWQgd2hlbiBuZXcg
ZGF0YSBsYXlvdXRzIGhhdmUgYmVlbiBhbmFseXplZC4gRm9yIG5vdyBhbGxvdyBCQ0g2IG9uCiAg
ICAqIGZsYXNoIHdpdGggMjA0OCBieXRlIGJsb2NrcyBhbmQgYXQgbGVhc3QgNjQgYnl0ZXMgb29i
LlNvbWUgTkFORCBjaGlwcyAoZS5nLiBNYWNyb25peCAKICAgICogTVgzNUxGMUcyNEFEKSBoYXZl
IGEgcGh5c2ljYWwgT09CIHNpemUgb2YgMTI4IGJ5dGVzIGJ1dCB2ZW5kb3IgZmlybXdhcmUgb25s
eSB1c2VzIHRoZSBmaXJzdAogICAgKiA2NCBieXRlcyBmb3IgdGhlIEVDQyBsYXlvdXQuIFRoZSBl
bmdpbmUgb3BlcmF0ZXMgb24gdGhlIGZpcnN0IDY0IGJ5dGVzIG9mIE9PQiBvbmx5OyBhbnkgZXh0
cmEKICAgICogYnl0ZXMgYXJlIHVudXNlZC4KCkRvZXMgdGhhdCBsb29rIHJlYXNvbmFibGUgdG8g
eW91LCBvciB3b3VsZCB5b3UgcHJlZmVyIGEgZGlmZmVyZW50IHdvcmRpbmc/CgpJJ2xsIHNlbmQg
YSB2MiBvbmNlIEkgaGF2ZSB5b3VyIGZlZWRiYWNrLgoKVGhhbmtzLApBaG1lZCBOYXNlZWYKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
