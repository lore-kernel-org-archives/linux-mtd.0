Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5829AC5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P4DAp9P2PY4YetBY5zQt7YUsTUd43y5RiW+IU/R5hMw=; b=Q2KSdpIFbsLaChQFQo1uDaVvkk
	enf2xvVNpUncyGIV8AH0xaB3SD7ycO3yZKrRDQy43RqgcbMkWu2VmSIU8NKsBTMDxRsVArRbztUus
	kYW3agyWEKTkN8LWjNdkvorvc/9JoQNE1cJ8cFkanvdZkdhN1VeFpszvBCcF+EGqr1lKlzMsiZtXn
	PcyeLuE/vkzdX39muMPqz5lBUILga6YPGIE44bs9WsqRAJ/6fqYD4LgrOnenimrvGgQsmYiu0WLDY
	ApO6YBqzjb8CBFOdKg0nD/nZg7Qr+IjM8luLkzaKIL9yfsieDW4KFOId9goGtyBNgRgO8DstQbtNu
	4YWcNvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnRm-0000000AXe1-0u3z;
	Wed, 19 Aug 2026 21:03:42 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnRi-0000000AXdd-3LwO
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 21:03:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EDED92ABFA3;
	Wed, 19 Aug 2026 23:03:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Bl6s-4N6wTwH; Wed, 19 Aug 2026 23:03:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8FEDE2A3C71;
	Wed, 19 Aug 2026 23:03:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eVdQFwria_v5; Wed, 19 Aug 2026 23:03:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 622C51012EE;
	Wed, 19 Aug 2026 23:03:33 +0200 (CEST)
