Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bi9R-0003ak-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 14:44:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEHIFFAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLMEHIFFAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Aug 2002 14:44:00 +0100
Message-ID: <22091.1028555040@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>  I have noticed that if i copy a "big" file(580K) it sometimes take up
> to 42 seconds before it's finished. Normally it takes about 3-4
> seconds. When this long copy happen, top reports that kupdate and the
> copy(cp) process is in D state, the rest is sleeping. The FS is a 45%
> usage. FS is about 63MB in size. Using the stable branch.

> Why does it block for so long time?

Dunno. What's it doing? Where are cp and kupdate sleeping? (SysRq-T).

>  Also, if I fill the FS up to 100% and later reboots, it kan take
> 10-15 minutes before init starts to run. The root fs mount takes about
> 20 seconds and the system just stops between the last message from the
> kernel and when init prints its version.

> It is just the first reboot after I fill the FS, once I have gotten
> past the first reboot and reboots again, things are back to normal. 

More logs and SysRq-T required. Sounds like it's erasing blocks and for 
some reason not allowing anything else to happen while it's doing it.

--
dwmw2
