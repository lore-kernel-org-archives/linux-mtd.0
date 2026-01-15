Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A555D46627
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kr0ZqjLbz4OB47Xs3qMEmoduQ53iF8JCl7Eqqx7PW0I=; b=Nr9g1gy47XbELF
	JciDe8s0tYxKBkoiqwGnFNf65wm56/sx4RT8trtwuHaxZlJv2AQufZC3IeK/8fnCf5p7BqNIc1TdQ
	v+Fl/fOfZRFG4XUM3UJbXygVe2wX7RQCgGmlkxB2X920t8eL0qGpV4MwwVAeYgM7YTH0/ErXO1eAh
	hc+M7WPVlzcTjMO9BFfPVXT7mFpxe0gvFx5I4g0zxzHRaVFGaYnOkTqNNvC/dEKheqvcsvuRtmUpS
	ZleFTQOWJ9CsMR/7D4V1cKgaNsUJmsRwqzDTU4wn0M95CuzNyvaXzJZ3ipHEPWPZSIJovxTiK19lh
	R9/kW9Jl0hKqTqyaeE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUb6-0000000DCwK-1afB;
	Thu, 15 Jan 2026 21:09:40 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUb3-0000000DCvo-2Mu0
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 21:09:39 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-81f478e5283so1204382b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1768511376; x=1769116176; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9qNaS/mHG0CWRhBXyo18LMgHGDC++HAHg2FdEUDjFsI=;
        b=Zoyr2lhw7wWeAgNiUjyoLi2xfJN6GDkt8w7c0+JY7o4ZrN7CAfqIS10exdpMFYWgYC
         NgW4+YhEH2hpNDCLX9DNDX+piZMrpgRLVYBzH73Wm8n/t9+NaWLixqZQsQJuWArdHn6o
         rju1tl598apaurzxSo8GnmLNg0ogUSpR2oSBi4sceAlPuX8Eb26rpl5n4XtbkoqJH51X
         P/WDLpvepq3ZQYftTMJTfaFVr7dqPeIJ2bcg5xH0ajeMV6ReNqTIwiUkfL/mm5WUUTtu
         Oilrtid0VWRzHYFklcWQWinElxGBSFei1p5TSHGQpjCWSE192al01AzzO7U8WlYaoS5r
         /SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511376; x=1769116176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qNaS/mHG0CWRhBXyo18LMgHGDC++HAHg2FdEUDjFsI=;
        b=T3R1cZ1pj4O6Y9oHIWWI3l4p7NomubvTPJBB9wfqdScm8w5jOp1oh71dv3purPaSTX
         XkXv7rDpD8KRVoom/cWsVhqv2U41W25yYOcDg+Wisc12s240QEbsltnIY4qjfEgMfTm8
         SO/KC8Qlix67xyxgi6Ho/cOAsLTKI7Ivp5qUiQdJ9Xcwn915hivMsNKrecsvUyx9yDDC
         vyzisCH+nZuPEyt207EId9UcYolhrTtPIl5ZI2bIf/GGYgenOvKewY4E1p3bp+qlc9s9
         C5Yh32UJSv6hvUS+ABPOkB53rNI1jJVsSi9z6KEMElrgYbsRuwFi4helTQjtgYZcxVhA
         GoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOszGLrGFmwgCBbeS0qD9IOd9DOyXsDwRewedh4pk5LrXUy/fkpbxGz7RD3+NCDYIbYQCnyZcCTFc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIhtGe2yELXHWYyFKa/U1JmJWEod8SGKxoibR8wybzGWaOGALY
	OX3A097g4waXy/R9mLMASsy7ztxrWaIRMQnw044ZSoR/0Fq8KGVyPBz5cU3mjIr5y3I=
X-Gm-Gg: AY/fxX5UNoJTc6wK/Smm+c+9zFk6HeoS7tpVTpmssOqg5Emj39riI6JVXNq7zc/VWTa
	xDdzWlpFUxUCHyX9QSS0UeGBnKDeypY1YkV1lvk9rixbWnm0fxWBTZrFgKRspuPAmK7S5bibuXv
	bBdnC8AnIwD3QjxwVQ/yXhhqZTrqg2M/Ycuda3qd2Anc3d7zWutQtCC1fpW6KZuVA3zfzIYz+8J
	bo4rc0JqatJbK0V0Lz8B6pgdV7mt6L0ZS8kcOuuV7Ot9dq5skJH8qqzBSMnOfBYQchHm/0xrAwl
	xEP7P4QDxAphstMTrh+ujKHXB8wHNu0jgDUimkTspm/tLxNZ2xm8GwmKf+wZtlgjfqVpucRBa/G
	n/tRpCl62ZYNmhLAP7d4gYdHnmYU7gNiL67KdOxeQD/kgI8WMfYcr+pnY8OlloFKQ8yYO5+lT+6
	IfA2CdM5mHo8Rm4i9Gex/EyC53PXi81nO7tbFYodpwbd2TfOEqlubiOQvVFo7D9LM=
