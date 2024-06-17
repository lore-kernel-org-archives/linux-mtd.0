Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714D9C27C6E
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PiJcinL0Pc1OhZCo3wXj4LOzGnGQKMpO+bM6gWHojGg=; b=g5KKfbJ5DcN484
	KxE8vWkKRBJrtMJJJkT2eMmhPGb3Gy9HZQ31XBq59PJNatB62NhMVShF3/waui3zGce+yDCgLJnfa
	jAX7oZhakIBN8lZCQoNGq6E1EhM49sfKhJGuBkx2FL4XhdK3AJKuh3Lqpwq7JCSzxezgyMNDI6wMo
	IADoxksl3EOm0kvvW5JLlzOo/4mqPI7lGVh16Lvvns0lcaczOSw7yyYPa3jrIaOpqL39yW2B65Tz2
	9QCW0kQ09YO+MVIXqHnuLlVer+L2+ezoSmxcnJ0Ypvq05OxGkewxbIvD+uctPUfcdVYjpTJbxYSww
	HHEM7ufvG9u5QyGqpf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7S1-00000009nqA-47uD;
	Mon, 17 Jun 2024 08:10:53 +0000
Received: from mail.salesoptimize.pl ([162.19.245.89])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Rx-00000009nnc-46lJ
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 08:10:51 +0000
Received: by mail.salesoptimize.pl (Postfix, from userid 1002)
	id 874FF46268; Mon, 17 Jun 2024 10:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=salesoptimize.pl;
	s=mail; t=1718611848;
	bh=u+y/L6S5UL+8vZAxwL74vV1B6m8M84m9zI1fQPT/Bfs=;
	h=Date:From:To:Subject:From;
	b=TeveFLFr+miFFaYJZFSCDxvVhf70B5AWYTNgYK2gtzz3iZPGmV/f2kCzgbUUaSEO9
	 wFbpwY53vTKnYyWMFGOoI5M1x7QYIoy0xniP+YhZzWv+ViRaPDWwcgXk2XD20AZJOx
	 b+VtCu1GLV9q1IF/CcFZFU2o9ktmD00PeUARI/aWuoGmkBkBg7E2rjUFAw42EBa04C
	 wG4ytdK/+lK91gZsyjpyc9rhcMocXVx29Xeq0sRofuInLqnDwhoL1O4gUgdSmZNJoy
	 DLrLJbVas02yZBUUtU/JaumPxYvOH+JXXMY+JC+aO0H1+itAUYYS7Jv1Hv+kzNM47Z
	 fYOMDEbqLxrSA==
Received: by mail.salesoptimize.pl for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2024 08:10:47 GMT
Message-ID: <20240617084500-0.1.31.oen7.0.j77j7gdqv7@salesoptimize.pl>
Date: Mon, 17 Jun 2024 08:10:47 GMT
From: "Tomasz Wawrzyniak" <tomasz.wawrzyniak@salesoptimize.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Odroczenie_zap=C5=82aty?=
X-Mailer: mail.salesoptimize.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_011050_234923_8D746081 
X-CRM114-Status: UNSURE (   0.63  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYnltIHphcHJvcG9ub3dhxIcgbW/FvGxpd2/Fm8SH
IHd5ZMWCdcW8ZW5pYSBva3Jlc3Ugc3DFgmF0eSB6YSB6YWt1cGlvbmUgcHJvZHVrdHkuCgpNb2ds
aWJ5xZtjaWUgesWCb8W8ecSHIHphbcOzd2llbmllIHUgc3dvamVnbyBkb3N0YXdjeSwgYSBteSBk
b2tvbmFteSBwxYJhdG5vxZtjaSB3IHd5em5hY3pvbnltIHByemV6IG5pZWdvIHRlcm1pbmllLiBQ
byBvdHJ6eW1hbml1IHDFgmF0bm/Fm2NpIHd5c3Rhd2lteSBQYcWEc3R3dSBmYWt0dXLEmSBzcHJ6
ZWRhxbx5IHogb2Ryb2N6b255bSB0ZXJtaW5lbSBwxYJhdG5vxZtjaSAoMzAtOTAgZG5pKS4KClPE
hSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB0YWtpbSByb3p3acSFemFuaWVtPwoKClBvemRyYXdp
YW0KVG9tYXN6IFdhd3J6eW5pYWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
