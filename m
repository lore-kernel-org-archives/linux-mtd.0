Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163C1C47258
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jan 2024 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CHEf+i3k01FN8okyixkbzM0tcL041z6TE/sd/ofpJC4=; b=5BW3PlbAE0l0TV
	QxguKgKYvF7CBLOD2A6NdAZ4k/vkguEtWD6FoZvJkvEU401JGX309NqBKKBcPcN1KBHF3Zgt1kHoy
	v0K3S4FzlVFufYu/UC3SCLs34DntjvhpEaQOd9nntR3+QOj5KCuOJolfrX7k5Ry56zDTwZuyRZLWp
	0WkV+gEL0f4vlkfaAsw49XPMHOEkczabM4BRJT0TldNoKiPE2dXFYNDChTmof+6QVeiRc5QS42DoC
	wQ9yBQvYG+WdyribnSoiwsopnBthG54g/C4+0nZ28jRLe/MxSIaxb6uSIzArUw7y6YCteXMOnZq1d
	dDJpqVa4/IvT6ZrdVJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPerD-00BQFZ-0g;
	Tue, 16 Jan 2024 08:31:39 +0000
Received: from mail.entropitech.pl ([141.94.250.74])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPerA-00BQEH-2P
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jan 2024 08:31:38 +0000
Received: by mail.entropitech.pl (Postfix, from userid 1002)
	id 2EA4EA381B; Tue, 16 Jan 2024 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=entropitech.pl;
	s=mail; t=1705393894;
	bh=3C0lFFl3FyqJxhWazybBxamNtYGn+JlC8TtPqc/zclI=;
	h=Date:From:To:Subject:From;
	b=rvUqx0fG0hCy6hf6Spgf/DVHesGXSrYHkkNGgy2rasNc/QtrXcznhmB5LXg96PI8P
	 K2F6U+/hY3C8gCEAAxJLaiMiyM4CM6ItQSr/t6NFaGIIBu7/e+AYwhubijd18eSWxR
	 dQIiHUU/NRcQr3xuhwvycglQ/Snqr/WqqQFvua7MUXbILkrp7KEa5s3kepNODBntmy
	 XQvkJTJR/zP/TqOkVMfAAKr24Asoe/E3HOiavzTIqafGdzLsYkNCX+c0l1RmEveaYe
	 7Sa8m60DoTcg8QZHC488ujzTrJiqdL3YdgLABIjSnWTBZ9Z0DlTKuuFmSn/gJOhTRH
	 qfNrknOFSk7Dw==
Received: by mail.entropitech.pl for <linux-mtd@lists.infradead.org>; Tue, 16 Jan 2024 08:31:12 GMT
Message-ID: <20240116074500-0.1.ed.p636.0.14fgqxwkpi@entropitech.pl>
Date: Tue, 16 Jan 2024 08:31:12 GMT
From: "Szymon Faryk" <szymon.faryk@entropitech.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Zam=C3=B3wienie_na_klimatyzatory_postojowe?=
X-Mailer: mail.entropitech.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_003136_925532_5A863C41 
X-CRM114-Status: UNSURE (   1.73  )
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

RHppZcWEIGRvYnJ5LCAKCmtvbnRha3R1asSZIHNpxJkgeiBQYcWEc3R3ZW0sIHBvbmlld2HFvCB3
IG9mZXJjaWUgbmFzemVqIGZpcm15IHpuYWpkxIUgUGHFhHN0d28gc3plcm9raSB3eWLDs3Igbm93
b2N6ZXNuZWogaSBpbnR1aWN5am5laiBrbGltYXR5emFjamkgcG9zdG9qb3dlaiBkbyBhdXQgaSBt
YXN6eW4uCgpPZmVydWplbXkgc3dvaW0gS2xpZW50b20gdXJ6xIVkemVuaWEgY3pvxYJvd3ljaCBw
cm9kdWNlbnTDs3csIG1hasSFIFBhxYRzdHdvIG1vxbxsaXdvxZvEhyB3eWJyYcSHIGluc3RhbGFj
asSZLCBrdMOzcmEgc3BlxYJuaSB3c3p5c3RraWUgb2N6ZWtpd2FuaWEgaSB6YXBld25pIGtvbWZv
cnQgdyBrYcW8ZHljaCB3YXJ1bmthY2guCgpNYW15IHcgc3dvaW0gYXNvcnR5bWVuY2llIGtsaW1h
dHl6YXRvcnkgcG9kxYJhd2tvd2UsIGthbWVyb3dlLCBrbGltYXR5emF0b3J5IHogcGlsb3RlbSBv
cmF6IHJvendpxIV6YW5pYSBkb3Bhc293YW5lIGRvIGthbXBlcsOzdyBpIMWCb2R6aS4KClpham11
amVteSBzacSZIG5pZSB0eWxrbyBzcHJ6ZWRhxbzEhSwgYWxlIHLDs3duaWXFvCBmYWNob3d5bSBk
b3JhZHp0d2VtIGkgbW9udGHFvGVtIGtsaW1hdHl6YWNqaS4gxZp3aWFkY3p5bXkgcsOzd25pZcW8
IHVzxYJ1Z2kgc2Vyd2lzb3dlIGkgcHJ6ZWdsxIVkeS4gCgpDenkgc8SFIFBhxYRzdHdvIHphaW50
ZXJlc293YW5pPyAKCgpQb3pkcmF3aWFtClN6eW1vbiBGYXJ5awoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