Date: Wed, 19 Aug 2026 23:03:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Kees Cook <kees@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, eulgyukim@snu.ac.kr
Message-ID: <849183271.921.1787173413104.JavaMail.zimbra@nod.at>
In-Reply-To: <20260819182805.4020838-1-jjy600901@snu.ac.kr>
References: <20260819182805.4020838-1-jjy600901@snu.ac.kr>
Subject: Re: [BUG] general protection fault in jffs2_xattr_delete_inode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF153 (Linux)/8.8.12_GA_3809)
Thread-Topic: general protection fault in jffs2_xattr_delete_inode
Thread-Index: 4sAwvj/mwoU3BVMs8GishbLzzlie7Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_140338_991016_EC85DCB9 
X-CRM114-Status: UNSURE (   6.39  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkphZXlvdW5nIENodW5nIiA8
amp5NjAwOTAxQHNudS5hYy5rcj4KClsuLi5dCgo+IFJJUDogMDAxMDpqZmZzMl94YXR0cl9kZWxl
dGVfaW5vZGUrMHgzOC8weDMwMCBmcy9qZmZzMi94YXR0ci5jOjYwMgo+IENvZGU6IDQxIDU1IDQx
IDU0IDUzIDQ4IDgzIGVjIDUwIDQ4IDg5IDNjIDI0IDQ4IDg1IGY2IDc0IDJhIDQ5IDg5IGY2IDQ5
IGJkIDAwIDAwCj4gMDAgMDAgMDAgZmMgZmYgZGYgNDggOGQgNWUgMjggNDggODkgZDggNDggYzEg
ZTggMDMgPDQyPiAwZiBiNiAwNCAyOCA4NCBjMCAwZiA4NQo+IDkwIDAyIDAwIDAwIDgzIDNiIDAw
IDc0IDE0IDQ4IDgzIGM0IDUwCj4gUlNQOiAwMDE4OmZmZmY4ODgxMDRhZDc5MTggRUZMQUdTOiAw
MDAxMDIwMwo+IFJBWDogMGM4YzhjOGM4YzhjOGM5MSBSQlg6IDY0NjQ2NDY0NjQ2NDY0OGMgUkNY
OiAwMDAwMDAwMDAwMDAwMDAxCj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAxIFJTSTogNjQ2NDY0NjQ2
NDY0NjQ2NCBSREk6IGZmZmY4ODgxMDgyNjAwMDAKPiBSQlA6IGRmZmZmYzAwMDAwMDAwMDAgUjA4
OiBmZmZmODg4MTA0YWQ3OTg3IFIwOTogMWZmZmYxMTAyMDk1YWYzMAo+IFIxMDogZGZmZmZjMDAw
MDAwMDAwMCBSMTE6IGZmZmZlZDEwMjA5NWFmMzEgUjEyOiAxZmZmZjExMDIyMzQ5Y2ZjCj4gUjEz
OiBkZmZmZmMwMDAwMDAwMDAwIFIxNDogNjQ2NDY0NjQ2NDY0NjQ2NCBSMTU6IDFmZmZmMTEwMjIz
NDljZTgKPiBGUzogIDAwMDA3ODYzNjI3MTg2YzAoMDAwMCkgR1M6ZmZmZjg4ODE1ZThhYzAwMCgw
MDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAw
IENSMDogMDAwMDAwMDA4MDA1MDAzMwo+IENSMjogMDAwMDc4NjM2MjcxN2Y3OCBDUjM6IDAwMDAw
MDAxMDc5NWMwMDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmYwCj4gQ2FsbCBUcmFjZToKPiA8VEFTSz4K
PiBqZmZzMl9kb19jbGVhcl9pbm9kZSsweDRkLzB4MmYwIGZzL2pmZnMyL3JlYWRpbm9kZS5jOjE0
MTgKPiBldmljdCsweDM1My8weDcwMCBmcy9pbm9kZS5jOjgyNQo+IGpmZnMyX25ld19pbm9kZSsw
eDQ0My8weGNlMCBmcy9qZmZzMi9mcy5jOi0xCj4gamZmczJfY3JlYXRlKzB4ODcvMHgzMDAgZnMv
amZmczIvZGlyLmM6MTgyCj4gbG9va3VwX29wZW4gZnMvbmFtZWkuYzo0NTA4IFtpbmxpbmVdCj4g
b3Blbl9sYXN0X2xvb2t1cHMgZnMvbmFtZWkuYzo0NjA4IFtpbmxpbmVdCj4gcGF0aF9vcGVuYXQr
MHhlM2MvMHgyOWIwIGZzL25hbWVpLmM6NDg2MAo+IGRvX2ZpbGVfb3BlbisweDE5ZC8weDM2MCBm
cy9uYW1laS5jOjQ4OTIKPiBkb19zeXNfb3BlbmF0MisweDlhLzB4MTAwIGZzL29wZW4uYzoxMzY4
Cj4gZG9fc3lzX29wZW4gZnMvb3Blbi5jOjEzNzQgW2lubGluZV0KPiBfX2RvX3N5c19vcGVuYXQg
ZnMvb3Blbi5jOjEzOTAgW2lubGluZV0KPiBfX3NlX3N5c19vcGVuYXQgZnMvb3Blbi5jOjEzODUg
W2lubGluZV0KPiBfX3g2NF9zeXNfb3BlbmF0KzB4ZjgvMHgxMzAgZnMvb3Blbi5jOjEzODUKPiBk
b19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6NjMgW2lubGluZV0KPiBk
b19zeXNjYWxsXzY0KzB4ZjcvMHgzNzAgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jOjk0Cj4g
ZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzYvMHg3ZQo+IFJJUDogMDAzMzoweDc4
NjM2MzAxZTgyOQoKU28sIHRoZSBwYXJ0aWFsbHkgY3JlYXRlZCBpbm9kZSBpcyBldmljdGVkIGlu
IHRoZSBjcmVhdGUgcGF0aC4KRG9lcyB0aGlzIGNoYW5nZSBoZWxwPwoKZGlmZiAtLWdpdCBhL2Zz
L2pmZnMyL29zLWxpbnV4LmggYi9mcy9qZmZzMi9vcy1saW51eC5oCmluZGV4IDg2YWIwMTRhMzQ5
Yy4uYTk5MDZmOWUzNjM4IDEwMDY0NAotLS0gYS9mcy9qZmZzMi9vcy1saW51eC5oCisrKyBiL2Zz
L2pmZnMyL29zLWxpbnV4LmgKQEAgLTU3LDYgKzU3LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGpm
ZnMyX2luaXRfaW5vZGVfaW5mbyhzdHJ1Y3QgamZmczJfaW5vZGVfaW5mbyAqZikKIAlmLT50YXJn
ZXQgPSBOVUxMOwogCWYtPmZsYWdzID0gMDsKIAlmLT51c2VyY29tcHIgPSAwOworCWYtPmlub2Nh
Y2hlID0gTlVMTDsKIH0KIApUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
