Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D963CC982D7
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwettME+Nac37n1+rMUBEBKOeOYrj75H56KgQN223Z4=; b=K7Sb+E9ekkfzyW
	zilBkO/JuW8weMbNyC6swJB34s+g0DK6ggqq8foHtLk1Kk2tB4dUWCdN3niWOD2n+4bzNkyM/vs58
	AQIsHX/GjSRFvAlZ4Kj+Wnin4tQM5xsgG4zpl5OmvGMBVuaYavAzqaIXBCiFMwjkRCG3agc0IihWl
	c1ilmHlMa7oG2RGVrao81GTJcNnb2kiR57RkHzhL/OHm2NlSobWnASoIlwnz4eIRgtq7k9SWMU4np
	mWpZe0248jn/IozD/jnsZX/GklGB9Yabbohmix3q7cXAvz9KllhKv5+qKeZki8NoMwBZnD5JKqrE9
	YLfGv/PGE+V7UCSkiPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wJ4-0000000GOTs-2P9g;
	Sat, 19 Sep 2026 14:44:46 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wJ2-0000000GOTJ-2Rqz
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 14:44:45 +0000
Received: by mail-yx2-x11.google.com with SMTP id 00721157ae682-85d4ddd179eso13653927b3.3
        for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2026 07:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789829083; cv=none;
        d=google.com; s=arc-20260327;
        b=sn6O6qhCRxxGjgTryEReezSzic+mfF3L6rUO5X4UPhWCa+Ga1BxJitxOITBKoegdmB
         tMGnRmBQ7+R9/rgM5gxcNd95zz/FZtsQzv0/mxGqPiNFnfWc5tl6A6rBuJm13Ygk2UtE
         HeQI/MokLJnenSi1na951Tg6V/zg3LVvweN3Bl8dK0zJspexqCWg0K7PMuPGzvBwMJJZ
         orKF35yqHxMIjcRrPz5WtrNrwDWo63MGzvr00bYfD0D+EvJK0T9HNymqXAHuCdp2YUKZ
         z0a0XiOtkt3RprjV8xE4zelAwO/Sox+7bEccKHIjpKBsZ1mJnGtJ2Nk/7Qv4mcK7CJE1
         ukng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        fh=cvRQ+Nc2ysesLUi8OV49eFSUNVcczgbXGwh6M5ApG8w=;
        b=oNMLEaDNRlwtM3U4YAXoNcZ3zPosWOCM0advQVZmiUezs/uqPfZ8o0tVUC3eh7E9+Y
         F41ImZHWqaWw1yhEF5oTlG0/c41mvwzKGrMPb5W5CE135BetJ6NQYNpaIPM4t7EwY407
         LJIp8L0hW1tIv5IlI539wmqTKO109onf1hsgNnqJQhDHvx5+iXxvW/vJx4VFqBX/Yde1
         LyJLp2dEeVLYjHXgWRMY51gSsdNZb+YpuFKapifhKCsxMI/u4vXrvtGRimRONzRyrVOy
         oqm7usQ9Gm/bVdzKWHx1byCxamGEwaYKv5nsrd88PTXKISBnPyT/IS+NxPwvGy8CDAQi
         Nqaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789829083; x=1790433883; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        b=Xy68OmMES+Js25iZbTvVSkhgAyp8OSXhJD94JLrUfpRHOTZ+WRYoqrv6vIebcWaNaH
         NWIBq08LJVF7ucfhxEYd+Qsv0FNF2VS+R246i+c6Q71xH3AVAoNQjab4O5lJTXa+4sBq
         J4eXB1GmW+ilPr+NYYnuMEN5RtqXs3Wiax8iHcZPJhzeIB+sdZi6QDgSc/VDN5Be9jhy
         Z4NT0eUL8AefbsScH6SuscRrk6VPFfHZl6dXMlK8BG5vKx7SJa2nXwatfaxO6yr2irkp
         YOKVANnjJUqqlPHxMNiaQwvkE8hu5jiNRorfsEu/zwwfzFZdSGSR2rxNaNRuXWxNSFGy
         /CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789829083; x=1790433883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        b=Iq+3KnGFmTJl9oLfqQCSbEktuAKbp/efu+Gga6N5hwMtNaxOZU4j1mnnYswCAHqlpn
         XxSzZ5KljPGSZhaLzsxiY9xmT0tYViD7KF4VHheJj0rx/+weGpseeOXTsNiPRi2XLjr2
         x1Nbd4Th5r05Jy2Hn4MNXWjd1MntEA3SzYYEI/Q4hFGmFDrKFCLLArHd90HD1FTUchCB
         b2Tw82gqnRth9VbMzO10CkSCY/7ZU0zk16n7xVEYOIJYC0W5+SinI63MOQFss1j5c2h2
         2/QC8SopGEIS7rSbgfzmlxDxd15whFUJ0bLPGp3s/kC7iXq85iKrGqqGs6FeMZguIcis
         u9QA==
