Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF58FF6E87
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Vb3Gcu2emG9qYt5kpoGXzIW+qaVwBfe4+gAr12HTDY=; b=DzU8JwYmfVLh6C
	4VxznQsEDFQB3LkiLWTXlw3dhMhbo1UHlURc/v+ET/6+ZHg7Fyxv81uMCLLM/rL96FLTBJuUKkWwa
	Nes2SF2DVrYc6uftE9RIYc3a24NhiL9FhNGXLMnpnCBmzBNiRC0Qagl4Jw7B3Y7Nnga5g3vKWQrf4
	C9AhzLcmLcJGwwXt8c7K0Tm8OOrV1YaDOWqLLhZqzaHqf9jGXJx6UJX1YMBAEmLH9Cxec9i/VS4eN
	3FFYyalvBrwfHtZJZ3rWe3bUh0HJWB/nDlevZxFd6z1h1dXQiDk08fiAxpkjkVdGp79/W5w5NULdJ
	wdZerRs61uSWH8jfjvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2c1h-00000007G7p-0z6Z;
	Tue, 17 Mar 2026 21:32:33 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2c1e-00000007G6m-238C
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 21:32:31 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50906a98ffeso172611cf.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 14:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773783149; cv=none;
        d=google.com; s=arc-20240605;
        b=TwrHIR9YCGe6mCNFCBaT1Lc9yBjNdtJSlhkFP6X+Hd2ScnwQ6d1Fd5f2No1AfgjNaM
         1UNcrlage58NFPY+Xnd0R5xPdO1gaWt7tr3B8Cu24Aji5uP6zJvznL/0urZ0rjhojjtZ
         8O+y9kCrblxUySRhZ1/L/xjdQYtABIdz7F6p2C9yPYlrwgYkqezGiFrognvuQscqXVYW
         d3b4BtcVQBAghYiSB8hTksmTNSS+zr2kp1c5wYxnCBhCX20QZneXBaOlT4ppkWjjkQyX
         TqCbBC8kvJYfgu+0oyTGWIIrRUJa+q/F8pp5XdHCTIZWSoJvU3zQ5J8s0Tv4i1VstYx4
         pftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
        fh=SdK4Y4XJdxI6JGJrFYIyjCE1wUTC9BWLREz1/I4SgSA=;
        b=Zw32vdlZBQmPhgSLkdLViOStl7aAV+WMl5kAoQox8IXkHYi+t18+xM/2rsoeW9JUCW
         HVK6hpd6rb3YoMWSeob757JI0HpzX5jjatKTXeoInAwwRRCG/eiOF+g+lbcjU/rmtiaR
         PBrpKsRvVbMNfAXhR9PA5wRUIEEpX39U8jDZXNILEzl6M158I4ENeFlD4+0hcKT52tSC
         ubTXMTsTZ9wEhRstmDFd4G8/QZukivjfzE8DvucAr9axSfzrJzTeKwlCJBb0EDo8WF39
         eBcP1L3gRTI5ZwUoT1AwGWlbcFOLYLHZVvHxNSJ+fCeTMhybYDS+I4Cpd95j6NDUctQ2
         ACbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773783149; x=1774387949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
        b=VS1Sn9jIaAVq/BCkegruZAScAiXvWsUs+h1aM84Xlz4La0UkL8MH1Rnhk54RLD4mYW
         +oxZgI3qfeJGtGqLgwYIsTgCYxQJoohgMGam0X12JGhW/B2JgjYMbFho2uvEdWuCkoo4
         8U/jIHGd7mVD5DfU7y9O7w35B73XK+k/ST7wWEQf8IKFL7gjb1hufwDJZ3/G8XEi6U7K
         qzZiEZBslN947Dtp01XpDQ1wIQZlKOopu6jQKbM6XqdBZP6JRiYbpZ7nz7IdhkiGG9Gj
         H2GKSIlezIh/0tCHMboKlerp/PLEW9LvQnjcn9ZOpxgYVtyoiON2h2Uc6YmeFgBny4dz
         HCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773783149; x=1774387949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
        b=mlDyTSQySiR9saai92kX6skSH5cPSB4tALIPRMQuim5CYqGisyZS3v5IRR8sHm+oGl
         lgJNXOND1sMVRUM/5wb0bQfPEI5Q7y1a1rP3yYbLeWjJ6mFMZdLeRbyirndk5Sl8+Ibd
         X0YoCMMIiizyODcAFzr3v7HcFKRgEI1NWkFBBvHWiX7HnzNqTpaoXj8lzp1PphEvrC3j
         +sPV8Vf+0Ucx0FnYScnAmd87RDkhpuW3UCWG1NTXS2UNaa9FDTH4Z9tPg1mHl3qq1T0h
         ucPLfO/1WkcSRn3Lj5DF4WTAc3DhLhqfpSychq5SUdqLbA2TwJ+/ShIZ8vMI+lMk6Km2
         YqXw==
