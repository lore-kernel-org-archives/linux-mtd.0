Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5EDC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 13:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 191202255F
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 13:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 191202255F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sG8Puoo6KQOfmlYb39CcMXkQD5sBDJqm1wYhc1Ms0q0=; b=2D63YAxuMV0CuPwnii6RksF1Q
	3r1ChlqROZByHaoO7+QmoqIs5NvmIPzlqcbLdKorglrX8awyn9wkUXCfEBVSAwM0GxUxwT+4n82XH
	D/8a15DBUlRRtNbNvQxbBMrAupTJe3CFi48n//76Bfab6NDFXLDF6a28C4sI2UWjb9DNs04Ko54T1
	t0bZxfQ7F2NQzy9Kt3RQLGmZuw5/TA9N2salzi8glpPfUx0zu9heBrslch7Qw5QwAdvTj3WtPPCbj
	shZByHvh9ypsYQ+riEGnzgyUQg0OPRva5+RJ2yUjLIyCbRyf/BvSgpoUdmDsu7r38o1+VmW3jBp6I
	pp9lr4JWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4OVV-00010H-2F; Tue, 26 Jan 2021 13:35:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4OVT-000102-4f
 for linux-mtd@merlin.infradead.org; Tue, 26 Jan 2021 13:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DdoWWj+OR2RUxvl/HiHdpv/96nfXkBt9+md+RxXslZk=; b=O++offQw8+5Ln73s8HS/jxxWwQ
 yuxTRE78DSLc7W5O58jbaX5wGJ5WX9PDN23fEZikMN5F3NUqA+LLYowoBC30URq6wK/3bmj91kSk1
 4hD+Hb9ftW1vGvVQBbDHDdkcC5zMA6fUhcg5MSuC0Luh+VbnU4K6zEOpMtNs9Qml5bfdrVxCbkVIU
 Xu0EKCs5j8B+MF+PGyjwr60ZrVzw3Q8rhlbY/7uwr3OJa3FOMaDuu9quKMXI77sHjirwFQVFxR4Sf
 Nk/8iXSjTSGLd1ZL5bNDm7nIR0wGu+IGkK/AjTjj0HiW9gISItFOAjFvHd/A7P866Lh2QVCI7Bctw
 LW5szJCA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l4OTu-005eqI-E6; Tue, 26 Jan 2021 13:34:19 +0000
Date: Tue, 26 Jan 2021 13:34:06 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210126133406.GA1346375@infradead.org>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
 <20210125204249.GA1103662@infradead.org>
 <20210126131752.GB10966@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126131752.GB10966@quack2.suse.cz>
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 02:17:52PM +0100, Jan Kara wrote:
> Well, I don't think that "wait until unfrozen" is that strange e.g. for
> Q_SETQUOTA - it behaves like setxattr() or any other filesystem
> modification operation. And IMO it is desirable that filesystem freezing is
> transparent for operations like these. For stuff like Q_QUOTAON, I agree
> that returning EBUSY makes sense but then I'm not convinced it's really
> simpler or more useful behavior...

If we want it to behave like other syscalls we'll just need to throw in
a mnt_want_write/mnt_drop_write pair.  Than it behaves exactly like other
syscalls.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
