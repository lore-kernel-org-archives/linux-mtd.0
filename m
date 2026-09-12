Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4E0C88E59
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2026 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cDjU1X28/p8TwgSLl8iM7ZUHbq+Riv822CcaT9PVzSQ=; b=HS57CXWrLWdCGknV54T62aJJ0P
	8gnE0BP8J5HSgVbJ91yRWdKoqiXdAOGKLmnO3zu5i3XXnxfpcFfoLAonCx6Lj9lR4QfXW9k9YwK36
	AL7IfeSi+k0gYDqQBJb1tG7Ut5XpfUUI1nouWVLzeWOXgfaY6kEnCtJWlyZRXKqb8h8PXd7lWUEBE
	Z/RzClQvyYW/yuVdwbpsnuNsoPHRUFjyXaQsZcrxx6rWg+55HDNTBFW7u4d8FOIENq1FflhaHdmPZ
	SVVN/Nh9Vpus65lTSjMzFx73UWre3YRWNsbeGYiZoh1EOqB/HZbMCfi4+TEUgPk26+bSGLg40C+zg
	K7IKhrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5R2w-000000011mo-3QTz;
	Sat, 12 Sep 2026 16:57:46 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5R2u-000000011mU-0c0T
	for linux-mtd@lists.infradead.org;
	Sat, 12 Sep 2026 16:57:45 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789232259; bh=LONZiyEPb/HzepShVjxR31z
	npWvVg/eEX6usx8DFrtg=; b=BiVToeZyKZXZmhoEr0YIY2sKRe8fiZRVQG32QFTVNrrE5BPQ+z
	ezLwLx359x/34So+f4hHeM7nqytVg7DzdfCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789232259; bh=LONZiyEPb/HzepShVjxR31z
	npWvVg/eEX6usx8DFrtg=; b=G2EOWb+qRigKMR+3OxQcm0eLSlRBVIU1FhoDQ+mPWJ+yPz/Owb
	bY76ogyPhXkJBV5YqWHxMpFIucXcNIoAcgLaiBNS+vc7wyER8hHEP3UXqKTENI4CrYek+UTkiZO
	fLFuXVZ9Pz1TNvpG+62E+vJ0dbbTPGhgndPVboAry47lqx80zAWY0awXF1hmKDC+3X26VDvfTPf
	7CSOJXcrIeEJd8VxdUNUzXlgujvjAAr1D0YEN2s/ejavRJhlWqdnnoGlOOttvh0QVdaxfTVc+Qk
	6q5fnWloCh8X/BWK88zim6vKdIPcN2ZXSDC44MIK3SOPAPHLIlHoe7uGqd4I7MSHhnw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Deepanshu Kartikey" <kartikey406@gmail.com>
Cc: <dwmw2@infradead.org>, <kees@kernel.org>, 
	<viro@zeniv.linux.org.uk>, <linux-mtd@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, 
	<syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com>
Subject: AW: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
Message-ID: <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at>
In-Reply-To: <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
References: <20260823152648.23136-1-kartikey406@gmail.com>
	<CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
	<mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
	<CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
Date: Sat, 12 Sep 2026 16:57:39 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_095744_337574_FD8D6B12 
X-CRM114-Status: UNSURE (   5.32  )
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

QW0gU2F0LCBTZXAgMTIsIDIwMjYsIDEwOjAwIHNjaHJpZWIgRGVlcGFuc2h1IEthcnRpa2V5IDxr
YXJ0aWtleTQwNkBnbWFpbC5jb20+Ogo+IE9uIFNhdCwgU2VwIDEyLCAyMDI2IGF0IDEyOjI44oCv
UE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4gSSBmZWVsIHRo
ZSBwYXRjaCB5b3UgYXJlIHBvaW50aW5nIGF0IGZpeGVzIGEgZGlmZmVyZW50IGtpbmQgb2YgaXNz
dWUgPwoKV2VsbCwgZGlmZmVyZW50IHN5bXB0b21zIG9mIGEgY29tbW9uIHJvb3QgY2F1c2UuCgpU
aGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
