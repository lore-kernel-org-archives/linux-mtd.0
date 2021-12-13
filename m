Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2450FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=II271q52bDpQIrZGsWQthSqEDHtSQdw86nR29E6KBw8=; b=gnf
	BM+LN93z5gT71fikUPVyQST96oeYzpQbtkDzAYSFguyQSsFM5a3cya8P/Tk9afHAqt36Bxlf/5eVK
	jIc9nxez+hdSNbOcOulszBKy/XMBy/5Xo5MIkkocTaoEWnfJICvfayHMQFAykrhDAfome/G9wPYBh
	UME6q+P6pF8yjtg1/ghGgsVFWBBFOOB/IlUvDr3ZD02cs8tOKM45qdV+ek74Uf2nQIGVK2bjarUHb
	hH5zPJAu9X8ox9rLXRbhECdN3iTz8B3C4jr/cRyejRdX9iNZsOYMDUCfcdJbJ5Q5t+Ax/QoR8tYRy
	lpGk+ATD/8xv+2MAhe7prTFLSr7BQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwbQH-007dmL-1p; Mon, 13 Dec 2021 02:50:41 +0000
Received: from c18.hpms1.jp ([183.90.183.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwbQD-007dle-1n
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 02:50:39 +0000
Received: (qmail 604093 invoked by uid 89); 13 Dec 2021 11:43:49 +0900
Received: from unknown (HELO www.favorite-spa111.com)
 (info@favorite-spa111.com@183.90.183.19)
 by c18.hpms1.jp with SMTP; 13 Dec 2021 11:43:49 +0900
Date: Mon, 13 Dec 2021 02:43:49 +0000
To: linux-mtd@lists.infradead.org
From: favorite Spa <info@favorite-spa111.com>
Subject: =?UTF-8?B?44GK5ZWP44GE5ZCI44KP44Gb44GC44KK44GM44Go44GG44GU44GW44GE44G+?=
 =?UTF-8?B?44GX44Gf?=
Message-ID: <5761ce1b154cda5f6b131f9bb9a9ed28@www.favorite-spa111.com>
X-Mailer: WPMailSMTP/Mailer/smtp 1.7.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_185037_354943_9B88085C 
X-CRM114-Status: UNSURE (  -0.20  )
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
Reply-To: info@favorite-spa111.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

44GK5ZWP44GE5ZCI44KP44Gb44GC44KK44GM44Go44GG44GU44GW44GE44G+44GX44GfCgrjg6Hj
g4Pjgrvjg7zjgrjmnKzmlocK4oC744GT44Gh44KJ44Gu44Oh44O844Or44Gv6Ieq5YuV55qE44Gr
44GK6YCB44KK44GX44Gm44GE44G+44GZ44CCCuacrOODoeODvOODq+OBq+WvvuOBl+OBpui/lOS/
oeOBquOBleOCieOBquOBhOOCiOOBhuOBq+OBiumhmOOBhOiHtOOBl+OBvuOBmeOAggoK4p2k77iP
IFlvdSBoYXZlIHVucmVhZCBtZXNzYWdlcyBmcm9tIFZpY2tpICgyKSEgQ2xpY2sgSGVyZTogaHR0
cDovL2JpdC5kby9mU1JSSz81cTA2byDinaTvuI/mp5gKCuOBk+OBruW6puOBr+OBiuWVj+OBhOWQ
iOOCj+OBm+OBhOOBn+OBoOOBjeOBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAggrku6Xk
uIvjga7lhoXlrrnjgavjgablj5fjgZHku5jjgZHjgb7jgZfjgZ/jgIIKCuOAkOOBiuWuouanmOaD
heWgseOAkQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoK44GK5ZCN5YmNCuKdpO+4jyBZb3UgaGF2ZSB1bnJl
YWQgbWVzc2FnZXMgZnJvbSBWaWNraSAoMikhIENsaWNrIEhlcmU6IGh0dHA6Ly9iaXQuZG8vZlNS
Uks/NXEwNm8g4p2k77iPCgrjg6Hjg7zjg6vjgqLjg4njg6zjgrkKbGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKCumbu+ipseeVquWPtwo4NTk0NzU2Mzc1OTcKCuOBiuWVj+OBhOWQiOOCj+OB
m+WGheWuuQppcnZ2MTd1CgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K5LiK6KiY5YaF5a6544KS56K66KqN
5b6M44CB6L+944Gj44Gm44Oh44O844Or44Gr44Gm44GU6YCj57Wh44GV44Gb44Gm44GE44Gf44Gg
44GN44G+44GZ44CCCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
