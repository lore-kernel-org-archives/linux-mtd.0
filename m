Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0D4C83F27
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 03:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OPHl5At0OsUfUTGpWT5MNW9h9Bdi2FyQdrJiNh08CA=; b=J9sApiB0arMDE+
	OYIK8KX9JfWEIJrgejGV42LU7ODrjasslQ1kd+Dt5yfkRnterq8oy1lj8Ximxe2Au3U6YmIrnQamS
	tHXFq96fnTfz6oh8pWvVeNNRURgc02joYnbAe1QOFMe2NFnJxPVNKid7wzwZviO1cnmY6w6T3TIG2
	3QJfPutJJ8gZspbGq9NBKJNuu1uyOWms1Yv2r4bcSvWMWNznLL0qCCDAgcTzKOBoVHuyFobsZy75r
	THRmA4cicFUwk8UuR/GHLp7NdLyr4tq53qhjXWNHDXCilyQB1autNgL1134bGo0GAOr+YCcgNoWWO
	KCZ5cOEy3Z6+rgDnjY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue45G-00000001DIK-1znL;
	Tue, 22 Jul 2025 03:54:30 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue45D-00000001DHm-2iUQ
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 03:54:28 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5313eff2649so1307253e0c.0
        for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2025 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753156466; x=1753761266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAAlykKu642VPrQqfIgQ/sSqAoZceoQZhIURS8zROzA=;
        b=THMt57RBZ8Nqb1OWasF6ylhFsFc8VQ6bYI1ZPBV7l1eRpK+thpQtp8OP6+FUbjvTSa
         88JeF7VLkoGc22J7pBTDAQYF67+HQoBsIwDkn07NqG+L0jOLESPzsWIWlcZ1BI7CFgRQ
         X7O6gep4F8sEDvPGJ08teCzLLZvnIsN5WkcOslWtjOEdx+VFG7IIzB8ad98dwtlZ8sro
         9Nhdhcp25SOP58Yolv3Q6a3ochyGahQp6yqJsjxCooc+JYwBm2pajRt3GeZzuhOYCHFm
         jigmo9PgdCENL+ouQ1Aqm1BtgtxasNCmi6VJ+jgbr2iPRswNxtwQpwSRCVWAyryNQtNL
         Asmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156466; x=1753761266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAAlykKu642VPrQqfIgQ/sSqAoZceoQZhIURS8zROzA=;
        b=ibDNJterotIRgsvpP7ZWuRtK2y+cC7z1TrgsoPf1JPdpRClTLMvKTQ1/D4y+GeHDAO
         JTL8ez1KpdDKmxLNyXHRQToXCfxU3Ku7vEZHGuqn29DGmYrSIsO3N2U6LpGSPDAwckl5
         DzzxAZC/OpN7yOyy3EPPc8remNAds7ifDO56M1pDTf0H78RrrWwISg8UPxxVKLiwuLEI
         65eKFJHavB6Th8WZqpRG8uKI+kGc6ww1KIxT1W4BS4/MEUimeN6XCiXFnXlZFlu33Ffc
         DPnxv8N9w0Y2fgvqtzUzUiajxFAdpMRChAtZ7dnTCgLdRvR7851wqLdALsuwCtT0ubDc
         uz7w==
X-Forwarded-Encrypted: i=1; AJvYcCXo+67KPCSQe4wisb3o8uDiUKVH0RctUHqQrDhd4D33ziAaKm9RjPwS9lUfxVKCOUTJfz2s3cq4AyY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRZpvWDwZp+W8IcSnmjC7bQMQlyTqQ/852yPyKVxOzG+2/7c95
	7EyyT0VCybhyiPkIrEhbATRGvw7lvS7VO7T7mmAi6v3sNLi1VihDNNxRLE4dlvUsFRBhxY4yQzf
	8V8Gsmf+uXKtbGwGezuV5z9xBUKCbjRA=
X-Gm-Gg: ASbGncuSV98ibVI1mQF0sheG2AGwUOYbCzQH0Cv/jVFTquXHU5yO3qOVJb0CGOYXx+B
	BNFPR6nk8Ejmp/8qb78+A1NcWxTQ2FZ6IpS9vSSM+iwMAqTTmQ6KtCv1Fy/HLGd5Ftzapw9m03j
	s3ugDNlOAliLWPIZfLRw2wcROVwnq0KKMBB5KV0MS9uB8relWPx1Cvcx0y6scQYztYNei/A1fVY
	fp6Ir0=
