From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Fri, 14 Feb 2003 00:08:56 +0100
Subject: cfi_cmdset_0002.c do_write_oneword(...) problem
In-Reply-To: <oprkjy0lzg7bj7b7@cbnsitar.cbnco.com>
References: <NGBBKMBLKLBCENJIBEJJMEOCCEAA.todd.fischer@cadenux.com> <oprkjy0lzg7bj7b7@cbnsitar.cbnco.com>
Message-ID: <20030213230856.GA6588@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 13 February 2003 16:51:47 -0500, Vladimir Doukhanine wrote:
> 
> The hack like yours didn???t make MTD write work.
> 
> But it works if I have
> Something like:
> 
> printk(KERN_DEBUG);
> 
> or
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(0);
> 
> in the very beginning of the subroutine.

Ugly. My bet is that you have a memory corruption somewhere, but don't
notice it. This does not have to be inside cfi_cmdset_0002.c

J?rn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