X-Received: by 2002:a05:6a00:1c99:b0:81e:5d52:53b9 with SMTP id d2e1a72fcca58-81f9f7f61bamr693898b3a.8.1768511376156;
        Thu, 15 Jan 2026 13:09:36 -0800 (PST)
Received: from dread.disaster.area (pa49-180-164-75.pa.nsw.optusnet.com.au. [49.180.164.75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bda5csm259171b3a.19.2026.01.15.13.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:09:35 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.99.1)
	(envelope-from <david@fromorbit.com>)
	id 1vgUai-00000003vHn-2AU2;
	Fri, 16 Jan 2026 08:09:16 +1100
Date: Fri, 16 Jan 2026 08:09:16 +1100
From: Dave Chinner <david@fromorbit.com>
To: Chuck Lever <cel@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Theodore Tso <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-unionfs@vger.kernel.org, devel@lists.orangefs.org,
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev,
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
Message-ID: <aWlXfBImnC_jhTw4@dread.disaster.area>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_130937_772700_7E41B883 
X-CRM114-Status: GOOD (  23.86  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgMDI6Mzc6MDlQTSAtMDUwMCwgQ2h1Y2sgTGV2ZXIgd3Jv
dGU6Cj4gT24gMS8xNS8yNiAyOjE0IFBNLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+IE9uIFRo
dSwgSmFuIDE1LCAyMDI2IGF0IDc6MzLigK9QTSBDaHVjayBMZXZlciA8Y2VsQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4+Cj4gPj4KPiA+Pgo+ID4+IE9uIFRodSwgSmFuIDE1LCAyMDI2LCBhdCAxOjE3
IFBNLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+Pj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQg
Njo0OOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Pj4K
PiA+Pj4+IEluIHJlY2VudCB5ZWFycywgYSBudW1iZXIgb2YgZmlsZXN5c3RlbXMgdGhhdCBjYW4n
dCBwcmVzZW50IHN0YWJsZQo+ID4+Pj4gZmlsZWhhbmRsZXMgaGF2ZSBncm93biBzdHJ1Y3QgZXhw
b3J0X29wZXJhdGlvbnMuIFRoZXkndmUgbW9zdGx5IGRvbmUKPiA+Pj4+IHRoaXMgZm9yIGxvY2Fs
IHVzZS1jYXNlcyAoZW5hYmxpbmcgb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQgdGhlIGxpa2UpLgo+
ID4+Pj4gVW5mb3J0dW5hdGVseSwgaGF2aW5nIGV4cG9ydF9vcGVyYXRpb25zIGlzIGdlbmVyYWxs
eSBzdWZmaWNpZW50IHRvIG1ha2UKPiA+Pj4+IGEgZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVkIGV4
cG9ydGFibGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJlcXVpcmVzIHRoYXQKPiA+Pj4+IHRoZSBzZXJ2
ZXIgcHJlc2VudCBzdGFibGUgZmlsZWhhbmRsZXMuCj4gPj4+Cj4gPj4+IFdoZXJlIGRvZXMgdGhl
IHRlcm0gInN0YWJsZSBmaWxlIGhhbmRsZXMiIGNvbWUgZnJvbT8gYW5kIHdoYXQgZG9lcyBpdCBt
ZWFuPwo+ID4+PiBXaHkgbm90ICJwZXJzaXN0ZW50IGhhbmRsZXMiLCB3aGljaCBpcyBkZXNjcmli
ZWQgaW4gTkZTIGFuZCBTTUIgc3BlY3M/Cj4gPj4+Cj4gPj4+IE5vdCB0byBtZW50aW9uIHRoYXQg
RVhQT1JUX09QX1BFUlNJU1RFTlRfSEFORExFUyB3YXMgQWNrZWQKPiA+Pj4gYnkgYm90aCBDaHJp
c3RvcGggYW5kIENocmlzdGlhbjoKPiA+Pj4KPiA+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1sZWloZ2FiZS0xMjAxOGU5M2MwMGNAYnJh
dW5lci8KPiA+Pj4KPiA+Pj4gQW0gSSBtaXNzaW5nIGFueXRoaW5nPwo+ID4+Cj4gPj4gUEVSU0lT
VEVOVCBnZW5lcmFsbHkgaW1wbGllcyB0aGF0IHRoZSBmaWxlIGhhbmRsZSBpcyBzYXZlZCBvbgo+
ID4+IHBlcnNpc3RlbnQgc3RvcmFnZS4gVGhpcyBpcyBub3QgdHJ1ZSBvZiB0bXBmcy4KPiA+IAo+
ID4gVGhhdCdzIG9uZSB3YXkgb2YgaW50ZXJwcmV0aW5nICJwZXJzaXN0ZW50Ii4KPiA+IEFub3Ro
ZXIgd2F5IGlzICJjb250aW51aW5nIHRvIGV4aXN0IG9yIG9jY3VyIG92ZXIgYSBwcm9sb25nZWQg
cGVyaW9kLiIKPiA+IHdoaWNoIHdvcmtzIHdlbGwgZm9yIHRtcGZzIHRoYXQgaXMgbW91bnRlZCBm
b3IgYSBsb25nIHRpbWUuCj4gCj4gSSB0aGluayB3ZSBjYW4gYmUgYSBsb3QgbW9yZSBwcmVjaXNl
IGFib3V0IHRoZSBndWFyYW50ZWU6IFRoZSBmaWxlCj4gaGFuZGxlIGRvZXMgbm90IGNoYW5nZSBm
b3IgdGhlIGxpZmUgb2YgdGhlIGlub2RlIGl0IHJlcHJlc2VudHMuIEl0Cgo8cGVkYW50aWMgbW9k
ZSBlbmdhZ2VkPgoKRmlsZSBoYW5kbGVzIG1vc3QgZGVmaW5pdGVseSBjaGFuZ2Ugb3ZlciB0aGUg
bGlmZSBvZiBhIC9waHlzaWNhbC8KaW5vZGUuIFVubGlua2luZyBhIGZpbGUgZG9lcyBub3QgcmVx
dWlyZSBlbmRpbmcgdGhlIGxpZmUgb2YgdGhlCnBoeXNpY2FsIG9iamVjdCB0aGF0IHByb3ZpZGVz
IHRoZSBwZXJzaXN0ZW50IGRhdGEgc3RvcmUgZm9yIHRoZQpmaWxlLgoKZS5nLiBYRlMgZHluYW1p
Y2FsbHkgYWxsb2NhdGVzIHBoeXNpY2FsIGlub2RlcyBtaWdodCBpbiBhIGxpZmUgY3ljbGUKdGhh
dCBsb29rcyBzb21ld2hhdCBsaWZlIHRoaXM6CgoJYWxsb2NhdGUgcGh5c2ljYWwgaW5vZGUKCWlu
c2VydCByZWNvcmQgaW50byBhbGxvY2F0ZWQgaW5vZGUgaW5kZXgKCW1hcmsgaW5vZGUgYXMgZnJl
ZQoKCXdoaWxlIChkb24ndCBuZWVkIHRvIGZyZWUgcGh5c2ljYWwgaW5vZGUpIHsKCQkuLi4KCQlh
bGxvY2F0ZSBpbm9kZSBmb3IgYSBuZXcgZmlsZQoJCXVwZGF0ZSBwZXJzaXN0ZW50IGlub2RlIG1l
dGFkYXRhIHRvIGdlbmVyYXRlIG5ldyBmaWxlaGFuZGxlCgkJbWFyayBpbm9kZSBpbiB1c2UKCQku
Li4KCQl1bmxpbmsgZmlsZQoJCW1hcmsgaW5vZGUgZnJlZQoJfQoKCXJlbW92ZSBpbm9kZSBmcm9t
IGFsbG9jYXRlZCBpbm9kZSBpbmRleAoJZnJlZSBwaHlzaWNhbCBpbm9kZQoKaS5lLiBhIGZyZWUg
aW5vZGUgaXMgc3RpbGwgYW4gLWFsbG9jYXRlZCwgaW5kZXhlZCBpbm9kZS0gaW4gdGhlCmZpbGVz
eXN0ZW0sIGFuZCB1bnRpbCB3ZSBwaHlzaWNhbGx5IHJlbW92ZSBpdCBmcm9tIHRoZSBmaWxlc3lz
dGVtCnRoZSBpbm9kZSBsaWZlIGN5Y2xlIGhhcyBub3QgZW5kZWQuCgpJT1dzLCB0aGUgcGh5c2lj
YWwgKHBlcnNpc3RlbnQpIGlub2RlIGxpZmV0aW1lIGNhbiBzcGFuIHRoZSBsaWZldGltZQpvZiAt
bWFueS0gZmlsZXMuIEhvd2V2ZXIsIHRoZSBmaWxlc3lzdGVtIGd1YXJhbnRlZXMgdGhhdCB0aGUg
aGFuZGxlCmdlbmVyYXRlZCBmb3IgdGhhdCBpbm9kZSBpcyBkaWZmZXJlbnQgZm9yIGVhY2ggZmls
ZSBpdCByZXByZXNlbnRzCm92ZXIgdGhlIHdob2xlIGlub2RlIGxpZmUgdGltZS4KCkhlbmNlIEkg
dGhpbmsgdGhhdCBmaWxlIGhhbmRsZSBzdGFiaWxpdHkvcGVyc2lzdGVuY2UgbmVlZHMgdG8gYmUK
ZGVmaW5lZCBpbiB0ZXJtcyBvZiAtZmlsZSBsaWZldGltZXMtLCBub3QgdGhlIGxpZmV0aW1lcyBv
ZiB0aGUKZmlsZXN5c3RlbSBvYmplY3RzIGltcGxlbWVudCB0aGUgZmlsZSdzIHBlcnNpc3RlbnQg
ZGF0YSBzdG9yZS4KCi1EYXZlLgotLSAKRGF2ZSBDaGlubmVyCmRhdmlkQGZyb21vcmJpdC5jb20K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
