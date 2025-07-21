Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDACC83F22
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqOv5ZfTWMfGRL1wKXLiGbuc1EUlDyo9YeoFNJZc/R0=; b=Ks7n70Gbioeotg
	WTvQiSDjuFmRwgyiZoKEoAy/eRdLPV/abMyCw8m7IMCwnVEB6mw+odDaXHFxl/EEF/q+Ypx//0/Mb
	62hYsusgr7lakJsu8VdKXPb0ciuHVSgLFnak7dQOZ3n6+cvxpKau7GJwxvecxxfn4gPMX66E2tbJ6
	adAdP5l2RBLl/h+3MG/1DP/NYg+MLuK6KMamlXYjdPJCwZSfVDXnPeMLXvjWJs5JH5FwI1g93ib7K
	v94JK/NLldAt4UF8DGykbk6t860vF2wrwGMZrGjDjiU2zhOtfgUaGwaK681fmg/FDY2+vSfeSPAt4
	+TRBu3R8eQ9xP2LeruuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udevm-0000000FuIK-04aG;
	Mon, 21 Jul 2025 01:03:02 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udevi-0000000FuHc-3QH7
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 01:03:00 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-87f32826f22so5254306241.0
        for <linux-mtd@lists.infradead.org>; Sun, 20 Jul 2025 18:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059777; x=1753664577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUWA5dQohEpiNzIiLQ5yB5KcDd7NwkYx6hF+GZtItHM=;
        b=kHQ5e7cYdzby67zTCIbFwF5/jZEP5oIkxJ9urTK+jtm8kKyYTLXeuMNdTa3zWQovim
         RXOAiGO0xvTqYtBajP4L4NjxRiVPVL7iQzf+0Hy2qZXKVToicjsUwV3g+bgubwjMR+yO
         Ae/Oz04FrpwJQA15W/LThqUWNjJhK/zlWnELoABsgLpiD42Rp9BzxgoL9djU/wpwcn8B
         5LCdXcCiJXOY+p6cMHjINN5Ny+kkiNVNJjbJu1iUVXHGyNLM2W2a0qLCIRMadhxlpFrk
         2ILcPQoLazT9Afzq6vz3mAYwpBdLG7TiEBORjSMSSm1u3ZH7yiuyaUd7eJo5bJVJct1/
         wfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059777; x=1753664577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUWA5dQohEpiNzIiLQ5yB5KcDd7NwkYx6hF+GZtItHM=;
        b=c7NNuW95TMrVvTLG5blDVboAHvBMkOKoPfbosmw3wpNkbwavyzEmTWLPR30tLj9ZS8
         iuCiR9XgFLoTA6ciH/0DE1l+eVJ7XvIHWZud/k7b1g5ZoalBnt/C2g8SqfYQvbAKroKB
         ea2O9lCgUrufu2buaYudPwYOJiQy+p6LDSB/rSjaHHskHyAJR+VI/kW1+Yct12zON406
         pDl93DnilqIUHGhgi3p4wv9LuG/npghBIhquAkyI0pdJEwL4UjPGm/nCDsR+onPOURDY
         ZgYr2yDFcRmbPTLJdaHRmZmvIIOh/IUv/W28DORXotvhjpRVlKSTdl2NYohv9bY5Oy/m
         xgbw==
X-Forwarded-Encrypted: i=1; AJvYcCX17OHxAPGC8Vi9ITH6BafqGM44XUuaeeLVykEUVXqor7JDCXzvXodKpGOCopFrVLNTYYPMLkKtOtw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Y0G3tJQlp/4iiAXDFvPeJ0tlAor7VeeDeqk/6XQr7cU+p0rm
	19bphghVkW1fJwPsaR0Qn3hA/Bw1K5pYPosKRHudGlWcVwgMxLnLOOlIhKwz5JU40sWywZUoQ3w
	ICbuzw+48rApOfh8OMVI1oqjTrHYASO8=
X-Gm-Gg: ASbGncvHVWFsBKE744iRKEc0hYUjx5sGm/XZGzDDE/XesPgrsutkitwpMsMQ648pn8X
	uqL5/G8fmWp4AtD/rqOj77kx5V+r9zfx8HrQuqn9tiL0k0IZ84RprP3l8FVpH3bcsO08CsgGnbF
	bJpb+HCQlihTtNx6j6Le650ff328BTR8GX9pmBD9aRQcDQlEov2ck26GLhAtgTuRYMzvnmNZPZv
	YVV2s8=
