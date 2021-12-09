Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E258C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YkBCEHIfh38s8yWJ25axBk6IuoKVIxLjWp1TNaikDB0=; b=gIG
	tO8k3xPn6XPcB0WyH0vTIdlEF2d2PZlHxwWRzMs4jZSizbWoIroGw+pULSZzI5dnDZp03UZweSh1e
	ovq9f/YqP1QDUf2zv/Ly1aYPnLAQyIETZUqAWT97uYMoar4bfNspW4bfdVz0UvIebyp58NFKjmHqg
	4or8wB5+3OD3nAn57XlstEXzLWEFLVYvpdbXZlZNVP5aRcZfoVyOc1OoU2krxtxgiPUFdTrhAnGNJ
	Lzpu+yI10xXQyCiuO6wBOCbg1eD3xCawFY6PHni9yjEGfXSSlbySnxdyJeZpV/Si/YoyIZeCXnj60
	JdoJ3csnha7Te3s9o0FfC+e89z1Gscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKZx-00GNom-LR; Thu, 09 Dec 2021 14:39:25 +0000
Received: from mxr015.valueserver.jp ([203.189.104.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKZr-00GNkq-Qw
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 14:39:22 +0000
Received: (qmail 8984 invoked by uid 89); 9 Dec 2021 23:39:08 +0900
Received: from c1.hpms1.jp (183.90.183.11)
 by mxr015.valueserver.jp with AES128-GCM-SHA256 encrypted SMTP;
 9 Dec 2021 23:39:08 +0900
Received: (qmail 144022 invoked by uid 89); 9 Dec 2021 23:39:07 +0900
Received: from unknown (HELO www.miyabi-tosou.jp)
 (info@miyabi-tosou.jp@183.90.183.11)
 by c1.hpms1.jp with SMTP; 9 Dec 2021 23:39:07 +0900
Date: Thu, 9 Dec 2021 14:39:07 +0000
To: linux-mtd@lists.infradead.org
From: =?UTF-8?B?6ZuF5aGX6KOF?= <info@miyabi-tosou.jp>
Subject: =?UTF-8?B?44GK5ZWP44GE5ZCI44KP44Gb44GC44KK44GM44Go44GG44GU44GW44GE44G+?=
 =?UTF-8?B?44GX44Gf?=
Message-ID: <0db9e647486ea1d9cb233167831f5558@www.miyabi-tosou.jp>
X-Mailer: WPMailSMTP/Mailer/smtp 1.2.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_063920_145339_739E9BA4 
X-CRM114-Status: UNSURE (   0.65  )
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
Reply-To: info@miyabi-tosou.jp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

44GK5ZWP44GE5ZCI44KP44Gb44GC44KK44GM44Go44GG44GU44GW44GE44G+44GX44GfCgrjg6Hj
g4Pjgrvjg7zjgrjmnKzmlocK4oC744GT44Gh44KJ44Gu44Oh44O844Or44Gv6Ieq5YuV55qE44Gr
44GK6YCB44KK44GX44Gm44GE44G+44GZ44CCCuacrOODoeODvOODq+OBq+WvvuOBl+OBpui/lOS/
oeOBquOBleOCieOBquOBhOOCiOOBhuOBq+OBiumhmOOBhOiHtOOBl+OBvuOBmeOAggoK4p2k77iP
IEhvdCBSdXNzaWFuIEdpcmxzISBDbGljayBIZXJlOiBodHRwczovL2JpdC5seS8zeTlqaG9sP2Rh
MCDinaTvuI/mp5gKCuOBk+OBruW6puOBr+OBiuWVj+OBhOWQiOOCj+OBm+OBhOOBn+OBoOOBjeOB
guOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAggrku6XkuIvjga7lhoXlrrnjgavjgablj5fj
gZHku5jjgZHjgb7jgZfjgZ/jgIIKCuOAkOOBiuWuouanmOaDheWgseOAkQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQoK44GK5ZCN5YmNCuKdpO+4jyBIb3QgUnVzc2lhbiBHaXJscyEgQ2xpY2sgSGVyZTogaHR0
cHM6Ly9iaXQubHkvM3k5amhvbD9kYTAg4p2k77iPCgrjg6Hjg7zjg6vjgqLjg4njg6zjgrkKbGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKCumbu+ipseeVquWPtwo2NjE4NzQ1NTUwNzAKCuOB
iuWVj+OBhOWQiOOCj+OBm+WGheWuuQo5NG82NDEKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQrkuIroqJjl
hoXlrrnjgpLnorroqo3lvozjgIHov73jgaPjgabjg6Hjg7zjg6vjgavjgabjgZTpgKPntaHjgZXj
gZvjgabjgYTjgZ/jgaDjgY3jgb7jgZnjgIIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
