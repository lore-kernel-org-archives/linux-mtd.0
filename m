Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12eavY-0006m8-00
	for mtd-list@infradead.org; Mon, 10 Apr 2000 10:56:16 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12eavV-0006m2-00
	for mtd@infradead.org; Mon, 10 Apr 2000 10:56:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: alex@cendio.se
Cc: mtd@infradead.org
Subject: get_mtd_device()
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 10 Apr 2000 10:58:52 +0100
Message-ID: <11432.955360732@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've been thinking about this over the weekend.

I think we can restore get_mtd_device(), but is _has_ to increase the MTD 
device's use count - hence it has to be coupled with a put_mtd_device().

Also, users like FTL cannot assume that the mtd_info struct will be present 
for a given MTD when ftl_open() is called - it may be in the process of 
being removed on another processor.

So in the _open() routine, they must attempt try_inc_mod_count(), which I'm 
going to wrap in another function mtd_inc_use_count() so that I can later 
deal with non-modular drivers which can go away (PCMCIA, anything else 
hotpluggable).

User modules _must_ be able to deal with mtd_inc_use_count() failing. If 
this happens, the mtd_info struct must be considered invalid, and not 
dereferenced at all.

So I reckon we want something like the following:

struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);

This _must_ be called with the mtd_table_mutex not held, i.e. not from an 
add/remove notify function. If <mtd> is NULL, it returns the MTD at minor 
<num>, and if <num> is -1, it scans the list for the MTD driver which has 
its struct mtd_info at location <mtd>.

On success, it returns a pointer to the struct mtd_info, on failure it 
returns NULL.

If both <mtd> and <num> are set, it checks that the MTD driver with minor 
<num> has its struct mtd_info at <mtd>, and returns NULL if they don't 
match.

The reason for having two parameters rather than just the number is as 
follows:

We need the number, because things like jffs, mtdblock and mtdchar when I 
split it from the core code will want to get an MTD driver directly from 
the minor number without using the notify functions to maintain a copy of 
the mtd_table (mtdblock currently does this and it's horrible).

We cannot make do with _just_ the number, because on SMP machines, a driver 
may have gone away and another been loaded in the same place - so user 
modules can't just use the number to get a handle on the same MTD later. 
They have to check that they've actually got the same one back.

We could actually provide just the number and force all the MTD user 
modules to do the check themselves, I suppose, but doing the check for them 
is safer.

---------
Couple it with 

int put_mtd_device(struct mtd_info *mtd);

I can't actually think of any possible reason for failure that the caller 
would be able to do anything about, so I may switch that to return void.

---------

If I don't hear any complaints, I'll implement this just as soon as I've 
provided some paperwork to get the boss off my back.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
