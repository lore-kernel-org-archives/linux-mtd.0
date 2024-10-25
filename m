Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F34D11718
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=CFHqkAVDmwfR+m
	CWm87+6mE8h0kY2/VJb5iaZcHHTQyJqZbW5ewIOLrBz0yUV8O1k1+9CoHlx6w5T4hiUCIg1bdt9aT
	GSpIyOJ2UBcVeL1VUxFp+847lqi31MH03xaMV37w0yJHyH61nUndszPVMnBx+jIBcZv9/YM3qJ2dW
	2g53kGJgSlMbLHeidUsO7R2uwwhm4xqurDkOHrcwKVoirlo/xxmhzf6q0PIyW/baPjTV5nf3x9zPM
	xqvuvNKe5o6diwxpH5jWrBiMiwpfkvTkSqruMhgPjHURjG69a5x5jKLyvpuQcGKLO5hNbghe0dMRD
	dhUzVNi0gIBXj8s/PJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FXm-00000002xb6-3uDN;
	Fri, 25 Oct 2024 08:19:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FVI-00000002xQB-08xD
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Oct 2024 08:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=; b=dCz45XIFEQCkHdqvKjy2Wa17Ft
	v6Ds7mrBlL0JG8YQWw82IKNZkqqQQ4aFWp6IW56tnEqffv3NiPyxkMkCB8RffkVHp072AisCS6a8E
	xSv0SYOn5uHEiJfc+jjDRzog3mGxwyhks0pRaEHmr0tQNIGGk6mxS2pSed93GIbUBQ+qDQasw9joQ
	90BoctuLEIo9ukq1MajmHK/SFC2WXXplzvg/PrzKDuBG2XgqBIXr6dwRzey1emztOIf+8TxA3Bid3
	jpJlbiTR/mrf7UrFqyDVnp28XnrZ881+VppwPsIQIAa7RMmzm6pRX0zhye82THRVIps1gEIO+/+Kw
	3KtWm4RA==;
Received: from mail.completesolutions.pl ([51.91.254.67])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FVB-00000008rQQ-10oH
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 08:17:02 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 80AA526AE5; Fri, 25 Oct 2024 10:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1729844212;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=hP9+VYXrwrO5/mBBRMBb5eecKnSDaV7NgIFE7/t81FHLr/1yCtNUTv/cBqZEGyLZP
	 TuXAEzH9fVGN7oDOI+QdRLRzng0Z/hge2Jdj/QmAWRRN+oeH2VMYF2aeq/0udQ6GHA
	 4STZWsf2ueXIaXt/NflRyhSEx/5tE7IxpecTb7cj8R4omIpYdoIbfJo7tjrv+wFaio
	 T8GwlKuly0PpMkpjgfNMHZfSLXBTHKEYZXjeKur9x3KyHcQv+F3Q3mYZV6OhDOd4+2
	 HboMW2hELR021Sthw0s46GZ/y1nlT/cU7EDipXPCgfOOhTclxgwGo0pASUchxWbLFR
	 KxBuIK9Jn2yNQ==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2024 08:15:30 GMT
Message-ID: <20241025084500-0.1.ef.1kxyq.0.5qdla3otk5@completesolutions.pl>
Date: Fri, 25 Oct 2024 08:15:30 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091700_203770_EE04923A 
X-CRM114-Status: UNSURE (   0.75  )
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
