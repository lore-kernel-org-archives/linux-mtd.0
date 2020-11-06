Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492A8C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 19:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8362151B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 19:43:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vfDxt0UQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8362151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ejfYJF05A1NxL51S3HALw+vqE00zu1+mjHZZCxD0rP4=; b=vfDxt0UQRowymZFvMsA3oTbaWL
	kRZ99Apk6uGXOFfix9yvHm2By6/p2RWxWAf7Wc5UlomcskA4uHLL60Yc1z1NP7iiGBAFG2eKX4Daf
	15oQgwcj/CQCTfyOZfpwqv4Ipn9N+xQdInJv7KjRFAjoXTtENCaKZ66uxvjt9goUhwkDDdVzBu/Mq
	inb3Z2oexTNhXKVU0Ap0ufWWcBX/TSxeGdQhCIpu9kzwnvS9jpHQdbPw26D6+9t8G/r90FkjJmBAE
	1lwAZOdWU3Rdj8RHx38g3+rVsHo8Chqrjbjv8zNFc9Mc4/97mfQ08t2+qXrNs0Ez0cXS8E6s9By6V
	ORMRRMvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb7dp-0002wR-2D; Fri, 06 Nov 2020 19:43:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb7dl-0002uy-Gr
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 19:43:18 +0000
X-Originating-IP: 109.220.208.103
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C3A3C20003;
 Fri,  6 Nov 2020 19:43:12 +0000 (UTC)
Date: Fri, 6 Nov 2020 20:43:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for v5.10-rc3
Message-ID: <20201106204311.795d6016@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_144317_670073_9799EE9E 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgdGhlIG5leHQgLXJjLgoK
VGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDM2NTBi
MjI4ZjgzYWRkYTdlNWVlNTMyZTJiOTA0MjljMDNmN2I5ZWM6CgogIExpbnV4IDUuMTAtcmMxICgy
MDIwLTEwLTI1IDE1OjE0OjExIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IG10ZC9maXhlcwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDllZmFjNmNlN2Y2MjFjNDA1ZDQ5YTA5MWUzZTM2N2JlNDI1MGEyN2E6CgogIG10ZDogcmF3bmFu
ZDogc3RtMzJfZm1jMjogZml4IGJyb2tlbiBFQ0MgKDIwMjAtMTAtMzAgMTg6MjQ6NTEgKzAxMDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkFsZXhhbmRlciBTdmVyZGxpbiAoMSk6CiAgICAgIG10ZDogc3BpLW5vcjogRG9u
J3QgY29weSBzZWxmLXBvaW50aW5nIHN0cnVjdCBhcm91bmQKCkJlcnQgVmVybWV1bGVuICgxKToK
ICAgICAgbXRkOiBzcGktbm9yOiBGaXggYWRkcmVzcyB3aWR0aCBvbiBmbGFzaCBjaGlwcyA+IDE2
TUIKCkNocmlzdG9waGUgS2VyZWxsbyAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1j
MjogZml4IGJyb2tlbiBFQ0MKCkZhYmlvIEVzdGV2YW0gKDIpOgogICAgICBtdGQ6IHJhd25hbmQ6
IG14YzogTW92ZSB0aGUgRUNDIGVuZ2luZSBpbml0aWFsaXphdGlvbiB0byB0aGUgcmlnaHQgcGxh
Y2UKICAgICAgbXRkOiByYXduYW5kOiBpZmM6IE1vdmUgdGhlIEVDQyBlbmdpbmUgaW5pdGlhbGl6
YXRpb24gdG8gdGhlIHJpZ2h0IHBsYWNlCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2lmY19u
YW5kLmMgICAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhjX25hbmQuYyAgICAgICAgfCAxNyArKysrKy0tLS0tLS0t
LS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDE1ICsrKysrKyst
LS0tLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgICAgICAgICAgICB8IDEzICsrKysr
KystLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25z
KC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
