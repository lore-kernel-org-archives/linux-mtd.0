Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22977E7716B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ostupS03XHeTJnXRuh32MxNcUxtwh4/0lBBG80dxi5U=; b=GT/2ZeHMCKzpx1
	ThMzMgUQ5OuAUb/0N/ni8mqJvdobYyOnaL6465VXkQi3DNzKc+FEGaVEogu0V7vTLfP2xlb/tkbtY
	I5NaBGdpwyX46DOkTXjg5AO48Sppqhu6Ba/Ek4Zx9ySHHHzmV9rZErB3Slx2GfAV2+vBpJwge/RBT
	7EW2Gz1yV9uj0trngEAVQ7tdUm9O7TPY5K2G8JqiyKR9AfNfIQklWijeuLBlC1bVhVMhsXZVC7ijI
	ram8uIxOWtaTGachpO3qP16juIciH+4QwnpweG1V2IbERo5fLQx6YU+0I2d2ofOKsTPXOvpaxB6zS
	IvV52zGkG2GTut8LagGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIm9k-0000000C81Y-1BWa;
	Wed, 04 Dec 2024 09:58:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIm9h-0000000C818-1S3r
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 09:58:50 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa531a70416so413557066b.0
        for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2024 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733306327; x=1733911127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MouHXQtNCaAsuF0SN6e6HpsGguY/Y4bmGgPG3F9d7Hw=;
        b=CuRa5TjA3BFYdvFbf3oB0Up22HR2XoxnEhDYaSv+QBE8ImhHO2eFx+Fbfj9IVUQcNA
         ojGJDv+gCE1XA1R0e3QDN6m4dvdrk4hzxg8NfOsUI2Ictd3sOOIaCxfLMM9vCbSRjLhA
         0r4QlCV/f2+/mjkaxEgdpgLvYPT2Y8ya4DsS06C4prhyfDYruug/I/PXPZxWc/HZDtwg
         GNIhIJoC2fNqNUQzt2nClT8aYGqRXgm0oESHCHXhVCr8BjGjB3C+XfWlszi1cHFrIfVX
         gumpFDHVDiP+jV64VuhonGBLU5TvCYWS9U9Uo04bz6bZw/KO4w8thibksKp4cgN15Hbi
         xnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733306327; x=1733911127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MouHXQtNCaAsuF0SN6e6HpsGguY/Y4bmGgPG3F9d7Hw=;
        b=EeLR/lyAxR8D30Y1X6obenCcxiCGl/YDPf7LTmdhTfFVzphKe3TA0R4YgPHPeC9Wo3
         qVQmO1gFfpVv7LdGDNqHnzQSW6WauuIWdSNlnnw79v0Cb5OnHOFndToRtQkeRqyvOWBh
         5EGVEzSOQmv4rqa6Gr3n2/ApbHz1A6VPOy8u7flxxnOSBobL0SPu43nMrvYH7Zak6K64
         kTM3TRPyJ4Dyarv+OM3IRgs6Srn6R4GMvDnXwmQsrJOLNI8ZPvGOYN6Kn8oVbgYIxYUr
         hhtV4aQnpxgqS9CdtnhpSRwLZbt4fqs2L+TQ1vVVMiTQtEenki3G65YH+jBhyMYC2los
         Ybdw==
X-Forwarded-Encrypted: i=1; AJvYcCVPjNFMinYxcNEQCduUtuKftsfV/srHtpXdQjPysmXFE4y2rODrtdOP25K/H1VhBJIZuS6nflMTqbQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5qjjavSh7hGdn6vhnrHUNOuvrQRDLtrnJ2gpld3GY7i0p/Nhy
	05vE33XlrgTReimnnSbVVH29kDGjuYZI/N4Hbg/WbUVQwKjn0N5h9PSw1OtLfpczNVXENQ94BjM
	MMl+DhroltpMUNBHmSTohvYVOe00=
X-Gm-Gg: ASbGncsAdGD/CoHObUqt5mOYID1KmK36rhdsCEhiFtoM0oP1BbGiRkX/LZdEB8bLgxd
	Y9Ef23Cs2OkHjpifLNYO1bvtcENeot6F4FQ==
