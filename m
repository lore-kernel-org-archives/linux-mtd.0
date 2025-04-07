Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98190C36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAGGDAkZHdN4e1ceeo0ox06H3NnfS0KhCB3nRn59diI=; b=V6krJfJXghLIrO
	2OrBP9rz/hDLLZiynuxDd8iYzSHmFO78XMujDJ7t3gLgWVL38nkI+DEUFIvHtP2yGTg6Xg2AC5peF
	wPbk6XVUVutGnY31qitfmN9/KYdOclNgHpEmtkXeSSmGyUaFqciQg/uoy15L5I5OBcq7SKgshPQgW
	qIhlzVv0bIxUUa+TSdauxJ9tlyT5XhlTNx9na5NaYdXh9nkarkRbc91bgd9K1oQv8qSi81dbsc4ia
	st85uS+kY/CsiN85LAljUMoAAOmgsy0+5Y1HjQXq9aYgXQVzCo7U39hlvcZ4bbXgX6cFEZBQXy9Ip
	+zLgEsmjzgKYpCA6IbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pam-00000001GNc-0oGj;
	Mon, 07 Apr 2025 16:45:00 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1om8-000000011Sl-1kgZ
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 15:52:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZWYcq50LWzm1Hbv;
	Mon,  7 Apr 2025 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1744041145; x=1746633146; bh=oxvfkoktGok/Tj8yNFuiqz5n
	ymZiR4HzCdd9/8a13b4=; b=p/bq2h/oyn3YhPR9Avw3KgPwhX7fOjlTQxDLy87i
	Lvq3NB3pAb5v+B6278kf7bhbB4ILbrrXofcauEJH6P3UEgqmRb0X2qaWM5LlvPpw
	vwE+LxRK14AUAZ3m972Np4MhpnwUkSPS58LjYKDnH+FtdQ0koYAHO8C4iiPahT2t
	1iN16w6/2z4OuNC9S8Mp98RGmKofKWhru8NAsqd624u7zBlc2vBoD1gFhwc2U7jS
	IMUrKokmfpmz2jjInkoVJoJ+/Ueeo2QIggCm8193H8NNENlwEzflzLNuIYDmA9MM
	QRDo4ZK3FouV9sx8iwWUnS9FnX/jnpCKh+cP26Sfd2kIVQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Xe_ks9NQxyHZ; Mon,  7 Apr 2025 15:52:25 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZWYcd104Jzm0djP;
	Mon,  7 Apr 2025 15:52:15 +0000 (UTC)
Message-ID: <e65d2884-a021-44e2-b3cc-9e9badad56e7@acm.org>
Date: Mon, 7 Apr 2025 08:52:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bio segment constraints
To: Christoph Hellwig <hch@infradead.org>, Keith Busch <kbusch@kernel.org>
Cc: Sean Anderson <seanga2@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <Z_N5nxLDOBb5NDAM@infradead.org> <Z_PXONJyuv4Z8ATr@kbusch-mbp>
 <Z_PaW2QS3OXTXHSO@infradead.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <Z_PaW2QS3OXTXHSO@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_085240_521592_3BB58F34 
X-CRM114-Status: GOOD (  13.36  )
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

On 4/7/25 6:59 AM, Christoph Hellwig wrote:
> On Mon, Apr 07, 2025 at 02:46:32PM +0100, Keith Busch wrote:
>> O_DIRECT only requires each user iovec be a multiple of the logical
>> block size with the address aligned to the dma_alignment. If the
>> dma_alignment is smaller than the logical block size, then this could
>> create bvec segments that are smaller. For nvme where we have 4-byte
>> dma alignment, you could have the first segment be the last 4 bytes of a
>> page, then the remaing 508 bytes from a different page in the next
>> segment.
> 
> Oh, right - with a smaller dma alignment this can actually happen.

Some time ago I added src/discontiguous-io.cpp to the blktests project
to trigger this scenario. This test program submits an SG_IO request
with multiple 4 byte segments. Maybe this test program should be
modified such that it uses O_DIRECT instead of SG_IO.

Bart.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
