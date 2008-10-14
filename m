Subject: Re: [RFC/PATCH 4/8] LPDDR QINFO records definitions
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0810082227360.13328@casper.infradead.org>
References: <alpine.LFD.1.10.0810082227360.13328@casper.infradead.org>
Content-Type: text/plain
Date: Tue, 14 Oct 2008 11:14:13 +0100
Message-Id: <1223979253.6770.765.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nico@cam.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-08 at 22:29 +0100, Alexey Korolev wrote:
> 
> --- /dev/null
> +++ b/include/linux/mtd/qinfo.h
> @@ -0,0 +1,91 @@
> +#include <linux/mtd/map.h>
> +#include <linux/wait.h>
> +#include <linux/spinlock.h>
> +#include <linux/delay.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/flashchip.h>
> +#include <linux/mtd/partitions.h>
> +
> +#ifndef __LINUX_MTD_QINFO_H
> +#define __LINUX_MTD_QINFO_H

GCC does magic optimisations to avoid looking at include files for a
second time -- but only if your include guard is around the _whole_
file, iirc. So it's best to move those #includes down below the 
#ifndef __LINUX_MTD_QINFO_H

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
