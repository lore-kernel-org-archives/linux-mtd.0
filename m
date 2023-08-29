Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C5EC83F14
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWvJ0fCoJnxy9lDAoBrmlFc/zV+iMrt0eQnm77X+9hQ=; b=dTTwF0fgNG2jtk
	TuOKdevFIHcVcaVntXRUt6sxtabTYYemvqTZGd581PEj53gJPCztdOmc8J0QPCjjszOS+ffH3o40Z
	KapIxL6iwjL5eUZ699b8USf5bQ2htvReJ9YUC3hbvfyP/Mj0L2u0TTgL0MOLGpGu5Lg3drvB82DQw
	f/GrgKS+33fTT1ynybSDdvFNDBk6h28V3es58dm+GOrkHrpCNYaBFz1U0Y9OALHRw7BpMfKZ6h53D
	EKRVhYcYp+1YS2/Zk4KTFr4i/OB4n39zhYJGtheiT0F5Dr/cWgRwyQ3HHYtkCkOdNIXbbDqkBQali
	7CXHnK9fIAzAxwxl5mxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qatQt-00AyGx-0Y;
	Tue, 29 Aug 2023 07:46:39 +0000
Received: from out-252.mta1.migadu.com ([2001:41d0:203:375::fc])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qatQq-00AyFn-0t
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 07:46:37 +0000
Message-ID: <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1693295192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WP3nN15JcnIGn7wEIePFcf6LVOuPCzTP32Hu73YPviw=;
	b=ngCnTfY2JVdB7UbTvhBxaE99SXYf68v1UOzv1oD4Q4J5vfDrhRAI+RinhUow/HJ/SENsM3
	ljkpELTTwPgx4fdS1Wsi0U6qZJzH3KEWBSpgNNnZhZo9Ah7qcNPQhnBWxHwyd9Ba5JlzW/
	R7n89/DPeOOyD3xIKShExED+0gXsmv8=
Date: Tue, 29 Aug 2023 15:46:13 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 07/11] vfs: add nowait parameter for file_accessed()
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Stefan Roesch <shr@fb.com>,
 Clay Harris <bugs@claycon.org>, Dave Chinner <david@fromorbit.com>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-cachefs@redhat.com, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-mtd@lists.infradead.org, Wanpeng Li <wanpengli@tencent.com>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <ZOvA5DJDZN0FRymp@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_004636_457836_05F7359F 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/28/23 05:32, Matthew Wilcox wrote:
> On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
>> From: Hao Xu <howeyxu@tencent.com>
>>
>> Add a boolean parameter for file_accessed() to support nowait semantics.
>> Currently it is true only with io_uring as its initial caller.
> 
> So why do we need to do this as part of this series?  Apparently it
> hasn't caused any problems for filemap_read().
> 

We need this parameter to indicate if nowait semantics should be 
enforced in touch_atime(), There are locks and maybe IOs in it.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
