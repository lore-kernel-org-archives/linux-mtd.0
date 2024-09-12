Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E99EEB58A
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Sep 2024 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gJcyBAvbEO++CT0Xi3Z4nh/8rc/mYkaUUVSz6RtteDI=; b=eUTgWpHGXNXvzv
	/VLIvOENvXW5HHB2RliHhhJgr3lT/RzdvQe7sOmoJfIDcQ/cxybq7zlmQYyxruAESA9OkOjI+DCK1
	mKQYobEVshENar9/3ImDYVuQJb/snc1MseQtlnZZR5gCzJIwnOPe2RNMOKuADOAfNnF3KqiwKpXJM
	HDaTHEdbJ5qW9NMdwSFswd/m3FICpZK3A14KIHDdrbAiOFsqsGOm4OvlnhqFWC1duYZzfOGCIuQLy
	ktpTgVFeoRkxuX4MWbkSfPBwoOvNApJF7QHKW/B5u7jkdRJXXTrSW//sln797ahuMB1kECIFtBkCn
	eO2Xj1Y/ml+BnxDMZLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soh4T-0000000Chgp-21gg;
	Thu, 12 Sep 2024 10:29:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soh4Q-0000000ChgM-0K5H
	for linux-mtd@lists.infradead.org;
	Thu, 12 Sep 2024 10:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E71BA5C59DE;
	Thu, 12 Sep 2024 10:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC51C4CEC3;
	Thu, 12 Sep 2024 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726136940;
	bh=jWAK/NmqSyCvRohQe/08YAse6V24XA89RG8riBEsnTw=;
	h=From:To:Cc:Subject:Date:From;
	b=Z6g0ZSQyc44vMIV6l1C56rVtx2yJWqzlzPtFu1Qg4bBOVlpDDCdlHb3ffqR8IxQ70
	 VAZIKu+Nv4x9T3xorrTa84Ck2u33cI8DDbLFkkozxblF8QsUGK0COivGgaJXdKapKL
	 9prlU8G0rUFTJFRmj1cZapZKD1pTI5fFrbb665vrWEnqbpOXh1DuggaT3htwDcmyHR
	 fO1Z44dAer3U3Yx7J8KbGYZGP2UMQmHCbS/bV2BTP0vJB17ifYgDeCEnV8vFk9hJBu
	 T1M0J+x13XytygPMGZge0wy/H8r+u5yi2yIfQE4LtgXjTZgQH3AdASY99prOctn3uv
	 ZunxFGsd15dhg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.12
Date: Thu, 12 Sep 2024 12:28:57 +0200
Message-ID: <mafs0bk0tf9na.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_032902_205428_F97794CC 
X-CRM114-Status: GOOD (  11.32  )
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

SGkgTWlxdWVsLAoKSGVyZSBhcmUgdGhlIFNQSSBOT1IgY2hhbmdlcyBmb3IgdjYuMTIuIEkgdXN1
YWxseSBiYXNlIG15IGJyYW5jaCBvbiB0b3AKb2YgLXJjMSwgYnV0IHRoaXMgdGltZSBhcm91bmQg
aXQgc2VlbXMgSSBkaWQgaXQgYSBmZXcgY29tbWl0cyBhZnRlcgp2Ni4xMS1yYzEuIFByb2JhYmx5
IGp1c3QgZGlkbid0IG5vdGljZSB0b3J2YWxkcy9tYXN0ZXIgaGFkIG1vdmVkLiBTaG91bGQKbWFr
ZSBubyBkaWZmZXJlbmNlIGluIHByYWN0aWNlIGFueXdheS4KClJlZ2FyZHMsClByYXR5dXNoIFlh
ZGF2CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGRjMWM4MDM0ZTMxYjE0YTJl
NWUyMTIxMDRlYzUwOGFlYzQ0Y2UxYjk6CgogIG1pbm1heDogc2ltcGxpZnkgbWluKCkvbWF4KCkv
Y2xhbXAoKSBpbXBsZW1lbnRhdGlvbiAoMjAyNC0wNy0yOCAyMDoyNDoxMiAtMDcwMCkKCmFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3Mvc3BpLW5vci9m
b3ItNi4xMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDUyN2QwZmE2NTQyNmI5OTU3
NDIyZDBlNzE2ZmRlMGQwNjAyYzc1YzI6CgogIG10ZDogc3BpLW5vcjogZml4IGZsYXNoIHByb2Jp
bmcgKDIwMjQtMDktMDkgMTU6NDI6NTAgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNQSSBOT1IgY2hhbmdlcyBm
b3IgNi4xMgoKTm90YWJsZSBjaGFuZ2VzOgoKLSBBZGQgV3JpdGUgUHJvdGVjdCBzdXBwb3J0IGZv
ciBOMjVRMDY0QS4KCi0gTmV3IGZsYXNoIHN1cHBvcnQgZm9yIFpldHRhIFpEMjVRMTI4QyBhbmQg
U3BhbnNpb24gUzI4SFMyNTZULgoKLSBGaXggYSBOVUxMIGRlcmVmZXJlbmNlIGluIHByb2JlIHBh
dGggZm9yIGZsYXNoZXMgd2l0aG91dCBhIG5hbWUuIFRoZQogIHByb2JlIHBhdGggdHJpZXMgdG8g
YWNjZXNzIHRoZSBuYW1lIHdpdGhvdXQgY2hlY2tpbmcgaXRzIGV4aXN0ZW5jZQogIGZpcnN0LiBT
MjhIUzI1NlQgaXMgdGhlIGZpcnN0IGZsYXNoIHRvIGRlZmluZSBpdHMgZW50cnkgd2l0aG91dCBh
CiAgbmFtZSwgdW5jb3ZlcmluZyB0aGlzIGlzc3VlLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpCcmlhbiBOb3JyaXMgKDEp
OgogICAgICBtdGQ6IHNwaS1ub3I6IG1pY3Jvbi1zdDogQWRkIG4yNXEwNjRhIFdQIHN1cHBvcnQK
CkNzw7Nrw6FzLCBCZW5jZSAoMSk6CiAgICAgIG10ZDogc3BpLW5vcjogc3N0OiBGYWN0b3Igb3V0
IGNvbW1vbiB3cml0ZSBvcGVyYXRpb24gdG8gYHNzdF9ub3Jfd3JpdGVfZGF0YSgpYAoKTWljaGFl
bCBXYWxsZSAoMik6CiAgICAgIG10ZDogc3BpLW5vcjogd2luYm9uZDogYWRkIFpldHRhIFpEMjVR
MTI4QyBzdXBwb3J0CiAgICAgIG10ZDogc3BpLW5vcjogZml4IGZsYXNoIHByb2JpbmcKClRha2Fo
aXJvIEt1d2FubyAoMSk6CiAgICAgIG10ZDogc3BpLW5vcjogc3BhbnNpb246IEFkZCBzdXBwb3J0
IGZvciBTMjhIUzI1NlQKCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgICAgIHwgIDMgKyst
CiBkcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jIHwgIDIgKysKIGRyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3BhbnNpb24uYyAgfCAgNCArKysrCiBkcml2ZXJzL210ZC9zcGktbm9yL3NzdC5jICAg
ICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L210ZC9zcGktbm9yL3dpbmJvbmQuYyAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDUgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
