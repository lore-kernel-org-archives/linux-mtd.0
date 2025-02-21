Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C158C021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kh+0zHzE4UP7Cl8YEXbdlSX4JhiR7XmCcBDCEzy1zHg=; b=Rc+epkyn8d3xyR
	NS68uBYBjcbf5cAdI24o8PgiNQc0NJUVAxCYb0YzUHsHVfoG66BWOQKRIv8mD6YN7nCljV0n9bC89
	Tadb0UGyAOJUgZ5OAr62BPkknvCwJQSuwyzLkO4533Hkw4Ai+mopw/Z7Yq6qO+uZ6PTM0JmUBodKw
	7pvPptxBQ0hzu1QvIOv8T2tPqpBt1ma1GUMx2uXSgYiSIAUmsXXwTJMIUpD5cXUyTrEySDmRXQLXV
	1vVTrLgV77Q2u1NV0e3k4KiB4rlg6Fs5r4K+N8V1TYWEfGX2UoqIy69BIq3bFzIcBjGUcqMzYRSd4
	Vfc+nNn9gLR0ZdtskIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVTS-0000000653N-1RL7;
	Fri, 21 Feb 2025 16:01:58 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVTN-0000000651m-3JE4
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 16:01:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4379F4431E;
	Fri, 21 Feb 2025 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740153710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zhqRsJfTSIXXNfdqTErR6vKsapQIO8s4/Gq1ixCrsL4=;
	b=L+TIapRHFSdCheEB7qZc/bqFriqt0up1QIrXGXM7k4SkFpNI0KyPidmvbJ9V4WvJPxZwlf
	k4TF0Rb/yFKiaYg/+Q521cyfeYtMEmva47GP9buuXUpgV87AOVScHfZWatVKeEAmQfh6yQ
	GiYEuMwhledY4R9Y476WiGRgeVPM0YxCrNPEAWF17rgLr82ZM3RimEsH9zkQSoxw2WofnS
	YNl+lvEuLrLeL87Q1/eEQiEcsTu4PfZV6XHb5ozRlHPhGtrhh4n1nUNNKtTRcmwRnsqLa2
	nx2GzG8YMTzDC2+Y9O+aJH9NbW4s3bB1+Tque6zpEVh2GFve4UW3801g99wuiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Changes for 6.14-rc4
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 21 Feb 2025 17:01:48 +0100
Message-ID: <87ikp3ffrn.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeehgeejhfetgfdtvdefveeiteejveelfeefgedvieefvdefleekueegheelkedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopefvuhguohhrrdetmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepfhhrihgvuggvrhdrshgthhhrv
 ghmphhfsehkohhnthhrohhnrdguvgdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_080154_301148_BDED69C6 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgpUaGlzIGlzIGEgZml4ZXMgUFIgZm9yIHRoZSBuZXh0IC1yYyBjeWNsZSBvZiA2LjE0
LgoKVGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDIw
MTRjOTVhZmVjZWUzZTc2Y2E0YTU2OTU2YTkzNmUyMzI4M2YwNWI6CgogIExpbnV4IDYuMTQtcmMx
ICgyMDI1LTAyLTAyIDE1OjM5OjI2IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci02LjE0LXJjNAoKZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDFkYmY2MDI3N2U5YjYxODFkMjM2NmE5NGM5NzQ3MjgxMDZj
ZGQ1NTE6CgogIE1lcmdlIHRhZyAnc3BpLW5vci9maXhlcy1mb3ItNi4xNC1yYzQnIG9mIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eCBpbnRv
IG10ZC9maXhlcyAoMjAyNS0wMi0xOSAxNDozODo0NyArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVGhlIHR3byBt
b3N0IGltcG9ydGFudCBmaXhlcyBpbiB0aGlzIGxpc3QgYXJlIHByb2JhYmx5IHRoZSBTU1Qgd3Jp
dGUKZmFpbHVyZSBhbmQgdGhlIFFjb20gcmF3IE5BTkQgY29udHJvbGxlciBwcm9iZSBmYWlsdXJl
IHdoaWNoIGFyZSBkdWUgdG8Kc29tZSByZWZhY3RvcmluZywgb3RoZXJ3aXNlIHRoZXJlIGhhcyBi
ZWVuIGEgc2VyaWVzIG9mIG1pc2MgZml4ZXMgb24gdGhlCkNhZGVuY2UgcmF3IE5BTkQgY29udHJv
bGxlciBkcml2ZXIgYW5kIGVzcGVjaWFsbHkgb24gdGhlIERNQSBzaWRlLgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbWl0
IEt1bWFyIE1haGFwYXRyYSAoMSk6CiAgICAgIG10ZDogc3BpLW5vcjogc3N0OiBGaXggU1NUIHdy
aXRlIGZhaWx1cmUKCkNocmlzdGlhbiBNYXJhbmdpICgxKToKICAgICAgbXRkOiByYXduYW5kOiBx
Y29tOiBmaXggYnJva2VuIGNvbmZpZyBpbiBxY29tX3BhcmFtX3BhZ2VfdHlwZV9leGVjCgpNaXF1
ZWwgUmF5bmFsICgxKToKICAgICAgTWVyZ2UgdGFnICdzcGktbm9yL2ZpeGVzLWZvci02LjE0LXJj
NCcgb2YgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4IGludG8gbXRkL2ZpeGVzCgpOaXJhdmt1bWFyIEwgUmFiYXJhICg1KToKICAgICAgbXRk
OiByYXduYW5kOiBjYWRlbmNlOiBmaXggZXJyb3IgY29kZSBpbiBjYWRlbmNlX25hbmRfaW5pdCgp
CiAgICAgIG10ZDogcmF3bmFuZDogY2FkZW5jZTogdXNlIGRtYV9tYXBfcmVzb3VyY2UgZm9yIHNk
bWEgYWRkcmVzcwogICAgICBtdGQ6IHJhd25hbmQ6IGNhZGVuY2U6IGZpeCBpbmNvcnJlY3QgZGV2
aWNlIGluIGRtYV91bm1hcF9zaW5nbGUKICAgICAgZHQtYmluZGluZ3M6IG10ZDogY2FkZW5jZTog
ZG9jdW1lbnQgcmVxdWlyZWQgY2xvY2stbmFtZXMKICAgICAgbXRkOiByYXduYW5kOiBjYWRlbmNl
OiBmaXggdW5jaGVja2VkIGRlcmVmZXJlbmNlCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L2NkbnMsaHAtbmZjLnlhbWwgICAgICAgfCAgOCArKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9j
YWRlbmNlLW5hbmQtY29udHJvbGxlci5jICAgICB8IDQ0ICsrKysrKysrKysrKysrKystLS0tLS0K
IGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyAgICAgICAgICAgICAgICAgIHwgMjIg
KysrKystLS0tLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMjQgZGVs
ZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
