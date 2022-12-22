Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F65C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Dec 2022 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfbCcGQ8086BvnAUgcLVGXgdzBiiJT3D+lTBE7VZ3Nc=; b=kY4DWdodu87F73
	hB1jxDqeQF9OMUNHfHMW6rJ3CRBLVjD03/9KlPNEag3AMrNETWhp8+HJ6H4so+z5IJ9/PRsYD+cwe
	Yc0yuA/laoL4tT3CqBVs+B67G5x8u0QNAqfp63rAi/kp9K1rVQBzcOba+DhH/VjW6VdGdh5cOQoz6
	ue64uwnpJA6WqYcVvsvWDjqMLvpYZ6VpJYO+l0WasNRdBxS+Xr9NRxL758mrmuT4fxROgfqRe8LUU
	Iu/bA7m+RP6yN+SosQIT72L899ikMeibiN2i7gJMqfyFhJUyt62f9KQk5iH893pJ/Nb3LzUji+tUG
	4QivzEBptIXv/Tyb79Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ItT-00AMNS-Jo; Thu, 22 Dec 2022 10:33:44 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Iso-00AM2T-HM
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2022 10:33:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id fy4so1525868pjb.0
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+/odhs+tvELqXvHFaH9zPDEa8WFFPLlMN7XXzBxHKk=;
        b=hVXC4cI/AjuF4Hoe7hfniLfdY7cw1WoJhl6nwrbExNPr4otsaj2gfDTOMiWPm5wuSv
         H2dtaO2wV62LkejqHO3d/21FCQajo/v53P4YODBUudkCkZVdQkUYZatpWA4ZTAX96HsK
         FaHbgCCNOlSmG74jTY/pHJKYJAo1JvC7mTvRKYJgO1Y4ZExbq+cQ16stIEgCtZCp6phQ
         b+ijyIpUkUBQ/uPsiJ/tZCriGosVBl0UCKWUjz+xeDgxXPJua/UKVGL0MO/FR1hy2lix
         sok9PYSdzZPGzJ/H2p/6SlXtQEX2OjCtEQkkmiZyjkl2xI+VRHLBolA3MNXYNu06i4vb
         fpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+/odhs+tvELqXvHFaH9zPDEa8WFFPLlMN7XXzBxHKk=;
        b=mWhqrbeNfyPbpD7URnXpTPzgAelseleO4XxG6ecKj179lfQNeJqOs5QFIJEFBk2ztH
         lxseiYxriSCGyK5I/fxuukt5Pajy+KBnkfEhFWwipzVOwbIychsEizwWJxpDKnjtAjYY
         qap9QNTMbFHjb74J/8FH7M0+yKHnB01Np3KIw3fYhcgVe/bWj7Ws658OC8IjCpElKm0M
         jCs78d7tUrM7BD+m8jLxljFIwXkLfD6IFhR31wFJP3Tg44yMzf8hc+njsgGajuodq1tl
         4c0RmKUAQWHzEORMVv+uofTCB3lN8S/4oTvtCPmpbsL7rqBf/T+W3fvcndDQK1ey00qJ
         x24w==
X-Gm-Message-State: AFqh2koh8+J7LP75kKnppQJoo+o6Ug99Nh0rWWIHhNBmUeZNRYC0pKkl
	eVN5jZNrScu/wWLoUdDLi8o=
X-Google-Smtp-Source: AMrXdXsQj3KT2svCwV4FyGmgw11Sm3A6+HwERq/I/eGo4NuklylsdbN+28+OxI7U0snfGfOmB1IKag==
X-Received: by 2002:a17:902:e801:b0:190:d283:7faf with SMTP id u1-20020a170902e80100b00190d2837fafmr7302327plg.13.1671705179566;
        Thu, 22 Dec 2022 02:32:59 -0800 (PST)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm188023plg.151.2022.12.22.02.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 02:32:59 -0800 (PST)
Message-ID: <50928382-4d0a-ae23-32d1-5c6764b24c59@gmail.com>
Date: Thu, 22 Dec 2022 19:32:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for Infineon
 S25FS256T
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20221219015509.15075-1-Takahiro.Kuwano@infineon.com>
 <511703b7a86075387b5bf07434077724@walle.cc>
 <5f6ec3f7-9d5d-dbb5-2e16-6ea0e6fafe6e@gmail.com>
 <f90b6ebb056c8eb3ec419f1b137762a9@walle.cc>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <f90b6ebb056c8eb3ec419f1b137762a9@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_023302_825333_1451F369 
