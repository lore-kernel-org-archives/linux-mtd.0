Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9A8C282CD
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 04:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC9C21473
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 04:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aKJSEBzx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.b="fdVvRdtJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC9C21473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cZaGcS73YlZ/Q+UGMF0UPhKn97evDKB8Exh/AZov/og=; b=aKJSEBzxLu+FP+
	lNDfW4UPdIsTJxijol+F/nr2wl+six6/epMjj0lgckcJUJMVi7Hkb7PtXWocOe16nXyUPK9cPgVXo
	o0WyD7aeqUvpfKmlvbAc6VWozFHyejuAmduzOOXF59C+vAXxvidiuJAJ+A6OgUUERiJ0XDabuzfkn
	DpWP13gk5nWn35VwFadMo931xuHdKNE/YrtgPoq9dC2nkSjfxNuf7+VAhMQ+SDfdj5Nvew9/0wWCe
	PnMWFmVfHvBNshzVp4Nz3CZvHl9x5nnc/VnsRaN9A79HmPYtZE0xKPW8riSU6EXIdy7rpLa+oessF
	SOxfCQMrBC1KBLyfx3TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gohG7-00022k-IX; Wed, 30 Jan 2019 04:13:55 +0000
Received: from smtpbg303.qq.com ([184.105.206.26])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gohFx-00021y-9w
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 04:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1548821514; bh=YUa3jaRB5mDrOoOXvBMffAyj7NxBV118ZYKJDFBWdC8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=fdVvRdtJbr+zyKmtPleu/SojJBpNQqDb+YxR8CR3rKE2vhhtu0xrOcYIF1GUeYrUo
 cvv9eMThQzF0SZKyB0/UPdz5mecx/GbsuJmQQk6KN/HcD4qxiXtMHHGbfst7BfVu1f
 sob6JG50S39UFeMSJVgY83IG3LrAzfX27RPPqCRw=
X-QQ-mid: esmtp7t1548821504t0qf44yvz
Received: from work.lan (unknown [175.0.122.109])
 by esmtp4.qq.com (ESMTP) with 
 id ; Wed, 30 Jan 2019 12:11:43 +0800 (CST)
X-QQ-SSF: B0000000000000F0F8202F00000000Z
X-QQ-FEAT: j16GwkBt1Eczqgy7ja6eO/EMLCSmTZewf+Dkm9Orf7uiKuCcNMLR8Ky7QtpoS
 ivSnTMLPQHnvBsZPbyGzmXYR720EhDEx17T5xv/n6I34Rt3/WHJDh15HGXsqKOshX7kJtC6
 ejcgAL/THNn+eL9CT0UNN3tmoln9jB64YonxCpHUugySEo4J85xnXJ9IN+x8BDp20O3RFU9
 DY7K2X0QT/+kqhHaOegruYQ8C6uA0eaRKUSyQdIrE0J9S6uyQqpBktQjM4eDYWdaBQ1zEXN
 vfgMCgWAQ2+Ubqu9nG6utcUxOQ9RRNpIGSbUpnVmqrXDhK
X-QQ-GoodBg: 0
From: Ding Tao <miyatsu@qq.com>
To: avalentin@marcant.net, hauke@hauke-m.de, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, Tudor.Ambarus@microchip.com
Subject: [PATCH] mtd: spi-nor: Add support for mx25u3235f
Date: Wed, 30 Jan 2019 12:11:21 +0800
Message-Id: <20190130041121.109735-1-miyatsu@qq.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
X-QQ-FName: 8F7D6C1B4489425D8048B59E97CFDABE
X-QQ-LocalIP: 10.198.131.167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_201352_098143_A2AA94B4 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Ding Tao <miyatsu@qq.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogQW5kcsOpIFZhbGVudGluIDxhdmFsZW50aW5AbWFyY2FudC5uZXQ+CgpUaGUgbXgyNXUz
MjM1ZiBpcyBmb3VuZCBvbiB0aGUgWnlYRUwgTkJHNjgxNyByb3V0ZXIsIHRoZXJlZm9yZQphZGQg
ZHJpdmVyIHN1cHBvcnQgZm9yIGl0IHNvIHRoYXQgd2UgY2FuIHVwc3RyZWFtIGJvYXJkIHN1cHBv
cnQuCgpNaW5pbWFsIHRlc3RlZCB3aXRoIHUtYm9vdCB0b29scyBmd19wcmludGVudi9md19zZXRl
bnYgb24gR2xvYmFsU2NhbGUKRVNQUkVTU09iaW4gdjUgYm9hcmQuCgpbbWl5YXRzdUBxcS5jb206
IFJlbW92ZSB1bm5lY2Vzc2FyeSB3aGl0ZSBzcGFjZS5dClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBW
YWxlbnRpbiA8YXZhbGVudGluQG1hcmNhbnQubmV0PgpTaWduZWQtb2ZmLWJ5OiBEaW5nIFRhbyA8
bWl5YXRzdUBxcS5jb20+Ci0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwppbmRl
eCA2ZTEzYmJkMWFhYTUuLjAxYWMyZTRiYWJhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9zcGktbm9yLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKQEAgLTE4
MzYsNiArMTgzNiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lk
c1tdID0gewogCXsgIm14MjVsMzI1NWUiLCAgSU5GTygweGMyOWUxNiwgMCwgNjQgKiAxMDI0LCAg
NjQsIFNFQ1RfNEspIH0sCiAJeyAibXgyNWw2NDA1ZCIsICBJTkZPKDB4YzIyMDE3LCAwLCA2NCAq
IDEwMjQsIDEyOCwgU0VDVF80SykgfSwKIAl7ICJteDI1dTIwMzNlIiwgIElORk8oMHhjMjI1MzIs
IDAsIDY0ICogMTAyNCwgICA0LCBTRUNUXzRLKSB9LAorCXsgIm14MjV1MzIzNWYiLAkgSU5GTygw
eGMyMjUzNiwgMCwgNjQgKiAxMDI0LCAgNjQsCisJCQkgU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9S
RUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sCiAJeyAibXgyNXU0MDM1IiwgICBJTkZPKDB4YzIy
NTMzLCAwLCA2NCAqIDEwMjQsICAgOCwgU0VDVF80SykgfSwKIAl7ICJteDI1dTgwMzUiLCAgIElO
Rk8oMHhjMjI1MzQsIDAsIDY0ICogMTAyNCwgIDE2LCBTRUNUXzRLKSB9LAogCXsgIm14MjV1NjQz
NWYiLCAgSU5GTygweGMyMjUzNywgMCwgNjQgKiAxMDI0LCAxMjgsIFNFQ1RfNEspIH0sCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
