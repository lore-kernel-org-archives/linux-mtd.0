Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDE5C26641
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 19:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 263CD20861
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 19:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhYH7UId";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks86CQnW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 263CD20861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6JHFuTGkkOoGqCInp2rzr28zo4+2asbizDTbJY2d8ig=; b=uhYH7UIdQED6IC0GvWs+Hzkc9
	lx5P2TUcjggJZ+dRiODEKZK/M9oI8jZ9AeHtesoAIcuKJPDoVQnUX+NCpglTUDekKkYEgI4VWEqkm
	IfNzOILyt6TIYFwIEgwf50PsdedmMPEpbrdp8BtjlyGBE3INnPznuM+va0gN/ueltR5MjOYkC3T7Y
	SW98qSoSAxrnoArrSFOWr1pHR6z7MTRZbN7lEUR1zA3WwTz9szsGxHVoVFICPRXcuAiW31Z52AEH0
	eiQxc0ClHa+uYsFO+kp/1pn/2WQ7Lwe3WvQUcd3MYpvTlpaqjsQEAScI4yESEHld2U53oCmOw03b2
	Nsn2VohKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glJ6V-0000mS-Bj; Sun, 20 Jan 2019 19:49:59 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glJ6P-0000m3-Cp
 for linux-mtd@lists.infradead.org; Sun, 20 Jan 2019 19:49:57 +0000
Received: by mail-lf1-x143.google.com with SMTP id y11so14010262lfj.4
 for <linux-mtd@lists.infradead.org>; Sun, 20 Jan 2019 11:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GjAlVyiItLy8VxFzIFe8lIt0jaw+jcgpnRfIY6YntA4=;
 b=Ks86CQnWvuPOkQvQjxCdVxXi4fykAP5JTDCzppV51LDFp4ZjQhFFfK3lP6F/HwxPgc
 oYuVyojMyTfad3Dk3xNYcxha4FtzR+1WbNAb/0GYYuPqrrX7W0qoVnkGYXSImNMYbNN0
 fjmKFjW0UIsD9SQ04mR3WfQqZBR8r+1AU1+FxcfiOQFKLLTyniP1YtHntIkSVd8cwK1c
 SLRrUi/7qfsROXi1fRZx0ryeAzY/7dQdnSpjkkn8AWcjdRrH5OWb//n/ko5ksdaCsGmM
 E2gfZUUPy2s1Hmfxlnmh4FXSj+umifnl63MCUWpLQnadJZn3qkKZhJvA8LTlsu/Cr+EX
 OUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GjAlVyiItLy8VxFzIFe8lIt0jaw+jcgpnRfIY6YntA4=;
 b=JIJ7XMt+xT0wyRsf4H0UlgO/xEHA87vwGKf1NF4s/GvVNu9LWYHfMpWXS0ha51K72h
 UUPj2ChkrSUIIiJvA3ukRbBs1FhWVVE+SHheX9Nu5hXstpOwKuDPmkkMiqLHhU3pArea
 +sVB26FzFC9LvaH4M5NWdkeq1EdBAg7SqRpWmtppdQnq9HCUEMfU+/GS6jcqVEGyYvB2
 HxYRrjl6NMrZPvvp1CEUCa7jZNvd/olI+Dtc22+yGYarOzm/EGV3eu7JbLuWRcRpaXev
 8N/7cOYHjAY0PqBsZVWjqfeTjehNPkzCkdH2u/Itj7eA9Sebv12xK7kFnYyhgagIjHRB
 TNGA==
X-Gm-Message-State: AJcUukfj7OBDQga0JE1eg1qkBn+j+fVB7bCJLVZEmOi5UpvRn2DzW/fw
 8+x9vG0RaxbkVa6LD5nW+SWD3FJR
X-Google-Smtp-Source: ALg8bN78OkL36JR/85FZ6Uh8tWPIDYQxjRpKwIP5FugDoe9mYBw7s1Ifc21NDG61GmpcI5hc++FhMQ==
X-Received: by 2002:a19:4849:: with SMTP id v70mr16329464lfa.62.1548013788816; 
 Sun, 20 Jan 2019 11:49:48 -0800 (PST)
Received: from [192.168.75.106] (staticline-31-182-180-253.toya.net.pl.
 [31.182.180.253])
 by smtp.gmail.com with ESMTPSA id h85-v6sm1880950ljf.68.2019.01.20.11.49.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Jan 2019 11:49:48 -0800 (PST)
