Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD6CA5FCB
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKZm+gFaxJKWtMKDRt39lVTnfExnLDG1/z74ydtAZSg=; b=K+iiETDOr/2bEI
	Ykch1smElnikvPb4sbdOoerUk9DEWH5/MOqm9Qb0yL5t2OthoBN56vEpnx7pfltGi4b42jFR8fE75
	ThTEHkT2roFSMxBlFmyYHq8hna+hohEQHyV5o0+vpzNd6+VccsGX68tGgt740n8j6N7O0wyju2YZB
	TTDTZT4bHKiwJRD364B64kyAnb/Mk7eeCuEtZDfmGyoUttLjdTEnIYgORHBhRSRko18CFWulbVeNZ
	DmzZjrvSGLIXPr9/0PJY/jbLu2DCvuw8Db4+rRhomJglIESq150YzcDgFre6fvpfG/J2lHBcOA5m0
	uQ7alnuHbFAh30pjltEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGOs-00000009A1C-3Wjv;
	Thu, 01 Oct 2026 13:00:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGOr-00000009A0q-0a2D
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 13:00:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF44240AE7;
	Thu,  1 Oct 2026 13:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E271F000FF;
	Thu,  1 Oct 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859636;
	bh=LGaKmgoYbC9tX3H+VvmhJMVa26GkXwY064QKAVbiwy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZbauWf76eclXen/YfQBxGU4aSrjavEChW5j1BmgqDhsd5ph2PHVldSd766rvu6U5
	 j+5ybxTDF82FW2yiyf/t8uPwpbBGnkYxwTWXSlb+w72w1D6JMbYP2iDVgsYymwKjUn
	 WIoNiCIb4+IUyJ6ru7EahQhEftE0nMzh1PMoJ1M7zDsm+ZbEQmPwiid4KaarvpWBfu
	 q70EKqcNrWfh6XdB9OBt7d/ljA4T4yMjQZPorzGubJAjDGr3lVjPBVaNxwyDgXgcBK
	 lbx4RBhk2r2Pn4e9QxlNoPB7iFwS80vnyCBJpMtPW0PoP+x6gt2m5P6XSXEvxJoXCd
	 7MCSJN4IFzppA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2] drivers/mtd: rawnand: nandsim: Fix stale
 NAND_ROW_ADDR_3 with overridesize
To: miquel.raynal@bootlin.com, yamada.masahiro@socionext.com, vigneshr@ti.com, wenyou.yang@microchip.com, bbrezillon@kernel.org, "wang
 wei" <a929244872@163.com>, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001124733.43559-1-a929244872@163.com>
