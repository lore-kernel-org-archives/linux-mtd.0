Received: from e35.co.us.ibm.com ([32.97.110.153])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LB9bh-00081Z-Pw
	for linux-mtd@lists.infradead.org; Fri, 12 Dec 2008 15:07:10 +0000
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by e35.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mBCF5aX5012603
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2008 08:05:36 -0700
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mBCF70vx011728
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2008 08:07:03 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mBCF6uCr005447
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2008 08:06:56 -0700
Date: Fri, 12 Dec 2008 10:06:50 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "Manasa Gangaiah" <x0099189@ti.com>
Subject: Re: [PATCH] [MTD] [NAND] : Correcting file name in the header section.
Message-ID: <20081212100650.2c31279e@zod.rchland.ibm.com>
In-Reply-To: <37466.192.168.10.89.1229084724.squirrel@dbdmail.itg.ti.com>
References: <35044.192.168.10.89.1229077681.squirrel@dbdmail.itg.ti.com>
	<37466.192.168.10.89.1229084724.squirrel@dbdmail.itg.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 Dec 2008 17:55:24 +0530 (IST)
"Manasa Gangaiah" <x0099189@ti.com> wrote:

> This patch corrects the file name in the header section.
> 
> Signed-off-by: Manasa Gangaiah <manasa.gangaiah@ti.com>

NAK.

It would be better to remove them entirely.  That way they don't need
to be updated again if the file is renamed or moved.

josh
