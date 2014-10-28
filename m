Received: from smtprelay0243.hostedemail.com ([216.40.44.243]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj9AB-0003Mv-Ok
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 15:58:28 +0000
Message-ID: <1414511877.6643.12.camel@perches.com>
Subject: Re: [PATCH 7/7] docg3: Fix miuse of seq_printf return value
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 28 Oct 2014 08:57:57 -0700
In-Reply-To: <20141028111301.22481f2a@gandalf.local.home>
References: <20140929124246.3e39dac8@gandalf.local.home>
 <cover.1412031505.git.joe@perches.com>
 <c1a1138f1b05e87a3fbd8737af2f2c0be6e2724b.1412031505.git.joe@perches.com>
 <20141022082916.GD16128@brian-ubuntu>
 <20141028111301.22481f2a@gandalf.local.home>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.cz>,
 linux-mtd@lists.infradead.org, Al Viro <viro@ZenIV.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Tue, 2014-10-28 at 11:13 -0400, Steven Rostedt wrote:
> I'm going to be working on changes to remove the return value of
> seq_printf() and friends.

I'm sure you know all of this, but for anyone else:

This doesn't need to be done in a single pass.

The seq_<foo> functions themselves can wait until
all the uses are converted.

Here are files that likely need to change:

$ git grep --name-only -E "[\(=]\s*seq_(vprintf|printf|puts|putc|escape|write|put_decimal_\w+)\s*\("
arch/arm/plat-pxa/dma.c
arch/cris/arch-v10/kernel/fasttimer.c
arch/cris/arch-v32/kernel/fasttimer.c
arch/microblaze/kernel/cpu/mb.c
arch/x86/kernel/cpu/mtrr/if.c
drivers/base/power/wakeup.c
drivers/mfd/ab8500-debugfs.c
drivers/net/wireless/brcm80211/brcmfmac/dhd_sdio.c
drivers/parisc/ccio-dma.c
drivers/parisc/sba_iommu.c
drivers/regulator/dbx500-prcmu.c
drivers/staging/lustre/lustre/fid/lproc_fid.c
drivers/staging/lustre/lustre/llite/lproc_llite.c
drivers/staging/lustre/lustre/mdc/lproc_mdc.c
drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
drivers/staging/lustre/lustre/osc/lproc_osc.c
drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
drivers/usb/gadget/udc/goku_udc.c
drivers/usb/gadget/udc/pxa27x_udc.c
drivers/watchdog/bcm_kona_wdt.c
fs/debugfs/file.c
fs/dlm/debug_fs.c
fs/eventfd.c
fs/eventpoll.c
fs/notify/fdinfo.c
fs/proc/base.c
fs/seq_file.c
kernel/trace/trace_seq.c
net/batman-adv/gateway_client.c
net/ipv4/netfilter/nf_conntrack_l3proto_ipv4_compat.c
net/netfilter/nf_conntrack_standalone.c
net/netfilter/nf_log.c
net/netfilter/xt_hashlimit.c
