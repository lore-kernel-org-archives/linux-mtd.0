Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DlTjk-0006xe-Fg
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2005 11:35:29 -0400
Date: Thu, 23 Jun 2005 17:35:13 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050623153512.GA14072@zappa>
References: <20050601134130.GA19482@synertronixx3>
	<429F96C0.3080508@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429F96C0.3080508@mvista.com>
Cc: 
Subject: Re: Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Todd Poynor <tpoynor@mvista.com> [Thu, Jun 02, 2005 at 04:31:12PM -0700]:

> If that's a bad guess then sorry for the misdirection. ;)  Let us know 
> how you are calling the unlock function to take some of the guesswork 
> out of it.

Sorry for late Reply, I had to do other nasty stuff last weeks :/

cfi_intelext_unlockall() calls cfi_intelext_unlock(mtd, 0, mtd->size);

These I got out of your patches initially handling this issue.

cfi_intelext_unlock() calls cfi_varsize_frob() where the Oops happenes
then. I had to remove all while loops and inserted some printk and the
Oops does not happen. So the system runs as before when I unlock whole
Flash in the bootloader. For example it Oopses here in cfi_varsize_frob:

//      while (i < mtd->numeraseregions && ofs >=
//      regions[i].offset)
//             i++;

I will take a closer look tomorrow to start again fix this issue.

Regards, Konsti
