Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUaUD-00062d-7I
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 11:34:42 +0000
Date: Mon, 31 Mar 2014 19:34:12 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [mtd/sbc_gxx] kernel BUG at include/linux/mtd/map.h:148!
Message-ID: <20140331113412.GA13548@localhost>
References: <20140327140140.GA9083@localhost>
 <CAErSpo7b+OJUoRcMY0edZPgEKG6DbwdLcq5M0-9B6JKALpm+QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAErSpo7b+OJUoRcMY0edZPgEKG6DbwdLcq5M0-9B6JKALpm+QQ@mail.gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CC Michal and kbuild list.

On Thu, Mar 27, 2014 at 04:51:53PM -0600, Bjorn Helgaas wrote:
> [+cc David, Brian]
> 
> On Thu, Mar 27, 2014 at 8:01 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> > FYI, here is a very old warning, too old to be bisected.
> >
> > [    5.282127] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
> > [    5.286079] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
> > [    5.288723] ------------[ cut here ]------------
> > [    5.289649] kernel BUG at include/linux/mtd/map.h:148!
> 
> I think the problem is that your randconfig happens to have none of
> CONFIG_MTD_MAP_BANK_WIDTH_* set (you should have played the lottery
> today!), and the default implementation of map_bankwidth() in that
> case is just "BUG()":
> 
>   $ grep MTD_MAP config-3.14.0-rc8-wl-03045-gdf16ea4
>   # CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
>   # CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
>   # CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
>   # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
>   # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
>   # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> 
> I don't know enough Kconfig or MTD to fix this.

Michal, the problem we run into is, how to select one of the above
CONFIG_MTD_MAP_BANK_WIDTH_xx in "make randconfig".

Thanks,
Fengguang
