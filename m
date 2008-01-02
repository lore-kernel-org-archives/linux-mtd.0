Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JA2zw-0006RV-Ux
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 12:47:05 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m02CfNT9022762
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jan 2008 07:41:23 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m02CfNd4113870
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jan 2008 07:41:23 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m02CfMI6013587
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jan 2008 07:41:23 -0500
Date: Wed, 2 Jan 2008 06:39:45 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: Does UBI support MLC nand flash?
Message-ID: <20080102063945.5355d112@zod.rchland.ibm.com>
In-Reply-To: <bae050c10801012219m71d7415du4379e5b5d5a54560@mail.gmail.com>
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
	<bae050c10801012219m71d7415du4379e5b5d5a54560@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Jan 2008 14:19:16 +0800
Nancy <nancydreaming@gmail.com> wrote:

> oh, forgot to metion UBI.
> UBI has two headers for each LED/PED, they are not write at same time.
> Is that against MLC nand's no ramdom write and  write only once
> permission?

Not to my knowledge.  The second header is written to the second page
in the block if subpage writes aren't supported by the underlying
chip.  That should still work fine for MLC.

josh