X-Google-Smtp-Source: AGHT+IF71UT/V7lY/zgb2nneDIgnWNe9aquIUB4pgtTNjsFfQsOeEBJ6i9HFgX2W+LlGyHQiF7wXnJ1F9OCyaqv199g=
X-Received: by 2002:a05:6402:34d4:b0:5cf:f361:1c11 with SMTP id
 4fb4d7f45d1cf-5d10cb5c7c7mr5552224a12.20.1733306326713; Wed, 04 Dec 2024
 01:58:46 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
 <CAOuPNLhhWzoBQH85zEd95LbONtrknq+b7tfcze50VPa9bEnXzw@mail.gmail.com>
 <87ldww4zrx.fsf@bootlin.com> <342000380.28770675.1733242094522.JavaMail.zimbra@nod.at>
In-Reply-To: <342000380.28770675.1733242094522.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 4 Dec 2024 15:28:34 +0530
Message-ID: <CAOuPNLhZZ1rs3Hhuwh2b3HLaqrAVUY7YwviQVUXgVi6XTZxnMw@mail.gmail.com>
Subject: Re: Block based OTA update needs mtdblock
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_015849_403550_097AB259 
X-CRM114-Status: GOOD (  26.23  )
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

SGVsbG8gUmljaGFyZCwKCk9uIFR1ZSwgMyBEZWMgMjAyNCBhdCAyMTozOCwgUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBN
YWlsIC0tLS0tCj4gPiBWb246ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPiA+IEFuOiAiUGludHUgQWdhcndhbCIgPHBpbnR1LnBpbmdAZ21haWwuY29tPgo+ID4g
Q0M6ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZp
Z25lc2hyQHRpLmNvbT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9y
Zz4sCj4gPiAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+LCAibGludXgt
a2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiA+IEdlc2VuZGV0OiBEaWVu
c3RhZywgMy4gRGV6ZW1iZXIgMjAyNCAxNToxNzowNgo+ID4gQmV0cmVmZjogUmU6IEJsb2NrIGJh
c2VkIE9UQSB1cGRhdGUgbmVlZHMgbXRkYmxvY2sKPgo+ID4gSGVsbG8sCj4gPgo+ID4gT24gMjAv
MTEvMjAyNCBhdCAxMjo1Mjo1NyArMDUzMCwgUGludHUgQWdhcndhbCA8cGludHUucGluZ0BnbWFp
bC5jb20+IHdyb3RlOgo+ID4KPiA+PiBIaSwKPiA+Pgo+ID4+IE9uIE1vbiwgNCBOb3YgMjAyNCBh
dCAyMTozMSwgUGludHUgQWdhcndhbCA8cGludHUucGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+
Pgo+ID4+PiBIaSBBbGwsCj4gPj4+Cj4gPj4+IEZvciBvbmUgb2Ygb3VyIGF1dG9tb3RpdmUgcHJv
ZHVjdHMgd2UgaGF2ZSB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRpb246Cj4gPj4+IFFDIGNoaXBz
ZXQsIGFybTY0LCBLZXJuZWwtNS4xNSwgTkFORCBGbGFzaCAxR0IsIEEvQiBzeXN0ZW0sIFVCSQo+
ID4+PiB2b2x1bWVzIChzcXVhc2hmcywgdWJpZnMpLCBETS12ZXJpdHkgZm9yIHJvb3RmcyAoc3F1
YXNoZnMpLCBzaW1wbGUKPiA+Pj4gYnVzeWJveCBwbGF0Zm9ybS4KPiA+Pj4KPiA+Pj4gRm9yIE9U
QSB1cGRhdGVzIHdlIGhhdmUgYSBzdHJvbmcgZGVwZW5kZW5jeSB3aXRoIE1URF9CTE9DSy4KPiA+
Pj4KPiA+Pj4gVGlsbCBub3csIHdlIHdlcmUgdXNpbmcgdWJpYmxvY2sgZm9yIG1vdW50aW5nIHNx
dWFzaGZzIHZvbHVtZXMgYW5kCj4gPj4+IGNvbXBsZXRlbHkgZ290IHJpZCBvZiBtdGRfYmxvY2sg
YnkgY29uZmlndXJpbmcgaXQgYXMgYSBsb2FkYWJsZQo+ID4+PiBtb2R1bGUuCj4gPj4+IEJ1dCwg
d2UgYWxzbyBuZWVkIHRvIHN1cHBvcnQgT1RBIHVwZGF0ZXMgKEZ1bGwsIEluY3JlbWVudGFsKSBv
biBBL0IKPiA+Pj4gdm9sdW1lcyB1c2luZyB0aGUgc2FtZSBBbmRyb2lkIE9UQSBmcmFtZXdvcmsu
Cj4gPj4+IGh0dHBzOi8vc291cmNlLmFuZHJvaWQuY29tL2RvY3MvY29yZS9vdGEvbm9uYWIvYmxv
Y2sKPiA+Pj4KPiA+Pj4gT1RBIHVwZGF0ZSB3aWxsIGJlIGFwcGxpZWQgdG8gdGhlIEIgKGluYWN0
aXZlKSBwYXJ0aXRpb24uCj4gPj4+IE9UQSB1cGRhdGVzIHByZWZlciBibG9jayBiYXNlZCB1cGRh
dGUgb3ZlciBmaWxlIGJhc2VkIGVzcGVjaWFsbHkgZm9yCj4gPj4+IGRtLXZlcml0eSBlbmFibGVk
IGRldmljZXMuCj4gPj4+Cj4gPj4+IE5vdywgdGhlIHByb2JsZW0gaXMsIG9uIE1URCB3ZSBvbmx5
IGhhdmUgMiBvcHRpb25zIGZvciBibG9jayBiYXNlZAo+ID4+PiB1cGRhdGVzOyB1YmlfYmxvY2sg
b3IgbXRkX2Jsb2NrLgo+ID4+PiBXZSBjYW5ub3QgdXNlIHViaWJsb2NrIGZvciBPVEEgdXBkYXRl
cyBhcyBpdCBpcyByZWFkIG9ubHkuCj4gPj4+IEZvciBmdWxsIHVwZGF0ZSB2b2x1bWUsIHdlIGNh
biB1c2UgInViaXVwZGF0ZXZvbCIgaW50ZXJmYWNlIHRvCj4gPj4+IGNvbXBsZXRlbHkgcmVwbGFj
ZSB0aGUgdm9sdW1lIGNvbnRlbnQsIGJ1dCBmb3IgcGFydGlhbCBvciBpbmNyZW1lbnRhbAo+ID4+
PiB1cGRhdGUgd2UgbmVlZCB0byB1cGRhdGUgb25seSBzcGVjaWZpYyBibG9ja3MgYW5kIG5vdCBl
bnRpcmUKPiA+Pj4gcGFydGl0aW9ucy4KPiA+Pj4gVGh1cywgd2UgaGF2ZSB0byB1c2UgdGhlIE1U
RF9CTE9DSyAoL2Rldi9tdGRibG9jaykgaW50ZXJmYWNlIHRvCj4gPj4+IHN1cHBvcnQgYmxvY2sg
YmFzZWQgT1RBIHVwZGF0ZXMgb24gVUJJIHZvbHVtZXMuCj4gPj4+IFRodXMsIGR1cmluZyBvdGEg
dXBkYXRlcyAob25seSkgd2UgbmVlZCB0byBpbnN0YWxsIHRoZSBtdGRibG9jawo+ID4+PiBtb2R1
bGUsIHBlcmZvcm0gdGhlIHVwZGF0ZSBhbmQgdGhlbiB1bmluc3RhbGwgdGhlIG1vZHVsZS4KPiA+
Pj4KPiA+Pj4gVGhhdCBtZWFucywgd2UgY2Fubm90IGNvbXBsZXRlbHkgZ2V0IHJpZCBvZiBNVERf
QkxPQ0sgZnJvbSBvdXIgcHJvZHVjdAo+ID4+PiBlc3BlY2lhbGx5IGZvciBPVEEgdXNlIGNhc2Vz
Lgo+ID4+Pgo+ID4+PiBJcyB0aGlzIHRoZSBvbmx5IHdheSwgb3IgZG8gd2UgaGF2ZSBhbnkgb3Ro
ZXIgb3B0aW9uIHRvIHN1cHBvcnQgT1RBCj4gPj4+IHVwZGF0ZXMgb3ZlciBVQkkgdm9sdW1lcyA/
Cj4gPj4+Cj4gPj4gUmVzdGFydGluZyB0aGlzIHRocmVhZCBhZ2Fpbi4uLgo+ID4+IEFueSBmdXJ0
aGVyIGNvbW1lbnQgb24gdGhpcyA/Cj4gPj4KPiA+PiBEaWQgYW55Ym9keSB1c2VkIGJsb2NrIGJh
c2VkIE9UQSB1cGRhdGUgTkFORCBBL0Igc3lzdGVtIHdpdGhvdXQgdXNpbmcKPiA+PiBtdGRfYmxv
Y2sgPwo+ID4KPiA+IE5vdCBvbiBteSBzaWRlLCBpdCBpcyBhY3R1YWxseSBhIGdvb2QgcXVlc3Rp
b24uIFJpY2hhcmQsIGFueSBpZGVhcz8KPgo+IFdoYXQgYWJvdXQgdXNpbmcgdWJpdXBkYXRldm9s
Pwo+CkFzIEkgZXhwbGFpbmVkIGFib3ZlLCB1Yml1cGRhdGV2b2wgYWN0dWFsbHkgcGVyZm9ybXMg
YSBmdWxsIHZvbHVtZQp1cGRhdGUsIHJpZ2h0ID8KSSB0aGluayB0aGUgcGFydGlhbC9pbmNyZW1l
bnRhbCB1cGRhdGUgaXMgbm90IHBvc3NpYmxlIHdpdGggdGhpcy4gT25jZQp0aGUgdXBkYXRlIGlz
IHRyaWdnZXJlZCBpdCBzaG91bGQgZmluaXNoIGZ1bGx5LgpCdXQgZm9yIE9UQSB1cGRhdGVzIChE
ZWx0YS9JbmNyZW1lbnRhbCksIG9ubHkgdGhlIGRlbHRhIGNoYW5nZXMgY2FuCmFsc28gYmUgYXBw
bGllZC4KUGxlYXNlIHJlZmVyIHRvIHRoaXMgWzFdIGFib3V0IHVwZGF0ZXMgbWVjaGFuaXNtLgpb
MV0gaHR0cHM6Ly9tZWRpdW0uY29tL0B5aWdpdHBpcmlsZGFrL2FuZHJvaWQtb3RhLXVwZGF0ZS1t
ZWNoYW5pc20tZWNjOGY2ZjY5ZjcxClsyXSBodHRwczovL3NvdXJjZS5hbmRyb2lkLmNvbS9kb2Nz
L2NvcmUvb3RhL3Rvb2xzIzp+OnRleHQ9QW4lMjBpbmNyZW1lbnRhbCUyMHVwZGF0ZSUyMGlzJTIw
YW4sbmVlZCUyMHRvJTIwaW5jbHVkZSUyMHVuY2hhbmdlZCUyMGZpbGVzLgoKT24gb3VyIE5BTkQg
dGFyZ2V0IHdlIHN1cHBvcnQgT1RBIHVwZGF0ZXMsIGluY2x1ZGluZyBpbmNyZW1lbnRhbCBvdGEg
dXBkYXRlcy4KQnV0IHdpdGhvdXQgbXRkYmxvY2sgdGhlIGluY3JlbWVudGFsIE9UQSB1cGRhdGUg
KG9uIEEvQiBzeXN0ZW0pIHdpbGwgbm90IHdvcmsuClRoaXMgaXMgdGhlIG1haW4gaXNzdWUuCkZv
ciBmdWxsIHVwZGF0ZXMgb24gdWJpIHZvbHVtZXMgd2UgYXJlIGFscmVhZHkgdXNpbmcgdGhlCiJ1
Yml1cGRhdGV2b2wiIG1lY2hhbmlzbS4KCgpUaGFua3MsClBpbnR1CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
