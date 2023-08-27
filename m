Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53474C83F01
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Aug 2023 21:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdLghLAPWJzSfwyNZslJGTEeLxZsg4J4HzCAca4nUsE=; b=Fr5ccFSgL6eu/k
	O3VTGPBl3Pdg5ddUGWySadhqbL4uXzqTlVWdfE8qgrxxLdNJQLzQSedn9JZ/ZX7d6k70CPojO+Ann
	bFNtwCqc0VPcbSMNrrIx0gxFELE1iTdRlCcAj02uKFHCTz0bvafctW9QGeKkglEioliRa+Td8/Y01
	wlMUWB1yiLyZN0MgOJbnyT1hEDlbQ7d6qgnkQpDR8j0XO3hzQgkKcljULMAa6JWWDCLSPPqfk6UkY
	+Di87H9ReKkti8aAoHpX1oxS9jVRgwKdOAfsHqgvYMtgAzYWawNEIT9e4V/ATADQ/q7cNMKRK6K3Y
	+glqJaJ3+NNq2XediA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaNN8-008Tpf-2a;
	Sun, 27 Aug 2023 21:32:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaNN6-008TpY-1J
	for linux-mtd@bombadil.infradead.org;
	Sun, 27 Aug 2023 21:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/6hpsLsV03ieW4vELbhOk4pxiCIUuyn6Bpw1V8QuWjA=; b=vTYL9F6nmyMC1z4vgUQ57UMuze
	c8bgt9vFOKWzPspRsbeTFLgLHz/hKRnLtd9UWTyKshqJF7eN4C3F+EMjcufK9pmtU6JnMc8dQv1Vt
	5InC4HIkUznFa/hnNRczUUX7xHbrfZD4svYR9Kg0wslB46dSko8l2iAdkLRH/H5iWuiyt8iN5XazN
	QityxWl2yb3p6DSle3T84m2jiGMPG15FtuhdmZtjHlUbcKD8n1NBcGDOexBbj8JBeLDTA1BEKmInL
	888FPoRnfrZ00U1GiFcxw/e4IZGsn0ijlmA9d45AXC5VifFlQ9hZQtQ/XxGEdq6/5qdn+lFw1Ut3Y
	+YmC6jBQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qaNMq-00DvXM-Sy; Sun, 27 Aug 2023 21:32:21 +0000
Date: Sun, 27 Aug 2023 22:32:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 07/11] vfs: add nowait parameter for file_accessed()
Message-ID: <ZOvA5DJDZN0FRymp@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-8-hao.xu@linux.dev>
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

On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Add a boolean parameter for file_accessed() to support nowait semantics.
> Currently it is true only with io_uring as its initial caller.

So why do we need to do this as part of this series?  Apparently it
hasn't caused any problems for filemap_read().

> +++ b/mm/filemap.c
> @@ -2723,7 +2723,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  		folio_batch_init(&fbatch);
>  	} while (iov_iter_count(iter) && iocb->ki_pos < isize && !error);
>  
> -	file_accessed(filp);
> +	file_accessed(filp, false);
>  
>  	return already_read ? already_read : error;
>  }
> @@ -2809,7 +2809,7 @@ generic_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
>  		retval = kiocb_write_and_wait(iocb, count);
>  		if (retval < 0)
>  			return retval;
> -		file_accessed(file);
> +		file_accessed(file, false);
>  
>  		retval = mapping->a_ops->direct_IO(iocb, iter);
>  		if (retval >= 0) {
> @@ -2978,7 +2978,7 @@ ssize_t filemap_splice_read(struct file *in, loff_t *ppos,
>  
>  out:
>  	folio_batch_release(&fbatch);
> -	file_accessed(in);
> +	file_accessed(in, false);
>  
>  	return total_spliced ? total_spliced : error;
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
