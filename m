Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D47CC982E1
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/zV4Ew3cqx4qACYMdC8Ho9ays7a2OnCl4VS1XRDzoo=; b=B/0H/YU93wFXg8
	o6G2g9cg0IYMHAFbpxtLywWRVS/Ov6U2iIbmFodpkpy/plpoYYZCTmXg9dJrPtg9UMfZslYaQcRX6
	Ooa6of4i39AOdY3RD/vQfoqdJ9hxsluxEJe9zhPbmGIDruyan9zCZF5HVQeztU4NSkYlyxSLbzUoa
	kWiz15A5ewmLnRTklpn3/sr92cyYgE56lOoATqGm+1XgMjriNd6ST0hLVRD0ao7ZTmdwv16mwR9Ez
	utKmcX2j55NlxXfldqFQL23mZH+xrBHtup8L4qxt+cLXodNUd77TnxJoqSPoepHjNIOHmWqpg560b
	Vdx/CA/LMiWd5PUsuqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8H23-0000000HT45-3rRF;
	Sun, 20 Sep 2026 12:52:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8H21-0000000HT3G-1mcL
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 12:52:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8DCF1C5CD5C;
	Sun, 20 Sep 2026 12:53:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBA98604C9;
	Sun, 20 Sep 2026 12:52:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB56C1032829C;
	Sun, 20 Sep 2026 14:52:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789908747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YmmPnaV7ildHZ+EWQKJf+Qc5RfsJpEmB2QsMAPSOZMU=;
	b=082P7CtfODUaGcGtCNed03VvETTk/7aXKnLyVv9PCXv63fs+z0Dm3h5shizWdVsVTEikKJ
	pYeAJeMxtaL/3ceYbu3Y3WK0+MvXOErLkZZxN9k6ehyX13KX92Da6Xxq4YHKjmLAquj1ro
	MtY8O8+zms1KUDTy3hs5D1IsDDLk3D44tXsKgBmw4at5Q+yOxP5Ah+BwqUSvcJ4qVDyebM
	aziDtJQGKNwDijleoqHMvcXcnmtzYBqxT0MSQ8Ho5NLvT2w+O3T30SJpY6wdIeVyqVZmxm
	3qkJtnyHlEHGsVMpi/OWHDDQRtihQy1A7v68ni+YxShOG26W9IyAgd3KeW9ObA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?Q?J=C3=B6rn?= Engel <joern@barelysecure.org>
Cc: Chris Roy <iam@thechris.in>,  Richard Weinberger <richard@nod.at>,  Greg
 KH <gregkh@linuxfoundation.org>,  syzbot
 <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>,  dakr@kernel.org,
  driver-core@lists.linux.dev,  linux-fsdevel@vger.kernel.org,
  linux-kernel@vger.kernel.org,  rafael@kernel.org,
  syzkaller-bugs@googlegroups.com,  linux-mtd@lists.infradead.org,
  vigneshr@ti.com,  Adarsh Das <adarshdas950@gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
In-Reply-To: <aq6sd2Z3nZuAYbMG@cashel.logfs.org> (=?utf-8?Q?=22J=C3=B6rn?=
 Engel"'s message of
	"Sat, 19 Sep 2026 08:38:31 -0700")
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
	<6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
	<CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
	<2026091753-broadness-bootie-b683@gregkh>
	<CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
	<aqwuWWMwdIcx3704@cashel.logfs.org>
	<mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
	<CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
	<aq6gJTYTpTr8sYPj@cashel.logfs.org>
	<CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
	<aq6sd2Z3nZuAYbMG@cashel.logfs.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 14:52:18 +0200
Message-ID: <87cxu8axvh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_055233_650016_F0D8BBAA 
X-CRM114-Status: GOOD (  14.48  )
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