X-Forwarded-Encrypted: i=1; AJvYcCW8dobzJStehyg+hgPXsbzQIAToCqKxljS0y1hBuUOkidEVEz7mWOVymvotjpWmCcZ566OqxHy1CsM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDg7mApzjUqRKI/b84XFZLsk5z3LQ9qICxROCzxiXxnYqjTUUX
	l/f3WtuNlCEr6I0QHUhec/8HQsLpK2WOYM/lgdBldJrejZ+IqADxPgdN1kO3M4xuKCMAu9H7s1Q
	hWgkkK+Ns3wCp+pgZZMXIuqjKudFMePSodVDPnGtR
X-Gm-Gg: ATEYQzxppDSk3FpzMMCsj4E1qpt8GydrF3zDh1qrmTKmLlaALcv1SYPXJ/dkR0Chz4G
	VhD2oGgV45gibx2nuc3Z1oUb1vhhoXPfoZblX8DGS/NVnY6C0tBEtWo4+9DTViA0nDcstXL9CS4
	dTHxGSIpIrgOndO1ITRSkOAipYN5YKGvlmJwJG2a+Id2SehXExrDkaT42ELMLaLQQ9/+MnW0MBb
	uKugrFB7me9PIl/cz20434NvDoAcZcyE1pQRU7soylnDYbLmJRR1GWSRuxfvJjHouRXUcll/X8K
	VCLTvSEVFh0j2HUNMaTBQTU5IQw31moqzR9kuw==
X-Received: by 2002:a05:622a:1a9b:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-50b1480564fmr4695911cf.8.1773783147340; Tue, 17 Mar 2026
 14:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
 <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
In-Reply-To: <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 14:32:16 -0700
X-Gm-Features: AaiRm50LOaxRG8hnm9GByPrpi5KQ-jnLdYLBR44IEnVyj1qDMmlGA-pMovuTqLE
Message-ID: <CAJuCfpE5qZmi43EeZiRcy78pD6YvJb5n_xnoUJfwEjomowu0=A@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] staging: vme_user: replace deprecated mmap hook
 with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_143230_645783_055177EA 
