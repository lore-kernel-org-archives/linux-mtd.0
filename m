Received: from web9907.mail.yahoo.com ([216.136.129.250])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7dkT-0000Nm-Dq
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 17:34:45 +0100
Message-ID: <20031009163345.54331.qmail@web9907.mail.yahoo.com>
Date: Thu, 9 Oct 2003 09:33:45 -0700 (PDT)
From: Slim <slimaffi@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1A6pZU-0003Bs-DJ@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The GRUB's 'e' key will allow to edit the configuration file
> in-memory.
> And the 'c' key will bring to the GRUB's shell prompt.

Didn't work for me.

> When you get to the grub shell you can do something like:
> 
> root (hd0)
> chainloader +1
> boot

Worked fine - thanks.  I'd like to incorporate the ctrl-key bypass
or better yet, have it recognize the bios setting to boot from C
instead.
 
So now I'm trying to mod the grub config on the doc, and I type:
   mount /dev/nftla /mnt/doc
and I get
   mount: /dev/nftla: unknown device
but 
   ls -l /dev/nftla
gives
   brw-r--r--   1  root     93,   0 Sep 23 10:22 /dev/nftla

I double checked the bios - it's correct.  Is the doc corrupted?
What's the reformat sequence?

Thanks,
John


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com
