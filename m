Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AAECCF9E3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Nov 2025 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eozQrVuilbHB5SomMAW22gytTEVJVBfzXjAD40UfPgs=; b=lxfCc1z+hnBXes
	l+3OiXobjL/1KWLQDl9NiXENG4Mrq9kumd3ScigKAAeOITYWQ/EIntaaH0XpRYJ62DyKIx/gEUC73
	WSXTQstp1ZkZUs2PTb4v+dvwrAmrc/ZIZggCudu1gxVbyby+JNDflqbZeWN2sk8xGD3gWAb//fSLe
	mvfM+1JnI4yCPTX1uQ88JyZtePYIPfDo625r1rI/biGvdIpNNeEAH9s0o47vQC3ny2iuVARy+fD/y
	vPAlGNeS6kxDnfaQQMNiSQkSo7tn9WmZgiegY/B/ctz2nmFDquct6gim2Xz5K3acnS0rFDrUlzNuV
	P7Ukjm9uBPH1dclnXBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCvn-0000000BUgk-1vpw;
	Tue, 04 Nov 2025 09:02:23 +0000
Received: from mail.zentro24.pl ([94.177.238.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCvk-0000000BUfS-1vvC
	for linux-mtd@lists.infradead.org;
	Tue, 04 Nov 2025 09:02:22 +0000
Received: by mail.zentro24.pl (Postfix, from userid 1002)
	id D0EA983797; Tue,  4 Nov 2025 10:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zentro24.pl; s=mail;
	t=1762246868; bh=Q6bV6bAAmvv9IXDh6kMg2M1FJxSoLbfUIGwkPra0wkA=;
	h=Date:From:To:Subject:From;
	b=K9x7qPiNNjtOxg5xHctQooIDnbxt9yiC9Ed+S12PZIJhQs/T7z2TtNXq71plfwE/u
	 1m5os7gBFbn4p4Vv/j0YMSYuqSD201o0C8ubFKraKiWqdKWUpN0BU5955eUrQf0Toc
	 gjTOCyoWljpEvKbdBMGGf3xeZd0GJV8Ncbnyh/oC+U1P0rTsF2cucbvsoKSmaa7LZ3
	 AF2CgkKd2jmd2Xsx/g3mEJ240vok1FKnppqN/x5pf7nQUP/lHykNCz52s5d7gFxYJp
	 32l2m+TVn3fJAH0SRW5PYL+B3SzajU0yzyZf88siJk44WMvwdlupc+0cpw+qH7SEUV
	 Oh+D54pj8JamA==
Received: by mail.zentro24.pl for <linux-mtd@lists.infradead.org>; Tue,  4 Nov 2025 09:00:54 GMT
Message-ID: <20251104085138-0.1.dt.1oh2l.0.r016md4n3n@zentro24.pl>
Date: Tue,  4 Nov 2025 09:00:54 GMT
From: "Tomasz Borgul" <tomasz.borgul@zentro24.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Dodatkowe_=C5=9Brodki_?=
X-Mailer: mail.zentro24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_010221_563593_67DEA2A8 
X-CRM114-Status: UNSURE (   2.97  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IGFrdHVhbG5pZSByb3p3YcW8YWrEhSBQYcWEc3R3byBkb2RhdGtv
d2Ugxbpyw7NkxYJvIGthcGl0YcWCdT8KClphcGV3bmlhbXkgZmluYW5zb3dhbmllIGRsYSBmaXJt
IHogc2VrdG9yYSBNxZpQIOKAkyBuYXdldCBkbyA0MDAgMDAwIHrFgiBiZXogemLEmWRuZWogYml1
cm9rcmFjamkuIAoKRGVjeXpqxJkgb3RyenltdWrEhSBQYcWEc3R3byB3IDI0IGdvZHppbnksIGEg
d25pb3NlayBtb8W8bmEgesWCb8W8ecSHIGNhxYJrb3dpY2llIG9ubGluZS4KCkN6eSBtb2fEmSBw
cnplZHN0YXdpxIcgc3pjemVnw7PFgnkgZG90eWN6xIVjZSB3YXJ1bmvDs3cgaSBwcm9jZXN1IHV6
eXNrYW5pYSBmaW5hbnNvd2FuaWE/CgoKUG96ZHJhd2lhbQpUb21hc3ogQm9yZ3VsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
