Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A079ECD5BC7
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2026 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86EsteFWnlPyMTfoK6+gHcEB0JA/fLpAFcwNgtMymi0=; b=zOI2UgrgtKTE33
	Bsu+vtUZHBvbWkXWmD+kp1q2kyq2eUPwTz4Tk2/Ft+2fZf4QBULF9LpUB7hXHWQcXr+99d085Thbg
	fj2rtW89cNbmPfD3NYWepDybBcMLtWqcHkNq2ib55nJr0DCX3QiBFX/FdnqEdpXQZTA0haNJ0PGcB
	hM2OtR8YRWoOA6VS0cO5lSYxz2kgpYtc8+qQ31lk748flz3ChDSF6HtcI0kKl7ayT1aFKUrc/zkG2
	b4h0tF8aof/9N3+SS4NNOrU22OYH3t+NQTf1EH5Y2/nQapCqaeQy8sOaMDnkrFmVG+0V9/q17RAuu
	/AUJjNIfcrvnhAL7AwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROPM-0000000GNNo-1VIV;
	Mon, 25 May 2026 06:03:24 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROPI-0000000GNN5-1b1n;
	Mon, 25 May 2026 06:03:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B108368C4E; Mon, 25 May 2026 08:03:14 +0200 (CEST)
Date: Mon, 25 May 2026 08:03:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Jens Axboe <axboe@kernel.dk>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sung-woo Kim <iam@sung-woo.kim>, Josef Bacik <josef@toxicpanda.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>, Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Luke Wang <ziniu.wang_1@nxp.com>,
	Kees Cook <kees@kernel.org>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v1] block: switch numa_node to int in blk_mq_hw_ctx and
 init_request
Message-ID: <20260525060313.GA3586@lst.de>
References: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_230320_562751_91FDBE2F 
X-CRM114-Status: UNSURE (   9.76  )
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
