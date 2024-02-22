Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16536C48BF8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pL7r62yy3OP+19nbwhSEPTy0kENbcOjJScam1zhZUQ=; b=Z7GgjyT+/ad/vF
	cGJRbmzOQrciYGSx0ECy1xDxHm1JOrgAQ5vr2SJX7bVY5yzgZ/XGbGaNu8U9IwBozZ+jZW/J1J5Qu
	Zm3p0G+G06qVmrgrPv0188bZ57OkAKkr1P1UZKn+H85nAkuFgnIuhG4UrKhyqGWkIFanQX7VzgSeB
	nhrt1qD00SySJUXmo1qizbYsp0SOAMBgEyjcxC86uFBIj7Lr7Cl+/in6hJweZiNs1GWNnr3KbtWm1
	uqD/elhqJkz+TJ+ye1XcDzC/FXM+pqwReH58oKvvtL8gf9bSD/iv5zA1CWgO9+yfOzL76Hev3Z9N9
	C2oFPIhbdtIiuXovQebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4eP-000000044st-2xCG;
	Thu, 22 Feb 2024 08:41:53 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4eH-000000044hC-0kdD
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 08:41:47 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id D8CC7A3BC0; Thu, 22 Feb 2024 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1708591296;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=AnR6Hu8Jd4kY2qMo14WQkdqWD1u92HvZRs/OyWpgrm4O/vSDwbvwNYjZ9lWIZdchk
	 51Hxv+KyJmTC8ClCN1xRCkMywf36HcRV+Fi0i1Ws7jQVlKIRNcLURNB5zQWvBp2csL
	 bbFjKhKC+MWE0nQwdGBrVSXYoTfSL3n9oUotZf9ViIZFstf8pqcG9bWORrEvkQxG/V
	 g1aSJV86zHnn0HD+2FHVNONTIYwL31YsMJnWZU/T6VWi4G4iD5Z7U1SDx66UM8U9qb
	 LTzhJ2fIXNwORUTgkzjPc/VUQBrQdMaB37cKsD9HMEdvHb+igqA604kccywIZ5BG3C
	 GfiRtssjGm+fQ==
Received: by mail.createsavvy.pl for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 08:40:41 GMT
Message-ID: <20240222074500-0.1.db.20qrg.0.05b7jr80gq@createsavvy.pl>
Date: Thu, 22 Feb 2024 08:40:41 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_004146_065953_98793F1A 
X-CRM114-Status: UNSURE (   1.15  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYWtzeW1pbGlhbiBDaXN6ZXdza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
