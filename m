Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jlxj-0002TZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 20:25:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D6BCCFD.4090707@goepel.com> 
References: <3D6BCCFD.4090707@goepel.com> 
To: Michael Palme <m.palme@goepel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: flash file system for production use 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Aug 2002 20:24:56 +0100
Message-ID: <27451.1030476296@redhat.com>
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

m.palme@goepel.com said:
>  i need a  mechanism for storing configuration files etc in the
> flashes. for this  purpose 20mb of the flashes are free. the
> performance/ stability thing  is very important for me. i cant wait 10
> secs fot mounting/ checking  etc. i' ve tried jffs2 from CVS and it
> seems to be "fast" on a nearly  empty flash partition, but i have no
> suggestion about what happens in  hard production use, when the flash
> will be written  over and over again  and the wear leveling takes
> place. the device is never shutdown'ed in a  clean way -- always hard
> power off... 

JFFS2 from CVS should be fine. It hasn't had as much hard testing as the
stable branch, but I have no particular reason to expect it to be broken on
NOR flash. I wouldn't ship it to a customer before doing some serious
retesting, but you can do that yourself and report anything you find -- I
don't expect anything to break.

There are other things we can do to improve performance and mount time even
more than we've already done in CVS. They're listed in the TODO file, and if
you're likely to actually implement them I'm happy to give more explicit
pointers -- or I can set our salesdroids on you if that would be useful :)

--
dwmw2
