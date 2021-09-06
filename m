Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B03C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 09:17:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41F760C3E
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 09:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D41F760C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5vVwUuQ4SSMORPCNvFk5IPZEotFcN0SzPx+bKWvoOs=; b=nhW8bPsMtSTHZf
	o6VsPePiv9OIqcaYU2q4v8d8rubTMdm2xC/bHKSnpei4Fze2YqXWPhXp4s5O3CuE5seGxOlXexmn4
	pheQpKkpRpd6G1XDBMN++V1LJb1s4VgOiQLte9+cwV+9uy6KahiWf9zPvbuxEe4WKU2IoRwui4itl
	sAAB8zbBmJtJo5zzG8fr5H3nTnzMlG3wR46kCp3zMii+EOVboTWLgXnX4LzRnyd5bFfwsw8Z2psaY
	fuJo0xfpJTZin8bkyc29nBZoHPSRp0yntwnjca2qtOgpbFb+pkD2KjXggx5Sg8N/fsQ6eaRyblKgl
	tiTZWNsUB7iQjtL4pyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNAjn-000M4J-VR; Mon, 06 Sep 2021 09:16:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNAjm-000M47-HX
 for linux-mtd@bombadil.infradead.org; Mon, 06 Sep 2021 09:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rpadY60xuZTsVqlD3pQoJaPqU3ClhmKBmxShxdIOPTQ=; b=PnvC6D5zqQVeRqwnkETdG9hYJx
 ljEOQvj4My7mUimGhEI1YNMlvjzbX7PGi2zUTMQmJQhK8Hns7uGt6hka0lnZFNJAsdlAaOCNA5Avs
 NFC6y8Agrp38qMbZLj6Tj0rySktHbY+AwC3htRPHpABgcJqs8/5c+0iuqiIe27xLRytx/rNIEpsqO
 ZWyWai5d2hrS9T6DmndX82cTyQCL5YmLldG/mmJW3nN7w1ac5T6SGMgp6R2RTc+Co9HFSjtZPr4IR
 8uf10wSIJ9a97lAjpGFuZeLuQ8W7X29RmhQVxfn5mxKuCE4/SfrEts5ru+wBawqcL8BDuPky7nXVI
 GZT9W8mA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNAj6-006oEv-Fr; Mon, 06 Sep 2021 09:15:52 +0000
Date: Mon, 6 Sep 2021 10:15:40 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
 gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] s390/block/xpram: add error handling support for
 add_disk()
Message-ID: <YTXcPBph323n2WJ8@infradead.org>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-10-mcgrof@kernel.org>
 <YTIr1w/qPvgioUfL@osiris>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTIr1w/qPvgioUfL@osiris>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Fri, Sep 03, 2021 at 04:06:15PM +0200, Heiko Carstens wrote:
> Hmm, this is a more or less dead device driver, and I'm wondering if
> we shouldn't remove it instead. But anyway, your patch is not correct:

I'm all for removing it.  I think we need to do a little more spring
cleaning on unmaintained and likely to be unused block drivers.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
