Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A0EC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/XRwUUjjJLQCkyXnPbXjUvFvf5eTRs0gYQU6cUycMU=; b=Ut984p6nNDXdYR
	aV+4SJW5btrlGvcO+58+D8iYKDfjIqItI9OY7dsO0+LSh+5qjDJi3NotlemSArYrLV5gdzi6X3lFE
	JqE0QDHqs1Lvfjc+f6eEBT4pq6l2/w6Dkn+JREApnb4gNOk0PYHDMoR6t4uS4ojd8OHVm7diKd0FV
	rvhCbiou7AsDLq9xJ9t4fBDgQ5gn6u5TSqidjabREqvumAw49/2GOvl21r/nXFl6dCSKmdJahACga
	BRn5hiNXUobbFZO4Z54bPyBb4V4di2UW6P5nfLTlrRnYGMYNrVdOF9fV8+4WnlJJa8+ayJqR4xItT
	kC9CBR6senUNsWvsY8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLx-005Pt1-AR; Tue, 18 Oct 2022 09:57:41 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLK-005PJU-KF
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:57:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D520E40005;
	Tue, 18 Oct 2022 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666087021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mN1nF865lcYvGYr15lBFejksJf9Opi3qv1C6xgzF7XQ=;
	b=WFsEmwGR/1G/8LsTF34HJ7HaWiGic2GjgChlx0ughwU4l3w80QbMyzR+ujdziXVF+fqKIV
	ksLwEPzIWeNYv4qYMA92gCyPFhfy0jVLAsHwqYs8VJ1rdwbHuPAWIBh3+P71Z5BQMsKhUk
	YURnw3qRB4BTrwxCgssLTL/wOqdpXPshLcjLdQke7UK4wEoJeIkACTE8Muxb9Vahz6tIyU
	KBRPW/vOp9Tt2KE3wy5Ozza68IgIcWCz7zk8hEtkXdPd2GAB1Md2uyEUdqIrSGFdFHGmTy
	Frjhr50khfPWLspHF6hYliBmpyMBWigPeKgw6DFWkF0NGLfX4FXulcNgxu+BLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: ansuelsmth@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?b?UmFm?= =?utf-8?b?YcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] mtd: core: simplify (a bit) code find partition-matching dynamic OF node
Date: Tue, 18 Oct 2022 11:56:59 +0200
Message-Id: <20221018095659.543383-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004083710.27704-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'63db0cb35e1cb3b3c134906d1062f65513fdda2d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025702_826132_AD75DF21 
X-CRM114-Status: UNSURE (   5.71  )
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

T24gVHVlLCAyMDIyLTEwLTA0IGF0IDA4OjM3OjA5IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IDEuIERvbid0IGhhcmRjb2RlICJwYXJ0aXRpb24tIiBzdHJpbmcgdHdpY2UKPiAy
LiBVc2Ugc2ltcGxlciBsb2dpYyAmIHVzZSAtPm5hbWUgdG8gYXZvaWQgb2ZfcHJvcGVydHlfcmVh
ZF9zdHJpbmcoKQo+IDMuIFVzZSBtdGRfZ2V0X29mX25vZGUoKSBoZWxwZXIKPiAKPiBDYzogQ2hy
aXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4
dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
