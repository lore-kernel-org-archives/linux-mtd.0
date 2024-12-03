Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48732E6C617
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=nj/03v2NHdf/4C
	2YQo7zgZ8FGnk6vEi4210ZHiTxFVblOeM+ZlA6dyQoSPBnAUcQtAzExZ90FNZKQDX4rPa5UdC9LSK
	M5dPmvs2E1tQ3NREQ65yOow0c1tiJDry2GTPfceKHSdgDXVCZ7a6yIp/r/WkLiQYGVuvbI/qdW1+c
	2UIkpSdRZpvWAcoE+wGQOpbifzJj3sjLfzmWTOOFoCEG0Q7b5IfyhtMxhANkvO5z/CDylZQb9+JuB
	FtAyyDTGapgkwCxtJFIr9EympjqVyTYFEgUbIhKEJP1ybk4mza3sP06EeaLR3Vl1hieBOOH0AXuG5
	a9+e+tbp3WEJ8wZB+nKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOU0-00000008jN0-3foK;
	Tue, 03 Dec 2024 08:42:12 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOTx-00000008jM8-2MNd
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 08:42:11 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 8879C24406; Tue,  3 Dec 2024 09:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1733215325;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=TipXaODXjlYRiM7qNfrNXc8x7PZ4m2+CeTpBDu9yzJSd7ss1/5Gl+6qzYfMeaSpC9
	 JCvPcLuCoUqtJE4z6QuAjXtnbCFGHZeKc77HaUvg8yZxtpLZw7g/tT3TN3tVnVyQ8j
	 Wf7nefqJOZ5XMC6oFZ4WXDhS1U9E6bQWmMoE8v6A223SUPZ7HbmfXI2vvKPqruZtI5
	 9wzo8hlAqYM9mmUrdWE/L963r9yP76BOhMOBarexfwtqAZ8gqy5aIT0MZX4qTF8kv2
	 d0ZazTU6KFl+URf5bwlYHUmfiMfRBrFM4frF4n7OVYDvOpXkznEvGgjwideMjJf0dA
	 VmwYOIky6Eztg==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Tue,  3 Dec 2024 08:40:56 GMT
Message-ID: <20241203084500-0.1.f4.1vwai.0.23qoqdodos@completesolutions.pl>
Date: Tue,  3 Dec 2024 08:40:56 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_004210_285584_8B40E7B0 
X-CRM114-Status: UNSURE (   2.22  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
