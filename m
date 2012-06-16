Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sfi70-0002jH-QO
 for linux-mtd@lists.infradead.org; Sat, 16 Jun 2012 01:47:39 +0000
Received: by dadm1 with SMTP id m1so4808588dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2012 18:47:36 -0700 (PDT)
Date: Fri, 15 Jun 2012 18:47:32 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fengguang Wu <wfg@linux.intel.com>
Subject: Re: [driver-core:driver-core-linus 6/6]
 drivers/firmware/iscsi_ibft_find.o: In function `kmsg_dump_rewind':
 (.text+0x18): multiple definition of `kmsg_dump_rewind'
Message-ID: <20120616014732.GA2981@kroah.com>
References: <4fdbcd2f.Ta8kRp58FRzqrqaL%wfg@linux.intel.com>
 <20120616011646.GA7847@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120616011646.GA7847@localhost>
Cc: devel@driverdev.osuosl.org, linux-mtd@lists.infradead.org,
 Kay Sievers <kay@vrfy.org>, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 16, 2012 at 09:16:46AM +0800, Fengguang Wu wrote:
> Hi list,
> 
> I'm sorry if this pile of build errors disturbed you too much. If
> the error notification is too permissive, I can limit it in two ways:
> 
> 1) only notify build errors on the first kconfig. There may be a few
>    new error messages show up in the other kconfig builds, however
>    mostly are just irritating duplications.

Duplicates should be suppressed, they are just annoying.

> 2) only notify the mailing list directly associated with the git tree.
>    In this particular case, to only CC devel@driverdev.osuosl.org, and
>    to avoid the linux-mtd and linuxppc-dev lists.

Yes, that would be the best thing to do to start with, then let the
developers take it from there.

thanks,

greg k-h
