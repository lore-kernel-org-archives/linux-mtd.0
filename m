Received: from dns.chez-thomas.org ([63.225.98.241]
	helo=hermes.chez-thomas.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ap6ag-0007W4-40
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2004 14:04:18 +0000
From: Gary Thomas <gary@mlbassoc.com>
To: Steffen Rumler <Steffen.Rumler@siemens.com>
In-Reply-To: <40239C69.5040803@siemens.com>
References: <40239C69.5040803@siemens.com>
Content-Type: text/plain
Message-Id: <1076076229.27984.182.camel@hermes>
Mime-Version: 1.0
Date: Fri, 06 Feb 2004 07:03:49 -0700
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: linuxppc embedded <linuxppc-embedded@lists.linuxppc.org>
Subject: Re: BUG in mtd/chips/cfi_cmdset_0002.c for 64bit width flashes
	(linuxppc_2_4_devel)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-02-06 at 06:53, Steffen Rumler wrote:
> Hi,
> 
> We have found the following bug in mtd/chips/cfi_cmdset_0002.c
> for 64bit bus width.
> 
> The routine do_write_oneword() uses the DQ6 algorithm in order
> to detect the end of programming phase (see bitkeeper: linuxppc_2_4_devel)
> 
> 
> oldstatus = cfi_read(map, adr);
> status = cfi_read(map, adr);
> 
> while( (status & dq6) != (oldstatus & dq6) &&
>          (status & dq5) != dq5 &&
>          !time_after(jiffies, timeo) ) {
> 
>      if (need_resched()) {
>          cfi_spin_unlock(chip->mutex);
>          yield();
>          cfi_spin_lock(chip->mutex);
>      } else
>          udelay(1);
> 
>      oldstatus = cfi_read( map, adr );
>      status = cfi_read( map, adr );
> }
> 
> There are two contiguous calls of cfi_read() to check for the DQ6 toggling.
> 
> But for 64bit one cfi_read() results in two flash accesses, one for
> the upper 32bit and the other for lower 32bit. In this way the DQ6 bits toggle
> for the two accesses related to one cfi_read(). The first access will be
> compared with the third and the second with the fourth.
> The end detection is broken, the body of the while loop will never be executed.
> 
> I suggest to switch to the alternative DQ7 algorithm.

You should probably discuss this with the folks that support the MTD
layer (cc'd)

-- 
Gary Thomas <gary@mlbassoc.com>
MLB Associates