X-Forwarded-Encrypted: i=1; AKwUvBx7i5MmVITR6N7yGUCLaW0ZH4oNxQWQev17R+/l0nwi3UpBBl1PaxXrbWLWcd5LBEvzHa7f+lHxRAo=@lists.infradead.org
X-Gm-Message-State: AFuF++nZhsrHFJ0WUpRhRccwixomkl+/s0aMKFp7d5WV6x0XLrBUwK3G
	KKsckj8ecGo85w0X4x2WzPPKD7VC2sZULy9dNuzsJ36h7Hs8m8q9MOge/o/Jj9CYxy4DY0C7b8A
	qOFijoavyLY7GjQZ/mmQBo6fKJ0SSl7kXIrUspE1eG24=
X-Gm-Gg: AYBFou1z5HS7neu+NSI9oCctY8xLxzNJTPJYzqqhHTNY9xT5ZfourGS8BdISF7LLFU6
	Ud8SYfuqzTajJL5N9PzXlTSLkYD0CeAa6UDja8EXr/Az8qdTe40GioWUuj3I3+Fh2i+3NxMWiOq
	o9NOqFZ4Ztzxv4ePYCh8nQ+BFG2K+mGta3X4ifN5vPkyiOPmE4XOxTkE8pfhBLubchHUxGFreUW
	mi+C/O72Njx6DJSRgXbOO6c4hrmOqGjberFE8sSI60tZ01Ziyrmh8PAKM6Jj+iBVEsVfabmhCCr
	2pCyQ22iFHghjpWUodj1vs3hKn4InX5e4yzpNTyemNkJYOAE8ktTHzCNwWKZyuh2zVWAdDMxzYE
	T2JCcJUSYb46SZYhhBLvA8JEflt+dfkp3i1glge5lDno7nb3DJfoFbvGDVNdWgpRDAgx9ShBFvF
	8RxEvzmIwMem6Hth8=
X-Received: by 2002:a05:690c:e685:b0:89a:63da:cbe5 with SMTP id
 00721157ae682-89a63dacd4cmr7313797b3.43.1789829083163; Sat, 19 Sep 2026
 07:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org> <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
In-Reply-To: <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
From: Chris Roy <iam@thechris.in>
Date: Sat, 19 Sep 2026 20:14:31 +0530
X-Gm-Features: AcwNN1VVdZq_i5--e-uskgSmXVQpAASq_eAqaNA9x5LP_XOGGCjlgNcTays_lsQ
Message-ID: <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_074444_641729_011453AF 
X-CRM114-Status: GOOD (  16.37  )
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

