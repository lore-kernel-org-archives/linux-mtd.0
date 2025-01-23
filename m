Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B0C02182
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2025 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=L1afmCWbB1Cxag
	qv7mNEWRuhpS7+M1FyZbw4Foe1dhDKlcZjNUtrXJfKCBR/JYw+8itZuzupEOXHlMI07Mevn97Q+xD
	JTbUKwvG0+dD41rkyh8/dwdcR8KxvXvDwqZagU7A8JAYGxQBrkw1QF8+0GD6UIwjzjmKkzd5wZpUb
	totdMBXW+wNNCpU84wBtiuYEzpV/fv71Kg18+ipFB8mhn/Yl59Un7QqtmO+4UpOPvCu5EeIPCKBjQ
	nHgbjD4KLTNQ3voSpjRlppG87fQkcIiShUYaJpxsBxMLaZqHunXhNOsYJE6qMVNh4qpkwOobeanzo
	X6yXkvNxNHgSaP67+6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tat0b-0000000C2gT-1M4A;
	Thu, 23 Jan 2025 08:56:17 +0000
Received: from mail.quantumquest.pl ([217.182.69.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tat0W-0000000C2gB-36Iy
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jan 2025 08:56:15 +0000
Received: by mail.QuantumQuest.pl (Postfix, from userid 1002)
	id DF2BC4A626; Thu, 23 Jan 2025 09:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=QuantumQuest.pl;
	s=mail; t=1737622568;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=Ex+yoxMEDa+0wHMxncaLlDW/GgxQYGpryDh/ZUeVQAhfjvU9xcaLXCnZT2FFGeOAq
	 WdBNudJXNsjXXxX53g4EIbKYS0uqaZwxbVjg0GLhAaJL79mDm8u93Pw7yPDeRubnHZ
	 /X0XxL78q00fU8wnre7DTkd4JswMFWNR7ZmwzaZiVc81IVujZ8poQefs1qIIyXBdRr
	 Rscjlhi8VQR8xVYzox2yUEIZZY6v/MBixlfnABNVmBboKrhb7r0ws5ABlJPjN4+8GM
	 t2p7HCu//HP8j7YcwvER4RXL6PL1Mig2VyPG2+yBkhUt4ETIa9Fli0ELaaISjnsIr6
	 2Zr8rPxl3/xLw==
Received: by mail.QuantumQuest.pl for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2025 08:55:38 GMT
Message-ID: <20250123084500-0.1.du.278ot.0.1hacfmq0jl@QuantumQuest.pl>
Date: Thu, 23 Jan 2025 08:55:38 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@quantumquest.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_005614_280838_FAB0A1B2 
X-CRM114-Status: UNSURE (   1.65  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllClRhZGV1c3ogxYF1a29tc2tpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
