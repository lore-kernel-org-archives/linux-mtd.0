Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Imiz-0002VN-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 09:18:45 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C6CE@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] Linux-2.4.18 block MTD dead-lock
Date: Mon, 2 Dec 2002 01:49:12 -0800 
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Below, David says, "wrong fix -- use the which is already in 2.4.19."

Could someone please summarize where I should look for that in the sense
that I want to get an isolated patch for it if possible?  I can't stably
bite off the full task of upgrading to 2.4.19, but would like to see the
diffs that were this fix.  Not even sure if they were in the MTD CVS or in
the main linux branch, else I guess I could look at a cvs diff.

Pointers appreciated, thx...

-Paul

-----Original Message-----
From: David Woodhouse <dwmw2@infradead.org>
To: Takeharu KATO <tkato@cs.fujitsu.co.jp>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Linux-2.4.18 block MTD dead-lock 
Date: Tue, 26 Nov 2002 13:21:33 +0000


tkato@cs.fujitsu.co.jp said:
> 3. The solution
> We changed the sequence of the function called ``get_sb_bdev''  in 
> fs/super.c.  We changed the function to make the block device  to be 
> mounted checked before opening the device.  Please refer the patch to 
> make out the changes in detail.

Wrong fix. Use the fix which is already in 2.4.19.

--
dwmw2
