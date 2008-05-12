Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JvVlu-0004Or-9d
	for linux-mtd@lists.infradead.org; Mon, 12 May 2008 11:00:47 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m4CB0jnO011045
	for <linux-mtd@lists.infradead.org>; Mon, 12 May 2008 07:00:45 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m4CB0j55080660
	for <linux-mtd@lists.infradead.org>; Mon, 12 May 2008 07:00:45 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m4CB0jT4024734
	for <linux-mtd@lists.infradead.org>; Mon, 12 May 2008 07:00:45 -0400
Date: Mon, 12 May 2008 05:58:17 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "marco.qu" <szarm@21cn.com>
Subject: Re: 64bit mtd subsystem and 4K page nand flash
Message-ID: <20080512055817.4e9af240@zod.rchland.ibm.com>
In-Reply-To: <20080512064314.398093807C@21cn.com>
References: <20080512064314.398093807C@21cn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 May 2008 14:11:27 +0800
"marco.qu" <szarm@21cn.com> wrote:

> 
> Is anybody can provide patches to convert the MTD subsystem to overcome the limit of
> using a 32bit variable to store size/offset?

You can if you work on it.  Some others are looking at it as well.

> Is anybody can provide patches for 4k+128 byte per page nand flash ? 

Patches for it are welcome.

josh
