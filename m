Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D490DC87FCA
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jul 2025 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XzWUKoGKCJg09I09juOLhLaWvlcsm9dEtWNgtGfKsxs=; b=y6O5CoBf0ZeJ5A
	OUIp5XsfvY+xfQA/fTvoDlN9gZ5EyMmqnjxu4jsqW4b9qT4R0S/BC5WxMg4iAtvijQM7YLuxI/Q2W
	QUyVcDGqfk2QHCZB7DUaKLr15LddeU3+asLINkKhAfeg5sZ3wE7JYRwv9GCvHzMlkuxWoDxeXJDCt
	jVq1gAcaAkRaCT3p4ufNvNBPXMrjMS3EOalZzzjIkTCN8dR2s8cHgpLXe0S3ESjVe9X86lFa7gl6K
	iO8c4AnsML/rUxxvUrIKSGVx81KfNgB94TWQf+251u8J+pKq6R9Bsr9OC3f/Hh/XuCSlWuNrK2s4n
	eWs/TLtVvhgqfbJ+fHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfEr-0000000GC1B-1vqw;
	Tue, 29 Jul 2025 07:59:09 +0000
Received: from mail.capitalcraft.pl ([57.129.67.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfCn-0000000GBlW-3csF
	for linux-mtd@lists.infradead.org;
	Tue, 29 Jul 2025 07:57:03 +0000
Received: by mail.capitalcraft.pl (Postfix, from userid 1002)
	id 7FC782360B; Tue, 29 Jul 2025 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=capitalcraft.pl;
	s=mail; t=1753775817;
	bh=HDVkD9F9d0LNuXby99FgApyHr5MULFRdKL2PW8Qg/Vo=;
	h=Date:From:To:Subject:From;
	b=fCicYF5oicwttUbeDFofUDk7ox1+CQZKShG4kilR12V3zSKIj1v9e8RbPY8EjbPLi
	 /Qd1dUcjiffoRJFy5CxdGpvQvB85u7Sjme4kpl4LHcNzHgKdBbb2PQrCH7eolN2+a/
	 tPCKb736jvnQaHsRI85tLm0q+110Wv4K7s3GZl6xAUtWaY24N0bsRL46+E8M9b4I0b
	 /06wZmsdbPw1jXmU43TV9oMicdWhPxL9xLf+VGJ+BX9m6gVJaIp+xtgeSOLFj6MAk0
	 lNhI2i/Z75MY2p/r2o7cz45Gye7kYCTlRGZQQiAVQv+JJ3DxBq5zYQh2QgpxCJE/je
	 xsn6H6/vs5s4A==
Received: by mail.capitalcraft.pl for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2025 07:55:24 GMT
Message-ID: <20250729064501-0.1.3p.ozwl.0.hdodqo2d3k@capitalcraft.pl>
Date: Tue, 29 Jul 2025 07:55:24 GMT
From: "Karolina Dylkiewicz" <karolina.dylkiewicz@capitalcraft.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Ochrona pracodawcy - prawo pracy
X-Mailer: mail.capitalcraft.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_005702_181854_204D2AD4 
X-CRM114-Status: UNSURE (   2.06  )
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

RHJvZHp5IFByemVkc2nEmWJpb3JjeSwKCncgcHJha3R5Y2UgcHJhd2EgcHJhY3kgZ3JhbmljYSBt
acSZZHp5IGZvcm1hbG5vxZtjaWFtaSBhIHJ5enlraWVtIHBvdHJhZmkgYnnEhyBjaWVua2Eg4oCT
IGEgamVkZW4gbmllcHJ6ZW15xZtsYW55IHphcGlzIG1vxbxlIG1pZcSHIGtvc3p0b3duZSBrb25z
ZWt3ZW5jamUuCgrFmndpYWRjesSZIHN0YcWCxIUgb2JzxYJ1Z8SZIHByYXduxIUgdyB6YWtyZXNp
ZSBwcmF3YSBwcmFjeSDigJMgdGFrLCBiecWbIG1pYcWCIHBld25vxZvEhywgxbxlIFR3b2plIGR6
aWHFgmFuaWEgamFrbyBwcmFjb2Rhd2N5IHPEhSBiZXpwaWVjem5lIGkgZG9icnplIHVkb2t1bWVu
dG93YW5lLiAKCkR6aWHFgmFtIHNwcmF3bmllLCByemVjem93byBpIGJleiBuYWRtaWFydSBmb3Jt
YWxub8WbY2kg4oCTIHdpxJlrc3pvxZvEhyBzcHJhdyByb3p3acSFenVqZW15IHphbmltIHVyb3Nu
xIUgZG8gcmFuZ2kgcHJvYmxlbXUuCgpDenkgbW9nxJkgcHJ6ZWRzdGF3acSHIHBlxYJlbiB6YWty
ZXMgbmFzemVnbyB3c3BhcmNpYT8KCgpQb3pkcmF3aWFtCkthcm9saW5hIER5bGtpZXdpY3oKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