X-Google-Smtp-Source: AGHT+IFdEM3sDnKSU7djtnY2X77gIkWr33PBhDuXfdQIDGEOAUgRW6b8nyrGT5SpWkQFjiRSNtgM+8Lmi+axf63N/6M=
X-Received: by 2002:a05:6122:4d0f:b0:531:236f:1295 with SMTP id
 71dfb90a1353d-5373fbda52dmr10043238e0c.5.1753156466033; Mon, 21 Jul 2025
 20:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <aHa8ylTh0DGEQklt@casper.infradead.org> <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com> <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com> <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
 <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
In-Reply-To: <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 22 Jul 2025 11:54:14 +0800
X-Gm-Features: Ac12FXykbYYT14P53wpCeHJw2yoMEcQU-j3E43IYKsTdPACdf43QFDrlblVigVM
Message-ID: <CAGsJ_4ySQFzSbXZzecH9oy53KFpVsoaqXThPiJxfYUJF3_Y+Hg@mail.gmail.com>
Subject: Re: Compressed files & the page cache
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Jan Kara <jack@suse.cz>, Gao Xiang <hsiangkao@linux.alibaba.com>, 
	Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, 
	Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	David Howells <dhowells@redhat.com>, netfs@lists.linux.dev, 
	Paulo Alcantara <pc@manguebit.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	Phillip Lougher <phillip@squashfs.org.uk>, Hailong Liu <hailong.liu@oppo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_205427_702390_DCAB46F7 
