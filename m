Received: from e34.co.us.ibm.com ([32.97.110.132])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CR96J-0004Kb-Me
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2004 07:58:30 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e34.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id iA8CwDJ8369470
	for <linux-mtd@lists.infradead.org>; Mon, 8 Nov 2004 07:58:13 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iA8CwDPs271466
	for <linux-mtd@lists.infradead.org>; Mon, 8 Nov 2004 05:58:13 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	iA8CwDFC000673
	for <linux-mtd@lists.infradead.org>; Mon, 8 Nov 2004 05:58:13 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: David Wuertele <dave-gnus@bfnet.com>
In-Reply-To: <m3wtwznbr4.fsf@bfnet.com>
References: <m33bzonifa.fsf@bfnet.com>  <m3wtwznbr4.fsf@bfnet.com>
Content-Type: text/plain
Message-Id: <1099918691.28947.1.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 08 Nov 2004 06:58:11 -0600
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: in situ MTD upgrade from userspace (kernel, CRAMFS, YAFFS)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-11-05 at 16:59, David Wuertele wrote:
> > 1.  There are many other processes running at the time of the upgrade.
> >     They are running out of CRAMFS.  As I overwrite the CRAMFS
> >     partition, is it possible that my write could get corrupted?
> >     Perhaps by crashing programs that inadvertently do weird syscalls?
> 
> Corollary question:
> 
>   As my own userspace process overwrites the CRAMFS block that
>   contains that process's program, how can I ensure that the process
>   doesn't get hosed until after it has a chance to reboot the system?

Copy it and all it's needed shared libraries (including libc) into a
tmpfs and start it from there.

If you don't do that, then cramfs gets mighty confused if it needs to
read a text page of your app and thing have changed underneath it.

josh
