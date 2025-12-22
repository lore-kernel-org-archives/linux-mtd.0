Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81955D711D5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Dec 2025 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lgAb2GwBsYwE+dJaAB2D4D2tH1j4GEiOKZFUvhr/kN4=; b=X1zRlAzPEoakrJ
	7MN7Rm4MByd6JXzgbaXPZyU+le/2JIjkyGxxvd3zhueiv5rHd6XlnvggMbCKqTenJskYRHU8ZaJ9p
	GEBnVkRYcgMbToYVqhRIoLBOx3+Qqk8G84w36z5Hkvs1Eke/F+AoZ3If+WpLEw/Tg2TNWTUsVBSSo
	UHcO6d3dAYb3r61MpT+nCbpzdjVdwV03KTYXIEJIG8jY4Puc2VqZ/MZlbsjDkndC3HCwnkyVVUFUe
	DaPfeGZalUcsDqHSCnSkcjQPr1MSpBARVOD9tJmBPjpvwyDstZPijz6TqCqGz8xUXH60icIjoLgzW
	odQ0Svzm4rAmE14Kwxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbjS-0000000DUI3-3L3g;
	Mon, 22 Dec 2025 08:57:34 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbjN-0000000DUGg-2yXi
	for linux-mtd@lists.infradead.org;
	Mon, 22 Dec 2025 08:57:30 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 7AA14A5A56; Mon, 22 Dec 2025 09:55:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1766393766; bh=rBf3jQVFnGCeJlMPbA0E+WWQIPnf9AfAJW4UEB5U3Ig=;
	h=Date:From:To:Subject:From;
	b=Gd8cXCICwi4WzwujY/LJCxIbdj4R6O8pSGCcAHYP4yVw09VuIjpQbZQICSJC6kE/T
	 pOeK1o+qK5Q+Erz9RqpX9E26/0ivWi/3lIgGZNUgZVnmGct/KAczoB44ZeUEtCQ4yc
	 Ga0UuKcHNc239gC4ueuZdnaQ0TX4VejLMEuXnNPNVzZTS4tP6EVDcbYGdTYm5a8B1d
	 CKk884rhKHM4rCzngUxNOqpOlK0SF0CH1YJ3VXNxQweIj7bpdtGwx6Hr1tgZDJ9xJt
	 6uX2bBUh5IBe+j8KTNEDaHMRhDkLao7qOnlMGgQfkxCU1rD+Icltlf5hXL6sHi/gt1
	 Yx+Qnj3A046Vg==
Received: by mail.vexro.pl for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 08:55:52 GMT
Message-ID: <20251222084500-0.1.pc.4shvx.0.pdu4theosu@vexro.pl>
Date: Mon, 22 Dec 2025 08:55:52 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_005729_928039_19035E37 
X-CRM114-Status: UNSURE (   1.88  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IGlzdG5pZWplIG1vxbxsaXdvxZvEhyBwb3Jvem1hd2lhbmlhIHog
UGHFhHN0d2VtIG8gd3Nww7PFgnByYWN5PwoKRG9zdGFyY3phbXkgaSB3ZHJhxbxhbXkgc3lzdGVt
LCBrdMOzcmVnbyBlZmVrdGVtIGplc3Qgb2JuacW8ZW5pZSBrb3N6dMOzdyB6YSBwYWxpd28sIHN6
eWJzemUgcG9rb255d2FuaWUgdHJhcywgc2tyw7NjZW5pZSBjemFzdSBkb3N0YXcgb3JheiB3acSZ
a3N6ZSBiZXpwaWVjemXFhHN0d28ga2llcm93Y8OzdyBuYSBkcm9kemUuCgpQcm9zesSZIG8ga29u
dGFrdCwgamXFm2xpIGludGVyZXN1amUgUGHFhHN0d2EgcG96bmFuaWUgbW/FvGxpd2/Fm2NpIGx1
YiBiZXpwxYJhdG55IHRlc3QgdGVnbyB0eXB1IG5hcnrEmWR6aWEuCgoKUG96ZHJhd2lhbQpBZGFt
IERyemV3aWVja2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
