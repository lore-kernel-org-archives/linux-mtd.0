Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038E4C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:28:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBFE61073
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DBFE61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hu2MsYkwmzVRvIdvZ4kbJU6LPjUC79VCOpZA7a3vAoY=; b=h5jqbuSvuGY0RR9bu7aTSMx2Mg
	mmzKFHR3jptHdyWcWaliV/bAgkgpIWIbKyMjpw2tgVcuyJQV6RmL0sdacXgbdxdPxJhA+WkPWEwg1
	/bMZaiZcDvAjbLXMAfcCGZhJrsb/loFK3oPh9VVp0v6Fw7URtGZWuNWAf9i/SUU9XynklXy/aXGvg
	lw+xq9jiZYbr7KitRClmmMzMskpqNhwE65l5rDT5xvlvpfKyOpzHHEwwfitmTaZWa5kmDbcuim3v2
	2Wwzde/jZtVIE6UshEaPotgrG5M6zxv1vrf8QbkFct27So+Rw7SmLRAl2LhBQJdABRj40AtDom+t8
	KUmGqxcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQuR-004lP0-2T; Wed, 19 May 2021 18:27:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu7-004lMY-S6
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RWphd2bca6w/kFX5v2pw76zhtQ2uvC/upLBR6XFMTEk=; b=zibLebCafl7cmK1FnWy5Ev4bks
 x2xUNJvBCSgGmHUlEZ3RcXBiT5ci4rjPRL23r39Cl4G38LBXArg30+QDykNi2Xp8Sf+ukGLYTiR6w
 dPI2TjwAXxt49OHqwjif3CCjoawaw759dQZytm61sEWV7uFhV6R4SR7xM4QZLWzLgMokGcLKZ0NMp
 gdUtj0SpfhQJF+/nK5sKhM9FzcyiYgcErP3LfnJ6bdN1FwFbNHPKDi3eE/qmhGJN38YVn7CZex7T4
 h5OX/gOF2AkLaobtplAUzZK3oqy+93vSkOM95q1vz0Zf0ohh/buRfLfS5x27V0T23NfVArmKQqKPN
 3FFYrT9Q==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu4-00Fh5Z-IZ
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A58C5C0003;
 Wed, 19 May 2021 18:26:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 00/19] ARM Primecell PL35x support
Date: Wed, 19 May 2021 20:26:17 +0200
Message-Id: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112644_798229_1999C174 
X-CRM114-Status: GOOD (  10.35  )
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

