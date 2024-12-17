Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BFAE7716A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=S9X55x4+As/o/m
	B+otP8DJKiFRoa0k9uAKYG9v18BxqL/OKEQiKGl0cTE/cjo/Vc7YL/eykiaEci7cpixL8BTpuDPWu
	wzpflGBczRDrtKXWmJ6YZLCE1szByus2M803M/ngoqaFVt9g3o8axL0Oh6tQYHKWBIjcCrmyy1vlp
	i4c9A6t46DhmhSV8Ni0RWToZWRAkWI1kF0AL9ybJSP/Wa7dNwCCIQIp6i/zCS24C3T+7gTRmkOhFB
	eMeGsbTKRQVRHXqlbZEPL55g0O595G0zHdlCU77qeIbOJZQUDC8pc6VTVckTc9RVPAIVlgZIdna9T
	yPs1IhaAgZSU60xmeYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT8l-0000000Cjfl-1jaC;
	Tue, 17 Dec 2024 08:41:15 +0000
Received: from mail.quantumquest.pl ([217.182.69.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT8i-0000000Cjez-0YCY
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 08:41:14 +0000
Received: by mail.QuantumQuest.pl (Postfix, from userid 1002)
	id 1B08F47791; Tue, 17 Dec 2024 09:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=QuantumQuest.pl;
	s=mail; t=1734424867;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=PocQwWC5kBiAA0XHKl5pPCAdq/DWdwqiD5MFcIUzxS4aNQG60bE8U8zkrxcB9IPs9
	 VtytC/QdKcJqiFwlrjr2IMC1W6L0OPQA7VqB6ppBBWFMUgS8HIJ6OpV0Wl8JGYv2/o
	 EP0LrMwhwDIg9dx9sZNq4NylqmC6p6AkJrdIDj6LHx5FrUpyMbyGMWUL3nQcAhxCBr
	 K5MmgOOAXepFeUn232x3dDw64kNTOB3dH/l1POZGfUUhyc5qOsFJ4dVAGYgfvtnc2h
	 UN3LRo7WXm9H1pqUEY0ZVtbLic6swejrUYxMRc4r/smazxgiXEgNRoV+pFM3TWTDcU
	 6Vdp9a/FCVu2w==
Received: by mail.QuantumQuest.pl for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 08:40:51 GMT
Message-ID: <20241217084500-0.1.d7.20igf.0.fg0erufa61@QuantumQuest.pl>
Date: Tue, 17 Dec 2024 08:40:51 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@quantumquest.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004112_856766_6391B4E5 
X-CRM114-Status: UNSURE (   1.61  )
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
