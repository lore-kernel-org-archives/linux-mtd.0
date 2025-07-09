Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD85BC83F03
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jul 2025 09:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PbDkTkYWQRxc4awL8owtjEu0JXhHhNY4JU22TnmKsHA=; b=d5nF0ADMPsQQyx
	Q2xI7jvKVxPpLQ7X968rd0UbQzYKcm13QtMhSK258pENgv3Zv/UgATZEZ+qmtJVY4E5lmmf4NHHcB
	r1++43FKpnHDDyIqotz/Q4XQXB9Qqe7FFGsOejvSp8AOHxX1WebZ2zUt1MH6IzSSyNX5bJNCIN+n3
	rs+g3REy6a0y+a++a0d/u5Ek8WOkBtH2Dx2P67pf6hLPG4BsARAYg9/dxafbUwnIkIu1Jt2ruODCx
	gqy2tzQsb0ct8qKHgPUGB1m3cz6+503qVYO1vXEXmVZ9whFot5ihpwnCElU8c8ld1A1IVqRoBQQZ1
	C4ksLsXA4a49DZMMhpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQqq-000000085J8-2dnx;
	Wed, 09 Jul 2025 09:12:28 +0000
Received: from mail.bizovo.pl ([217.61.16.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPIE-00000007p2i-3AsA
	for linux-mtd@lists.infradead.org;
	Wed, 09 Jul 2025 07:32:39 +0000
Received: by mail.bizovo.pl (Postfix, from userid 1002)
	id 1158783677; Wed,  9 Jul 2025 09:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizovo.pl; s=mail;
	t=1752046282; bh=GFLqhBmGowcpiiQwNum256VPL08ZNDpLKbHxe0rNTSA=;
	h=Date:From:To:Subject:From;
	b=UB8RP58UG/mwOuU1Uyx4QdrwIqzjP2OgeI3WWL97JwHCMYcstHMsplSfAU5pgb3R5
	 xkrKJVcerMyydQDTwzxa8m+TCUu+COyqYMgPpoGS+BjHqRjIz32snT9CB9yAHPnACa
	 m/Kwry3TleHndk37kH7aV95HsPsRPVQjyQvuBoO6HvoVWn1URHbRGJOnnHEsvrJjz2
	 IR85r7uMSjgSZjyHoHJZWBi+lcxQCshEuiTGZ1L1vDt0kDn8WKvEvAypzbaQghd2AG
	 zn61YRpb0AH8WJMS5vDQiECMCCimjRqtCFZ00S6/AjUAYD5aERrmnU1Ju9wJm1dwCo
	 fjwVaE1DeLqIQ==
Received: by mail.bizovo.pl for <linux-mtd@lists.infradead.org>; Wed,  9 Jul 2025 07:31:04 GMT
Message-ID: <20250709084500-0.1.8v.19cag.0.qh69t9v17n@bizovo.pl>
Date: Wed,  9 Jul 2025 07:31:04 GMT
From: "Wiktoria Bielaszka" <wiktoria.bielaszka@bizovo.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Zamro=C5=BCenie_ceny_energii?=
X-Mailer: mail.bizovo.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003238_918109_88C3995C 
X-CRM114-Status: UNSURE (   1.27  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSBwbGFudWrEhSBQYcWEc3R3byBvcHR5bWFsaXphY2rEmSBrb3N6
dMOzdyBlbmVyZ2lpIGVsZWt0cnljem5laiB3IHN3b2plaiBmaXJtaWU/CgpDaGNpZWxpYnnFm215
IHByemVkc3Rhd2nEhyBuYXN6xIUgb2ZlcnTEmSBYUE9ULCBrdMOzcmEgbW/FvGUgcHJ6eW5pZcWb
xIcgem5hY3rEhWNlIG9zemN6xJlkbm/Fm2NpLiBKdcW8IG9kIHRlcmF6LCBtb2fEhSBQYcWEc3R3
byB1enlza2HEhyBjZW7EmSBuacW8c3rEhSBvIDQwLDklIHcgc3Rvc3Vua3UgZG8gb2JlY25laiBj
ZW55IHVzdGF3b3dlai4gCgpOYXN6YSBwcm9wb3p5Y2phIG9iZWptdWplIGxhdGEgMjAyNSBpIDIw
MjYsIGEgc3RhcnQgd3Nww7PFgnByYWN5IGplc3QgbW/FvGxpd3kgb2QgemFyYXouIEd3YXJhbnR1
amVteSBlbGFzdHljem5lIHdhcnVua2kgdW1vd3kgKDMtNi05LTEyIG1pZXNpxJljeSksIHphcGV3
bmlhasSFYyBtaW5pbXVtIGZvcm1hbG5vxZtjaS4KCkplc3RlxZtteSBwaW9uaWVyZW0gdyBzcHJ6
ZWRhxbx5IGVuZXJnaWkgdyBjZW5hY2ggUkROIHdlZMWCdWcgVEdFIGRsYSBrYcW8ZGVqIGdydXB5
IHRhcnlmb3dlai4gUHJ6ZXogY2HFgnkgb2tyZXMgdHJ3YW5pYSB1bW93eSB6YXBld25pYW15IFBh
xYRzdHd1IGRlZHlrb3dhbmVnbyBvcGlla3VuYSwgYSBjYcWCeSBwcm9jZXMgWm1pYW55IFNwcnpl
ZGF3Y3kgaSB3c3plbGtpZSBmb3JtYWxub8WbY2kgcmVhbGl6dWplbXkgemEgS2xpZW50w7N3LiAg
CgpDaMSZdG5pZSBwb3Jvem1hd2lhbSBvIHR5bSwgamFrIG1vxbxlbXkgd3Nww7NsbmllIHpyZWFs
aXpvd2HEhyBQYcWEc3R3YSBjZWxlIGVuZXJnZXR5Y3puZS4gUHJvc3rEmSBvIHdpYWRvbW/Fm8SH
IHcgcHJ6eXBhZGt1IHphaW50ZXJlc293YW5pYS4gCgoKWiBwb3pkcm93aWVuaWFtaQpXaWt0b3Jp
YSBCaWVsYXN6a2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