X-CRM114-Status: GOOD (  26.81  )
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgNzozN+KAr1BNIFF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRy
ZnNAZ214LmNvbT4gd3JvdGU6Cj4KPgo+Cj4g5ZyoIDIwMjUvNy8yMSAxOTo1NSwgSmFuIEthcmEg
5YaZ6YGTOgo+ID4gT24gTW9uIDIxLTA3LTI1IDExOjE0OjAyLCBHYW8gWGlhbmcgd3JvdGU6Cj4g
Pj4gSGkgQmFycnksCj4gPj4KPiA+PiBPbiAyMDI1LzcvMjEgMDk6MDIsIEJhcnJ5IFNvbmcgd3Jv
dGU6Cj4gPj4+IE9uIFdlZCwgSnVsIDE2LCAyMDI1IGF0IDg6MjjigK9BTSBHYW8gWGlhbmcgPGhz
aWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPiA+Pj4gR2l2ZW4gdGhl
IGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBmb2xpb3MsIGl0J3MgYWx3YXlzIGEgZ29v
ZAo+ID4+PiBpZGVhIHRvIGhhdmUgb3JkZXItMCBhcyBhIGZhbGxiYWNrLiBXaGlsZSBJIGFncmVl
IHdpdGggeW91ciBwb2ludCwKPiA+Pj4gSSBoYXZlIGEgc2xpZ2h0bHkgZGlmZmVyZW50IHBlcnNw
ZWN0aXZlIOKAlCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZm9yCj4gPj4+IHRob3NlIGRldmljZXMg
bWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVyIHNob3VsZAo+ID4+PiBy
ZW1haW4gc21hbGwuIEknbSByZWZlcnJpbmcgdG8gInNtYWxsIiBsYXJnZSBmb2xpb3MuCj4gPj4K
PiA+PiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4aW11bSBvcmRl
ciBmb3IgdGhvc2Ugc21hbGwKPiA+PiBkZXZpY2VzIChyYXRoZXIgdGhhbiBkaXNhYmxpbmcgaXQg
Y29tcGxldGVseSkgd291bGQgYmUgaGVscGZ1bC4gIEF0Cj4gPj4gbGVhc3QgInNtYWxsIiBsYXJn
ZSBmb2xpb3MgY291bGQgc3RpbGwgcHJvdmlkZSBiZW5lZml0cyB3aGVuIG1lbW9yeQo+ID4+IHBy
ZXNzdXJlIGlzIGxpZ2h0Lgo+ID4KPiA+IFdlbGwsIGluIHRoZSBwYWdlIGNhY2hlIHlvdSBjYW4g
dHVuZSBub3Qgb25seSB0aGUgbWluaW11bSBidXQgYWxzbyB0aGUKPiA+IG1heGltdW0gb3JkZXIg
b2YgYSBmb2xpbyBiZWluZyBhbGxvY2F0ZWQgZm9yIGVhY2ggaW5vZGUuIEJ0cmZzIGFuZCBleHQ0
Cj4gPiBhbHJlYWR5IHVzZSB0aGlzIGZ1bmN0aW9uYWxpdHkuIFNvIGluIHByaW5jaXBsZSB0aGUg
ZnVuY3Rpb25hbGl0eSBpcyB0aGVyZSwKPiA+IGl0IGlzICJqdXN0IiBhIHF1ZXN0aW9uIG9mIHBy
b3BlciB1c2VyIGludGVyZmFjZXMgb3IgYXV0b21hdGljIGxvZ2ljIHRvCj4gPiB0dW5lIHRoaXMg
bGltaXQuCj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBIb256YQo+Cj4gQW5kIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBk
b2Vzbid0IG1lYW4gYWxsIGZzIG9wZXJhdGlvbnMgd2lsbCBncmFiIGFuCj4gdW5uZWNlc3Nhcmls
eSBsYXJnZSBmb2xpby4KPgo+IEZvciBidWZmZXJlZCB3cml0ZSwgYWxsIHRob3NlIGZpbGVzeXN0
ZW0gd2lsbCBvbmx5IHRyeSB0byBnZXQgZm9saW9zIGFzCj4gbGFyZ2UgYXMgbmVjZXNzYXJ5LCBu
b3Qgb3Zlcmx5IGxhcmdlLgo+Cj4gVGhpcyBtZWFucyBpZiB0aGUgdXNlciBzcGFjZSBwcm9ncmFt
IGlzIGFsd2F5cyBkb2luZyBidWZmZXJlZCBJTyBpbiBhCj4gcG93ZXItb2YtdHdvIHVuaXQgKGFu
ZCBhbGlnbmVkIG9mZnNldCBvZiBjb3Vyc2UpLCB0aGUgZm9saW8gc2l6ZSB3aWxsCj4gbWF0Y2gg
dGhlIGJ1ZmZlciBzaXplIHBlcmZlY3RseSAoaWYgd2UgaGF2ZSBlbm91Z2ggbWVtb3J5KS4KPgo+
IFNvIGZvciBwcm9wZXJseSBhbGlnbmVkIGJ1ZmZlcmVkIHdyaXRlcywgbGFyZ2UgZm9saW9zIHdv
bid0IHJlYWxseSBjYXVzZQo+ICAgdW5uZWNlc3NhcmlseSBsYXJnZSBmb2xpb3MsIG1lYW53aGls
ZSBicmluZ3MgYWxsIHRoZSBiZW5lZml0cy4KCkkgZG9uJ3QgdGhpbmsgdGhpcyBjYXB0dXJlcyB0
aGUgZnVsbCBwaWN0dXJlLiBGb3IgZXhhbXBsZSwgaW4gbWVtb3J5CnJlY2xhbWF0aW9uLCBpZiBh
bnkgc2luZ2xlIHN1YnBhZ2UgaXMgaG90LCB0aGUgZW50aXJlIGxhcmdlIGZvbGlvIGlzCnRyZWF0
ZWQgYXMgaG90IGFuZCBjYW5ub3QgYmUgcmVjbGFpbWVkLiBTbyBJ4oCZbSBub3QgY29udmluY2Vk
IHRoYXQKImZpbGVzeXN0ZW1zIHdpbGwgb25seSB0cnkgdG8gZ2V0IGZvbGlvcyBhcyBsYXJnZSBh
cyBuZWNlc3NhcnkiIGlzIHRoZQpyaWdodCBwb2xpY3kuCgpMYXJnZSBmb2xpb3MgYXJlIGEgZ29v
ZCBpZGVhLCBidXQgdGhlIGxhY2sgb2YgY29udHJvbCBvdmVyIHRoZWlyIG1heGltdW0Kc2l6ZSBs
aW1pdHMgdGhlaXIgcHJhY3RpY2FsIGFwcGxpY2FiaWxpdHkuIFdoZW4gYW4gZW1iZWRkZWQgZGV2
aWNlIGVuYWJsZXMKbGFyZ2UgZm9saW9zIGFuZCBvbmx5IG9ic2VydmVzIHBlcmZvcm1hbmNlIHJl
Z3Jlc3Npb25zLCB0aGUgaW1tZWRpYXRlCnJlYWN0aW9uIGlzIG9mdGVuIHRvIGRpc2FibGUgdGhl
IGZlYXR1cmUgZW50aXJlbHkuIFRoaXMsIGluIHR1cm4sIGhhcm1zIHRoZQphZG9wdGlvbiBhbmQg
ZGV2ZWxvcG1lbnQgb2YgbGFyZ2UgZm9saW9zLgoKPgo+IEFsdGhvdWdoIEknbSBub3QgZmFtaWxp
YXIgZW5vdWdoIHdpdGggZmlsZW1hcCB0byBjb21tZW50IG9uIGZvbGlvIHJlYWQKPiBhbmQgcmVh
ZGFoZWFkLi4uCj4KPiBUaGFua3MsCj4gUXUKCkJlc3QgUmVnYXJkcwpCYXJyeQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
