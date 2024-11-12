Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C84D41D70
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=l9WxI6aIMAs/ea
	ebSqpzQ0//ovzTE2HLUsGnCxYGhuABmW/FuKILcSATnbRWxEq7KceC2WHGrFRc0oi+88UsZCSjvbe
	0FY16a7ITtmePfx1PxPvWz7Iwxie5lpZS7XIS56poLdEGf3K6Uy5pue5Jy532iBm4zmndjI9qAb8m
	+ARyFqMhMgHLsHJtEzAqTBpOeM/TWS7MMhN2fU9n6VxQpYWkmOmKv3fQZhysaqminuJcBcCfgasl9
	L1huYhTbIBQWRAR5+zbweX1J7eFh9tlwdnjd0LGrjhqcIHAAOzHUjQmjIgVTdfFG9fLSILQvcZDwE
	N1V36iz+YnK1LcQxcsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmff-00000002irJ-2rOL;
	Tue, 12 Nov 2024 08:54:47 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmfc-00000002iq9-1Jyt
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 08:54:45 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 28C6A24919; Tue, 12 Nov 2024 09:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1731401581;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=dQrefW4Qm+3NFTR3+75E2ZYoY+Ussl2hZkMXnMtxGB/nuHu3XCQp86L64b7xmwS5T
	 hsW9LXg9/R7T4bnla6UNycHrart9s7p26Ph/7dZiglAXrYgL8Th7F6hBthLm0FGyV4
	 j4zPoWe6lBQNDPvdT91XJ0kYuKeayQu81zxbyurqJX2Xj9sSSjmTHF0sa5ad90ugBs
	 z1ZMOorXGyfB1x2K6+WrgzJR2e6orJwkI+41rj8OGBwV88dKVie+eYQSoFp5dYtko2
	 5TeCMQ2dEvpS5ynZ4pKUAdG1NREUuWBXIAyQX4Qhnl2eXI3+Wj0waXuBDc3IDrWNoA
	 5KAVFpxA2AGjg==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2024 08:51:17 GMT
Message-ID: <20241112084500-0.1.ep.1pcec.0.clypbbenoa@completesolutions.pl>
Date: Tue, 12 Nov 2024 08:51:17 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_005444_518911_F469DA3F 
X-CRM114-Status: UNSURE (   2.05  )
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
