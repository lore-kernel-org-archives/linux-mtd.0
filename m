Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA59AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Je2CZvjftY88QsTfFSUUa8ifERHhbq4KRGwhULpGKms=; b=uWI/07EL5A04I1
	xpH3xTznArVvVq3uCyA5weG4gGPePncbmDIzJblnToFnezdn/MJIs4D8grZwzrf3olvctUmgHFr7A
	vO+Ab1Mj24ElhQLxNI7qZX/zZ0uadohgrOXBKu5GxxQSnTDoig08KjDTMzuPYb+Aetaejaa7Vu7Zw
	p4VC2a6sGquvwH06jWPVj5qpW2q1EPtmkoEJEbA5gGrDv318eiXyri2x0RoJjdsII2WQls9DmID0a
	TgKdUcNGp1sv6bDNGzf6ZBzt23U1DZUjgAQ/i6+t2Qi3gvjK8Myqyr5tgY0zGw/QG5vvJeOthr7ig
	t5HCGstyPj+6bmiuygRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvJ9-002jJd-8O; Mon, 24 Jan 2022 09:06:39 +0000
Received: from mail.portyid.pl ([192.36.61.58])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvJ7-002jIS-6l
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 09:06:38 +0000
Received: by mail.portyid.pl (Postfix, from userid 1001)
 id A217F4111E; Mon, 24 Jan 2022 10:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=portyid.pl; s=mail;
 t=1643015195; bh=+PMi7irkA4XlRgpdW2HqpqcJeZNxKGysf407T0katTE=;
 h=Date:From:To:Subject:From;
 b=Pl1ZWfY4LNyxRWzQ2i0hQVmXuXhV475Xior39iLkLmJXxSKq51iyICtPf42kj05vw
 2RGxVZMnjbkEQNoLEYP/qp4Mc8O80PG54F3FoDA+zd8syXu8uaRI41oLYsGVr6Qdah
 cOcCua7g0tUPjYPmFxSQpH+FfLdgdHbR+OjdvvD6YwY98JYwUBWmHFezRUdwp+CxQ4
 NejOCBkPgIBnCQxFciLVEsibNeAJkleS41ujTdJMyRfFD4/brweCfuTlE+5u2jTkhj
 Kmzf+LIeJIsMYHxnzpzscLRgYJBrTXMtRFCpgvDMB+qz7muH1cxpIf5CFW9oY3LhOf
 TA2EqEwEm1ppQ==
Received: by mail.portyid.pl for <linux-mtd@lists.infradead.org>;
 Mon, 24 Jan 2022 09:06:07 GMT
Message-ID: <20220124084500-0.1.1b.5f5a.0.oan14bgje4@portyid.pl>
Date: Mon, 24 Jan 2022 09:06:07 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Jasi=C5=84ski"?= <pawel.jasinski@portyid.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika - nowe warunki
X-Mailer: mail.portyid.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_010637_424285_33D7CB48 
X-CRM114-Status: UNSURE (   2.29  )
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

RHppZcWEIGRvYnJ5LAoKamVzemN6ZSB3IHBpZXJ3c3plaiBwb8WCb3dpZSAyMDIyIHJva3Ugd3py
b3NuxIUgY2VueSB6YSB3eWt1cCBlbmVyZ2lpIGRsYSBwb3NpYWRhY3p5IGZvdG93b2x0YWlraS4g
CgpBYnkgdW5pa27EhcSHIHVtb3d5IG5hIG5vd3ljaCB6YXNhZGFjaCB0cnplYmEgemRlY3lkb3dh
xIcgc2nEmSBuYSBpbnN0YWxhY2rEmSBwYW5lbGkgUFYgZG8ga2/FhGNhIG1hcmNhLiAKCkpha28g
ZmlybWEgc3BlY2phbGl6dWrEhWNhIHNpxJkgdyBtb250YcW8dSBpIHNlcndpc2llIGZvdG93b2x0
YWlraSBjaMSZdG5pZSBwb2Rlam1pZW15IHNpxJkgcmVhbGl6YWNqaSBjYcWCZWdvIHByb2pla3R1
LiBTxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmk/CgoKUG96ZHJhd2lhbQpQYXdlxYIgSmFzacWE
c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
