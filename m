Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQXZ2-0004sQ-Bi
 for linux-mtd@lists.infradead.org; Fri, 12 Apr 2013 06:34:24 +0000
Message-ID: <5167AAE3.3070202@gmail.com>
Date: Fri, 12 Apr 2013 08:34:11 +0200
From: Stefan Roese <stefan.roese@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>
 <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
In-Reply-To: <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, Kevin Cernekee <cernekee@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11.04.2013 11:00, Brian Norris wrote:
> [Sorry for the repeat email for some; Gmail switched me back to
> HTML-mode, so my previous email couldn't be delivered to the MTD list]
> 
> Hi all,
> 
> I'm having some trouble where I am getting timeouts in cfi_cmdset_0002.c:
> 
> MTD do_write_buffer(): software timeout
> 
> I'm using a 64Mbyte Spansion S29GL512 NOR flash:
> 
> physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank.
> Manufacturer ID 0x000001 Chip ID 0x002301
> 
> I can reproduce the timeout approximately 0.5% of the time on a simple
> reboot, mount UBI rootfs test. My system has CONFIG_HZ=250, and so the
> timeout comes out to just 1 jiffy. I have to increase this timeout to
> at least 3 ticks to avoid the timeouts. (I've been running reboot
> tests successfully for several days with the timeout as 3 jiffies.)
> 
> So my question is: what is the "best" way to decide these timeouts?
> I'm inclined to just increase the timeout (and to use the proper
> msecs_to_jiffies() macro, as a cleanup). But according to the
> datasheets (which agree with the comments in the code), the max time
> should be less than a millisecond. So simply increasing the timeout
> may in fact just be masking some other bug.
> 
> Huang,
> 
> I noticed you recently sent a patch that adjusts the timeout print
> message in do_write_buffer(). Have you had problems with this code
> recently?
> 
> Any thoughts from any interested (or uninterested) party would be useful.

Without looking into the cmdset_0002 code, I remember fixing a
similar issue for cmdset_0001 a few months ago:

git id: 7be1f6b9a1ae3476a424380b52aad7c14c3273ab
Author: Stefan Roese <sr@denx.de>  2012-08-28 11:34:13
Committer: David Woodhouse <David.Woodhouse@intel.com>  2012-09-29 16:29:08
Follows: v3.6-rc2
Precedes: v3.7-rc1

    mtd: cfi_cmdset_0001: Fix problem with unlocking timeout
    
    Unlocking may take up to 1.4 seconds on some Intel flashes. So
    lets use a max. of 1.5 seconds (1500ms) as timeout.
    
    See "Clear Block Lock-Bits Time" on page 40 in
    "3 Volt Intel StrataFlash Memory" 28F128J3,28F640J3,28F320J3 manual
    from February 2003
    
    This patch also fixes some other problems with this timeout:
    
    - Don't use HZ in timeout "calculation"!
      While testing we noticed that an unlocking timeout occured with
      HZ=1000 and didn't occur with HZ=300. This was because the
      timeout parameter was calculated differently depending on the
      HZ value. Now a fixed value of 1500ms is used.
    
    - The last parameter of WAIT_TIMEOUT (defined to
      inval_cache_and_wait_for_operation) has to be passed in
      micro-seconds. So multiply the ms value with 1000 and not 100
      to calculate this value.
    
    - Use variable name "mdelay" instead of misleading "udelay".
    

One main issue here was that the resulting timeout was HZ related
resulting in different behavior depending on the HZ configuration.

This current issue here might be related, not sure though.

Thanks,
Stefan
