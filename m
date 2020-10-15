Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB19C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:07:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4A52224A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qwb1IXa7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NMumZN8r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A4A52224A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2GnscYAnhecZlU4bP8XjUgYsBXo8Tatb0FHrep5koAs=; b=Qwb1IXa7Ra2Un7Qd84EW04m2I
	DTzXnwpQUVNELphr91zLdp0HGNNcqlm3xBoM3lDAWXyV/9fQuXEhe+vOPEslIRIDwBqGyF3Uxp6SU
	3r8PchiWvbpgzInToa3st0pz2MKEvVDAW+3KQjFGRLCqAzoye2iZ6bOgDokGxiit0G5OkKOAvcJd1
	CKtREv08lluVRTY7x5iglzn2OIo5UqbUWYpltCNG3l+88DGZd+gI19CFjajRduOPbCObVwVy5sEK2
	J28xJk/1cAOeJc5ByOJLPCGlzy6mr+lScRImuoibA41X7Xz0LtgjzYL29+9MqftlK35bpJGLHFhSo
	2Z1NC2nig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSzDr-0003Ss-6S; Thu, 15 Oct 2020 09:06:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSzDo-0003SE-PI; Thu, 15 Oct 2020 09:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eAQ03fyofDh/dAkzXvYvtJBzdj+En3zTAxHnDGWSjwc=; b=NMumZN8r+h7wwLDxvcuANP4oPP
 qHfBFzc05V59Oy5GabxGM3+WgA26CwOGTt4TG+mvQ3gMgqnuP6cS5W7DnbTZ6rtgVuLxuIUgNC80u
 LnIiUsoAdXrPOwj9YCy1hHe8T4zBc9WYAVDiEdWTGIBh8hwntQ1+X8CTtAydgI97lyRhRCff81YBA
 JY7iBTWLjhUVjMLn22KqLhBc7XD2em3PZtzIogKWFr3AMnS3N1wzVyj5il3gUeobIQnFRM4vAWRtN
 /fVaPN1YAiVqbZnbH6WnH+xd63HhCnpwxoBoQ8aPSor2vCkcY/rF2XtCEveacrQsCk4w1vExKrWHm
 QIcnEz2g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSzDn-0003kt-N1; Thu, 15 Oct 2020 09:06:51 +0000
Date: Thu, 15 Oct 2020 10:06:51 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2 01/16] mm: Add AOP_UPDATED_PAGE return value
Message-ID: <20201015090651.GB12879@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-2-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009143104.22673-2-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Don't we also need to handle the new return value in a few other places
like cachefiles_read_reissue swap_readpage?  Maybe those don't get
called on the currently converted instances, but just leaving them
without handling AOP_UPDATED_PAGE seems like a time bomb.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