SGVsbG8sCgpJIGFtIHRha2luZyBvdmVyIE5hZ2EncyBzZXJpZXMsIGhlcmUgYXJlIHRoZSBtYWpv
ciBjaGFuZ2VzOgoqIENsZWFuaW5nIG9mIHRoZSBTTUMgYnVzIGJpbmRpbmcgZmlsZSAoYW5kIHlh
bWwgY29udmVyc2lvbikKKiBTdXBlcmZpY2lhbCBjbGVhbmluZyBhbmQgZ3JlYXQgc2ltcGxpZmlj
YXRpb24gb2YgdGhlIFNNQyBidXMgZHJpdmVyCiogQWRkaXRpb24gb2YgYSB5YW1sIGZpbGUgZGVz
Y3JpYmluZyB0aGUgTkFORCBjb250cm9sbGVyCiogRnVsbCByZXdvcmsgb2YgdGhlIE5BTkQgY29u
dHJvbGxlciBkcml2ZXIuIEpGRlMyIGFuZCBVQklGUyBub3QgdGVzdGVkCiAgeWV0LCBvbmx5IGJh
cmUgdGVzdCB0b29scyBoYXZlIGJlZW4gdXNlZCB0byBwcm9vdmUgYmFzaWMgY29ycmVjdG5lc3MK
ICBvZiB0aGUgaGVscGVycy4KKiBBZGRpdGlvbiBvZiBhIGNvdXBsZSBvZiBNQUlOVEFJTkVSUyBl
bnRyaWVzLgoKSGVsbXV0LCB3b3VsZCB5b3UgYmUgd2lsbGluZyB0byB0ZXN0IHRoaXMgc2VyaWVz
IHdpdGggSkZGUzI/IEkgd2lsbCBkbwp0aGUgVUJJRlMgdGVzdGluZyBsYXRlciBvbiBteSBzaWRl
LgoKQSBHaXRodWIgYnJhbmNoIG5hbWVkIHBsMzUzIGlzIGF2YWlsYWJsZSBvbiBteSByZXBvc2l0
b3J5OgpodHRwczovL2dpdGh1Yi5jb20vbWlxdWVscmF5bmFsL2xpbnV4LwoKVGhhbmtzLApNaXF1
w6hsCgpNaXF1ZWwgUmF5bmFsICgxOSk6CiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6
IFJlcGhyYXNlIHRoZSBiaW5kaW5nCiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IERv
Y3VtZW50IHRoZSByYW5nZSBwcm9wZXJ0eQogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMtc21j
OiBEcm9wIHRoZSBwYXJ0aXRpb25pbmcgc2VjdGlvbgogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwz
NTMtc21jOiBEZXNjcmliZSB0aGUgY2hpbGQgcmVnIHByb3BlcnR5CiAgZHQtYmluZGluZzogbWVt
b3J5OiBwbDM1My1zbWM6IEZpeCB0aGUgZXhhbXBsZSBzeW50YXggYW5kIHN0eWxlCiAgZHQtYmlu
ZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IERyb3AgdW5zdXBwb3J0ZWQgbm9kZXMgZnJvbSB0aGUg
ZXhhbXBsZQogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMtc21jOiBGaXggdGhlIE5BTkQgY29u
dHJvbGxlciBub2RlIGluIHRoZQogICAgZXhhbXBsZQogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwz
NTMtc21jOiBGaXggdGhlIHJlZyBwcm9wZXJ0eSBpbiB0aGUgZXhhbXBsZQogIGR0LWJpbmRpbmc6
IG1lbW9yeTogcGwzNTMtc21jOiBEZXRhaWwgdGhlIG1haW4gcmVnIHByb3BlcnR5IGNvbnRlbnQK
ICBkdC1iaW5kaW5nOiBtZW1vcnk6IHBsMzUzLXNtYzogQ29udmVydCB0byB5YW1sCiAgbWVtb3J5
OiBwbDM1My1zbWM6IEZpeCBzdHlsZQogIG1lbW9yeTogcGwzNTMtc21jOiBSZW5hbWUgZ290byBs
YWJlbHMKICBtZW1vcnk6IHBsMzUzLXNtYzogTGV0IGxvd2VyIGxldmVsIGNvbnRyb2xsZXIgZHJp
dmVycyBoYW5kbGUgaW5pdHMKICBtZW1vcnk6IHBsMzUzLXNtYzogQXZvaWQgdXNlbGVzcyBhY3Jv
bnltcyBpbiBkZXNjcmlwdGlvbnMKICBtZW1vcnk6IHBsMzUzLXNtYzogRGVjbGFyZSB2YXJpYWJs
ZXMgZm9sbG93aW5nIGEgcmV2ZXJzZSBjaHJpc3RtYXMKICAgIHRyZWUgb3JkZXIKICBNQUlOVEFJ
TkVSUzogQWRkIFBMMzUzIFNNQyBlbnRyeQogIE1BSU5UQUlORVJTOiBBZGQgUEwzNTMgTkFORCBj
b250cm9sbGVyIGVudHJ5CiAgZHQtYmluZGluZ3M6IG10ZDogcGwzNTMtbmFuZDogRGVzY3JpYmUg
dGhpcyBoYXJkd2FyZSBjb250cm9sbGVyCiAgbXRkOiByYXduYW5kOiBwbDM1MzogQWRkIHN1cHBv
cnQgZm9yIHRoZSBBUk0gUEwzNTMgU01DIE5BTkQgY29udHJvbGxlcgoKIC4uLi9tZW1vcnktY29u
dHJvbGxlcnMvYXJtLHBsMzUzLXNtYy55YW1sICAgICB8ICAxMjQgKysKIC4uLi9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvcGwzNTMtc21jLnR4dCB8ICAgNDcgLQogLi4uL2JpbmRpbmdzL210
ZC9hcm0scGwzNTMtbmFuZC1yMnAxLnlhbWwgICAgIHwgICA0NSArCiBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDE2ICsKIGRyaXZlcnMvbWVtb3J5L3Bs
MzUzLXNtYy5jICAgICAgICAgICAgICAgICAgICB8ICAzMTQgKy0tLS0KIGRyaXZlcnMvbXRkL25h
bmQvcmF3L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgIDggKwogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYyAgfCAxMTk0ICsrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL2xpbnV4L3BsMzUzLXNtYy5oICAgICAgICAgICAgICAgICAgICAgfCAgIDMwIC0KIDkg
ZmlsZXMgY2hhbmdlZCwgMTM5OCBpbnNlcnRpb25zKCspLCAzODEgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9hcm0scGwzNTMtc21jLnlhbWwKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3BsMzUzLXNtYy50
eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2FybSxwbDM1My1uYW5kLXIycDEueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
bXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jCiBkZWxldGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC9wbDM1My1zbWMuaAoKLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
