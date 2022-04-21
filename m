Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B84C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RSTkzwcJBaWnGot6ZXbSvo3qcbzCMYZDj61dZ3eNtQ=; b=iBfsnqv9v4v8QB
	z4XKytBp9KdSHoq9xHvHeEVvpIu8bPxz/tlrMw7CbHHVugzxwcXIMkfxXus4mSKnpO05qhMrh+YfF
	ASOMMYvzfUW8SrJ7Bz5O6OtJiTyK9v+W6rc6iawDnuVHufqQPandYq9efgrfgODf1+gKsBHRUBgRR
	tj+Dwqjr1+swnMhWe58aGn3EpwE3KV4WJ1q6ydAtDuB/vtravNxKj9O+et1+UqgPqwHrlX+cj/Fqk
	14WqD0mrFuPBLfZNQirq0CQg5f6URmzCr6ENLRDbsaxH21R7KQAcY4ap1OoulLod1v7wnrYZSNprd
	WhxTum3N/1hu7w/r/H/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRMI-00C3Dn-5E; Thu, 21 Apr 2022 07:36:10 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRLy-00C2ws-Cu
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:35:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23C10FF803;
 Thu, 21 Apr 2022 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEoc1vhPIBbeW5Cg/z4Ftn7IujLen2JFeBGa5Tkzd3Y=;
 b=f9mdmnWbNtt2L6o0HWanTF+G/K8mMA79i2U2R5n1KSHhikjhteW9UVzQgM7THMECO2nQrf
 nQtDoSMWJdoopy0UbXJyhEhCLLCtVtO6RXV1K7shMTzt9E0w74IN8ULkLkYr+4zw/fmI2Y
 eNFDgU6qE/N0l3+/haaP1YifjTFroaxlE2ZCsTaY/aS86/eqLy0MJzptsYr2NJPu2Vh3qp
 4ByPClb5X92x2b5sTclMBXjnLmNVJtqp6fGpHe+q5MdgzKS1dSSTfJmqQDpPR8/8Lxpq8y
 xf6CIOXpVTGeqIxq6qUwZaJOsuwq9QiDLQlRM4EFequG6mN+pkdEHYlFaVxQvA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] mtd: mtdoops: Create a header structure for the
 saved mtdoops.
Date: Thu, 21 Apr 2022 09:35:47 +0200
Message-Id: <20220421073547.71951-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220415001321.252848-3-jmeurin@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0629fcef16d703d384f76cb2c2c3a119a9149a34'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003550_633743_BFA4D561 
X-CRM114-Status: UNSURE (   6.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2022-04-15 at 00:13:20 UTC, Jean-Marc Eurin wrote:
> Create a dump header to enable the addition of fields without having
> to modify the rest of the code.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
