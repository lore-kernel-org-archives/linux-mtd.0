Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DB7C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:05:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC6C261968
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC6C261968
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ph1cXT6n/nuGKFx806vebSFVnHGOqzQwIKi884/QJaA=; b=RfDN5KtjlzFo1FZNK9uGxr2W/
	fq2SjF64Evpb4+WLaAvWKYNnjSeYtmqyns+Wp6oyxlsBsymh2oMbhM/sYkVG/R9IzDibvbn0naQ7G
	ePADV0dSj4F9SRiQFiZNHkBcz7SGLZAmymy+u5dhG0RsnN1enf5F2J52w3aZQjKVFNqI/xSA0Rh46
	+4f5leaL2naJHYxrrBYxW4uesZd1WUEPbMQBjG2IN0ZbbOpvxOnv494ppPgdkuc+34R7o7JldYLjK
	lkQ0+XyU2CCBV84FDEV4DnODyQpBSU6Ep7+xYTSgHocoV9GHueHaCeZH7Dh75mWp1xNMZPVrT2f5T
	0Yjk4Ujpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvJ0-000q5K-SY; Mon, 29 Mar 2021 17:03:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQotv-000ZUj-9T
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=O79FbKVIBQ5afx3VfjWpaCtdQh0ZBv6+JzVVq/HvU8k=; b=bxwbAwIQxoMSrdkl+1YubQXjVV
 4s6T9g8gfshCxe1cK83ajBqkiUg7auqBeoZbzuZMXix3i4LpXr71MlAXbM3xVUcOKcx9qXh3SJObh
 6ynXRz8PShIBEvrecz5ogLxax3i/azqKhlJjinfFn3DS2qlzRjlhe/7YkQKyV8IrAPQfJwKsQqv6+
 ZzP/yN2vnrBP4DxXPy5phrS01mu6WyltXiOBbztess10wuZ6LqPffeEmoG4qrxhC8Rc4spi0HRIlP
 fNUkfpqKIIcLLhZTONbwuI3Cul8TKQl2szIR11QzhZz/pPym0IdaPh/XtPqWcYBjwDLyCCIT90kU+
 ILrECTtg==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZCb-000KaV-50
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:27:59 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BEB6040008;
 Sun, 28 Mar 2021 17:27:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Vivek Unune <npcomplete13@gmail.com>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] mtd: parsers: ofpart: support Linksys Northstar
 partitions
Date: Sun, 28 Mar 2021 19:27:23 +0200
Message-Id: <20210328172723.9702-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312134919.7767-2-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7134a2d026d942210b4d26d6059c9d979ca7866e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_182756_293148_B682519D 
X-CRM114-Status: UNSURE (   5.68  )
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

T24gRnJpLCAyMDIxLTAzLTEyIGF0IDEzOjQ5OjE5IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRoaXMgYWxsb3dzIGV4dGVuZGluZyBvZnBhcnQgcGFyc2VyIHdpdGggc3VwcG9y
dCBmb3IgTGlua3N5cyBOb3J0aHN0YXIKPiBkZXZpY2VzLiBUaGF0IHN1cHBvcnQgdXNlcyByZWNl
bnRseSBhZGRlZCBxdWlya3MgbWVjaGFuaXNtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhh
bmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
