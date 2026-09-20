Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6503C982D8
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1TC4wmvxarK8DksOuv79zlQq7tFcGqmABapqGkgwoo=; b=hRKPupj5C+ekB7
	738bPIF1Z9lZ/xm2vSs3LV/wJxfNFikjpfu9VqG9DukxQI7jWtNypMbIFBdTv1gW1BOLa6gcNZ/yY
	fzONcCszPAV67JVm6E9AWZiAfz382yx8b560tj0sIJx7xSF5tbcVKvCu454yb7lMixiKaQ+tfaqkN
	CEZzZ0GPJdSRbi54d9LpoXvBkvSV81+Ia14Cky33pFNa8JZs21dggRwJ0PKLFpVI8zqMfik6V8Irb
	t7jXeaakt1AyFsdWSszW0VJsfjaUR5xSRIqHmi2jdopWjpItaCZZcFjW7h6fqS19Hb5iupkqShQ3E
	Vs8jXvuxIyToAPgdnDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MMi-00000000FJH-1PMF;
	Sun, 20 Sep 2026 18:34:16 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MMg-00000000FIv-0ou8
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 18:34:15 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 00721157ae682-895eaf30817so22998787b3.0
        for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2026 11:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789929252; cv=none;
        d=google.com; s=arc-20260327;
        b=pKgJ+vKrVAk2n/9JCbInkmKFbFg28cVwjP0y/RGg5LX1LMbIi4sv+QcbvmkaobaMxY
         B6GxjfutrWbH3DySjnrDjQMyxdsJqDydaBjV0J6e1tqP+Ygg6d6BNUP1DrYi0ePhj0n5
         EyM45Ufgi/Zm2Sn5TbGYwZzn3epxBM8g6rTQ1P0dn5+i4k/NBtwp3leq7MVchCRjyNnV
         vN1RLIyL71PGka1LImWukEYQtp6OK+cMo9JT05gODWvo9jPMzrFEsO5+qYDe5/3g9gJI
         A8xHaknqCTHmEScpU/MrlD0tnDyJFWNpP/aAReqQvT8NmGpN9e0rOqStE3oM8Tv9GUoi
         wYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        fh=1bNKVkJakGjfITmFWuzpHAn5fxnFZ6SJDV9PpytQHYc=;
        b=E8jpL3hMHjER/si8gvpf2nhjOTxdyGOwdROi91CvdYrS73TklKxsmnTrv0ZDiM8fJ3
         IAr2PQ0PM+rjlPmzINIzOe1iYwtJ99emOEwlHRzSygkGudIx8HisdTlOmzxuJDMyQds0
         +XULEbT6S+7TYe1jyzVKY+h3lBEKlTp4Ry/7iE9npgfAREavPIevs6oBIaQowaDyEajb
         tHdNNn1XFglsTNibDPlGE5WN4Bivh+xZCdp9PbMD/9eeVPIpY79PyJChj65FOyNeEF0K
         vxOXoMXmp5+I5hhQPn3PigQ3K65NpJpeCQ59Q1v5rRkurGsEzIlNGpWQlBMWmJ0y0IjV
         wHLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789929252; x=1790534052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        b=V4HKMne3GoYWa9iZOWShuDTloF7KrHsIR1/rxTPE7/s3D09raHEQKho7bhAvjZNJml
         6fCvEvcB13g6Slub3sIMDmCECE5opzrTIblhX7VzQIHAur1WSaCC6sOPmCEm2WV9ZU2G
         k9uXlCX5HNFRTc5Vos2OjQpVmB6FlhX33Neb2GWoKDFG98AiFlRkmnDXjv8ao6eVrzEk
         P7qAQfXQI1ry5ynMkJ0DkJMWOwHitL3kWII37tKSEzSAa+hFVc41vZgoPMkc/mU9q+8e
         crXUknBYFLDtS99qNfw2qczYHWK7O35OWS9xDGByBOPi8DTLIldkaGaeMX2YMJLdO/Qs
         whmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929252; x=1790534052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        b=iBU+mh+cxokiYA3oKLhee3obWzYyS8tBcGaaY1n25DZ1+H9sjoKashIvGHWKnIseob
         rgrZhkGb/wNIycjyo4AlI0ZgyAG/jcjBw/C2r2nBrtagKLxgw8ov/8FmMc1wbHL/Rd34
         5jN153RmAeEqNsuWH42+xWxaaxBk7IXFGsoLuZPgXTEXHiYJJfdzBfC7SCijSmcrMzDd
         M2OaqmYP6A0MzH+k2/XcVNYUCw/aOZqaC1iUyDK7WOCJuFAoWVCjiHybZXad7DHeXh/K
         ivH8RKeMmwScbGbR3mYEN84LdHJJ44HXncQWFPo4r/U8orz4X8H0ICOfWZ898KJFBPmh
         2vNA==
