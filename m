Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtKPF-0004sE-VG
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 14:14:15 +0000
Received: by gwb1 with SMTP id 1so4075035gwb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 07:14:11 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] bugfix, cleanup for mtdinfo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 16 Aug 2011 17:15:50 +0300
In-Reply-To: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
References: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313504155.21711.2.camel@sauron>
Mime-Version: 1.0
Cc: brian.foster@maxim-ic.com, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-09 at 14:36 -0700, Brian Norris wrote:
> This series includes v2 of a bugfix patch, as discussed in this thread:
>   http://lists.infradead.org/pipermail/linux-mtd/2011-August/037386.html
> and previously. Now, `mtdinfo --all' will not try to print out
> region_info, since we need to supply a file path for use with ioctl. In
> the future, if sysfs support is supplied for region_info, then we can
> renew support in `mtdinfo --all'.
> 
> In addition to the bugfix, there are several other cleanups for mtdinfo.
> 
> Brian
> 
> Brian Norris (5):
>   mtdinfo: don't open NULL pointer when getting region_info with `-a'
>   mtdinfo: refactor code to remove "args.all" dependency
>   mtdinfo: restructure help message
>   mtdinfo: fixup "example usage" help section
>   mtdinfo: consolidate help as display_help()
> 
>  ubi-utils/mtdinfo.c |   61 ++++++++++++++++++++++++++------------------------
>  1 files changed, 32 insertions(+), 29 deletions(-)

Pushed the series to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy
