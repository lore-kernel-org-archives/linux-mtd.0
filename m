Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388DBCA6CB6
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jan 2026 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=60sbJdIdv//IthjoDW33G9uMEplY8F88xC5qA4qITTw=; b=jh7vmzuvIFOG8W
	VBcMFlRXttRX805LQ65Yng32TDUCkM979xKWOu8wO8eyQ9Wb51LYp17XURX6ERs/8mX9Ht0I29t7/
	NKjWt3Mrwb+t4h+ctcDDbzYn3V1lE+Tlo3Mf7LZmwFBXYEr6h/NKRtQ/Dd44aBYNAlRVOJ0BPGqFq
	iiEFO4Y5qsE8j+SpPsA/5YlgoV69u8SWpr7YUjc+vZH3th7mOOPeGJ4oP5sleRwxkXwJaw8Zpbjrf
	ol4k3xa1g1a8rfgsF6X1jTGbGOP4WA1eWVxnnl7HYffkcWstW3mb5Pq4iHZAO6JAoQN7hXIJ0Fnmp
	Tseia3Ou4W9R+UNpWdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkexs-0000000DtdL-3kOw;
	Tue, 27 Jan 2026 09:02:24 +0000
Received: from mail.bizalt.pl ([141.94.250.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkexj-0000000Dtb7-3FVC
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jan 2026 09:02:23 +0000
Received: by mail.bizalt.pl (Postfix, from userid 1002)
	id 41FE0AAEAD; Tue, 27 Jan 2026 10:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizalt.pl; s=mail;
	t=1769504481; bh=OnCy7IALU8WU2qOP9bhBk/voftnZuOdBsIhZTZPgF2c=;
	h=Date:From:To:Subject:From;
	b=NppMnMAheZcyWdOyvifV4VWCkc8pr/xkj1frUba7vRLQ3fEbXMeLFScZovhfjZ5b4
	 KyfOiKIHbZ7dPIig9if4oKAIg4qfkt4Ej6uudOvNO5OcTe6vb3m5X7av45fNjr5BDX
	 dIyL/8FCUttEJw0xO660iYeoMqxtjmK/5WqXhe+f7hUoIRdcwGBxG679Kzxt5sL3FS
	 iIIr4Wbaav29habW3IDx7FhCd2vymzKWpXy6/azFbunbLlr5uT+WXBzUJlpfqi0xnr
	 hu0ilw/Yba170gjMgeRgHIyMy4R2xQi5q+KBnmhTWcg8V+ZOHpdEbgGjtWEAvdbBGT
	 Jpn49EkKMCprg==
Received: by mail.bizalt.pl for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2026 09:01:15 GMT
Message-ID: <20260127084500-0.1.sk.4hzq7.0.ckollxruoh@bizalt.pl>
Date: Tue, 27 Jan 2026 09:01:15 GMT
From: "Adam Wojciechowski" <adam.wojciechowski@bizalt.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.bizalt.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_010216_333213_19149D42 
X-CRM114-Status: UNSURE (   2.39  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpBZGFtIFdvamNpZWNob3dza2kKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
