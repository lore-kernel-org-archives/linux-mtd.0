Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL5Ba-0003j5-Ac
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 06:20:11 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so648609pab.38
 for <linux-mtd@lists.infradead.org>; Tue, 04 Mar 2014 22:19:45 -0800 (PST)
Date: Tue, 4 Mar 2014 22:19:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [PATCH v2 RESEND 1/2] mtd: Add a retlen parameter to
 _get_{fact,user}_prot_info
Message-ID: <20140305061937.GK13420@norris-Latitude-E6410>
References: <1390897785-991-1-git-send-email-christian.riesch@omicron.at>
 <db5db0eb-2c50-4642-ab11-5c406356bdeb@mary.at.omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db5db0eb-2c50-4642-ab11-5c406356bdeb@mary.at.omicron.at>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 28, 2014 at 09:29:44AM +0100, Christian Riesch wrote:
> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |   31 +++++++++++++------------------
>  drivers/mtd/devices/mtd_dataflash.c |    7 ++++---
>  drivers/mtd/mtdchar.c               |   11 ++++++-----
>  drivers/mtd/mtdcore.c               |   12 ++++++------
>  drivers/mtd/mtdpart.c               |   14 ++++++++------
>  drivers/mtd/onenand/onenand_base.c  |   30 ++++++++++++------------------
>  include/linux/mtd/mtd.h             |   16 ++++++++--------
>  7 files changed, 57 insertions(+), 64 deletions(-)

Pushed patch 1 to l2-mtd.git. I may not push patch 2 yet; let me know if
you see a problem with that.

Thanks,
Brian
