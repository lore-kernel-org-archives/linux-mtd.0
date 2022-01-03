Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3390C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkkAvvn2XSt8Q2pWC7FXBxfzTtMloRaIw2JEsHE/lPY=; b=d7SyT8AX3FLtZR
	z/rctfJcUd9WmqjwJYdOcRFesPpgpbBS2ic5jX39v3hv2j356hWhmbV8DKCPK/kpj6r8dbOcUzVaz
	JkDGvQsmOmkFRbSk9OoMCeC6QVF7g/Twzu851mUwJgcKSTGjRwWS9fNNonpWOEzlP8iYnny2NVxjT
	PB0/42lDXOJ3feak/CNbRXfMhV3aOAxSfvTrhANIJYBp2560dU5SSowGdBIfHXErXAQEVz23qlqlq
	HAYrtgII1eLdbTRNdPy5bJiqcRg8iBA58e09yRBU6uiUYoxWQ4ueEiVoPFrpX+iseXX/gaWp7AxjB
	slN6e7gkcS9Eo12D4SRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Jws-008hny-Bt; Mon, 03 Jan 2022 09:48:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Jwp-008hnH-JY
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 09:48:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 24C341F4107D;
 Mon,  3 Jan 2022 09:48:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641203289;
 bh=Y62ksDINKxhxf80D4QARZK4BQpkw1rSP2CDcW5izEi8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EbpPwbQOK6TUXCJqy/xmToY7KqMl7Wcin0DZQ5YaqLrlYjyRJRLnzwTODkTVZt/F5
 DIcqugGWpXaifc220MhCGquhK0wPkL9h7ottYt2apG2MHKgUS2U9Sb2t1qrWHTOh14
 M5DK+0kAvcjdAjHfN+dFdoR+svIiMVPJ+8DjE+FGspf2UJSgTx0FIzXXcvbOudfBAr
 onVSdPwE8EFdmQvQwAafiPajN4/dWVJxFWvZCeqaWFBRBzXcphIRIh6uV+uZ4ob/Dx
 WUBl8ZQ87MSaQ4MBP+i7cQW/gPcxnbtr2U6IkFJbtAByvMz77HW2HpcgcSduoXnIdZ
 dwm6Iu/9uBsHQ==
Date: Mon, 3 Jan 2022 10:48:05 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 04/17] mtd: spinand: Rename 'op_templates' to 'data_ops'
Message-ID: <20220103104805.17dd390d@collabora.com>
In-Reply-To: <20220101074250.14443-5-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-5-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_014811_879041_4A3BA3BC 
X-CRM114-Status: GOOD (  16.26  )
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

On Sat, 1 Jan 2022 13:12:37 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> Manufacturers have been deviating from the standard SPI operations for
> NAND flashes. There have been variations in non-page read/write
> instructions too. Additionally, operations, including non-page r/w ops,
> vary when flash is in different SPI mode, eg. Octal DTR.
> 
> To avoid live-patching in hot-paths or vendor-specific adjustment,
> it is better to have a set of operation templates and variants for
> non-page read/write operations as well. These would get initialized at
> the probe time or when flash changes modes. These would be called
> 'ctrl_ops'.
> 
> To make code better understandable, create two types of op templates
> which are: data_ops and ctrl_ops. Reason for having two different type
> of templates is the difference in their use cases i.e. it is possible
> to have ops of different protocol for read/write/update simulatneously
> in the data_ops, but all the ops in the ctrl_ops follow same protocol.
> 
> Rename op_templates to data_ops, and the ctrl_ops would be introduced
> in later commits.

Didn't read till the end, but I don't see any overlap between the
control and data operations in the first half of this series, so I'm
wondering if the split is actually necessary.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
