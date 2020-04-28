Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DEFC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01743206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oj//Ybze"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01743206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHsZYYNMdqgJhtj2vm7q2hKMG5GTEGLb9ZLf1j7IiXk=; b=oj//YbzenPCJzo
	OxaA96Y19Ek4DSBnMUDclPKmaZHaARzLa+h4ZtwQt1s2Xn7ECJmpcCG4CpUeMLbVw0YeSnq9CBTR5
	UXfzw2kYytb3WZODMntZA9fopbEisqzAJwvVaFfqf4XmWXY0N/waIhFO8oiOhvKdkZpoTgjyhS7rN
	OH406cyV1GGFqk0kqoQq8In3qTmfw1HKg15PuGY+C7Zg3631kBfp1UUmgRgQ2Xv3ZLy/edYxGKccP
	/9TQBl+R5t4sEU34UjyOZM1Z3fwvIzzlVxUZVN4cM3Q4arpPwQwhq6EMSxln9KMGJOjEFWgxedNiX
	kH4DEIpqkCEdHJy8Kzsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJhZ-000147-6p; Tue, 28 Apr 2020 06:26:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJhW-000132-8V
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:26:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 578882A0BA2;
 Tue, 28 Apr 2020 07:26:35 +0100 (BST)
Date: Tue, 28 Apr 2020 08:26:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 16/17] mtd: rawnand: cafe: Handle non-32bit aligned
 reads/writes
Message-ID: <20200428082632.2fc9d06f@collabora.com>
In-Reply-To: <20200427220459.32a26073@xps13>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-17-boris.brezillon@collabora.com>
 <20200427220459.32a26073@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_232638_430567_6B812D4A 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 22:04:59 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 27 Apr
> 2020 10:20:26 +0200:
> 
> > The spec says the write/read buffers should be filled/read 32bits at a
> > time. While most of the time the reads/writes are aligned on 4 bytes,
> > we should make the implementation more robust to non-usual NAND
> > operations.  
> 
> Well, if I didn't get confused by the previous changes, I think these
> are used by ->exec_op() and at boot time there are 2B (ID), 3B (I
> don't remember) and 5B (full ID) accesses that are performed. These are
> not 32-bit aligned.

Oh, you're right. Looks like read_byte() does single byte accesses
already, meaning that readb is allowed on the MMIO region. I'll just
drop this patch then.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