References: <20261001124733.43559-1-a929244872@163.com>
Date: Thu, 01 Oct 2026 13:00:35 +0000
Message-Id: <20261001130036.44E271F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBuYW5kc2lt
OiBhZGRyZXNzIGN5Y2xlIG1pc21hdGNoIGZvciAyNTYgTWlCIC8gNDA5Ni1ieXRlIHBhZ2UgZGV2
aWNlcwotLQoKY29tbWl0IGQxMTg2NzUzNmVjYmIwZDAyNDNjMDUyMDY5ZDYwZjVmMWEyYzRhZmUK
QXV0aG9yOiB3YW5nIHdlaSA8YTkyOTI0NDg3MkAxNjMuY29tPgoKZHJpdmVycy9tdGQ6IHJhd25h
bmQ6IG5hbmRzaW06IEZpeCBzdGFsZSBOQU5EX1JPV19BRERSXzMgd2l0aCBvdmVycmlkZXNpemUK
ClRoZSBjb21taXQgZml4ZXMgYSBzdGFsZSBOQU5EX1JPV19BRERSXzMgZmxhZyBieSByZS1ldmFs
dWF0aW5nIGl0IGFmdGVyCmNoYW5naW5nIHRoZSBzaXplIG9mIHRoZSBzaW11bGF0ZWQgZGV2aWNl
IHdoZW4gdXNpbmcgdGhlIG92ZXJyaWRlc2l6ZQpwYXJhbWV0ZXIuIEl0IHVwZGF0ZXMgdGhlIGZs
YWcgYmFzZWQgb24gdGhlIGNvcmUgbG9naWM6IGNoaXBfc2hpZnQgLQpwYWdlX3NoaWZ0ID4gMTYu
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMKPiBpbmRleCBmZTk2ODAzN2Y3NWEyLi5hYzgyZGQ3ZTE4
YTkzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYwo+IEBAIC0yMzU5LDYgKzIzNTksMTEgQEAg
c3RhdGljIGludCBfX2luaXQgbnNfaW5pdF9tb2R1bGUodm9pZCkKPiAgCQl0YXJnZXRzaXplID0g
bmFuZGRldl90YXJnZXRfc2l6ZSgmY2hpcC0+YmFzZSk7Cj4gIAkJY2hpcC0+Y2hpcF9zaGlmdCA9
IGZmcyhuc210ZC0+ZXJhc2VzaXplKSArIG92ZXJyaWRlc2l6ZSAtIDE7Cj4gIAkJY2hpcC0+cGFn
ZW1hc2sgPSAodGFyZ2V0c2l6ZSA+PiBjaGlwLT5wYWdlX3NoaWZ0KSAtIDE7Cj4gKwo+ICsJCWlm
IChjaGlwLT5jaGlwX3NoaWZ0IC0gY2hpcC0+cGFnZV9zaGlmdCA+IDE2KQo+ICsJCQljaGlwLT5v
cHRpb25zIHw9IE5BTkRfUk9XX0FERFJfMzsKPiArCQllbHNlCj4gKwkJCWNoaXAtPm9wdGlvbnMg
Jj0gfk5BTkRfUk9XX0FERFJfMzsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoaXMgbG9naWMg
Y29uZmxpY3Qgd2l0aCB0aGUgYWRkcmVzcyBieXRlIGV4cGVjdGF0aW9uIGluIG5zX2luaXQoKT8K
CkZvciBhIDI1NiBNaUIgZGV2aWNlIHdpdGggNDA5Ni1ieXRlIHBhZ2VzLCBjaGlwX3NoaWZ0IC0g
cGFnZV9zaGlmdCBldmFsdWF0ZXMKdG8gMjggLSAxMiA9IDE2LiBUaGlzIGNhdXNlcyB0aGUgY29k
ZSBoZXJlIHRvIGNsZWFyIE5BTkRfUk9XX0FERFJfMywgc28gdGhlCmNvcmUgZW1pdHMgNCBhZGRy
ZXNzIGJ5dGVzLgoKSG93ZXZlciwgbnNfaW5pdCgpIGhhcyBoYXJkY29kZWQgbG9naWMgZXhwZWN0
aW5nIDUgYWRkcmVzcyBieXRlcyBmb3IgZGV2aWNlcwpsYXJnZXIgdGhhbiAxMjggTWlCOgoKZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jOm5zX2luaXQoKSB7CiAgICAuLi4KCQlpZiAobnMt
Pmdlb20udG90c3ogPD0gKDEyOCA8PCAyMCkpIHsKCQkJbnMtPmdlb20ucGdhZGRyYnl0ZXMgID0g
NDsKCQkJbnMtPmdlb20uc2VjYWRkcmJ5dGVzID0gMjsKCQl9IGVsc2UgewoJCQlucy0+Z2VvbS5w
Z2FkZHJieXRlcyAgPSA1OwoJCQlucy0+Z2VvbS5zZWNhZGRyYnl0ZXMgPSAzOwoJCX0KICAgIC4u
Lgp9CgpXaWxsIHRoaXMgbWlzbWF0Y2ggc3RhbGwgdGhlIG5hbmRzaW0gc3RhdGUgbWFjaGluZSBh
bmQgZmFpbCBvcGVyYXRpb25zIGR1ZSB0bwphbiBhZGRyZXNzIGN5Y2xlIG1pc21hdGNoPwoKUHJp
b3IgdG8gdGhpcyBjaGFuZ2UsIHNocmlua2luZyBhIDUxMiBNaUIgZGV2aWNlIHRvIDI1NiBNaUIg
bGVmdCB0aGUgc3RhbGUKZmxhZyBzZXQsIHdoaWNoIHNlcmVuZGlwaXRvdXNseSBtYXRjaGVkIG5h
bmRzaW0ncyBleHBlY3RhdGlvbiBvZiA1IGJ5dGVzLgoKPiAgCX0KPiAgCj4gIAlyZXQgPSBuc19z
ZXR1cF93ZWFyX3JlcG9ydGluZyhuc210ZCk7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDAxMTI0NzMzLjQzNTU5LTEtYTkyOTI0
NDg3MkAxNjMuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
