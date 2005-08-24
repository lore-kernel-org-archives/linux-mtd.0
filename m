Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7iwS-00014O-35
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 20:16:41 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Russ Dill <russ.dill@gmail.com>
In-Reply-To: <f9d2a5e1050823154740e66385@mail.gmail.com>
References: <f9d2a5e1050823154740e66385@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 24 Aug 2005 00:17:20 +0000
Message-Id: <1124842640.20120.10.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: RedBoot FIS Directory parsing bails out early
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-08-23 at 15:47 -0700, Russ Dill wrote:
> Deleted partitions cause the FIS directory parsing to bail out early,
> this is because in redboot, deleting a partition causes the first byte
> in the entry to be set to 0xff. The kernel is currently looking for
> 0xff as an end of table marker.
> 
> This means that if you create two partitions, ie, test1 and test2, and
> then delete test1, the kernel will no longer detect test1.
> 
> redboot.c should instead scan every entry in the FIS table, and throw
> out any entries that begin with 0xff, ie, change the break to a
> continue. The checksum check should also be changed  from a break to a
> continue (even though checksums in fis tables were never implemented
> anyway).
> 
> pseudo patch:
> 
>  struct fis_list *new_fl, **prev
>  
>  if (buf[i].name[0] == 0xff)
> -       break;
> +       continue;
>  if (!redboot_checksum(&buf[i]))
> -       break;
> +       continue;
> 

Care to provide a real patch ?

tglx
