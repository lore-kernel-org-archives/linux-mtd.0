Received: from web21507.mail.yahoo.com ([66.163.169.18])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ImxT-0003n5-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 10:01:27 +0100
Message-ID: <20020614090125.91096.qmail@web21507.mail.yahoo.com>
Date: Fri, 14 Jun 2002 02:01:25 -0700 (PDT)
From: Studying MTD <studying_mtd@yahoo.com>
Subject: Re: why MTD model ? 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <18178.1024041299@redhat.com>
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
> Flash devices have large erase blocks. You cannot
> just treat them as a block
> device with a sector size of 64KiB, etc. 

We can change the sector size on block devices.

> A flash device can have sectors
> erased independently of write operations, can have
> write operations
> performed independently of erases 

I think, this is not neccesary to keep erase
independent from writing, we can erase before we
write.

> (e.g. JFFS2 does so just to clear one
> extra 'valid' bit in existing nodes', can support
> writes to arbitrary byte
> ranges, etc. 

It is not neccesary that we use JFFS2, we can use any
filesystem on flash but at low level when we are
writing to flash, we can use wear levelling.

> The MTD API allows you to make use of those
features.

Are these are only feature provided by MTD ?

I am not able to understand what is special in MTD
model ?

Please help me.

thanks for your help.


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
