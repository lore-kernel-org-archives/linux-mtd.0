From: Russ.Dill@asu.edu (Russ Dill)
Date: 17 Mar 2003 13:31:56 -0700
Subject: New problem with DoC
In-Reply-To: <000201c2ecbf$47ab1be0$88a7580c@who5>
References: <000201c2ecbf$47ab1be0$88a7580c@who5>
Message-ID: <1047933115.1637.19.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> Thanks folks. That worked. Funny thing, these devices, the solutions
> suggested by the manufacturer didn't work. Which is what I expected. 

Generally, if you want to use their stuff, I think you have to use their
dos based tools

> Next question, how do I put that one, the /boot directory, and the
> menu.list as when I would use a normal Grub booting arrangement in to
> the DoC? Oh, and a custom kernel as well.

right now, grub only supports filesystems on top of NFTL. It'd be really
nice to get YAFFS and JFFS2 support into grub. As a workaround, you may
be able to use a small NFTL partition, with cramfs (patches exist to add
cramfs to grub) containing a menu.lst and kernel, and then mount the
rest as YAFFS/JFFS2. Or of course just use NFTL

> P.S. David is my message formatting acceptable?

generally, its best to reply to relevant paragraphs right below that
paragraph, and then delete stuff that isn't relevant.
