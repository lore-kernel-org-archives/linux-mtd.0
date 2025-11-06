Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D48CCFA03
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEG4SgEetClLbbTnzKzMXPT9gNcENCktFN8hAynaKFc=; b=wHVdQEvTb2QKaw
	4Rs7qMxFry85sLDNhAaxE32W9GqTXTcBCyFgbbsBzN3bTbUUIouIPMGZhCy4zsqedI4HPDKitHDvS
	g+Sk6IqAZMpPw0KQwBcjSORibgJXRk6DHF/ZkSvM+wzc2+OslSq4Ijw991syMuTdBj0SBxYChZ/CM
	lj16+8AfHlVkqrlxofBhV/5R8Yhp4x2wK/an0F69YY92CvGfF67QbPwqrHF9JvV1LTBrLL3hd29ww
	f95R26KqTWcoE50b15YTCSPB0fAbqQP0C7feYNmp2dXhCdCCadllvk3DEzjHMsRSImPYF/eMu1I56
	9oiqv1kiY3U5z3ncQ+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwd5-0000000FCuS-0SiG;
	Thu, 06 Nov 2025 09:50:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwd2-0000000FCtC-0waZ
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 09:50:05 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-34182b1c64bso542461a91.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 01:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762422603; x=1763027403; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuITS4kBtdrE0xOY6fuM1GNDJI0Hyov1YNBt8plbc9A=;
        b=EA77F1aVmYZyWMS/DC111L277vNX8dsBqxqm9S4fysDUgbnqf2x4lDlgNxKzCqQKzW
         IowKf7NF/IVvYWmrHoeDhDHSg0xVfzEUW/KH4eXHEQits3sAJbPWnTEtzQ+RjFw2MoxX
         Mhk8YljXihIll0wUeQlXW5UVThYQaASYw6hfEH2PrTmcWG92w71oHpAPmCj+yDz07xAj
         pEZRqWAtDwag6QHogQ6eSK/wjxo4trPYxOsWvxeQMeKvwMgTNPzElkKa/wkFJo/VIQGM
         gRV4v+4X69p1jDnnJBX0OcUXviy7+W8d4cKQkNxBNTLbsdEKC6Kdt2S+BRAdlvulrgwO
         ok/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762422603; x=1763027403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuITS4kBtdrE0xOY6fuM1GNDJI0Hyov1YNBt8plbc9A=;
        b=s5Rfn5QnFWfcWLBKwyi9doRZ3sViO7Scwsl5pUYcejic3KoMa2n56pySKB+RwUU9yq
         aJV7h1yL5YzPje2zOVRXj27mpdXpGIJ8w9ejHN0+mTjCMFu4XCsb89ytULRkpJMwCrim
         2OydZ1AkXqDGPN7sWSuuHm+T5TONJ9pjz1LlK4PgH55JAcCRfNHjfk+zP6iAS4RgNQqe
         FzVAed6SeCszI1rqUQbJ6JxGRMEpc8EFppCUM2g1xoaktZ8UPNU45694bF7pbvVNl112
         qzDQDEqtzWYqFtNc/VVI5IKV10JZi3Hgut62LRv2LaJtY2IKXFM2icTyDESc5VS9VosB
         An7g==
X-Forwarded-Encrypted: i=1; AJvYcCXDGTpDOvdwGCDAOxtkAQ4dmm0sxJmr9E14aNBBmR/BeV3Pd+AAhLGcR3j5P1OIIkZr1kLgwXIlMu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxweM5OD79butU0Sodu+6Ic+d5+k3mJGdl6CI8/g53iA9lapK6e
	3R5qo4gs149hR3rpu8VB1UJXeW1lFev8jK2dqEWbGrBt3SxDTp0D28gqmYNTKVXXpbX4/RNmEah
	bgjRsT8XuC4gQzeRvuGXeOEMfOQ9k80I=
X-Gm-Gg: ASbGncsUIsNnl6QQdd9XoX133SvuAfKGEIBbfKEaeLh5PgJSSznHkNFIR85q7czcTxc
	UGrrPYR/DUPrwKdm0ONPIYgM2zSH4sQKqCwdkTsaOGy3Q/udH8SEAm9qeQsQUEQS3UpVHvNiAbx
	Lr4YRiKHft2GrmIByivArDQIfnfeeKSJzZf+Mj0HC5b9gxoMBlW41ojLIl04NMDPr1y2zf462Li
	0EecLNvwDhxfZ4TrgxbGTdBYAMNTWLPPL/vgME1NY0XmC0uEzUAUATS+PPZ