X-Forwarded-Encrypted: i=1; AKwUvByaKaAH1QhJ/zkJBCIFd0Vahb0EykvpAWPwDKyPFJeJ7CS8CyDJg0bgVRr9Fdp9QPIpBtJLqVoGbT0=@lists.infradead.org
X-Gm-Message-State: AFuF++n9yKWFiLiX9a4UbHfHBmE4EhFmYhb8cSVd4yEaaL96RXVFobKL
	aLD4fb3CTvsOI9r/ftqV41J7cfXXGgya6EUfWBer9TKbKckC4mHVn5v0O5xxy7kAzesMi7qK1JN
	AD+jfPiIIKc50IrHn5TLChoLvZW9s4tv99pjTM3RE8l0=
X-Gm-Gg: AYBFou1wU806srr0gkEZWNY7YkbJRZdH/vubWlzUdE6hThl/svPMWHR5lhs6VRwT6Ip
	L7f1WALNQMzcuJfB9RcAxW6WOaNaTbFk4FyQb8Lg96oRRgmzKcuOtiyTmEAT0AZqltcJI5xQJVg
	Z3HYQSUOZYhiprS994GrIv2llQJdqRoyqOnb4QwRJeZWETaYvdps49wj1zzFgRA/t+sU7Me0NJ0
	S5aQKIojEQz0J98Mt647znVt93+L4DKGXVzWIoKyhJKQ/b3wOdKXKhHwRQNXMkkKcAg4UVP4Nam
	ejXksjGi4/oPovh2VjvhyAU3rFsUKBn/9NiHXwd6rm8uahw3cY+kNBKEPSZkXkWTmVc4yNutKlc
	0ZSfiriFWvT2GGQOPw2CoK2e3Y30Gr5Cr/unJTuwRUXLSuTl5xjLgcUjlDLe+fS6Ld9urKUWMAJ
	7lRUw/M63/uc4SQln+cwd9c8h6
X-Received: by 2002:a05:690c:e24b:20b0:873:5bd1:98b6 with SMTP id
 00721157ae682-89736b37e64mr15478617b3.40.1789929252348; Sun, 20 Sep 2026
 11:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
 <aq6gJTYTpTr8sYPj@cashel.logfs.org> <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
 <aq6sd2Z3nZuAYbMG@cashel.logfs.org> <87cxu8axvh.fsf@bootlin.com> <arAHq0imD-Gm_bOc@cashel.logfs.org>
In-Reply-To: <arAHq0imD-Gm_bOc@cashel.logfs.org>
From: Chris Roy <iam@thechris.in>
Date: Mon, 21 Sep 2026 00:04:00 +0530
X-Gm-Features: AcwNN1XxQ2tTnCe51T1q51ULBvx85COBmsrgwZB0hguL-K1VAzqspcbd4FKQXzI
Message-ID: <CAE2Bdm2TpoA9ctHGhvtrDePvz11Yf3koyiw9S4WvY0jS5jZSuQ@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	vigneshr@ti.com, Adarsh Das <adarshdas950@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_113414_257500_BEBA450D 
X-CRM114-Status: GOOD (  27.53  )
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

