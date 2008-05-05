Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JsrHv-00036h-36
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 03:22:51 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m453Kgmd031014
	for <linux-mtd@lists.infradead.org>; Sun, 4 May 2008 23:20:42 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m453Kgg4263082
	for <linux-mtd@lists.infradead.org>; Sun, 4 May 2008 23:20:42 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m453KgqS018386
	for <linux-mtd@lists.infradead.org>; Sun, 4 May 2008 23:20:42 -0400
Date: Sun, 4 May 2008 22:19:51 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "marco.qu" <szlinux@21cn.com>
Subject: Re: nand flash's size overflow
Message-ID: <20080504221951.163ba145@zod.rchland.ibm.com>
In-Reply-To: <20080505005505.7D77038005@21cn.com>
References: <20080505005505.7D77038005@21cn.com>
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

On Mon, 5 May 2008 08:55:06 +0800
"marco.qu" <szlinux@21cn.com> wrote:

> Hi,all
>    is there an official way to solve this problem?

Provide patches to convert the MTD subsystem to overcome the limit of
using a 32bit variable to store size/offset in a sane manner.

This is getting asked often enough that it should be an FAQ.

josh
