Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63493D44149
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9K4V1vAHOn/7qzbiQxivCJGo73BUPREi7mhchMFpdfY=; b=aWtQh+vcVeFmpd
	X5IH6/AryhZPnfsJt0yfasZ7i7ie3hZxnmht9acBIesKHQPD4U6l+LvaPfV5nXcnLbFVtHgG8+Rq+
	fn21r6YK8p+00LJ/qT3EqAcxNzLD7uyEGnHyVbXEyZCgR6f+je3id0px470EIaPTa79mhwLLU7wJp
	xK1rWTjZGkX7gfO8B8o8TIxUFmj4jWr92buUC0+YFt7xR8aJMZjALseOYIylZKE/GsugC5i9BNWRX
	V9nAd9JYsEyXqBrUHBFltr0kdAlLulDIgrkw++uS1mUKEVwEnfpfRiBVwBAt8QWXDlYuJPeL/EHAP
	WBAPHUSPZ7QwKv3w+yPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz7z-00000000JNu-48qY;
	Fri, 12 Dec 2025 09:07:55 +0000
Received: from mail.fontri.pl ([51.195.90.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz7x-00000000JN6-3ADh
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 09:07:55 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
	id 3C6E4ACA79; Fri, 12 Dec 2025 10:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
	t=1765530468; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=iHJ2XNLa/uK6e9HUyDfg7mFFjH4UUv23423HSk6tgpYV8zLrNvXqWvgeumnnVxMst
	 a0P5inEqKlakgy+dJjuZSnMo0uaIOGhXlsqhErn3p8q9/DEG7wE46lNOO48UUVu7UT
	 HeaCu8fQkkeIbxeo08+TeBpOo6CGfH+pg4w0iWAuH/D4llA+OB8TSh2MQiFRSXbz0y
	 sEe8GjUb7UKPmXLLGgm4utQj7jsYeKplzyeQeekX+FMiWuaG+OaIXB5JH3LBiEWmyk
	 Xv2/TGSwmFthrqj5LiRVbbKdTtJAvGXuQDKZtLin2D2WteZ5S7toPaCsuT13xa2VQg
	 hEci2G3m6eBZg==
Received: by mail.fontri.pl for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2025 09:05:58 GMT
Message-ID: <20251212084500-0.1.sy.6b6v7.0.6h21fgb2fc@fontri.pl>
Date: Fri, 12 Dec 2025 09:05:58 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@fontri.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010754_065826_CB2D4F47 
X-CRM114-Status: UNSURE (   0.86  )
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

RHppZcWEIGRvYnJ5LAoKamFrbyBsaWRlciB3IHVzxYJ1Z2FjaCBrdXJpZXJza2ljaCB3IFBvbHNj
ZSBwcnp5Z290b3dhbGnFm215IGVsYXN0eWN6bmUgcm96d2nEhXphbmllIGRsYSBwcnplZHNpxJli
aW9yY8Ozdy4KClN0d29yenlsacWbbXkgYWJvbmFtZW50IMWCxIVjesSFY3kgZG9zdGF3eSBkbyBQ
YWN6a29tYXQgMjQvNyBvcmF6IG9ic8WCdWfEmSBrdXJpZXJza8SFIC0gamVkZW4gZG9zdGF3Y2Es
IGplZG5hIGZha3R1cmEgaSBwcnpld2lkeXdhbG5lLCBzdGHFgmUga29zenR5LiAKCkN6eSBtb2fE
mSBwcnplZHN0YXdpxIcsIGNvIG1vxbxlbXkgemFwcm9wb25vd2HEhyB3emdsxJlkZW0gUGHFhHN0
d2EgcG90cnplYj8KCgpQb3pkcmF3aWFtCsW7YW5ldGEgS8SZZHppZXJza2EKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