X-CRM114-Status: GOOD (  36.61  )
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

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMjoyNuKAr1BNIFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3Vy
ZW5iQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKA
r1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IFRoZSBmX29wLT5tbWFwIGludGVyZmFjZSBpcyBkZXByZWNhdGVkLCBzbyB1cGRhdGUgZHJp
dmVyIHRvIHVzZSBpdHMKPiA+IHN1Y2Nlc3NvciwgbW1hcF9wcmVwYXJlLgo+ID4KPiA+IFRoZSBk
cml2ZXIgcHJldmlvdXNseSB1c2VkIHZtX2lvbWFwX21lbW9yeSgpLCBzbyB0aGlzIGNoYW5nZSBy
ZXBsYWNlcyBpdAo+ID4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVxdWl2YWxlbnQsIG1tYXBfYWN0
aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4gPgo+ID4gRnVuY3Rpb25zIHRoYXQgd3JhcCBtbWFwKCkg
YXJlIGFsc28gY29udmVydGVkIHRvIHdyYXAgbW1hcF9wcmVwYXJlKCkKPiA+IGluc3RlYWQuCj4g
Pgo+ID4gQWxzbyB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gYWNjb3JkaW5nbHkuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4K
PiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0ICAgIHwgIDIgKy0K
PiA+ICBkcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMgICAgICB8IDIwICsrKysrLS0tLS0t
Cj4gPiAgZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZS5oICAgICAgfCAgMiArLQo+ID4gIGRy
aXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jIHwgNTEgKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDMzIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
dm1lLnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0Cj4gPiBpbmRleCBjMGI0
NzUzNjlkZTAuLjcxMTE5OTlhYmMxNCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS92bWUucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1lLnJz
dAo+ID4gQEAgLTEwNyw3ICsxMDcsNyBAQCBUaGUgZnVuY3Rpb24gOmM6ZnVuYzpgdm1lX21hc3Rl
cl9yZWFkYCBjYW4gYmUgdXNlZCB0byByZWFkIGZyb20gYW5kCj4gPgo+ID4gIEluIGFkZGl0aW9u
IHRvIHNpbXBsZSByZWFkcyBhbmQgd3JpdGVzLCA6YzpmdW5jOmB2bWVfbWFzdGVyX3Jtd2AgaXMg
cHJvdmlkZWQgdG8KPiA+ICBkbyBhIHJlYWQtbW9kaWZ5LXdyaXRlIHRyYW5zYWN0aW9uLiBQYXJ0
cyBvZiBhIFZNRSB3aW5kb3cgY2FuIGFsc28gYmUgbWFwcGVkCj4gPiAtaW50byB1c2VyIHNwYWNl
IG1lbW9yeSB1c2luZyA6YzpmdW5jOmB2bWVfbWFzdGVyX21tYXBgLgo+ID4gK2ludG8gdXNlciBz
cGFjZSBtZW1vcnkgdXNpbmcgOmM6ZnVuYzpgdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmVgLgo+ID4K
PiA+Cj4gPiAgU2xhdmUgd2luZG93cwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92
bWVfdXNlci92bWUuYyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuYwo+ID4gaW5kZXgg
ZjEwYTAwYzA1ZjEyLi43MjIwYWJhN2I5MTkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUu
Ywo+ID4gQEAgLTczNSw5ICs3MzUsOSBAQCB1bnNpZ25lZCBpbnQgdm1lX21hc3Rlcl9ybXcoc3Ry
dWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHVuc2lnbmVkIGludCBtYXNrLAo+ID4gIEVYUE9S
VF9TWU1CT0wodm1lX21hc3Rlcl9ybXcpOwo+ID4KPiA+ICAvKioKPiA+IC0gKiB2bWVfbWFzdGVy
X21tYXAgLSBNbWFwIHJlZ2lvbiBvZiBWTUUgbWFzdGVyIHdpbmRvdy4KPiA+ICsgKiB2bWVfbWFz
dGVyX21tYXBfcHJlcGFyZSAtIE1tYXAgcmVnaW9uIG9mIFZNRSBtYXN0ZXIgd2luZG93Lgo+ID4g
ICAqIEByZXNvdXJjZTogUG9pbnRlciB0byBWTUUgbWFzdGVyIHJlc291cmNlLgo+ID4gLSAqIEB2
bWE6IFBvaW50ZXIgdG8gZGVmaW5pdGlvbiBvZiB1c2VyIG1hcHBpbmcuCj4gPiArICogQGRlc2M6
IFBvaW50ZXIgdG8gZGVzY3JpcHRvciBvZiB1c2VyIG1hcHBpbmcuCj4gPiAgICoKPiA+ICAgKiBN
ZW1vcnkgbWFwIGEgcmVnaW9uIG9mIHRoZSBWTUUgbWFzdGVyIHdpbmRvdyBpbnRvIHVzZXIgc3Bh
Y2UuCj4gPiAgICoKPiA+IEBAIC03NDUsMTIgKzc0NSwxMyBAQCBFWFBPUlRfU1lNQk9MKHZtZV9t
YXN0ZXJfcm13KTsKPiA+ICAgKiAgICAgICAgIHJlc291cmNlIG9yIC1FRkFVTFQgaWYgbWFwIGV4
Y2VlZHMgd2luZG93IHNpemUuIE90aGVyIGdlbmVyaWMgbW1hcAo+ID4gICAqICAgICAgICAgZXJy
b3JzIG1heSBhbHNvIGJlIHJldHVybmVkLgo+ID4gICAqLwo+ID4gLWludCB2bWVfbWFzdGVyX21t
YXAoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKQo+ID4gK2ludCB2bWVfbWFzdGVyX21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1lX3Jlc291cmNl
ICpyZXNvdXJjZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJl
YV9kZXNjICpkZXNjKQo+ID4gIHsKPiA+ICsgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyB2bWFf
c2l6ZSA9IHZtYV9kZXNjX3NpemUoZGVzYyk7Cj4gPiAgICAgICAgIHN0cnVjdCB2bWVfYnJpZGdl
ICpicmlkZ2UgPSBmaW5kX2JyaWRnZShyZXNvdXJjZSk7Cj4gPiAgICAgICAgIHN0cnVjdCB2bWVf
bWFzdGVyX3Jlc291cmNlICppbWFnZTsKPiA+ICAgICAgICAgcGh5c19hZGRyX3QgcGh5c19hZGRy
Owo+ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIHZtYV9zaXplOwo+ID4KPiA+ICAgICAgICAgaWYg
KHJlc291cmNlLT50eXBlICE9IFZNRV9NQVNURVIpIHsKPiA+ICAgICAgICAgICAgICAgICBkZXZf
ZXJyKGJyaWRnZS0+cGFyZW50LCAiTm90IGEgbWFzdGVyIHJlc291cmNlXG4iKTsKPiA+IEBAIC03
NTgsMTkgKzc1OSwxOCBAQCBpbnQgdm1lX21hc3Rlcl9tbWFwKHN0cnVjdCB2bWVfcmVzb3VyY2Ug
KnJlc291cmNlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+ICAgICAgICAgfQo+ID4K
PiA+ICAgICAgICAgaW1hZ2UgPSBsaXN0X2VudHJ5KHJlc291cmNlLT5lbnRyeSwgc3RydWN0IHZt
ZV9tYXN0ZXJfcmVzb3VyY2UsIGxpc3QpOwo+ID4gLSAgICAgICBwaHlzX2FkZHIgPSBpbWFnZS0+
YnVzX3Jlc291cmNlLnN0YXJ0ICsgKHZtYS0+dm1fcGdvZmYgPDwgUEFHRV9TSElGVCk7Cj4gPiAt
ICAgICAgIHZtYV9zaXplID0gdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0Owo+ID4gKyAgICAg
ICBwaHlzX2FkZHIgPSBpbWFnZS0+YnVzX3Jlc291cmNlLnN0YXJ0ICsgKGRlc2MtPnBnb2ZmIDw8
IFBBR0VfU0hJRlQpOwo+ID4KPiA+ICAgICAgICAgaWYgKHBoeXNfYWRkciArIHZtYV9zaXplID4g
aW1hZ2UtPmJ1c19yZXNvdXJjZS5lbmQgKyAxKSB7Cj4gPiAgICAgICAgICAgICAgICAgZGV2X2Vy
cihicmlkZ2UtPnBhcmVudCwgIk1hcCBzaXplIGNhbm5vdCBleGNlZWQgdGhlIHdpbmRvdyBzaXpl
XG4iKTsKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiA+ICAgICAgICAgfQo+
ID4KPiA+IC0gICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+
dm1fcGFnZV9wcm90KTsKPiA+IC0KPiA+IC0gICAgICAgcmV0dXJuIHZtX2lvbWFwX21lbW9yeSh2
bWEsIHBoeXNfYWRkciwgdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KTsKPiA+ICsgICAgICAg
ZGVzYy0+cGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZChkZXNjLT5wYWdlX3Byb3QpOwo+ID4g
KyAgICAgICBtbWFwX2FjdGlvbl9zaW1wbGVfaW9yZW1hcChkZXNjLCBwaHlzX2FkZHIsIHZtYV9z
aXplKTsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gLUVYUE9SVF9TWU1CT0wodm1l
X21hc3Rlcl9tbWFwKTsKPiA+ICtFWFBPUlRfU1lNQk9MKHZtZV9tYXN0ZXJfbW1hcF9wcmVwYXJl
KTsKPiA+Cj4gPiAgLyoqCj4gPiAgICogdm1lX21hc3Rlcl9mcmVlIC0gRnJlZSBWTUUgbWFzdGVy
IHdpbmRvdwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuaCBi
L2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuaAo+ID4gaW5kZXggNzk3ZTk5NDBmZGQxLi5i
NjQxMzYwNWVhNDkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1l
LmgKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuaAo+ID4gQEAgLTE1MSw3
ICsxNTEsNyBAQCBzc2l6ZV90IHZtZV9tYXN0ZXJfcmVhZChzdHJ1Y3Qgdm1lX3Jlc291cmNlICpy
ZXNvdXJjZSwgdm9pZCAqYnVmLCBzaXplX3QgY291bnQsCj4gPiAgc3NpemVfdCB2bWVfbWFzdGVy
X3dyaXRlKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlLCB2b2lkICpidWYsIHNpemVfdCBj
b3VudCwgbG9mZl90IG9mZnNldCk7Cj4gPiAgdW5zaWduZWQgaW50IHZtZV9tYXN0ZXJfcm13KHN0
cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlLCB1bnNpZ25lZCBpbnQgbWFzaywgdW5zaWduZWQg
aW50IGNvbXBhcmUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IHN3YXAsIGxvZmZfdCBvZmZzZXQpOwo+ID4gLWludCB2bWVfbWFzdGVyX21tYXAoc3RydWN0IHZt
ZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ICtp
bnQgdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmUoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2Us
IHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpOwo+ID4gIHZvaWQgdm1lX21hc3Rlcl9mcmVlKHN0
cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlKTsKPiA+Cj4gPiAgc3RydWN0IHZtZV9yZXNvdXJj
ZSAqdm1lX2RtYV9yZXF1ZXN0KHN0cnVjdCB2bWVfZGV2ICp2ZGV2LCB1MzIgcm91dGUpOwo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jIGIvZHJpdmVy
cy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMKPiA+IGluZGV4IGQ5NWRkN2Q5MTkwYS4uMTFl
MjVjMmY2YjBhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91
c2VyLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jCj4gPiBA
QCAtNDQ2LDI0ICs0NDYsMTQgQEAgc3RhdGljIHZvaWQgdm1lX3VzZXJfdm1fY2xvc2Uoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiAgICAgICAgIGtmcmVlKHZtYV9wcml2KTsKPiA+ICB9
Cj4gPgo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qgdm1lX3Vz
ZXJfdm1fb3BzID0gewo+ID4gLSAgICAgICAub3BlbiA9IHZtZV91c2VyX3ZtX29wZW4sCj4gPiAt
ICAgICAgIC5jbG9zZSA9IHZtZV91c2VyX3ZtX2Nsb3NlLAo+ID4gLX07Cj4gPiAtCj4gPiAtc3Rh
dGljIGludCB2bWVfdXNlcl9tYXN0ZXJfbW1hcCh1bnNpZ25lZCBpbnQgbWlub3IsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hKQo+ID4gK3N0YXRpYyBpbnQgdm1lX3VzZXJfdm1fbWFwcGVkKHVu
c2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29mZl90IHBnb2ZmLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUsIHZv
aWQgKip2bV9wcml2YXRlX2RhdGEpCj4gPiAgewo+ID4gLSAgICAgICBpbnQgZXJyOwo+ID4gKyAg
ICAgICBjb25zdCB1bnNpZ25lZCBpbnQgbWlub3IgPSBpbWlub3IoZmlsZV9pbm9kZShmaWxlKSk7
Cj4gPiAgICAgICAgIHN0cnVjdCB2bWVfdXNlcl92bWFfcHJpdiAqdm1hX3ByaXY7Cj4gPgo+ID4g
ICAgICAgICBtdXRleF9sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ID4KPiA+IC0gICAgICAg
ZXJyID0gdm1lX21hc3Rlcl9tbWFwKGltYWdlW21pbm9yXS5yZXNvdXJjZSwgdm1hKTsKPiA+IC0g
ICAgICAgaWYgKGVycikgewo+ID4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmaW1hZ2Vb
bWlub3JdLm11dGV4KTsKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4gLSAgICAg
ICB9Cj4gPiAtCj4KPiBPaywgdGhpcyBjaGFuZ2VzIHRoZSBzZXQgb2YgdGhlIG9wZXJhdGlvbnMg
cGVyZm9ybWVkIHVuZGVyIGltYWdlW21pbm9yXS5tdXRleC4KPiBCZWZvcmUgd2UgaGFkOgo+Cj4g
bXV0ZXhfbG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsKPiB2bWVfbWFzdGVyX21tYXAoKTsKPiA8
c29tZSBmaW5hbCBhZGp1c3RtZW50cz4KPiBtdXRleF91bmxvY2soJmltYWdlW21pbm9yXS5tdXRl
eCk7Cj4KPiBOb3cgd2UgaGF2ZToKPgo+IG11dGV4X2xvY2soJmltYWdlW21pbm9yXS5tdXRleCk7
Cj4gdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmUoKQo+IG11dGV4X3VubG9jaygmaW1hZ2VbbWlub3Jd
Lm11dGV4KTsKPiB2bV9pb21hcF9tZW1vcnkoKTsKPiBtdXRleF9sb2NrKCZpbWFnZVttaW5vcl0u
bXV0ZXgpOwo+IHZtZV91c2VyX3ZtX21hcHBlZCgpOyAvLyA8c29tZSBmaW5hbCBhZGp1c3RtZW50
cz4KPiBtdXRleF91bmxvY2soJmltYWdlW21pbm9yXS5tdXRleCk7Cj4KPiBJIHRoaW5rIGFzIGxv
bmcgYXMgaW1hZ2VbbWlub3JdIGRvZXMgbm90IGNoYW5nZSB3aGlsZSB3ZSBhcmUgbm90Cj4gaG9s
ZGluZyB0aGUgbXV0ZXggd2Ugc2hvdWxkIGJlIHNhZmUsIGFuZCBsb29raW5nIGF0IHRoZSBjb2Rl
IGl0IHNlZW1zCj4gdG8gYmUgdGhlIGNhc2UuIEJ1dCBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhp
cyBkcml2ZXIgYW5kIG1pZ2h0IGJlCj4gd3JvbmcuIFdvcnRoIGRvdWJsZS1jaGVja2luZy4KCkEg
c2lkZSBub3RlOiBpZiB3ZSBoYWQgdG8gaG9sZCB0aGUgbXV0ZXggYWNyb3NzIGFsbCB0aG9zZSBv
cGVyYXRpb25zIEkKdGhpbmsgd2Ugd291bGQgbmVlZCB0byB0YWtlIHRoZSBtdXRleCBpbiB0aGUg
dm1fb3BzLT5tbWFwX3ByZXBhcmUgYW5kCmFkZCBhIHZtX29wcy0+bWFwX2ZhaWxlZCBob29rIG9y
IHNvbWV0aGluZyBhbG9uZyB0aGF0IGxpbmUgdG8gZHJvcCB0aGUKbXV0ZXggaW4gY2FzZSBtbWFw
X2FjdGlvbl9jb21wbGV0ZSgpIGZhaWxzLiBOb3Qgc3VyZSBpZiB3ZSB3aWxsIGhhdmUKc3VjaCBj
YXNlcyB0aG91Z2guLi4KCj4KPiA+ICAgICAgICAgdm1hX3ByaXYgPSBrbWFsbG9jX29iaigqdm1h
X3ByaXYpOwo+ID4gICAgICAgICBpZiAoIXZtYV9wcml2KSB7Cj4gPiAgICAgICAgICAgICAgICAg
bXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ID4gQEAgLTQ3MiwyMiArNDYyLDQx
IEBAIHN0YXRpYyBpbnQgdm1lX3VzZXJfbWFzdGVyX21tYXAodW5zaWduZWQgaW50IG1pbm9yLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+Cj4gPiAgICAgICAgIHZtYV9wcml2LT5taW5v
ciA9IG1pbm9yOwo+ID4gICAgICAgICByZWZjb3VudF9zZXQoJnZtYV9wcml2LT5yZWZjbnQsIDEp
Owo+ID4gLSAgICAgICB2bWEtPnZtX29wcyA9ICZ2bWVfdXNlcl92bV9vcHM7Cj4gPiAtICAgICAg
IHZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gdm1hX3ByaXY7Cj4gPiAtCj4gPiArICAgICAgICp2bV9w
cml2YXRlX2RhdGEgPSB2bWFfcHJpdjsKPiA+ICAgICAgICAgaW1hZ2VbbWlub3JdLm1tYXBfY291
bnQrKzsKPiA+Cj4gPiAgICAgICAgIG11dGV4X3VubG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsK
PiA+IC0KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgaW50IHZt
ZV91c2VyX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qgdm1lX3VzZXJf
dm1fb3BzID0gewo+ID4gKyAgICAgICAubWFwcGVkID0gdm1lX3VzZXJfdm1fbWFwcGVkLAo+ID4g
KyAgICAgICAub3BlbiA9IHZtZV91c2VyX3ZtX29wZW4sCj4gPiArICAgICAgIC5jbG9zZSA9IHZt
ZV91c2VyX3ZtX2Nsb3NlLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGludCB2bWVfdXNlcl9t
YXN0ZXJfbW1hcF9wcmVwYXJlKHVuc2lnbmVkIGludCBtaW5vciwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4g
K3sKPiA+ICsgICAgICAgaW50IGVycjsKPiA+ICsKPiA+ICsgICAgICAgbXV0ZXhfbG9jaygmaW1h
Z2VbbWlub3JdLm11dGV4KTsKPiA+ICsKPiA+ICsgICAgICAgZXJyID0gdm1lX21hc3Rlcl9tbWFw
X3ByZXBhcmUoaW1hZ2VbbWlub3JdLnJlc291cmNlLCBkZXNjKTsKPiA+ICsgICAgICAgaWYgKCFl
cnIpCj4gPiArICAgICAgICAgICAgICAgZGVzYy0+dm1fb3BzID0gJnZtZV91c2VyX3ZtX29wczsK
PiA+ICsKPiA+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ID4g
KyAgICAgICByZXR1cm4gZXJyOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHZtZV91c2Vy
X21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4gIHsKPiA+IC0gICAg
ICAgdW5zaWduZWQgaW50IG1pbm9yID0gaW1pbm9yKGZpbGVfaW5vZGUoZmlsZSkpOwo+ID4gKyAg
ICAgICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSA9IGRlc2MtPmZpbGU7Cj4gPiArICAgICAgIGNv
bnN0IHVuc2lnbmVkIGludCBtaW5vciA9IGltaW5vcihmaWxlX2lub2RlKGZpbGUpKTsKPiA+Cj4g
PiAgICAgICAgIGlmICh0eXBlW21pbm9yXSA9PSBNQVNURVJfTUlOT1IpCj4gPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIHZtZV91c2VyX21hc3Rlcl9tbWFwKG1pbm9yLCB2bWEpOwo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiB2bWVfdXNlcl9tYXN0ZXJfbW1hcF9wcmVwYXJlKG1pbm9yLCBkZXNj
KTsKPiA+Cj4gPiAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ID4gIH0KPiA+IEBAIC00OTgsNyAr
NTA3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgdm1lX3VzZXJfZm9w
cyA9IHsKPiA+ICAgICAgICAgLmxsc2VlayA9IHZtZV91c2VyX2xsc2VlaywKPiA+ICAgICAgICAg
LnVubG9ja2VkX2lvY3RsID0gdm1lX3VzZXJfdW5sb2NrZWRfaW9jdGwsCj4gPiAgICAgICAgIC5j
b21wYXRfaW9jdGwgPSBjb21wYXRfcHRyX2lvY3RsLAo+ID4gLSAgICAgICAubW1hcCA9IHZtZV91
c2VyX21tYXAsCj4gPiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSB2bWVfdXNlcl9tbWFwX3ByZXBh
cmUsCj4gPiAgfTsKPiA+Cj4gPiAgc3RhdGljIGludCB2bWVfdXNlcl9tYXRjaChzdHJ1Y3Qgdm1l
X2RldiAqdmRldikKPiA+IC0tCj4gPiAyLjUzLjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
