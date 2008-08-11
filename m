Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSWGq-0003uu-Rm
	for linux-mtd@lists.infradead.org; Mon, 11 Aug 2008 12:13:09 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m7BCD8kW027005
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2008 08:13:08 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m7BCD83j193652
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2008 08:13:08 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m7BCD7Qm017145
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2008 08:13:08 -0400
Date: Mon, 11 Aug 2008 08:13:05 -0400
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "Kyungmin Park" <kmpark@infradead.org>
Subject: Re: [U-Boot] U-Boot and UBI
Message-ID: <20080811081305.1a69c76f@zod.rchland.ibm.com>
In-Reply-To: <9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com>
References: <1218220016.2328.109.camel@localhost.localdomain>
	<20080808225824.138D3248BF@gemini.denx.de>
	<9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org, arnez@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 11 Aug 2008 14:18:53 +0900
"Kyungmin Park" <kmpark@infradead.org> wrote:

> Dear Josh,
> 
> First thank you for announcing UBI support on U-boot.
> 
> Actually the Samsung implemented the UBI support on U-boot already and
> has used it internally. The big difference is the code base. It's
> based on kernel UBI code. Yes it's not fit well to u-boot ecosystem so
> it created the ubi wrapper for u-boot.

Interesting.

> I saw your source codes and ubi commands. I think it supports minimal
> features of UBI, no volume create, remove, read/write and so on like
> these.

That is correct.  Simple scan and static volume read support are
present in the code base I pushed out.  That was all the project we
were doing really required in U-Boot at the time.


> u-boot $ help ubi
> ubi info [l[ayout]] - Display volume and ubi layout information
> ubi create[vol] volume [size] [type] - create volume name with size
> ubi write[vol] address volume size - Write volume from address with size
> ubi read[vol] address volume [size] - Read volume to address with size
> ubi remove[vol] volume - Remove volume
> [Legends]
>  volume: character name
>  size: KiB, MiB, GiB, and bytes
>  type: s[tatic] or d[ynamic] (default=dynamic)
> 
> I want to know what's the better way if there are two code bases.
> 
> Please give any options and comments

If your code base is more feature complete, it is certainly worth
looking at.  Particularly if it is for a newer version of U-Boot.

josh
