Received: from chrudim.coprosys.cz ([194.108.73.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AuZn-0001H2-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 16:32:27 +0100
Message-ID: <3CED0C03.A4919B85@wolfhill.cz>
Date: Thu, 23 May 2002 17:34:27 +0200
From: Ales Makarov <ales.makarov@wolfhill.cz>
Reply-To: ales.makarov@wolfhill.cz
MIME-Version: 1.0
To: Frederic Giasson <fgiasson@mediatrix.com>,
        Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Kernel oops after sync command in jffs2
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF4B@mail.mediatrix.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Frederic Giasson wrote:
> 
> However, I had a look at do_erase_oneword() function.  I seen that to verify

I guess you mean do_write_oneword() function.

> if write operation has completed, we simply read back the written value
> until it matches or until we read back 10000 times or more.  This works most
> of the time, but in my opinion it is not the best way to do that.

You are right. This could be my problem...
 
> What I think we should do to determine if write operation has completed OK
> is to poll DQ6 and DQ5, as we do for erase operation.  However, since
> program operation takes *much* less time than erase operation ( 150 us max
> accoring to my AMD spec ), we should not schedule.  We should simply poll
> 150 times at most, inserting a "udelay(1);" in each loop.  If DQ5 rises, we
> must threat it the same way we do in do_erase_oneblock().

I agree. I would also prefer the DQ6 and DQ5 testing.

> 
> Also, speaking of do_erase_oneblock(), it is said in my AMD spec that when
> DQ5 rises, even if that happen while DQ6 still toggle, it is necessary to
> read DQ0-DQ7 twice once again and compare both values to see if it still
> toggles.  If it does not toggle, it means that erase operation has completed
> correctly.  You can verify that my yourself by having a look at figure 6, p.
> 29 in spec sheet "Am29DL322D/323D/324D, revD, May 8th, 2001".
> 
> Frederic Giasson
> 

I have read it also in the datasheet of the Fujitsu MBM29LV320 (p.32).
These additional reads should be done, because the toggle bit may have
stopped toggling just as DQ5 went high.

Ales
