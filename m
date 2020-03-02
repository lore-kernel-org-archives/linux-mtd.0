Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6BFC3F2D2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C9EC246B4
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RXMfMJBv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yNc0Z6lQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C9EC246B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OpgD4BwqTcBpZWH0C1qEkj4iKWUb5/GHTPkmc9rteI=; b=RXMfMJBvodcRmW
	/3K/64jCG1kQ7zDz68AqMVYNQovHz4sCoYy0wB4JNW81vYSvq9dkcLXeS3A+KLIEDNLXIgZ/LmrKl
	kxByqnSmc2Mzv8seIS49r0D8GpgIrzK1AQJ4TVOWiydR40SHS1shiLj5rDqJyG04Y0YqDWeFVVoHS
	lY3CprcTI1Kwekv8tO27xYHJpNmG88OwR4vaTPKZmeZE6OANjRLIl3TJAEGnLA8Ah77uPvFPjKDSn
	HVB2DGfXAJZJyMICa9dsXrCbJAJD3NTcBrk0/f0nm/xQns17llR3sgpTK7va8CwNe3aI+f3fWrwSA
	KKMRljhLMRqWJaYrYclQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hgg-0008Cy-Qg; Mon, 02 Mar 2020 09:48:34 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hge-0008Ci-RY; Mon, 02 Mar 2020 09:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=KHxxvYImJT7QiDa3sc8KENVWKTPjXD62w1dc/5cT9rU=; b=yNc0Z6lQSzSl/z4cE43aSfUXZ6
 F6/9s6Rsz20ol+JZJ9zWW7MgYGJ1UyhNmx3DgNZ1IKI4jv0F85NyNgrO3ADQDK1T2SuyAn5dopfdt
 OCPOcVNq2GwR+9yH3sAMNlsIX9ohdDLjeF863YDmm9zXxG/qctvIEIYZMeTnluZPtxhMGxDmq+74D
 YNPjsM3tOBbkAe3E1en2bKFLkwl4rw6xFrjxTLiAnn4nPOcSGwhbdJzXMVa1kG/qvIMFkGWG99WbR
 PRuSIldznfsDGtNSqM4ouLGwWGpU46etpONJL+i/7jbafDgbkVy7FNtv61KQEi6+KqVWhT/WRuGqa
 zfuw5c8w==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hgc-00064V-DE; Mon, 02 Mar 2020 09:48:31 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5FD5040006;
 Mon,  2 Mar 2020 09:47:55 +0000 (UTC)
Date: Mon, 2 Mar 2020 10:47:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK3188 and others
Message-ID: <20200302104754.61204e72@xps13>
In-Reply-To: <20200302024744.28185-2-yifeng.zhao@rock-chips.com>
References: <20200302024744.28185-1-yifeng.zhao@rock-chips.com>
 <20200302024744.28185-2-yifeng.zhao@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWWlmZW5nLAoKWWlmZW5nIFpoYW8gPHlpZmVuZy56aGFvQHJvY2stY2hpcHMuY29tPiB3cm90
ZSBvbiBNb24sICAyIE1hciAyMDIwCjEwOjQ3OjQyICswODAwOgoKPiBUaGlzIGRyaXZlciBzdXBw
b3J0cyBSb2NrY2hpcCBORkMgKE5BTkQgRmxhc2ggQ29udHJvbGxlcikgZm91bmQgb24gUkszMzA4
LAo+IFJLMzM2OCwgUktQWDMwLCBSVjExMDggYW5kIG90aGVyIFNPQ3MuIFRoZSBkcml2ZXIgaGFz
IGJlZW4gdGVzdGVkIHVzaW5nCj4gOC1iaXQgTkFORCBpbnRlcmZhY2Ugb24gdGhlIEFSTSBiYXNl
ZCBSSzMzMDggcGxhdGZvcm0uCgpJIG1pc3NlZCB0aGlzIHNlcmllcywgeW91IHNob3VsZCBoYXZl
IGl0IHByZWZpeGVkICJ2MiIuIFBsZWFzZSB1c2UKZ2l0LWZvcm1hdC1wYXRjaCB0byBnZW5lcmF0
ZSB5b3VyIHNlcmllcy4gVGhpcyB0aW1lIHlvdSBtaXNzIHRoZSBjb3ZlcgpsZXR0ZXIgKG9yIGF0
IGxlYXN0IHlvdXIgc2Vjb25kIGFuZCB0aGlyZCBwYXRjaGVzIHNob3VsZCBiZSBhbnN3ZXJzIHRv
CnRoZSBmaXJzdCBvbmUpIG90aGVyd2lzZSBpdCBpcyBub3QgZWFzeSB0byBmb2xsb3cgd2hlbiBw
ZW9wbGUgc3RhcnQKZGlzY3Vzc2luZzoKCglnaXQgZm9ybWF0LXBhdGNoIC0tY292ZXItbGV0dGVy
IC12PHg+IFtjb21taXRzXQoJZ2l0IHNlbmQtZW1haWwgdjx4Pi0qLnBhdGNoIC0tdG8gLi4uIC0t
Y2MgLi4uCgpGb3IgdGhlIG5leHQgaXRlcmF0aW9uLCA8eD4gc2hvdWxkIGJlIDMuCgpBbHNvLCBt
aW5kIHRoZSB0aXRsZSBjaGFuZ2UgZm9yIHRoZSBiaW5kaW5ncyBjaGFuZ2VzLgoKR29vZCBsdWNr
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