I3N5eiBzZXQgc3Vic3lzdGVtczogbXRkCgoKUmVnYXJkcywKLSBDaHJpcwoKIkJ1dCBob3cgY291
bGQgeW91IGxpdmUgYW5kIGhhdmUgbm8gc3RvcnkgdG8gdGVsbD8iCgpPbiBTdW4sIDIwIFNlcHQg
MjAyNiBhdCAyMTo1MCwgSsO2cm4gRW5nZWwgPGpvZXJuQGJhcmVseXNlY3VyZS5vcmc+IHdyb3Rl
Ogo+Cj4gSGVsbG8gTWlxdcOobAo+Cj4gT24gU3VuLCBTZXAgMjAsIDIwMjYgYXQgMDI6NTI6MThQ
TSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+Cj4gPiBOb3Qgc2F5aW5nIHRoaXMgd291
bGQgYmUgYSBiYWQgbW92ZSwgaXQgd291bGQgYmUgaGlnaGx5IGluY29uc2lzdGVudAo+ID4gd2l0
aCB0aGUgY3VycmVudCBjb2RlIGJhc2UuIEV2ZXJ5IHNpbmdsZSBhbGxvY2F0aW9uIGluIHRoZSBr
ZXJuZWwgaXMKPiA+IGNoZWNrZWQuIFN1Y2ggYSBjaGFuZ2UsIHdpdGhvdXQgYSBkb2N1bWVudGVk
IGFuZCBhZ3JlZWQgdXBvbiBtZXRob2QsCj4gPiB3b3VsZCBsZWFkIHRvIGRvemVucyBmdXp6aW5n
IEFJcyBzZW5kaW5nIHBhdGNoZXMgdG8gYWRkIHRoZSAibWlzc2luZyIKPiA+IGNoZWNrLgo+Cj4g
SWYgeW91ciBhcmd1bWVudCBpcyB0aGF0IHN1Y2ggYSBjaGFuZ2Ugd291bGQgYmUgaW5hcHByb3By
aWF0ZSBmb3IgdGhlCj4gcGF0Y2ggaW4gcXVlc3Rpb24sIEkgdG90YWxseSBhZ3JlZSB3aXRoIHlv
dS4KPgo+IEkgd291bGQgZGlzYWdyZWUgd2l0aCBhbiBhcmd1bWVudCBvZiAid2Ugc2hvdWxkIGRv
IHRoZSB3cm9uZyB0aGluZyBmb3IKPiB0aGUgc2FrZSBvZiBjb25zaXN0ZW5jeSIuICBJZiBpbmRl
ZWQgaXQgaXMgdGhlIHdyb25nIHRoaW5nLCB3ZSBzaG91bGQKPiBzdG9wIGRvaW5nIGl0LiAgVGhl
biB3ZSBjYW4gcmVnYWluIGNvbnNpc3RlbmN5IGJ5IG5vdCBkb2luZyB0aGUgd3JvbmcKPiB0aGlu
ZyBhbnl3aGVyZS4gIEluIG90aGVyIHdvcmRzLCBjb25zaXN0ZW5jeSBpcyBpcnJlbGV2YW50LiAg
VGhlIG9ubHkKPiBxdWVzdGlvbiBzaG91bGQgYmUgd2hldGhlciBzdWNoIGEgY2hhbmdlIGlzIHJp
Z2h0IG9yIHdyb25nLgo+Cj4gVGhlcmUgaXMgYWxzbyB0aGUgcHJhY3RpY2FsIGNvbnNpZGVyYXRp
b24gdGhhdCBjaGFuZ2luZyB0aGUga21hbGxvYwo+IGludGVyZmFjZSB3aWxsIGxlYWQgdG8gdGhv
dXNhbmRzIG9mIGNoYW5nZXMgdGhyb3VnaG91dCB0aGUga2VybmVsIGFuZAo+IHJlcXVpcmVzIGEg
bGFyZ2UgdGltZSBjb21taXRtZW50IGZyb20gc29tZW9uZS4gIElmIG5vYm9keSB2b2x1bnRlZXJz
IHRvCj4gYmUgdGhhdCBzb21lb25lLCBpdCBtaWdodCBzdGlsbCBiZSBiZXR0ZXIgdG8gc3RpY2sg
d2l0aCB0aGUgc3RhdHVzIHF1bwo+IGZvciBub3cuCj4KPgo+IFNvIG1ha2luZyBhbiBlbnRpcmVs
eSB0aGVvcmV0aWNhbCAiaWYgSSB3ZXJlIGtpbmcgZm9yIGEgZGF5IiBraW5kIG9mCj4gYXJndW1l
bnQsIEkgZG9uJ3QgdGhpbmsgR0ZQX0tFUk5FTCBhbGxvY2F0aW9ucyBzaG91bGQgaGF2ZSB0byBj
aGVjayBmb3IKPiBmYWlsdXJlLiAgTmVpdGhlciBzaG91bGQgdXNlcnNwYWNlIGNhbGxlcnMgdG8g
bWFsbG9jLiAgQW4gaW50ZXJmYWNlIHRoYXQKPiBmcmVxdWVudGx5IHJldHVybnMgZXJyb3JzIGlz
IHByZXR0eSBzYWZlLCBhcyBjYWxsZXJzIHdpdGggYnJva2VuIGVycm9yCj4gaGFuZGxpbmcgYXJl
IHF1aWNrbHkgZGV0ZWN0ZWQgYW5kIGZpeGVzLiAgQW4gaW50ZXJmYWNlIHRoYXQgYWxtb3N0IG5l
dmVyCj4gcmV0dXJucyBlcnJvcnMgaXMgZGFuZ2Vyb3VzLCBhcyBicm9rZW4gZXJyb3IgaGFuZGxp
bmcgaW4gY2FsbGVycyBiZWNvbWVzCj4gY29tbW9uIGFuZCB3aWxsIGV2ZW50dWFsbHkgbGVhZCB0
byBiaXphcnJlIGhhcmQtdG8tcmVwcm9kdWNlIGZhaWx1cmVzLgo+Cj4gT25lIG9mIG15IHJvbGVz
IGluIG15IGxhc3Qgam9iIHdhcyB0byBmaXggdXNlcnNwYWNlIG1hbGxvYyBhbmQgb25lIG9mIG15
Cj4gZml4ZXMgd2FzIHRvIGVuc3VyZSBpdCB3b3VsZCBuZXZlciByZXR1cm4gYW4gYWxsb2NhdGlv
biBmYWlsdXJlLiAgSWYgaXQKPiByZXR1cm5lZCwgdGhlIGNhbGxlciByZWNlaXZlZCB3aGF0IGl0
IHJlcXVlc3RlZC4gIElmIHRoYXQgd2Fzbid0Cj4gcG9zc2libGUsIHRoZSBwcm9jZXNzIHdvdWxk
IGNyYXNoLiAgQSBjcmFzaGluZyBwcm9jZXNzIGlzbid0IGV4YWN0bHkKPiBkZXNpcmVkLCBidXQg
aXQgYmVhdHMgdW5wcmVkaWN0YWJsZSBiZWhhdmlvciB0cmlnZ2VyZWQgYnkgYnJva2VuIGVycm9y
Cj4gaGFuZGxlcnMuICBBbmQgZGVhbGluZyB3aXRoIGEgc2luZ2xlIGVycm9yIHBhdGggY29zdHMg
c2lnbmlmaWNhbnRseSBsZXNzCj4gY29nbml0aXZlIGVmZm9ydCB0aGFuIGRlYWxpbmcgd2l0aCB0
aG91c2FuZHMgb2YgZXJyb3IgaGFuZGxlcnMKPiBldmVyeXdoZXJlIGluIHRoZSBjb2RlIGJhc2Uu
Cj4KPiBBbnl3YXksIHNpbmNlIEkgYW0gbm90IHZvbHVudGVlcmluZyB0byBzcGVuZCBhIHNpZ25p
ZmljYW50IGNodW5rIG9mIG15Cj4gdGltZSwgdGhpcyBpcyBqdXN0IHRoZSBvcGluaW9uIG9mIHNv
bWVvbmUgdGhhdCBkb2Vzbid0IG1hdHRlci4gIEZlZWwKPiBmcmVlIHRvIHJlamVjdCBpdC4KPgo+
IErDtnJuCj4KPiAtLQo+IFdoeSBkbyBtdXNpY2lhbnMgY29tcG9zZSBzeW1waG9uaWVzIGFuZCBw
b2V0cyB3cml0ZSBwb2Vtcz8KPiBUaGV5IGRvIGl0IGJlY2F1c2UgbGlmZSB3b3VsZG4ndCBoYXZl
IGFueSBtZWFuaW5nIGZvciB0aGVtIGlmIHRoZXkgZGlkbid0Lgo+IFRoYXQncyB3aHkgSSBkcmF3
IGNhcnRvb25zLiAgSXQncyBteSBsaWZlLgo+IC0tIENoYXJsZXMgU2h1bHR6CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
