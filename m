Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53143C282EC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kl3RsSM6au+Q6VFZry+fRfY+8czwEIJBpoPSXtRUxak=; b=VFHytnANl0XMdH
	MPNK0NileCiq+3W6qgy0qL+jHgyOIGcH1dkHI0JlZIdM1f1dhSeR66Ac6EEInQQ9JWREJRNpvyvgq
	0+YbH+7e0WRmiqQKsTLWJDqt4m3CYpZMYcd9NGgbl3909GQzW0J7oxdKwjpYR6wfwj8IrWY/GJWAU
	ne9KbCByUZ9pih4Zw1bnzWqdBzGFCrnM04QwMh3eA1xSUQZTpaAVjjgjPha4rcsCAZQqqnuZKOEVE
	V2TyQnVhxiPxzwirTGjjLkH1wraCWj++U9Z+mGmCUZwIGKbxIGJXmrT+h3x/xpONzIrpDYIOiPw4R
	Vab0mg8sTrWUjqOzB5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt16p-0000000DdNX-0FHB;
	Fri, 14 Mar 2025 09:13:39 +0000
Received: from mail.ventrixio.pl ([57.129.137.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt11S-0000000DcR3-3V46
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 09:08:09 +0000
Authentication-Results: ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=ventrixio.pl; s=default; a=rsa-sha256; cv=none; t=1741943177;
	b=s9/a3dMunvBKIyVNntQgTUzcQ2OALioLVzOcykiPX2WR+h5Zgrbe7NG5siSfHabpbqsk
	 PJdrP0OiL/Yb7DQ641p0VoF9K/oq/KW38xq7SHN763+2D3R7FZAAwV3h7EUFjuFUa1DVQ
	 UA69NoBv81D+TwYafZbroCo/mZkxjA3ZZsVlzlfdCdls57rWDda5a6yGIna7Bmh+l2Y2E
	 hylHBOXGbS+6MJ6ON/nRJg8r8/nVZldkLvphp69K2cLyFOnU7LDvvJuo7Y1hyz86yeylv
	 DWjwSWPhtX28af7m+Ke+sQVRus3fz4cp66Cr15NkXN+zyyVQgYqLN+BV/GzFRwAavCg==
ARC-Message-Signature: i=1; d=ventrixio.pl; s=default; a=rsa-sha256;
	c=relaxed/simple; t=1741943177;
	h=Message-ID:Date:From:Subject:From;
	bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=;
	b=CXyDTKm5+t350MjHNh1LGT28+KrWaD3caiyuW42ZN1GBa2auUY/NG5BRlJu6sG+FNd9M
	 CszzM40+dQYqiU/RoQQxx6DTLAan8Xgkzy0y/49nNKZpcfQRqwy/Cgua5dZh/0akZ0+1/
	 P678GknGpQQU8vlRFf95JMbRiKS/J7hqXsi05ISBjKlj4DIvJU1yih5bVPipm5lUWLksA
	 5JE66QxpGrEKs/eKYmNN/UIABCnpyaRBFnwJzw4HmprEwgaPnsbPLjDAVvechKJRx1OYl
	 PIiBfgiimitD4i5fH8KiqXwKmLlVjNisNDumwMOz/SFMkPycBacJorCV7aqNI2Zs/VA==
ARC-Authentication-Results: i=1; ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
Received: by mail.ventrixio.pl (Postfix, from userid 1002)
	id 3E71C25947; Fri, 14 Mar 2025 09:05:54 +0000 (UTC)
Received: by mail.ventrixio.pl for <linux-mtd@lists.infradead.org>; Fri, 14 Mar 2025 09:05:41 GMT
Message-ID: <20250314074500-0.1.12.82fx.0.nqfpin82bb@ventrixio.pl>
Date: Fri, 14 Mar 2025 09:05:41 GMT
From: "Karol Bednaszewski" <karol.bednaszewski@ventrixio.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Mniejsze_wydatki_na_samoch=C3=B3d?=
X-Mailer: mail.ventrixio.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_020807_012101_1E7989CA 
X-CRM114-Status: UNSURE (   1.16  )
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

RHppZcWEIGRvYnJ5IQoKQ3p5IG3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBr
dMOzcmUgdW1vxbxsaXdpYSBtb25pdG9yaW5nIGthxbxkZWdvIGF1dGEgdyBjemFzaWUgcnplY3p5
d2lzdHltIHcgdHltIGplZ28gcG96eWNqxJksIHp1xbx5Y2llIHBhbGl3YSBpIHByemViaWVnPwoK
RG9kYXRrb3dvIG5hc3plIG5hcnrEmWR6aWUgbWluaW1hbGl6dWplIGtvc3p0eSB1dHJ6eW1hbmlh
IHNhbW9jaG9kw7N3LCBza3JhY2EgY3phcyBwcnplamF6ZMOzdywgYSB0YWvFvGUgdW1vxbxsaXdp
YSB0d29yemVuaWUgcGxhbnUgdHJhcyBjenkgZG9zdGF3LgoKWiBuYXN6ZWogd2llZHp5IGkgZG/F
m3dpYWRjemVuaWEga29yenlzdGEganXFvCBwb25hZCA0OSB0eXMuIEtsaWVudMOzdy4gTW9uaXRv
cnVqZW15IDgwOSAwMDAgcG9qYXpkw7N3IG5hIGNhxYJ5bSDFm3dpZWNpZSwgY28gamVzdCBuYXN6
xIUgbmFqbGVwc3rEhSB3aXp5dMOzd2vEhS4KCkJhcmR6byBwcm9zesSZIG8gZS1tYWlsYSB6d3Jv
dG5lZ28sIGplxZtsaSBtb2dsaWJ5xZtteSB3c3DDs2xuaWUgb23Ds3dpxIcgcG90ZW5jamHFgiB3
eWtvcnp5c3RhbmlhIHRha2llZ28gcm96d2nEhXphbmlhIHcgUGHFhHN0d2EgZmlybWllLgoKClBv
emRyYXdpYW0KS2Fyb2wgQmVkbmFzemV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
