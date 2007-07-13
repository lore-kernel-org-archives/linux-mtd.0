Received: from e33.co.us.ibm.com ([32.97.110.151])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I9Kqa-0008IF-VM
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 09:06:14 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6DD6ArN004710
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2007 09:06:10 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l6DD6A0a211000
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2007 07:06:10 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6DD69fP030424
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2007 07:06:09 -0600
Subject: Re: UBI: Can we handle -EINTR differently in erase/write path???
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
References: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 13 Jul 2007 08:06:03 -0500
Message-Id: <1184331963.6456.3.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
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

On Fri, 2007-07-13 at 11:37 +0530, Vinit Agnihotri wrote:
> Hi heres few code snip from erase_worker(); from wl.c
> if (err != -EIO) {
>         /*
>          * If this is not %-EIO, we have no idea what to do. Scheduling
>          * this physical eraseblock for erasure again would cause
>          * errors again and again. Well, lets switch to RO mode.
>          */
>         ubi_ro_mode(ubi);
>         return err;
>     }
> 
> Suppose while erasure in progress & someone pressed "Ctrl+C" then UBI

This is the kernel...  the erase_worker function is called from a kernel
thread that doesn't allow signals.  How would it get a "Ctrl+C" event?

> This is my initial understanding about handling -EINTR, however I
> would like to know views of others. If all agrees I can post patch for
> same.

That is how you handle the EINTR errno in userspace.  I think you'd need
to show how -EINTR could show up in this code path in the kernel before
worrying about how to handle it.

josh
