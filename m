Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9DDC7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:Cc:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dw884c9DVAHIOZFBJd3dY+5Y4eXQwx5UC1QaIo8Se+I=; b=G8aErGXjsfB4vh
	JysK21aCCteyGoeG8nsvx9EEu6VKKa5FSo/Ish2c3soA4PcRs0eIhzG3RQIpbXdfpzd2c7lXrOAPU
	XtV/0ZtjuPvJI2gkeD6QYK94obZVnIcH4H5eBHJCUC20qRhpLXCYDARohoS30PKrHEzOPlDgtRYXP
	7vNZZCEg//WVPju3LjvNsawkVCFPzgsZQv0PDHsIWfudEh8l9UdexQYpycm0LQbEZD5yatdFuK45q
	ckVdsnjfauMMrneWhhvvWc6wcA2jMNIfk1+Ri8uybOr6MyYEKT10g0XKnIRsZbu24+KyMGZ99tEXM
	ItPmDfYWXCiNVCYyGgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gcZ-0040Di-0E;
	Mon, 12 Jun 2023 12:26:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gcW-0040C6-2H
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 12:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686572762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tTMhvLLlxLduku60kqh9t4hhU2KGCMkQO9qTJKYmDvE=;
	b=ARn19Ew7MHAz00cixyaW4hDwMQybY3p327MHWFaEzdfwYTy/l1y8YZcpoNMQ0GPThHO1jP
	efHqIKzYNnuQe8TlXxmNA/apY46rEP3b6lY08OTQ5XNmh8Tp6qpyC4uQvxWtDT0v4lnLam
	ALuoh/NN09jjerCZjT4vAPty2gnblT8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-AynBElupPJ6WiOJw2BAedg-1; Mon, 12 Jun 2023 08:25:57 -0400
X-MC-Unique: AynBElupPJ6WiOJw2BAedg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDEEC3C11C67;
	Mon, 12 Jun 2023 12:25:55 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 023222026833;
	Mon, 12 Jun 2023 12:25:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202306121557.2d17019b-oliver.sang@intel.com>
References: <202306121557.2d17019b-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: dhowells@redhat.com, oe-lkp@lists.linux.dev, lkp@intel.com,
    Linux Memory Management List <linux-mm@kvack.org>,
    Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
    Christian Brauner <brauner@kernel.org>,
    Al Viro <viro@zeniv.linux.org.uk>,
    David Hildenbrand <david@redhat.com>,
    John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
    linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
    linux-btrfs@vger.kernel.org, ecryptfs@vger.kernel.org,
    linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
    cluster-devel@redhat.com, linux-um@lists.infradead.org,
    linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
    linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
    ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
    linux-karma-devel@lists.sourceforge.net,
    reiserfs-devel@vger.kernel.org, ying.huang@intel.com,
    feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linux-next:master] [splice] 2cb1e08985: stress-ng.sendfile.ops_per_sec 11.6% improvement
MIME-Version: 1.0
Content-ID: <105868.1686572748.1@warthog.procyon.org.uk>
Date: Mon, 12 Jun 2023 13:25:48 +0100
Message-ID: <105869.1686572748@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_052604_822073_C5AA9C23 
X-CRM114-Status: GOOD (  15.17  )
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

kernel test robot <oliver.sang@intel.com> wrote:

> kernel test robot noticed a 11.6% improvement of stress-ng.sendfile.ops_per_sec on:

If it's sending to a socket, this is entirely feasible.  The
splice_to_socket() function now sends multiple pages in one go to the network
protocol's sendmsg() method to process instead of using sendpage to send one
page at a time.

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
