Received: from web21504.mail.yahoo.com ([66.163.169.15])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IiiZ-0003PP-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 05:29:47 +0100
Message-ID: <20020614042945.11949.qmail@web21504.mail.yahoo.com>
Date: Thu, 13 Jun 2002 21:29:45 -0700 (PDT)
From: Studying MTD <studying_mtd@yahoo.com>
Subject: Re: why MTD model ? 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <30266.1024004092@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> studying_mtd@yahoo.com said:
> > Can somehow we treat(emulate) memory device as a
> block device and
> > treat memory device like a hard disk ?
> 
> Not directly, no. There are drivers which do so --
> and present a flash 
> device as a block device using translation layers of
> various complexity, 

you mean, it is possible.


> but that is not a true representation of the
> capabilities of the underlying 
> device.
> 

what you mean by "true representation of the
capabilities" ?

what i will miss, if i use memory flash device as
block device and merge memory flash device with other
block devices ?

what is the advantage of MTD model with respect to
block devices , why we use MTD ?

thanks for your help.

> --
> dwmw2
> 
> 
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
