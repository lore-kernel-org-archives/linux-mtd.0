Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65683C4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D3E20862
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BFh8vY8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34D3E20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8CHLNNnMPSYWm/QL4DOdhfF7P5yM3Ts1Cx4UOmKpLs=; b=BFh8vY8suESX3b
	EEbB+twvAnodCveqMrPZcc13kpErQJh7MZwBA2fIKYrub/iWB8xQ8I0XLgkLzOod27q27uj9dYVi4
	kG6UYTxEqwGLcGZJRw47Rj50YTxFxOIHx+diopybZMcElrXIpVA9jnrzsQJ35jDUxhBl/EVBEfQZw
	/r7AuObFy4ReYAtTg6MB1jlWpLL+pWcv5V1fM+djFJ1DnfZn4spSHSkvGG6YYOwucsP2XGO6tJKeb
	wJL5+yPifrUFcaC2RM7qjXPS27yPaGbg99OqpSPN9m1If0THzku6oJDBe4a6XvMj2OwIyxfkcZG/H
	N9chaYbLq2ZJ9YrqN4cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMIs-0000ae-Vx; Fri, 04 Oct 2019 12:03:22 +0000
Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMH5-0007Fn-31
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:01:32 +0000
Received: from player792.ha.ovh.net (unknown [10.109.159.191])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 5523822A2EA
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:01:28 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id E2558AA65E5C;
 Fri,  4 Oct 2019 12:01:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 06/16] mtd: spi-nor: fix options for mx66l51235f
Date: Fri,  4 Oct 2019 13:59:09 +0200
Message-Id: <20191004115919.20788-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3789779088870509491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050131_308291_2D513397 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Alexander Amelkin <a.amelkin@yadro.com>,
 Alexander Soldatov <a.soldatov@yadro.com>, Marek Vasut <marek.vasut@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lei YU <mine260309@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogQWxleGFuZGVyIFNvbGRhdG92IDxhLnNvbGRhdG92QHlhZHJvLmNvbT4KCkN1cnJlbnRs
eSBpbiBkcml2ZXIgc3BpLW5vciB0aGVyZSBpcyBhIGxpbmUgZm9yIG14NjZsNTEyMzVsLgpBY2Nv
cmRpbmcgdG8gTWFjcm9uaXggc2l0ZSB0aGVyZSBpcyBubyBzdWNoIHBhcnQgbnVtYmVyLgpUaGUg
Y2hpcCBkZXRlY3RlZCBhcyBzdWNoIGlzIGFjdHVhbGx5IG14NjZsNTEyMzVmLgoKQWNjb3JkaW5n
IHRvIHRoZSBkYXRhc2hlZXQgZm9yIG14NjZsNTEyMzVmLAoiVGhlIGRldmljZSBkZWZhdWx0IGlz
IGluIDI0LWJpdCBhZGRyZXNzIG1vZGUiIChzZWN0aW9uIDktMTApLgpIZW5jZSB3ZSByZW1vdmVk
IFNQSV9OT1JfNEJfT1BDT0RFUyBvcHRpb24gd2l0aCB0aGlzIGNvbW1pdC4KCk9wZW5CTUMtU3Rh
Z2luZy1Db3VudDogNwpGaXhlczogZDM0MmI2YTk3M2FmICgibXRkOiBzcGktbm9yOiBlbmFibGUg
NEIgb3Bjb2RlcyBmb3IgbXg2Nmw1MTIzNWwiKQpDYzogQWxleGFuZGVyIEFtZWxraW4gPGEuYW1l
bGtpbkB5YWRyby5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTb2xkYXRvdiA8YS5zb2xk
YXRvdkB5YWRyby5jb20+ClJldmlld2VkLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qu
b3JnPgpSZXZpZXdlZC1ieTogTGVpIFlVIDxtaW5lMjYwMzA5QGdtYWlsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KU2lnbmVkLW9mZi1ieTogQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMKaW5kZXggMWQ4NjIxZDQzMTYwLi5iMTE2NTY3M2NkOTMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCisrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jCkBAIC0yMjk0LDcgKzIyOTQsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9IHsKIAl7ICJteDI1djgwMzVmIiwgIElORk8o
MHhjMjIzMTQsIDAsIDY0ICogMTAyNCwgIDE2LAogCQkJIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxf
UkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAogCXsgIm14MjVsMjU2NTVlIiwgSU5GTygweGMy
MjYxOSwgMCwgNjQgKiAxMDI0LCA1MTIsIDApIH0sCi0JeyAibXg2Nmw1MTIzNWwiLCBJTkZPKDB4
YzIyMDFhLCAwLCA2NCAqIDEwMjQsIDEwMjQsIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9R
VUFEX1JFQUQgfCBTUElfTk9SXzRCX09QQ09ERVMpIH0sCisJeyAibXg2Nmw1MTIzNWYiLCBJTkZP
KDB4YzIyMDFhLCAwLCA2NCAqIDEwMjQsIDEwMjQsIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05P
Ul9RVUFEX1JFQUQpIH0sCiAJeyAibXg2NnU1MTIzNWYiLCBJTkZPKDB4YzIyNTNhLCAwLCA2NCAq
IDEwMjQsIDEwMjQsIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9S
RUFEIHwgU1BJX05PUl80Ql9PUENPREVTKSB9LAogCXsgIm14NjZsMWc0NWciLCAgSU5GTygweGMy
MjAxYiwgMCwgNjQgKiAxMDI0LCAyMDQ4LCBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBT
UElfTk9SX1FVQURfUkVBRCkgfSwKIAl7ICJteDY2bDFnNTVnIiwgIElORk8oMHhjMjI2MWIsIDAs
IDY0ICogMTAyNCwgMjA0OCwgU1BJX05PUl9RVUFEX1JFQUQpIH0sCi0tIAoyLjIxLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
