Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05580D3B7F6
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBcPEDEjBOnplsncMo2fkg/rXbt7nTCnX1fN2Wqsf1k=; b=TMUFXn7gUaFM8j
	9j+ulKms0Q3o6KF7I9L0Oh14NesMzDdJd5hhm91p57v/nzWJQbA2cPhFc6GA/6ZcVhEWOH5zSNKR0
	hhKKjPqTsiF7nBjRfVP2VmEbpqUkCnkUHBLX9Jt4Wt8qhEHlqskqEE+lJbiFFVB3PH3x5X3Z2gO0Y
	9adwZaLRPn5qZaowrlB7iCGnHkjSQKeTkgI6PaUUF6VOmRNtr6mugE6g7W7Ag/0qV9/2uFmlPZ6vs
	o8pnr/ksWqciUH8QlbH64syx46uhJUc9iM5zKOJ5U0Vwno8+Hap1KFgu8fc867ySzNU0n1nIJe3dL
	r2Uw73uLpBpQO6dVo1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVA0-00000007Vyn-37kN;
	Mon, 25 Nov 2024 09:13:36 +0000
Received: from mail.sharpwise.pl ([5.249.155.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV9C-00000007VtT-44VD
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 09:12:48 +0000
Received: by mail.sharpwise.pl (Postfix, from userid 1002)
	id C6C3C83D42; Mon, 25 Nov 2024 10:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sharpwise.pl; s=mail;
	t=1732525939; bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=VDUm6vFiJWJCMwtpbnaLHzmEckDnsD/6HMQRc5kySOGUx3SHV3I/bJznIe+KJnizg
	 /lWd7gjkklYAK0pxuUp4S6Al7TXgim3SjqgubT057ZZIsBGcqfqibCV1oKA9AunIds
	 WdJnA/Kr8VrTBev16+/JX8hz7SyDVLggitsn7IcfNuyjlVAVIEYj0b4zREVRjpesaP
	 WI0PMM313i8c6jq/UZLIV3qxJ8KeuHI1ZX1sQXtXZu2C9/RTthlhJ6HZO6VM2DTd26
	 TWwJH+Gn90R/fMv2AqjMQ63HhyHGzPcI52oC5on4k3jvwyP6ngzgFho2sNop//RHAK
	 G3eUQ2RWiAhVQ==
Received: by mail.sharpwise.pl for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 09:10:51 GMT
Message-ID: <20241125084501-0.1.82.1al2u.0.uk2wr13ofa@sharpwise.pl>
Date: Mon, 25 Nov 2024 09:10:51 GMT
From: "Patryk Wysocki" <patryk.wysocki@sharpwise.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.sharpwise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011247_154204_09D21893 
X-CRM114-Status: UNSURE (   2.58  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8KCgpQb3pkcmF3aWFtClBhdHJ5
ayBXeXNvY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
