Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9D5C7619A
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Apr 2023 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:From:Date:
	Subject:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uq1O30UlBr7tGyE0kmA640D0FOWquY8CS7cXVUpt5Xo=; b=oMGFmvD/PB585I
	kqxQiPOcQkuWLSFpCZG3eC9UaNDNhBOc83u8Y/ISNYjVxgIZ5CPjMyfRjbmgWwqawWAmqYrEGtZVT
	6CXa6C9VLgDO0D8/Z7JI4C4w/9Irn34qx5fQ5E1LSc54SJeYbcoT48ipFjugo3vocAlQy7PheDOh0
	B4dMSNyXWnqu7wGVFZX1r3HY45zGP/++w6Ayssg20gLldDsPs9BM0j5rsyQLePLBHraxxuFIdZ+ge
	Q0mlQTwOO3siNMYXgw2tY86kOFblAues2w3COq8d0f+oSP15Eevs3AVcCzUxcBbfMIqI+Wr5Z7gnp
	rkfSGUAYPjRPZxU+Hdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnyEF-00DOkM-05;
	Sun, 16 Apr 2023 08:59:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnyED-00DOk2-0v
	for linux-mtd@bombadil.infradead.org;
	Sun, 16 Apr 2023 08:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:From:Date:Subject:To:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=hPILDKGQDGyM/nJa1tFDpJokoFzxNyejJONqhkzHxBk=; b=nrpf3znQXNPZGrxLxQ+PRpfHoI
	dOTi2q9F5KHPMxO0SuTy2Hf0femqgRFLghpajQsK3bgTGBQT/9fGVvrXymdnrxcVReNcgT2KVejNm
	gi7HKRh6ycjcdbDa1x+MbWNiBmz00WdJ+ABaqs93TT048ZLgu3fj5X9PaVdLRESglKc3Li8mVXjns
	TR2TKphdz75t/FsVVdP0CKcUb9SG49c3tuBMY9cKVvahqow6h9zIR2hKHx8ZJO8BCe98uFKRqb35V
	IMFQgSLz5fZVCrdPtvbh21t/0wqkAVVV51Y4j5F/0wwwsAl9biIAosr7V9gdNUj52u3uknJL2HtzJ
	bwiou9Gg==;
Received: from www3475.sakura.ne.jp ([49.212.235.215])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pnyE7-00AGs4-9L
	for linux-mtd@lists.infradead.org; Sun, 16 Apr 2023 08:59:18 +0000
Received: from www3475.sakura.ne.jp (localhost [127.0.0.1])
	by www3475.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 33G8wE4D077524
	for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2023 17:58:14 +0900 (JST)
	(envelope-from tsubasa-ent@www3475.sakura.ne.jp)
Received: (from tsubasa-ent@localhost)
	by www3475.sakura.ne.jp (8.15.2/8.15.2/Submit) id 33G8wERM077523;
	Sun, 16 Apr 2023 17:58:14 +0900 (JST)
	(envelope-from tsubasa-ent)
To: MichaelSek <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?B?44Oh44OD44K744O844K444GC44KK44GM44Go44GG44GU44GW44GE44G+44GZ?=  =?UTF-8?B?44CC44CQ5bed5baL44GC44GETXlSb29t44CR?=
Date: Sun, 16 Apr 2023 08:58:14 +0000
From: =?UTF-8?B?5bed5baL44GC44GETXlSb29t?= <info@kawashimaai.com>
Message-ID: <b207eb962146da8cbf17b19e7ada736e@kawashimaai.com>
X-Mailer: PHPMailer 5.2.22 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_095915_908395_A31848A9 
X-CRM114-Status: UNSURE (   0.39  )
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

44GT44Gu44Oh44O844Or44Gv44CQ5bed5baL44GC44GETXlSb29t44CR44KI44KK6Ieq5YuV44Gn
6YCB5L+h44GV44KM44Gm44GE44G+44GZ44CCCuOBk+OBruW6puOBr+ODoeODg+OCu+ODvOOCuOOC
kuOBiumAgeOCiuOBhOOBn+OBoOOBjeOBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAggoK
44Oh44OD44K744O844K45pys5paHOgpHZXQgRXhwZXJ0IFNvY2lhbCBNZWRpYSBTZXJ2aWNlcyBm
b3IgWW91ciBCdXNpbmVzcyBodHRwczovL3NtbS1lbGl0ZS1zZXJ2aWNlLmljc2lnZXdhbmdtaXIu
dGsvaW52aXRlLTU5NzkKCi0tCuOBk+OBruODoeODvOODq+OBryDlt53ltovjgYLjgYQgTXkgUm9v
bSAoaHR0cDovL2thd2FzaGltYWFpLmplZXouanApIOOBruOBiuWVj+OBhOWQiOOCj+OBm+ODleOC
qeODvOODoOOBi+OCiemAgeS/oeOBleOCjOOBvuOBl+OBnwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