X-Google-Smtp-Source: AGHT+IEmfqw92aWBN5S+l0I76SU0igPCpvqCsAsKehe4/Ig+tf7XCtcGuzfl8boXl3T7O5lTenPtedOe1kc4xTvXkm8=
X-Received: by 2002:a05:6102:30c8:10b0:4e9:9221:46d5 with SMTP id
 ada2fe7eead31-4f9a863ff9fmr3911618137.3.1753059777443; Sun, 20 Jul 2025
 18:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <aHa8ylTh0DGEQklt@casper.infradead.org> <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
In-Reply-To: <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 21 Jul 2025 09:02:45 +0800
X-Gm-Features: Ac12FXxvyCQ0eeZOJnljUPiNW1hOMFbnyUUqpvxURHtPLurlhEFVPbwv81doELM
Message-ID: <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
Subject: Re: Compressed files & the page cache
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, 
	Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	David Howells <dhowells@redhat.com>, netfs@lists.linux.dev, 
	Paulo Alcantara <pc@manguebit.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	Phillip Lougher <phillip@squashfs.org.uk>, Hailong Liu <hailong.liu@oppo.com>, 
	Qu Wenruo <quwenruo.btrfs@gmx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_180258_879313_EC26CDD2 
X-CRM114-Status: GOOD (  38.04  )
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

