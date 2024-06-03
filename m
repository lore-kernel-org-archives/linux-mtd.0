Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEC0C25B76
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvcoNG/5BUNc8d7jwAJLbpKWkHSwKnZkRlT160u4vDg=; b=w5xx3vW0Ru2+0U
	wGVRueMOJk2olaOJiq/vk+XwtinuIfLrGHP4gq6SkWp9qVzg0Ele0WL8IQThRAgBUIMlJSINqFj1k
	KNMr/o2K3IbACnJ61/IxoWJ6y6s5JAZltH+werHU956rZsClISBEgywRJNNgH7qcv1aS1uUyzDVZF
	fbtYcoTmPI8TiVAemABNnYXym0nPDgbYnQ59FmIlBJuGaMF7cEA3AX+rWDADj/HANHFhyiANae2IN
	GOIaNVwzbITZu/24rQLO6VzG/N5HwFVKXKXUQti+fpRGkZldfec9gy35qBGsYpgXuRT4/QUZcacDK
	nl7a53rEqPj3Rw/UJBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2aG-0000000FyT7-0Wag;
	Mon, 03 Jun 2024 07:58:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2aC-0000000FySN-2Ym9
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 07:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE2D8CE0B21;
	Mon,  3 Jun 2024 07:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E759C2BD10;
	Mon,  3 Jun 2024 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717401495;
	bh=eh6tut1IJgmad37uAxGyzCMHVLe7YQvVq1+Fct/0RUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0UGoFNTKfM8WWJ5xuVy5f5mH0kJxC4HXV+osILnRIzYpkbTi/deYLZ0bcl3QFf21k
	 GerH5YbdCMiI2JEMhAChUUYlveImSterN1d251iemDBrucckIRCfXypCI0aNwVXVip
	 G7UobbL64908L55b247TxUvSJ3c+iKkn4RutQqmk=
Date: Mon, 3 Jun 2024 09:58:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
	computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] Documentation: mtd: spinand: macronix: Add support for
 serial NAND flash
Message-ID: <2024060337-relatable-ozone-510e@gregkh>
References: <20240603073953.16399-1-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603073953.16399-1-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_005820_851570_A9390485 
X-CRM114-Status: GOOD (  10.47  )
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

On Mon, Jun 03, 2024 at 03:39:53PM +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> MX35UF{1,2,4}GE4AD and MX35UF{1,2}GE4AC have been merge into 
> Linux kernel mainline. 

Trailing whitespace :(

> Commit ID: "c374839f9b4475173e536d1eaddff45cb481dbdf".

See the kernel documentation for how to properly reference commits in
changelog messages.

> For SPI-NAND flash support on Linux kernel LTS v5.4.y,
> add SPI-NAND flash MX35UF{1,2,4}GE4AD and MX35UF{1,2}GE4AC in id tables.
> 
> Those five flashes have been validate on Xilinx zynq-picozed board and
> Linux kernel LTS v5.4.y.

What does 5.4.y have to do with the latest mainline tree?  Is this
tested on our latest tree?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
