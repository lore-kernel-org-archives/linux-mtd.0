Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3295C43457
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 14:07:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3309C20704
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 14:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUqcaAjb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B6ppARpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3309C20704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u44DFpzt1FFIF4HiAWmtHTjiexKRWMqN0aDK20Nqw1Q=; b=tUqcaAjb2M44ms1JBFsSBrVuZ
	ecQHIjTWSLEkH7twKEiErdQx+lULvWDXuxlNZnvqCvLFy7rBgqHGl/RXwO5hyhhPz/Qqw9RGqhO1T
	gbvtCOolx4tyq73wU6whlIeltSTBzXxIjakBxOz20d+sDBYP/AVnlXhHd75HsYr/0rVN4ryzmHTJB
	dOEh64lw6v9XDGUdufvbrbuacnGdpkV0vJ8qrgO0G6G3jvYs3ryp5T0oapB+SjeoS0FwE29zok+ak
	tdxIdete46NZTcrsdH/cm3knuKjL/Vh9QhP/2+WYgo2yl6yi9LcLcI8RBFUQEQHxFZL/1LkAfNQlV
	P2dHy+DGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT3tr-0001PI-HD; Thu, 15 Oct 2020 14:06:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT3to-0001OX-MO; Thu, 15 Oct 2020 14:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Y78eONskpyGlU4hGu9lHbAxkXtJjFWlaahMgdLwji6I=; b=B6ppARpmYwCguqRCWuD1mChED9
 0Ynel8CZX3dIMkGMZoYbet00r1q6dl7TVFrN72W9mH/FpfN+ODef1K3iXilMVq8tYAYphLYb8/VGu
 PHTN8gt5nuuzPNOguHRpKav6gSgQOjR75Bkg6sv1yH6A+JtGCEHdNIvQvXxScJftqXb1Cl5dJqpXI
 XWsI4YqRvnmF6acOelUUYNHxNmT1H3xye3fajByyN9b890hcmz5rUOLamoA+B8N262oSAy21FGroD
 Gd7AJKsJRntHU6MURMWkyIrel4h2vcq0Zx/DOdYSjq3RJ8SZOnH+Pwj1hcWEpBYRjYMOMGMJ2pwi9
 u502InRA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kT3tn-0004lO-7n; Thu, 15 Oct 2020 14:06:31 +0000
Date: Thu, 15 Oct 2020 15:06:31 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 01/16] mm: Add AOP_UPDATED_PAGE return value
Message-ID: <20201015140631.GZ20115@casper.infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-2-willy@infradead.org>
 <20201015090651.GB12879@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015090651.GB12879@infradead.org>
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

On Thu, Oct 15, 2020 at 10:06:51AM +0100, Christoph Hellwig wrote:
> Don't we also need to handle the new return value in a few other places
> like cachefiles_read_reissue swap_readpage?  Maybe those don't get
> called on the currently converted instances, but just leaving them
> without handling AOP_UPDATED_PAGE seems like a time bomb.

Er, right.  And nobh_truncate_page(), and read_page().  And then I
noticed the bug in cachefiles_read_reissue().  Sigh.

Updated patch series coming soon.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