SGkgSsO2cm4sCgo+PiA+IElzIHRoaXMgY2hlY2sgbmVjZXNzYXJ5PyBbLi4uXSBMb29rcyBsaWtl
IHRoZSBrZXJuZWwgaXMgc3RpbGwKPj4gPiB1bmRlY2lkZWQgd2hldGhlciBjaGVja3MgYXJlIG5l
Y2Vzc2FyeSBvciBub3QuCj4+IAo+PiBJIHdpbGwga2VlcCBpdC4ga3phbGxvYygpL2tzdHJkdXAo
KSB1bmRlciBwbGFpbiBHRlBfS0VSTkVMIGNhbiBzdGlsbAo+PiByZXR1cm4gTlVMTCB1bmRlciBy
ZWFsIG1lbW9yeSBwcmVzc3VyZSAobm8gX19HRlBfTk9GQUlMIGhlcmUpLCBhbmQKPj4gZHJvcHBp
bmcgaXQgd291bGQgYmUgaW5jb25zaXN0ZW50IHdpdGggdGhlIGtzdHJkdXAoKSBjaGVjayB0d28g
bGluZXMKPj4gYmVsb3cuCj4KPiBNeSBmb2dneSBtaW5kIGlzIHNsb3dseSB3YWtpbmcgdXAuICBH
RlBfQVRPTUlDIGNhbiByZXR1cm4gTlVMTC4gIElmCj4geW91J3JlIHRyeWluZyB0byBhbGxvY2F0
ZSBtZW1vcnkgZnJvbSBhbiBpbnRlcnJ1cHQgaGFuZGxlciBvciBzaW1pbGFyLAo+IHlvdSBjYW5u
b3QgYWZmb3JkIHRvIHdhaXQgZm9yIG1lbW9yeSByZWNsYWltIHRvIGhhcHBlbi4gIFRob3NlIGNh
bGxzCj4gZGVmaW5pdGVseSBuZWVkIGEgY2hlY2sgYW5kIGEgcmVhc29uYWJsZSBwbGFuIHdoYXQg
dG8gZG8gaW4gY2FzZSBvZgo+IGZhaWx1cmUuCj4KPiBHRlBfS0VSTkVMIHNob3VsZCBiZSBhYmxl
IHRvIGJsb2NrIGFuZCB3YWl0LCBzbyB0aGVyZSByZWFsbHkgaXMgbm8KPiBleGN1c2UgZm9yIGtt
YWxsb2MgdG8gcmV0dXJuIE5VTEwgb3IgZm9yIHRoZSBjYWxsZXJzIHRvIG5lZWQgYSBjaGVjay4K
Pgo+IEJ1dCB5b3VyIGRlY2lzaW9uIG9mIG5vdCBwdWxsaW5nIHRvbyBtYW55IGRlY2lzaW9ucyBp
bnRvIGEgc2luZ2xlIHBhdGNoCj4gaXMgc3RpbGwgYSBnb29kIGRlY2lzaW9uLiAgRXZlbiBpZiBt
eSBsb2dpYyBpcyBzb3VuZCwgcmVtb3ZpbmcgY2hlY2tzCj4gZnJvbSBrbWFsbG9jIGNhbGxlcnMg
c2hvdWxkIGJlIGEgc2VwYXJhdGUgZWZmb3J0LgoKTm90IHNheWluZyB0aGlzIHdvdWxkIGJlIGEg
YmFkIG1vdmUsIGl0IHdvdWxkIGJlIGhpZ2hseSBpbmNvbnNpc3RlbnQKd2l0aCB0aGUgY3VycmVu
dCBjb2RlIGJhc2UuIEV2ZXJ5IHNpbmdsZSBhbGxvY2F0aW9uIGluIHRoZSBrZXJuZWwgaXMKY2hl
Y2tlZC4gU3VjaCBhIGNoYW5nZSwgd2l0aG91dCBhIGRvY3VtZW50ZWQgYW5kIGFncmVlZCB1cG9u
IG1ldGhvZCwKd291bGQgbGVhZCB0byBkb3plbnMgZnV6emluZyBBSXMgc2VuZGluZyBwYXRjaGVz
IHRvIGFkZCB0aGUgIm1pc3NpbmciCmNoZWNrLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