X-Google-Smtp-Source: AGHT+IHtTu0aItN7oCpYlQZATPWzMYAFpRwqJjPF19uAoe9o1LjA9xlu2YB532D+sdeX4rZwu4Y297vlJzwmbTz5sNU=
X-Received: by 2002:a17:90b:584d:b0:341:315:f50d with SMTP id
 98e67ed59e1d1-341a6bfb59bmr7314378a91.8.1762422603266; Thu, 06 Nov 2025
 01:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20251106054940.2728641-1-linchengming884@gmail.com>
 <20251106054940.2728641-2-linchengming884@gmail.com> <87o6pf8r24.fsf@bootlin.com>
In-Reply-To: <87o6pf8r24.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 6 Nov 2025 17:45:27 +0800
X-Gm-Features: AWmQ_blxzccAHkkFrG_7m68qvbkNEe1KQA8jfJHjAGe25H_MIaeW4TBvjXhKUes
Message-ID: <CAAyq3Sa=7d6We2xz6bEb_x_zBv+fJwEZuSsfti+S46t3JVo7sw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: ubi: skip programming unused bits in ubi headers
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, chengzhihao1@huawei.com, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_015004_269883_0840ED50 
X-CRM114-Status: GOOD (  33.58  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQxMeaciDbml6Ug6YCx5ZubIOS4i+WNiDU6MTDlr6vpgZPvvJoKPgo+IEhlbGxvLAo+
Cj4gT24gMDYvMTEvMjAyNSBhdCAxMzo0OTo0MCArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVu
Z21pbmc4ODRAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNo
ZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+Cj4gPiBUaGlzIHBhdGNoIHByZXZlbnRzIHVubmVj
ZXNzYXJ5IHByb2dyYW1taW5nIG9mIGJpdHMgaW4gZWNfaGRyIGFuZAo+ID4gdmlkX2hkciB0aGF0
IGFyZSBub3QgdXNlZCBvciByZWFkIGR1cmluZyBub3JtYWwgVUJJIG9wZXJhdGlvbi4gVGhlc2UK
PiA+IHVudXNlZCBiaXRzIGFyZSB0eXBjaWFsbHkgYWxyZWFkeSBzZXQgdG8gMSBpbiBlcmFzZWQg
Zmxhc2ggYW5kIGRvIG5vdAo+ID4gbmVlZCB0byBiZSBleHBsaWNpdGx5IHByb2dyYW1tZWQgdG8g
MCBpZiB0aGV5IGFyZSBub3QgdXNlZC4KPiA+Cj4gPiBQcm9ncmFtbWluZyBzdWNoIHVudXNlZCBh
cmVhcyBvZmZlcnMgbm8gZnVuY3Rpb25hbCBiZW5lZml0IGFuZCBtYXkKPiA+IHJlc3VsdCBpbiB1
bm5lY2Vzc2FyeSBmbGFzaCB3ZWFyLCByZWR1Y2luZyB0aGUgb3ZlcmFsbCBsaWZldGltZSBvZiB0
aGUKPiA+IGRldmljZS4gQnkgc2tpcHBpbmcgdGhlc2Ugd3JpdGVzLCB3ZSBwcmVzZXJ2ZSB0aGUg
Zmxhc2ggc3RhdGUgYXMgbXVjaCBhcwo+ID4gcG9zc2libGUgYW5kIG1pbmltaXplIHdlYXIgY2F1
c2VkIGJ5IHJlZHVuZGFudCBvcGVyYXRpb25zLgo+ID4KPiA+IFRoaXMgY2hhbmdlIGVuc3VyZXMg
dGhhdCBvbmx5IG5lY2Vzc2FyeSBmaWVsZHMgYXJlIHdyaXR0ZW4gd2hlbiBwcmVwYXJpbmcKPiA+
IFVCSSBoZWFkZXJzLCBpbXByb3ZpbmcgZmxhc2ggZWZmaWNpZW5jeSB3aXRob3V0IGFmZmVjdGlu
ZyBmdW5jdGlvbmFsaXR5Lgo+ID4KPiA+IEFkZGl0aW9uYWxseSwgdGhlIEtpb3hpYSBUQzU4TlZH
MVMzSFRBMDAgZGF0YXNoZWV0IChwYWdlIDYzKSBhbHNvIG5vdGVzCj4gPiB0aGF0IGNvbnRpbnVv
dXMgcHJvZ3JhbS9lcmFzZSBjeWNsaW5nIHdpdGggYSBoaWdoIHBlcmNlbnRhZ2Ugb2YgJzAnIGJp
dHMKPiA+IGluIHRoZSBkYXRhIHBhdHRlcm4gY2FuIGFjY2VsZXJhdGUgYmxvY2sgZW5kdXJhbmNl
IGRlZ3JhZGF0aW9uLgo+ID4gVGhpcyBmdXJ0aGVyIHN1cHBvcnRzIGF2b2lkaW5nIGxhcmdlIDB4
MDAgcGF0dGVybnMuCj4gPgo+ID4gTGluazogaHR0cHM6Ly9ldXJvcGUua2lveGlhLmNvbS9jb250
ZW50L2RhbS9raW94aWEvbmV3aWRyL3Byb2R1Y3RpbmZvL2RhdGFzaGVldC8yMDE5MTAvRFNUX1RD
NThOVkcxUzNIVEEwMC1UREVfRU5fMzE0NDIucGRmCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hl
bmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPgo+IFRoYW5rcyBmb3IgdGhp
cyB2ZXJ5IGNsZWFyIGFuZCBkZXRhaWxlZCBjb21taXQgbG9nLCBhcyB3ZWxsIGFzIGZvciB0aGUK
PiB3ZWxsIHdyaXR0ZW4gY292ZXIgbGV0dGVyLiBJIGFtIHBlcnNvbmFsbHkgZmluZSB3aXRoIHRo
ZSBvdmVyYWxsIGlkZWEgb2YKPiBjbGVhcmluZyB0aGVzZSB1bnVzZWQgYml0cyB0byAxLiBZZXQs
IEkgaGF2ZSBvbmUgY29uY2VybiByZWdhcmRpbmcgdGhlCj4gaW1wbGVtZW50YXRpb24sIHBsZWFz
ZSBzZWUgYmVsb3cuCj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3ViaS9pby5jIHwgNyArKysr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC91YmkvaW8uYyBiL2RyaXZlcnMvbXRkL3ViaS9pby5jCj4gPiBpbmRl
eCBhNDk5OWJjZTQuLmMyMTI0MmExNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9p
by5jCj4gPiArKysgYi9kcml2ZXJzL210ZC91YmkvaW8uYwo+ID4gQEAgLTg2OCw2ICs4NjgsOCBA
QCBpbnQgdWJpX2lvX3dyaXRlX2VjX2hkcihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51
bSwKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FUk9GUzsKPiA+ICAgICAgIH0KPiA+Cj4gPiAr
ICAgICBtZW1zZXQoKGNoYXIgKillY19oZHIgKyBVQklfRUNfSERSX1NJWkUsIDB4RkYsIHViaS0+
ZWNfaGRyX2Fsc2l6ZSAtIFVCSV9FQ19IRFJfU0laRSk7Cj4gPiArCj4gPiAgICAgICBlcnIgPSB1
YmlfaW9fd3JpdGUodWJpLCBlY19oZHIsIHBudW0sIDAsIHViaS0+ZWNfaGRyX2Fsc2l6ZSk7Cj4g
PiAgICAgICByZXR1cm4gZXJyOwo+ID4gIH0KPiA+IEBAIC0xMTUwLDYgKzExNTIsMTEgQEAgaW50
IHViaV9pb193cml0ZV92aWRfaGRyKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtLAo+
ID4gICAgICAgICAgICAgICByZXR1cm4gLUVST0ZTOwo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAg
IGlmICh1YmktPnZpZF9oZHJfc2hpZnQpCj4gPiArICAgICAgICAgICAgIG1lbXNldCgoY2hhciAq
KXAsIDB4RkYsIHViaS0+dmlkX2hkcl9hbHNpemUgLSBVQklfVklEX0hEUl9TSVpFKTsKPiA+ICsg
ICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgbWVtc2V0KChjaGFyICopcCArIFVCSV9WSURfSERS
X1NJWkUsIDB4RkYsIHViaS0+dmlkX2hkcl9hbHNpemUgLSBVQklfVklEX0hEUl9TSVpFKTsKPgo+
IEhlcmUgSSBhbSByZWFjaGluZyB0aGUgbGltaXRzIG9mIG15IFVCSSBrbm93bGVkZ2UsIHNvIEkg
d291bGQgcHJlZmVyCj4gUmljaGFyZCB0byAoaW4pdmFsaWRhdGUgd2hhdCBJIGFtIHNheWluZywg
YnV0IEFGQUlVLCB0aGUgVklEIGhlYWRlciBjYW4KPiBiZSBsaXRlcmFsbHkgYW55d2hlcmUgaW4g
dGhlIHBhZ2UsIG5vdCBqdXN0IGF0IHRoZSBzdGFydCBvciBlbmQgb2YgYQo+IHN1YnBhZ2UsIHNv
IGluIHRoZSB2aWRfaGRyX3NoaWZ0IEkgd291bGQgZXhwZWN0IHNvbWUgZXh0cmEgbWF0aHMgdG8K
PiBoYXBwZW4sIG5vPwo+Cj4gSGVyZSBpcyBhbiBleGNlcnB0IG9mIHRoZSBtYWluIGNvbW1lbnQg
YXQgdGhlIHRvcCBvZiB0aGUgaW8uYyBmaWxlOgo+Cj4gICAgICogQXMgaXQgd2FzIG5vdGVkIGFi
b3ZlLCB0aGUgVklEIGhlYWRlciBtYXkgc3RhcnQgYXQgYSBub24tYWxpZ25lZAo+ICAgICAqIG9m
ZnNldC4gRm9yIGV4YW1wbGUsIGluIGNhc2Ugb2YgYSAyS2lCIHBhZ2UgTkFORCBmbGFzaCB3aXRo
IGEgNTEyCj4gICAgICogYnl0ZXMgc3ViLXBhZ2UsIHRoZSBWSUQgaGVhZGVyIG1heSByZXNpZGUg
YXQgb2Zmc2V0IDE5ODQgd2hpY2ggaXMKPiAgICAgKiB0aGUgbGFzdCA2NCBieXRlcyBvZiB0aGUg
KiBsYXN0IHN1Yi1wYWdlIChFQyBoZWFkZXIgaXMgYWx3YXlzIGF0Cj4gICAgICogb2Zmc2V0IHpl
cm8pLgo+CgpIZXJlIEkgd2FzIGNvbnNpZGVyaW5nIHRoZSBjb21tZW50IGluIGlvLmMsIGFuZCBh
bHNvIHRoZSBkZWZpbml0aW9ucyBpbgp1YmkuaCwgd2hpY2ggc2F5OgoKICogQHZpZF9oZHJfb2Zm
c2V0OiBzdGFydGluZyBvZmZzZXQgb2YgdGhlIHZvbHVtZSBpZGVudGlmaWVyIGhlYWRlciAobWln
aHQKICogICAgICAgICAgICAgICAgICBiZSB1bmFsaWduZWQpCiAqIEB2aWRfaGRyX2Fsb2Zmc2V0
OiBzdGFydGluZyBvZmZzZXQgb2YgdGhlIFZJRCBoZWFkZXIgYWxpZ25lZCB0bwogKiAgICAgICAg
ICAgICAgICAgICAgQGhkcnNfbWluX2lvX3NpemUKICogQHZpZF9oZHJfc2hpZnQ6IGNvbnRhaW5z
IEB2aWRfaGRyX29mZnNldCAtIEB2aWRfaGRyX2Fsb2Zmc2V0CgpTbywgaWYgdWJpLT52aWRfaGRy
X3NoaWZ0IGlzIG5vbi16ZXJvLCB0aGVuIHRoZSBWSUQgaGVhZGVyIGlzIG5vdCBsb2NhdGVkCmF0
IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHN1YnBhZ2UuIEluIHRoaXMgY2FzZSwgd2UgZmlsbCAweEZG
IGZyb20gdGhlIHN0YXJ0Cm9mIHRoZSBidWZmZXIgdW50aWwgdGhlIGFjdHVhbCB2aWRfaGRyX3N0
YXJ0LgoKSWYgdWJpLT52aWRfaGRyX3NoaWZ0IGlzIHplcm8sIHRoZW4gdGhlIFZJRCBoZWFkZXIg
aXMgYWxyZWFkeSBwbGFjZWQgYXQKdGhlIGJlZ2lubmluZyBvZiB0aGUgc3VicGFnZS4gVGhlbiB3
ZSBmaWxsIDB4RkYgb25seSBhZnRlciB0aGUgaGVhZGVyCnJlZ2lvbiBpbiB0aGUgYnVmZmVyLgoK
PiBJIGFtIG5vdCBzdXJlIHRoaXMgaXMgc3VwZXIgY29tbW9uIHRvZGF5IHRob3VnaC4KPgo+IFRo
YW5rcywKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