T24gU2F0LCBTZXAgMTksIDIwMjYsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPiBXaGlsZSB3
ZSdyZSBoZXJlLCBtYXliZSBpdCdzIHRpbWUgdG8gYWRkIGEgZGVjZW50IGNvbmZpZ2ZzIGludGVy
ZmFjZSB0bwo+IHRoaXMgZHJpdmVyIGluc3RlYWQgb2YgY29uZmlndXJpbmcgdGhyb3VnaCBtb2R1
bGUgcGFyYW1ldGVycy4KPiBUaGF0IHdheSBhbHNvIG11bHRpcGxlIGluc3RhbmNlcyBhcmUgcG9z
c2libGUuCj4KPiBJTUhPIHRlc3RpbmcgaXMgdGhlIG9ubHkgdXNlIGNhc2UuIEkgdXNlIGl0IHJl
Z3VsYXJseS4KCkkgd291bGQgbG92ZSB0byBsb29rIGF0IHRoaXMgaWYgeW91IHRoaW5rIGl0J3Mg
d29ydGggdGhlIGFkZGVkCmNvbXBsZXhpdHkuIEEgY291cGxlIG9mIGRlc2lnbiBxdWVzdGlvbnMg
YmVmb3JlIEkgc3RhcnQKb24gYW55dGhpbmc6CgotIERvZXMgY29uZmlnZnMgY29leGlzdCB3aXRo
IHRoZSBleGlzdGluZyBibG9jazJtdGQ9IG1vZHVsZSBwYXJhbQogIChmb3IgZWFybHktYm9vdC9j
bWRsaW5lIGNvbXBhdGliaWxpdHkpLCBvciByZXBsYWNlIGl0IG91dHJpZ2h0PwoKLSBGb3IgbXVs
dGlwbGUgaW5zdGFuY2VzLCB3b3VsZCBhIGNvbmZpZ2ZzIGdyb3VwIHBlciBkZXZpY2UgKGJhY2tp
bmcKICBwYXRoLCBlcmFzZSBzaXplLCBsYWJlbCkgbWF0Y2ggd2hhdCB5b3UgaGFkIGluIG1pbmQ/
CgpDYW4gc2tldGNoIGFuIFJGQy1zdHlsZSBkb2Mgb25jZSBJIGhhdmUgYSBzZW5zZSBvZiB0aGUg
YWJvdmUuCgpSZWdhcmRzLApDaHJpcwoKT24gU2F0LCAxOSBTZXB0IDIwMjYgYXQgMTk6NTgsIFJp
Y2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOgo+Cj4gQW0gU2F0LCBTZXAg
MTksIDIwMjYsIDE2OjIyIHNjaHJpZWIgSsO2cm4gRW5nZWwgPGpvZXJuQGJhcmVseXNlY3VyZS5v
cmc+Ogo+ID4gSSBhZGRlZCBBZGFyc2ggRGFzLCB3aG8gYWxzbyBhdHRlbXB0ZWQgdG8gZml4IHRo
aXMgYnVnLgo+ID4KPiA+IE9uIFNhdCwgU2VwIDE5LCAyMDI2IGF0IDA3OjQyOjI1QU0gKzAwMDAs
IFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPiA+ID4KPiA+ID4gV2hpbGUgd2UncmUgaGVyZSwg
bWF5YmUgaXQncyB0aW1lIHRvIGFkZCBhIGRlY2VudCBjb25maWdmcyBpbnRlcmZhY2UgdG8KPiA+
ID4gdGhpcyBkcml2ZXIgaW5zdGVhZCBvZiBjb25maWd1cmluZyB0aHJvdWdoIG1vZHVsZSBwYXJh
bWV0ZXJzLgo+ID4gPiBUaGF0IHdheSBhbHNvIG11bHRpcGxlIGluc3RhbmNlcyBhcmUgcG9zc2li
bGUuCj4gPgo+ID4gSSBob25lc3RseSB3b25kZXIgd2hldGhlciB0aGlzIGRyaXZlciBoYXMgYW55
IHByb2R1Y3Rpb24gdXNlcnMuICBJdCBpcwo+ID4gc29tZXdoYXQgdXNlZnVsIGZvciBkZXZlbG9w
ZXJzIHRoYXQgd2FudCB0byBzaW11bGF0ZSBoYXJkd2FyZSB0aGV5IGRvbid0Cj4gPiBoYXZlLiAg
QnV0IGJleW9uZCB0aGF0Pwo+Cj4gSU1ITyB0ZXN0aW5nIGlzIHRoZSBvbmx5IHVzZSBjYXNlLiBJ
IHVzZSBpdCByZWd1bGFybHkuCj4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