Subject: Re: VIRTIO iface in mtd
To: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>
References: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
 <f53fe2ac-c1a1-1e64-1f4c-046b8e9daa2b@gmail.com>
 <20190118214455.18345232@bbrezillon> <2945987.RD84OsBdxl@blindfold>
From: =?UTF-8?Q?Marcin_Krzemi=c5=84ski?= <mar.krzeminski@gmail.com>
Message-ID: <a978c3ac-83fb-04e7-4143-f16c2e5ca5c3@gmail.com>
Date: Sun, 20 Jan 2019 20:49:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <2945987.RD84OsBdxl@blindfold>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_114953_462307_96E81604 
X-CRM114-Status: GOOD (  25.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxOC4wMS4yMDE5IDIyOjI1LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gSGkhCj4K
PiBTb3JyeSBmb3Igam9pbmluZyB0aGlzIGRpc2N1c3Npb24gc28gbGF0ZS4KPiBJIGRpZG4ndCBu
b3RpY2UgdGhlIHByaXZhdGUgbWFpbHMuIDstXApObyBwcm9ibGVtIDopCj4KPiBBbSBGcmVpdGFn
LCAxOC4gSmFudWFyIDIwMTksIDIxOjQ0OjU1IENFVCBzY2hyaWViIEJvcmlzIEJyZXppbGxvbjoK
Pj4gT24gRnJpLCAxOCBKYW4gMjAxOSAyMTowMzoxNyArMDEwMAo+PiBNYXJjaW4gS3J6ZW1pxYRz
a2kgPG1hci5rcnplbWluc2tpQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+Pj4gICAKPj4+Pj4gTXkg
dW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoaXMgZHJpdmVyIHdpbGwgdXNlIFZJUlRJTyB0byBjb21t
dW5pY2F0ZQo+Pj4+PiB3aXRoIFFlbXUuIEZyb20gUWVtdSBzaWRlIGF0IHRoZSBlbmQgdGhlcmUg
d2lsbCBiZSBhIGZpbGUgdGhhdCB3aWxsCj4+Pj4+IHNpbXVsYXRlIE5BTkQvTk9SLiBJcyBpdCBj
b3JyZWN0Pwo+Pj4+IFRoYXQncyBteSB1bmRlcnN0YW5kaW5nLCBidXQgSSdtIG5vdCByZWFsbHkg
YSB2aXJ0aW8gb3IgcWVtdSBleHBlcnQgc28KPj4+PiBJIG1pZ2h0IGJlIHdyb25nLgo+Pj4+ICAg
Cj4+Pj4+IFdoYXQgdXNlIGNhc2VzIGRvIHlvdSBoYXZlIGluIG1pbmQgZm9yIHRoaXM/Cj4+Pj4g
SSBoYXZlIG9uZSBpbiBtaW5kOiBzaW11bGF0ZSBOQU5EIChpbiBwYXJ0aWN1bGFyIE1MQyBOQU5E
KSBiZWhhdmlvciBpbgo+Pj4+IGEgcHNldWRvLXJlYWxpc3RpYyB3YXkgdG8gdmFsaWRhdGUgVUJJ
L1VCSUZTIGNvZGUgKG9yIGFueSBvdGhlcgo+Pj4+IEZTL3dlYXItbGV2ZWxpbmcvRlRMIGNvZGUp
IHdlIG1pZ2h0IHdhbnQgdG8gdXNlIG9uIHRvcCBvZiBzdWNoIGRldmljZXMKPj4+IEluIHRoaXMg
cGxhY2UgbXkgcXVlc3Rpb24gaXMgd2hhdCB3ZSByZW1vdmUgZnJvbSBlbXVsYXRpb24/Cj4+PiBJ
IHVuZGVyc3RhbmQgdGhhdCBjb21tdW5pY2F0aW9uIGxheWVyIGlzIHJlbW92ZWQsIGhvd2V2ZXIg
Y29tbXVuaWNhdGlvbgo+Pj4gcHJvdG9jb2wKPj4+IG5lZWQgdCBvIHN0YXk/IEVnLiBiZWNhdXNl
IE5BTkQgYW5kIE9PQi4KPj4gSWYgYnkgcHJvdG9jb2wgeW91IG1lYW4gdGhlIGZhY3QgdGhhdCBh
IE5BTkQgaGFzIGFuIG91dC1vZi1iYW5kIGFuZCBhbgo+PiBpbi1iYW5kIGFyZWEsIHRoZW4geWVz
LCB3ZSB3YW50IHRvIGVtdWxhdGUgdGhhdC4gV2hhdCBJIG1lYW50IGJ5Cj4+ICJwcm90b2NvbCIg
d2FzIHRoZSBob3cgeW91IGludGVyYWN0IHdpdGggYSBwYXJhbGxlbCBvciBTUEkgTkFORCAoInNl
bmQKPj4gdGhpcyBvcGNvZGUgdG8gZG8gdGhpcyBvciB0aGF0IiksIGFuZCB3ZSBkZWZpbml0ZWx5
IGRvbid0IHdhbnQgdG8KPj4gZW11bGF0ZSB0aGF0IHBhcnQuCj4+Cj4+Pj4gSSdkIGFsc28gbGlr
ZSB0byByZXBsYWNlIG5hbmRzaW0gYnkgdGhpcyBlbXVsYXRpb24gYXBwcm9hY2guIEluZGVlZCwK
Pj4+PiBuYW5kc2ltIGlzIGVtdWxhdGluZyB0aGUgcGFyYWxsZWwgTkFORCBwcm90b2NvbCBtb3Jl
IHRoYW4gYW55dGhpbmcKPj4+PiBlbHNlLCB3aGljaCB3ZSBkb24ndCByZWFsbHkgY2FyZSBhYm91
dCB1bmxlc3Mgd2UgbmVlZCB0byB0ZXN0IHRoZSByYXcKPj4+PiBOQU5EIGZyYW1ld29yayAoYW5k
IEkgdGhpbmsgdGhlcmUgYXJlIGJldHRlciBzb2x1dGlvbnMgdG8gZG8gdGhhdCkuIE9uCj4+Pj4g
dGhlIG90aGVyIGhhbmQsIGJlY2F1c2UgbmFuZHNpbSB0cmllcyB0byB1c2UgdGhlIGZ1bGwgcmF3
IE5BTkQgc3RhY2ssCj4+Pj4gaXQncyBvZnRlbiBoYXJkIHRvIGVtdWxhdGUgcmVhbCBkZXZpY2Vz
IChJRC1iYXNlZCBkZXRlY3Rpb24gZG9lcyBub3QKPj4+PiB3b3JrIGZvciBPTkZJL0pFREVDIGNv
bXBhdGlibGUgZGV2aWNlcykuIEFsbCBvZiB0aGlzIG1ha2VzIG5hbmRzaW0gYQo+Pj4+IHBvb3Ig
Y2hvaWNlIHdoZW4gdGhlIHVzZXIgd2FudHMgdG8gZW11bGF0ZSBhIE5BTkQgZGV2aWNlIHRvIGRv
Cj4+Pj4gcG9zdC1tb3J0ZW0gYW5hbHlzaXMgdXNpbmcgYSBOQU5EIGR1bXAuCj4+PiBUaGlzIEkg
bmVlZCB0byB1bmRlcnN0YW5kIGJldHRlci4gSWYgd2UgZWcuIGhhdmUgTkFORCBkdW1wLCBkbyB3
ZSBjYXJlCj4+PiB3aXRoIE9PQiBvciBFQ0MsCj4+PiBvciBub3Q/Cj4+IFllcyB3ZSBzaG91bGQu
IEZvciB0aGUgRUNDIHBhcnQsIGl0IHdpbGwgYmUgaGFyZCB0byBlbXVsYXRlIEhXIEVDQwo+PiBl
bmdpbmUsIGJ1dCB3ZSBjYW4gYXQgbGVhc3Qgc3BlY2lmeSB0aGUgbGF5b3V0IGluIHVzZSBvbiB0
aGUgYm9hcmQKPj4gKHdoaWNoIE9PQiBwb3J0aW9ucyBhcmUgdXNlZCB0byBzdG9yZSBFQ0MgYnl0
ZXMgYW5kIHdoaWNoIG9uZXMgYXJlCj4+IGNvbnRhaW5pbmcgdXNlciBkYXRhIG9yIGJhZCBibG9j
ayBtYXJrZXJzKS4KPj4KPj4+IEF0IHRoZSBlbmQgSSBhbHNvIG5lZWQgdG8gYWRkLCB0aGF0IEkg
dW5kZXJzdGFuZCBOT1IgZGV2aWNlcywgYnV0Cj4+PiB1bmZvcnR1bmF0ZWx5Cj4+PiBJIGhhdmUg
bG93IGV4cGVyaWVuY2Ugd2l0aCBOQU5Ecy4gVGhpcyBjb3VsZCBsZWFkIHRvIHNvbWUgbWlzdW5k
ZXJzdGFuZHMgOigKPj4gV2UgY2FuIGhlbHAgd2l0aCB0aGF0Lgo+IFllcywgSSdsbCBoYXBwaWx5
IGhlbHAuCj4KPiBJJ20gdW5oYXBweSB3aXRoIG5hbmRzaW0gbW9zdGx5IGJlY2F1c2UgaXQgZW11
bGF0ZXMgdGhlIGNoaXAgaXRzZWxmLCB3aGljaCBpcwo+IHRoZXNlIGRheXMgYWxtb3N0IHVzZWxl
c3MgYW5kIGluZWZmaWNpZW50Lgo+IFRvIGZpbmQgYnVncyBpbiBuYW5kX2Jhc2UuYyBpdCBoZWxw
cyBvbmx5IGluIHRoZW9yeSwgaW4gcmVhbGl0eSB3ZSB0cmlnZ2VyCj4gYnVncyBpbiBuYW5kc2lt
J3MgTkFORCBlbXVsYXRpb24uCkkgZ3Vlc3MgaXQgY291bGQgaGVscCB0byBjYXRjaCByZWdyZXNz
aW9uLi4uCj4KPiBJIHRyaWVkIHRvIG92ZXJoYXVsIG5hbmRzaW0gc29tZSB0aW1lIGFnbzoKPiBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxNi84LzMxLzY3Cj4gQnV0IEJvcmlzIGNvbnZpbmNlZCBt
ZSB0aGF0IEkgc2hvdWxkIG5vdCByaWRlIGEgZGVhZCBob3JzZS4gOy0pCj4KPiBTbywgdGhlIGJh
c2ljIGlkZWEgaXMgaGF2aW5nIGEgc2ltcGxlIGFuZCBzdHVwaWQga2VybmVsLWRyaXZlciB3aGlj
aCBpbXBsZW1lbnRzCj4gdGhlIE1URCBpbnRlcmZhY2UgYW5kIGNhbiBhY3QgbGlrZSB3aGF0ZXZl
ciB3ZSB3YW50Lgo+IFRoZSBsb2dpYyBzaGFsbCBoYXBwZW4gaW4gYW4gZW11bGF0b3IgbGlrZSBx
ZW11Lgo+IFRoaW5rIG9mIHZpcnRpby1ibGsgb3IgdmlydGlvLXNjc2kuClRoYXQgc2VlbSB0byBi
ZSByZWFzb25hYmxlIGFuZCBtYWNoIG15IHVuZGVyc3RhbmQgb2YgdGhlIHRvcGljLgpNVEQgZHJp
dmVyIHdvdWxkIGJlIG5vdGhpbmcgbW9yZSB0aGF0IHRyYW5zbGF0b3IgYmV0d2VlbiBNVEQgYW5k
IFFlbXUgCihvdmVyIHZpcnRpbykuCkFzIEJvcmlzIHN1Z2dlc3RlZCBhbmQgYWRkaXRpb25hbCBj
aGFubmVsIHRvIG1vZGlmeSBRZW11cyBiZWhhdmlvciBmcm9tIApndWVzdCAoZWcuIGluc2VydGlu
ZyBFQ0MgZXJyb3JzKT8KRWcuIGZyb20gc3lzZj8KClJlYWwgdW5rbm93biBmb3IgbWUgaXMgUWVt
dSBwYXJ0LiBFZy4gYmFzaWMgcXVlc3Rpb24gaG93IGRvZXMgTkFORCBkdW1wcyAKc2hvdWxkIGxv
b2sgbGlrZT8KSXQgc2hvdWxkIGNvbnNpc3Qgb25seSByZWFsIGRhdGEgb3Igc2VjdG9ycyBpbWFn
ZXMod2l0aCBPT0IpLiBPciBib3RoPwo+Cj4gQmVzaWRlIG9mIGVtdWxhdGluZyB2YXJpb3VzIGZs
YXNoZXMsIEkgaGF2ZSBtb3N0bHkgdGVzdGluZyBpbiBtaW5kLgo+IFRlc3RpbmcgbGlrZSBwb3dl
ci1jdXQgZW11bGF0aW9uLCBpbyBsb2dnaW5nIGFuZCByZXBsYXksIHNpbXVsYXRpb24gb2YKPiBN
TEMgaXNzdWVzIChwYWlyZWQtcGFnZXMpLCAuLi4KVGhhbmtzLApNYXJjaW4KCj4KPiBUaGFua3Ms
Cj4gLy9yaWNoYXJkCj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
