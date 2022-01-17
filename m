Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE8DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfbZvTHE5Aug7Vt3YvsZBxKPOcBV4QOIZoTTG4YCs9Y=; b=rD1kc4emuzgPmX
	anoR7sg6qMb6LphQkV7Xu0dIbaiNEzPInGzMOYn8C6WNFkIofAhwkjNkZWWSRNQ4ComR0z30YrEah
	BLz7vjwdmSWqzFEv8pgkM1Th9IE1SzaH/kXlkGhwOukKLDlsvFIJhJX+gFfawi1G4p5z60xsEEVyg
	PNdIgpYgF3VCQfBi9lxH4JjZPiWFq+50O2EAUdQs59cSoOKKY+ni3Cbtagghs1XiLItirv2dbht0o
	+jGT4dx4sB43WNC71cQFe9tyVlKxAy+NM1VkBqoBvyIZLni4zTHj5uQDz/EZHANoZCKiR/TKqz46E
	ii9sAoTFWk2+QT9A5seQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9MgA-00DxG0-7E; Mon, 17 Jan 2022 07:43:50 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Mg6-00DxEB-Gu
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 07:43:48 +0000
Received: from skn-laptop.hadsten (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id 1ABB1E1D2B;
 Mon, 17 Jan 2022 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1642405421; bh=BkxqqyOywP8z7KZIMPcWrvw63V4L9m98zNSVef5yzcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=WwYATuhJElseYGS0r8SZvEhu03GwuQy7g36X87wL53dKMVjnSgq5kOER6nPk6yYOM
 I6SIxCF7yaRBRikAfFD9bMJB53u00p4X+kfnGXuQKzqJvPYC7RqWywTKD3S89utipG
 aZXnAdV+cWj89kMn3efiiQ9hB25tXtAlJyv0iyolcOHFOa+gUAfC7B1zXvU09uPIWz
 0nmVjWBrFOQpUVWzg2NXpGFZMqDvk48yT8e6kKVEro2U/B8wk6naB2y+VlSdqDSnTx
 v1/auBzJJms0zVGdgvuPIwZIUOE9bAyuCYvOE/sQ33ywjMj8pe4dk1BRtiR0uB3Hnc
 UY85hJdHdVBxQ==
Date: Mon, 17 Jan 2022 08:43:39 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: protect access to rawnand devices while in
 suspend
Message-ID: <20220117074339.ctuaxnetz47j45z4@skn-laptop.hadsten>
References: <20211220130015.3630975-1-sean@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220130015.3630975-1-sean@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_234346_759302_4280330C 
X-CRM114-Status: UNSURE (   9.85  )
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

On Mon, Dec 20, 2021 at 02:00:15PM +0100, Sean Nyekjaer wrote:
> Prevent rawnend access while in a suspended state.
> 
> Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
> rawnand layer to return errors rather than waiting in a blocking wait.
> 
> Tested on a iMX6ULL.
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---

Hi Boris and Miquel,

I know the kernel test robot is complaining a bit about uninitialized
values.
But is this OK? If I fix the unitialized values?

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