X-CRM114-Status: GOOD (  31.04  )
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

T24gMTIvMjAvMjAyMiA3OjAxIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjItMTIt
MjAgMDk6MzEsIHNjaHJpZWIgVGFrYWhpcm8gS3V3YW5vOgo+IAo+IAo+Pj4+ICtzdGF0aWMgaW50
Cj4+Pj4gK3MyNWZzMjU2dF9wb3N0X2JmcHRfZml4dXAoc3RydWN0IHNwaV9ub3IgKm5vciwKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHNmZHBfcGFyYW1ldGVy
X2hlYWRlciAqYmZwdF9oZWFkZXIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnN0IHN0cnVjdCBzZmRwX2JmcHQgKmJmcHQpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHN0cnVjdCBz
cGlfbWVtX29wIG9wOwo+Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+PiArCj4+Pj4gK8KgwqDCoCAv
KiA0LWJ5dGUgYWRkcmVzcyBtb2RlIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCAqLwo+Pj4+ICvCoMKg
wqAgbm9yLT5wYXJhbXMtPmFkZHJfbW9kZV9uYnl0ZXMgPSA0Owo+Pj4KPj4+IFNob3VsZG4ndCB0
aGlzIGFscmVhZHkgYmUgc2V0IGluIHNwaV9ub3JfcGFyc2VfNGJhaXQoKT8KPj4+Cj4+IE5vLCBw
YXJhbXMtPmFkZHJfbW9kZV9uYnl0ZXMgaXMgaW5pdGlhbGl6ZWQgaW4gc3BpX25vcl9wYXJzZV9i
ZnB0KCkuCj4+IEluIHNwaV9ub3JfcGFyc2VfNGJhaXQoKSwgcGFyYW1zLT5hZGRyX25ieXRlcyBp
cyBzZXQgdG8gNC4KPiAKPiBBaCByaWdodCwgbXkgYmFkLiBJbiBhbnkgY2FzZSwgc2hvdWxkbid0
IHRoaXMgcmVhZCB0aGUgYWN0dWFsCj4gbW9kZSBmcm9tIHRoZSBmbGFzaCBnaXZlbiB0aGF0IHRo
aXMgaXMgYSBub24tdm9sYXRpbGUgc2V0dGluZz8KPiAKVG8gcmVhZCBvdXQgY3VycmVudCBhZGRy
ZXNzIG1vZGUsIHdlIG5lZWQgdG8gaXNzdWUgUmVhZCBBbnkgUmVnIHdpdGggY29ycmVjdAphZGRy
ZXNzIGxlbmd0aCAoY2hpY2tlbi1hbmQtZWdnKS4KClBsZWFzZSByZWZlciB0byBjb21taXQgZGVz
Y3JpcHRpb24gaW46Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1t
dGQvcGF0Y2gvMjAyMjA3MjUwOTI1MDUuNDQ2MzE1LTYtdHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAu
Y29tLwoKQW5kIGRpc2N1c3Npb24gYWJvdXQgYWRkcmVzcyBtb2RlIGRpc2NvdmVyeToKaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC9lNDdlZDBhYTNl
MWE2ZmRjYTc2ODk0MzRjZTdkZWE5OWZmNDgyNmU3LjE2NTk3NjQ4NDguZ2l0LlRha2FoaXJvLkt1
d2Fub0BpbmZpbmVvbi5jb20vCgpVbmZvcnR1bmF0ZWx5LCB0aGlzIGRldmljZSBkb2VzIG5vdCBz
dXBwb3J0IENSQy4uLgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgt
bXRkL3BhdGNoLzUzZDM3ZWVhZDliZGQwOTc0NGFmNTU1YjkzMzgxYWY0Nzc2NDNhNDYuMTY2MDI5
MTI4MS5naXQuVGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbS8KClVudGlsIHdlIGRldmVsb3Ag
Z29vZCBzb2x1dGlvbiwgSSB3b3VsZCByZWx5IG9uIGZhY3RvcnkgZGVmYXVsdCBzZXR0aW5nLgoK
Pj4+PiArc3RhdGljIHZvaWQgczI1ZnMyNTZ0X3Bvc3Rfc2ZkcF9maXh1cChzdHJ1Y3Qgc3BpX25v
ciAqbm9yKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0
ZXIgKnBhcmFtcyA9IG5vci0+cGFyYW1zOwo+Pj4+ICsKPj4+PiArwqDCoMKgIC8qCj4+Pj4gK8Kg
wqDCoMKgICogUkVBRF9GQVNUIGlzIG9taXR0ZWQgaW4gNEJBSVQgcGFyc2Ugc2luY2UgT1BfUkVB
RF9GQVNUXzRCKDBDaCkgaXMgbm90Cj4+Pj4gK8KgwqDCoMKgICogc3VwcG9ydGVkLiBFbmFibGUg
T1BfUkVBRF9GQVNUKDBCaCkgdGhhdCBjYW4gd29yayBpbiA0LWJ5dGUgYWRkcmVzcwo+Pj4+ICvC
oMKgwqDCoCAqIG1vZGUuCj4+Pj4gK8KgwqDCoMKgICovCj4+Pj4gK8KgwqDCoCBwYXJhbXMtPmh3
Y2Fwcy5tYXNrIHw9IFNOT1JfSFdDQVBTX1JFQURfRkFTVDsKPj4+PiArwqDCoMKgIHNwaV9ub3Jf
c2V0X3JlYWRfc2V0dGluZ3MoJnBhcmFtcy0+cmVhZHNbU05PUl9DTURfUkVBRF9GQVNUXSwgMCwg
OCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElOT1JfT1BfUkVB
RF9GQVNULCBTTk9SX1BST1RPXzFfMV8xKTsKPj4+Cj4+PiBNaCwgdGhpcyByZXF1aXJlcyBtb2Rl
IHN3aXRjaGluZywgdGhlIGFkdmFudGFnZSBvZiB0aGUgb3Bjb2RlcyBpbgo+Pj4gdGhlIDRiYWl0
IHRhYmxlIGFyZSB0aGF0IHRoZXkgZG9uJ3QgcmVxdWlyZSBtb2RlIHN3aXRjaGluZy4KPj4+IE9Q
X1JFQURfRkFTVCBkb2Vzbid0IHdvcmsgaGVyZSBpZiB0aGUgYWRkcmVzcyBtb2RlIGlzIHNldCB0
byAzLiAoSQo+Pj4ga25vdyB0aGlzIGZsYXNoIGRlZmF1bHRzIHRvIDEsIGJ1dCB0aGVyZSBpcyBh
bHNvIGEgbm9uLXZvbGF0aWxlCj4+PiBzZXR0aW5nIGZvciB0aGlzKS4KPj4+Cj4+PiBSZWdhcmRp
bmcgbW9kZSBzd2l0Y2hpbmcsIEkgZ3Vlc3MgdGhpcyBpcyB3cm9uZyBmb3IgdGhpcyBmbGFzaCwg
YmVjYXVzZQo+Pj4gaXQgaXMgc2V0IHRvIHNwYW5zaW9uX3NldF80Ynl0ZV9hZGRyX21vZGUoKSBi
eSBkZWZhdWx0IHdoaWxlIGl0IHNob3VsZAo+Pj4gcmVhbGx5IGJlIHNldCB0byBzcGlfbm9yX3Nl
dF80Ynl0ZV9hZGRyX21vZGUoKS4KPj4+Cj4+IExldCBtZSBqdXN0IGRyb3AgZmFzdCByZWFkIHN1
cHBvcnQgc28gZmFyIGFuZCBtZW50aW9uIHRoaXMgaW4gY29tbWl0Cj4+IGRlc2NyaXB0aW9uLgo+
IAo+IFRoZW4gdGhlIGZsYXNoIHdpbGwgbGlrZWx5IGJlIGltcG9zc2libGUgdG8gYmUgdXNlZCBp
biB4MSBtb2RlLCBiZWNhdXNlCj4gd2UgZG9uJ3Qgc3VwcG9ydCBkaWZmZXJlbnQgZnJlcXVlbmNp
ZXMgZm9yIG5vdy4gQW5kIHRoZSBTUEkgZnJlcXVlbmN5Cj4gd2lsbCBsaWtlbHkgYmUgdG9vIGZh
c3QgZm9yIHRoZSBub3JtYWwgcmVhZCBjb21tYW5kLgo+IElmIHlvdSBza2lwIHRoYXQsIHRoZW4g
cGxlYXNlIG1ha2Ugc3VyZSwgdGhlIGZsYXNoIGRvZXNuJ3QgcHJvYmUgYXQgYWxsLgo+IEkuZS4g
cmV0dXJuaW5nIEVOT0RFViBsaWtlIGFib3ZlLgo+IAo+IE1heWJlIHdlIGNhbiB1c2UgdGhlIHNw
aSBidXMgbWF4X2ZyZXF1ZW5jeSBhcyBhbiBpbmRpY2F0b3IgaWYgeW91IGNhbgo+IHVzZSB0aGUg
bm9ybWFsIHJlYWQgb3Bjb2RlICg0YiB2YXJpYW50IG9mIGNvdXJzZSkuIEkndmUganVzdCBsb29r
ZWQKPiBhdCBzb21lIHNwaSBkcml2ZXJzIGFuZCBub3QgYWxsIGFyZSB1c2luZyB0aGUgc3BlZWRf
aHogcHJvcGVydHkgb2YKPiBhbiBTUEkgdHJhbnNmZXIgbWVzc2FnZSwgYnV0IGp1c3QgdXNlIHRo
ZSBtYXhfc3BlZWRfaHogb2YgdGhlIFNQSQo+IGRldmljZS4gU2lnaC4KPiAKSSB3b3VsZCBsaWtl
IHRvIGxlYXZlIGl0IHRvIHNwaV9ub3Jfc3BpbWVtX2NoZWNrX3JlYWRvcCgpLiBJZiBjb250cm9s
bGVyIGlzCnJ1bm5pbmcgb3IgY2FuIGFkYXB0IGZyZXF1ZW5jeSB0byBub3JtYWwgcmVhZCwgaXQg
aXMgcG9zc2libGUgdG8gdXNlIGluIHgxCm1vZGUuIElmIG5vdCwgc3BpX25vcl9zcGltZW1fY2hl
Y2tfcmVhZG9wKCkgc2hvdWxkIHJldHVybiBlcnJvciBhbmQgcHJvYmUKd2lsbCBiZSBmYWlsZWQu
Cgo+Pj4gQWxzbyBJJ20gbm90IHN1cmUgd2hlbiBzZXRfNGJ5dGVfYWRkcl9tb2RlKCkgaXMgY2Fs
bGVkIGR1cmluZyBpbml0Lgo+Pj4gSXQgc2VlbXMgc2xpZ2h0bHkgd3JvbmcgdG8gbWUgYmVjYXVz
ZSBpdCB3aWxsIGNoZWNrIHdldGhlcgo+Pj4gU05PUl9GXzRCX09QQ09ERVMgaXMgc2V0LiBCdXQg
aW4gdGhlIHJlc3RvcmUgcGF0aCwgaXQgaXMgY2hlY2tlZCBmb3IKPj4+ICFTTk9SX0ZfNEJfT1BD
T0RFUyBiZWZvcmUgMyBieXRlIG1vZGUgaXMgZW5hYmxlZCBhZ2Fpbi4gTWhoLgo+Pj4KPj4+PiAr
Cj4+Pj4gK8KgwqDCoCAvKiBQUF8xXzFfNF80QiBpcyBzdXBwb3J0ZWQgYnV0IG1pc3NpbmcgaW4g
U0ZEUC4gKi8KPj4+PiArwqDCoMKgIHBhcmFtcy0+aHdjYXBzLm1hc2sgfD0gU05PUl9IV0NBUFNf
UFBfMV8xXzQ7Cj4+Pj4gK8KgwqDCoCBzcGlfbm9yX3NldF9wcF9zZXR0aW5ncygmcGFyYW1zLT5w
YWdlX3Byb2dyYW1zW1NOT1JfQ01EX1BQXzFfMV80XSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNQSU5PUl9PUF9QUF8xXzFfNF80QiwKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNOT1JfUFJPVE9fMV8xXzQpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtz
dGF0aWMgdm9pZCBzMjVmczI1NnRfbGF0ZV9pbml0KHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4g
K3sKPj4+PiArwqDCoMKgIC8qIFRoZSB3cml0ZXNpemUgc2hvdWxkIGJlIEVDQyBkYXRhIHVuaXQg
c2l6ZSAqLwo+Pj4+ICvCoMKgwqAgbm9yLT5wYXJhbXMtPndyaXRlc2l6ZSA9IDE2Owo+Pj4KPj4+
IFRoZSBkYXRhc2hlZXRzIG1lbnRpb25zLCBhIFBQIHNob3VsZCBiZSBlaXRoZXIgMTI4IG9yIDI1
NiAoZm9yIGJlc3QKPj4+IHBlcmZvcm1hbmNlKS4gU28gd2h5IDE2Pwo+Pj4KPj4gd3JpdGVzaXpl
IGlzIHVzZWQgYXMgbWluaW11bSBJTyBzaXplIGluIFVCSS4KPj4gUGxlYXNlIHNlZToKPj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjAxMTE4MTgyNDU5LjE4MTk3LTEtcC55
YWRhdkB0aS5jb20vCj4gCj4gT2suIG1heWJlIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gYW1lbmQg
dGhhdCBjb21tZW50IHRoYXQgdGhlIHByb2dyYW0KPiBncmFudWxhcml0eSBpcyAxNmJ5dGVzIGZv
ciB0aGlzIGZsYXNoLCBvdGhlcndpc2UgRUNDIHdpbGwgYmUgZGlzYWJsZWQKPiBpZiB0aGUgc2Ft
ZSBwYWdlIGlzIHByb2dyYW1tZWQgYWdhaW4gd2l0aG91dCBhbiBlcmFzZS4gU2VlIGNoLiA1LjMu
MQo+IGluIHRoZSBkYXRhc2hlZXQuCj4gCk9LLgoKPj4+PiArfQo+Pj4+ICsKPj4+PiArc3RhdGlj
IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBzMjVmczI1NnRfZml4dXBzID0gewo+Pj4+ICvCoMKgwqAg
LnBvc3RfYmZwdCA9IHMyNWZzMjU2dF9wb3N0X2JmcHRfZml4dXAsCj4+Pj4gK8KgwqDCoCAucG9z
dF9zZmRwID0gczI1ZnMyNTZ0X3Bvc3Rfc2ZkcF9maXh1cCwKPj4+PiArwqDCoMKgIC5sYXRlX2lu
aXQgPSBzMjVmczI1NnRfbGF0ZV9pbml0LAo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiDCoHN0YXRpYyBp
bnQKPj4+PiDCoHMyNWh4X3RfcG9zdF9iZnB0X2ZpeHVwKHN0cnVjdCBzcGlfbm9yICpub3IsCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBzZmRwX3BhcmFtZXRlcl9o
ZWFkZXIgKmJmcHRfaGVhZGVyLAo+Pj4+IEBAIC00NDEsNiArNTAyLDkgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBmbGFzaF9pbmZvIHNwYW5zaW9uX25vcl9wYXJ0c1tdID0gewo+Pj4+IMKgwqDCoMKg
IHsgInMyNWZsMjU2bCIswqAgSU5GTygweDAxNjAxOSzCoMKgwqDCoMKgIDAswqAgNjQgKiAxMDI0
LCA1MTIpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElf
Tk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAg
RklYVVBfRkxBR1MoU1BJX05PUl80Ql9PUENPREVTKSB9LAo+Pj4+ICvCoMKgwqAgeyAiczI1ZnMy
NTZ0IizCoCBJTkZPNigweDM0MmIxOSwgMHgwZjA4OTAsIDEyOCAqIDEwMjQsIDI1NikKPj4+Cj4+
PiBEb2VzIElORk82KDB4MzQyYjE5LCAweDBmMDg5MCwgMCwgMCkgd29yayBmb3IgeW91Pwo+Pj4K
Pj4gWWVzLCBpdCB3b3Jrcy4KPiAKPiBQbGVhc2UgdXNlIHRoYXQgb25lIHRoZW4uIEknbSBwbGFu
bmluZyB0byByZXBsYWNlIGFsbCB0aGUgSU5GTygpL0lORk82KCkKPiBpbiB0aGUgZnV0dXJlIGFu
ZCBkcm9wIHRoZSBzaXplcyBiZWNhdXNlIHRoZXkgd2lsbCBnZXQgZmV0Y2hlZCBmcm9tCj4gU0ZE
UC4KPiAKT0suCgo+IC1taWNoYWVsCj4gCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIFBBUlNFX1NGRFAK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZpeHVwcyA9ICZzMjVmczI1NnRfZml4dXBzIH0sCj4+Pj4g
wqDCoMKgwqAgeyAiczI1aGw1MTJ0IizCoCBJTkZPNigweDM0MmExYSwgMHgwZjAzOTAsIDI1NiAq
IDEwMjQsIDI1NikKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIFBBUlNFX1NGRFAKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgIE1GUl9GTEFHUyhVU0VfQ0xTUikKPj4KPj4gVGhhbmtzLAo+PiBUYWthaGlybwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