T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgODoyOOKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMDI1LzcvMTYgMDc6MzIsIEdhbyBY
aWFuZyB3cm90ZToKPiA+IEhpIE1hdHRoZXcsCj4gPgo+ID4gT24gMjAyNS83LzE2IDA0OjQwLCBN
YXR0aGV3IFdpbGNveCB3cm90ZToKPiA+PiBJJ3ZlIHN0YXJ0ZWQgbG9va2luZyBhdCBob3cgdGhl
IHBhZ2UgY2FjaGUgY2FuIGhlbHAgZmlsZXN5c3RlbXMgaGFuZGxlCj4gPj4gY29tcHJlc3NlZCBk
YXRhIGJldHRlci4gIEZlZWRiYWNrIHdvdWxkIGJlIGFwcHJlY2lhdGVkISAgSSdsbCBwcm9iYWJs
eQo+ID4+IHNheSBhIGZldyB0aGluZ3Mgd2hpY2ggYXJlIG9idmlvdXMgdG8gYW55b25lIHdobyBr
bm93cyBob3cgY29tcHJlc3NlZAo+ID4+IGZpbGVzIHdvcmssIGJ1dCBJJ20gdHJ5aW5nIHRvIGJl
IGV4cGxpY2l0IGFib3V0IG15IGFzc3VtcHRpb25zLgo+ID4+Cj4gPj4gRmlyc3QsIEkgYmVsaWV2
ZSB0aGF0IGFsbCBmaWxlc3lzdGVtcyB3b3JrIGJ5IGNvbXByZXNzaW5nIGZpeGVkLXNpemUKPiA+
PiBwbGFpbnRleHQgaW50byB2YXJpYWJsZS1zaXplZCBjb21wcmVzc2VkIGJsb2Nrcy4gIFRoaXMg
d291bGQgYmUgYSBnb29kCj4gPj4gcG9pbnQgdG8gc3RvcCByZWFkaW5nIGFuZCB0ZWxsIG1lIGFi
b3V0IGNvdW50ZXJleGFtcGxlcy4KPiA+Cj4gPiBBdCBsZWFzdCB0aGUgdHlwaWNhbCBFUk9GUyBj
b21wcmVzc2VzIHZhcmlhYmxlLXNpemVkIHBsYWludGV4dCAoYXQgbGVhc3QKPiA+IG9uZSBibG9j
aywgZS5nLiA0aywgYnV0IGFsc28gNGsrMSwgNGsrMiwgLi4uKSBpbnRvIGZpeGVkLXNpemVkIGNv
bXByZXNzZWQKPiA+IGJsb2NrcyBmb3IgZWZmaWNpZW50IEkvT3MsIHdoaWNoIGlzIHJlYWxseSB1
c2VmdWwgZm9yIHNtYWxsIGNvbXByZXNzaW9uCj4gPiBncmFudWxhcml0eSAoZS5nLiA0S2lCLCA4
S2lCKSBiZWNhdXNlIHVzZSBjYXNlcyBsaWtlIEFuZHJvaWQgYXJlIHVzdWFsbHkKPiA+IHVuZGVy
IG1lbW9yeSBwcmVzc3VyZSBzbyBsYXJnZSBjb21wcmVzc2lvbiBncmFudWxhcml0eSBpcyBhbG1v
c3QKPiA+IHVuYWNjZXB0YWJsZSBpbiB0aGUgbG93IG1lbW9yeSBzY2VuYXJpb3MsIHNlZToKPiA+
IGh0dHBzOi8vZXJvZnMuZG9jcy5rZXJuZWwub3JnL2VuL2xhdGVzdC9kZXNpZ24uaHRtbAo+ID4K
PiA+IEN1cnJlbnRseSBFUk9GUyB3b3JrcyBwcmV0dHkgd2VsbCBvbiB0aGVzZSBkZXZpY2VzIGFu
ZCBoYXMgYmVlbgo+ID4gc3VjY2Vzc2Z1bGx5IGRlcGxveWVkIGluIGJpbGxpb25zIG9mIHJlYWwg
ZGV2aWNlcy4KPiA+Cj4gPj4KPiA+PiAgRnJvbSB3aGF0IEkndmUgYmVlbiByZWFkaW5nIGluIGFs
bCB5b3VyIGZpbGVzeXN0ZW1zIGlzIHRoYXQgeW91IHdhbnQgdG8KPiA+PiBhbGxvY2F0ZSBleHRy
YSBwYWdlcyBpbiB0aGUgcGFnZSBjYWNoZSBpbiBvcmRlciB0byBzdG9yZSB0aGUgZXhjZXNzIGRh
dGEKPiA+PiByZXRyaWV2ZWQgYWxvbmcgd2l0aCB0aGUgcGFnZSB0aGF0IHlvdSdyZSBhY3R1YWxs
eSB0cnlpbmcgdG8gcmVhZC4gIFRoYXQncwo+ID4+IGJlY2F1c2UgY29tcHJlc3NpbmcgaW4gbGFy
Z2VyIGNodW5rcyBsZWFkcyB0byBiZXR0ZXIgY29tcHJlc3Npb24uCj4gPj4KPiA+PiBUaGVyZSdz
IHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVtcyB3aGV0aGVyIHlvdSBuZWVkIHNj
cmF0Y2gKPiA+PiBzcGFjZSBmb3IgZGVjb21wcmVzc2lvbi4gIFNvbWUgZmlsZXN5c3RlbXMgcmVh
ZCB0aGUgY29tcHJlc3NlZCBkYXRhIGludG8KPiA+PiB0aGUgcGFnZWNhY2hlIGFuZCBkZWNvbXBy
ZXNzIGluLXBsYWNlLCB3aGlsZSBvdGhlciBmaWxlc3lzdGVtcyByZWFkIHRoZQo+ID4+IGNvbXBy
ZXNzZWQgZGF0YSBpbnRvIHNjcmF0Y2ggcGFnZXMgYW5kIGRlY29tcHJlc3MgaW50byB0aGUgcGFn
ZSBjYWNoZS4KPiA+Pgo+ID4+IFRoZXJlIGFsc28gc2VlbXMgdG8gYmUgc29tZSBkaXNjcmVwYW5j
eSBiZXR3ZWVuIGZpbGVzeXN0ZW1zIHdoZXRoZXIgdGhlCj4gPj4gZGVjb21wcmVzc2lvbiBpbnZv
bHZlcyB2bWFwKCkgb2YgYWxsIHRoZSBtZW1vcnkgYWxsb2NhdGVkIG9yIHdoZXRoZXIgdGhlCj4g
Pj4gZGVjb21wcmVzc2lvbiByb3V0aW5lcyBjYW4gaGFuZGxlIGRvaW5nIGttYXBfbG9jYWwoKSBv
biBpbmRpdmlkdWFsIHBhZ2VzLgo+ID4+Cj4gPj4gU28sIG15IHByb3Bvc2FsIGlzIHRoYXQgZmls
ZXN5c3RlbXMgdGVsbCB0aGUgcGFnZSBjYWNoZSB0aGF0IHRoZWlyIG1pbmltdW0KPiA+PiBmb2xp
byBzaXplIGlzIHRoZSBjb21wcmVzc2lvbiBibG9jayBzaXplLiAgVGhhdCBzZWVtcyB0byBiZSBh
cm91bmQgNjRrLAo+ID4+IHNvIG5vdCBhbiB1bnJlYXNvbmFibGUgbWluaW11bSBhbGxvY2F0aW9u
IHNpemUuICBUaGF0IHJlbW92ZXMgYWxsIHRoZQo+ID4+IGV4dHJhIGNvZGUgaW4gZmlsZXN5c3Rl
bXMgdG8gYWxsb2NhdGUgZXh0cmEgbWVtb3J5IGluIHRoZSBwYWdlIGNhY2hlLj4gSXQgbWVhbnMg
d2UgZG9uJ3QgYXR0ZW1wdCB0byB0cmFjayBkaXJ0aW5lc3MgYXQgYSBzdWItZm9saW8gZ3JhbnVs
YXJpdHkKPiA+PiAodGhlcmUncyBubyBwb2ludCwgd2UgaGF2ZSB0byB3cml0ZSBiYWNrIHRoZSBl
bnRpcmUgY29tcHJlc3NlZCBib2NrCj4gPj4gYXQgb25jZSkuICBXZSBhbHNvIGdldCBhIHNpbmds
ZSB2aXJ0dWFsbHkgY29udGlndW91cyBibG9jayAuLi4gaWYgeW91J3JlCj4gPj4gd2lsbGluZyB0
byBkaXRjaCBISUdITUVNIHN1cHBvcnQuICBPciB0aGVyZSdzIGEgcHJvcG9zYWwgdG8gaW50cm9k
dWNlIGEKPiA+PiB2bWFwX2ZpbGUoKSB3aGljaCB3b3VsZCBnaXZlIHVzIGEgdmlydHVhbGx5IGNv
bnRpZ3VvdXMgY2h1bmsgb2YgbWVtb3J5Cj4gPj4gKGFuZCBjb3VsZCBiZSB0cml2aWFsbHkgdHVy
bmVkIGludG8gYSBub29wIGZvciB0aGUgY2FzZSBvZiB0cnlpbmcgdG8KPiA+PiB2bWFwIGEgc2lu
Z2xlIGxhcmdlIGZvbGlvKS4KPiA+Cj4gPiBJIGRvbid0IHNlZSB0aGlzIHdpbGwgd29yayBmb3Ig
RVJPRlMgYmVjYXVzZSBFUk9GUyBhbHdheXMgc3VwcG9ydHMKPiA+IHZhcmlhYmxlIHVuY29tcHJl
c3NlZCBleHRlbnQgbGVuZ3RocyBhbmQgdGhhdCB3aWxsIGJyZWFrIHR5cGljYWwKPiA+IEVST0ZT
IHVzZSBjYXNlcyBhbmQgb24tZGlzayBmb3JtYXRzLgo+ID4KPiA+IE90aGVyIHRoaW5nIGlzIHRo
YXQgbGFyZ2Ugb3JkZXIgZm9saW9zIChwaHlzaWNhbCBjb25zZWN1dGl2ZSkgd2lsbAo+ID4gY2F1
c2VkICJpbmNyZWFzZSB0aGUgbGF0ZW5jeSBvbiBVWCB0YXNrIHdpdGggZmlsZW1hcF9mYXVsdCgp
Igo+ID4gYmVjYXVzZSBvZiBoaWdoLW9yZGVyIGRpcmVjdCByZWNsYWltcywgc2VlOgo+ID4gaHR0
cHM6Ly9hbmRyb2lkLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2Mva2VybmVsL2NvbW1vbi8rLzM2
OTIzMzMKPiA+IHNvIEVST0ZTIHdpbGwgbm90IHNldCBtaW4tb3JkZXIgYW5kIGFsd2F5cyBzdXBw
b3J0IG9yZGVyLTAgZm9saW9zLgo+ID4KPiA+IEkgdGhpbmsgRVJPRlMgd2lsbCBub3QgdXNlIHRo
aXMgbmV3IGFwcHJvYWNoLCB2bWFwKCkgaW50ZXJmYWNlIGlzCj4gPiBhbHdheXMgdGhlIGNhc2Ug
Zm9yIHVzLgo+Cj4gLi4uIGhpZ2gtb3JkZXIgZm9saW9zIGNhbiBjYXVzZSBzaWRlIGVmZmVjdHMg
b24gZW1iZWRkZWQgZGV2aWNlcwo+IGxpa2Ugcm91dGVycyBhbmQgSW9UIGRldmljZXMsIHdoaWNo
IHN0aWxsIGhhdmUgTWlCcyBvZiBtZW1vcnkgKGFuZCBJCj4gYmVsaWV2ZSB0aGlzIHdvbid0IGNo
YW5nZSBkdWUgdG8gdGhlaXIgdXNlIGNhc2VzKSBidXQgdGhleSBhbHNvIHVzZQo+IExpbnV4IGtl
cm5lbCBmb3IgcXVpdGUgbG9uZyB0aW1lLiAgSW4gc2hvcnQsIEkgZG9uJ3QgdGhpbmsgZW5hYmxp
bmcKPiBsYXJnZSBmb2xpb3MgZm9yIHRob3NlIGRldmljZXMgaXMgdmVyeSB1c2VmdWwsIGxldCBh
bG9uZSBsaW1pdGluZwo+IHRoZSBtaW5pbXVtIGZvbGlvIG9yZGVyIGZvciB0aGVtIChJdCB3b3Vs
ZCBtYWtlIHRoZSBmaWxlc3lzdGVtIG5vdAo+IHN1aXRhYmxlIGFueSBtb3JlIGZvciB0aG9zZSB1
c2Vycy4gIEF0IGxlYXN0IHRoYXQgaXMgd2hhdCBJIG5ldmVyCj4gd2FudCB0byBkbykuICBBbmQg
SSBiZWxpZXZlIHRoaXMgaXMgZGlmZmVyZW50IGZyb20gdGhlIGN1cnJlbnQgTEJTCj4gc3VwcG9y
dCB0byBtYXRjaCBoYXJkd2FyZSBjaGFyYWN0ZXJpc3RpY3Mgb3IgTEJTIGF0b21pYyB3cml0ZQo+
IHJlcXVpcmVtZW50LgoKR2l2ZW4gdGhlIGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBm
b2xpb3MsIGl0J3MgYWx3YXlzIGEgZ29vZAppZGVhIHRvIGhhdmUgb3JkZXItMCBhcyBhIGZhbGxi
YWNrLiBXaGlsZSBJIGFncmVlIHdpdGggeW91ciBwb2ludCwKSSBoYXZlIGEgc2xpZ2h0bHkgZGlm
ZmVyZW50IHBlcnNwZWN0aXZlIOKAlCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZm9yCnRob3NlIGRl
dmljZXMgbWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVyIHNob3VsZApy
ZW1haW4gc21hbGwuIEknbSByZWZlcnJpbmcgdG8gInNtYWxsIiBsYXJnZSBmb2xpb3MuCgpTdGls
bCwgZXZlbiB3aXRoIHRob3NlLCBhbGxvY2F0aW9uIGNhbiBiZSBkaWZmaWN1bHQg4oCUIGVzcGVj
aWFsbHkKc2luY2Ugc28gbWFueSBvdGhlciBhbGxvY2F0aW9ucyAod2hpY2ggYXJlbid0IGxhcmdl
IGZvbGlvcykgY2FuIGNhdXNlCmZyYWdtZW50YXRpb24uIFNvIGhhdmluZyBvcmRlci0wIGFzIGEg
ZmFsbGJhY2sgcmVtYWlucyBpbXBvcnRhbnQuCgpJdCBzZWVtcyB3ZSdyZSBtaXNzaW5nIGEgbWVj
aGFuaXNtIHRvIGVuYWJsZSAic21hbGwiIGxhcmdlIGZvbGlvcwpmb3IgZmlsZXMuIEZvciBhbm9u
IGxhcmdlIGZvbGlvcywgd2UgZG8gaGF2ZSBzeXNmcyBrbm9ic+KAlHRob3VnaCB0aGV5CmRvbuKA
mXQgc2VlbSB0byBiZSB1bml2ZXJzYWxseSBhcHByZWNpYXRlZC4gOi0pCgpUaGFua3MKQmFycnkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
