Received: from plane.gmane.org ([80.91.229.3])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaNmr-0002KP-FD
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 09:04:50 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SaNmj-0000zt-A8
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 11:04:41 +0200
Received: from ram94-11-88-187-113-157.fbx.proxad.net ([88.187.113.157])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2012 11:04:41 +0200
Received: from romain.izard.pro by ram94-11-88-187-113-157.fbx.proxad.net with
 local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2012 11:04:41 +0200
To: linux-mtd@lists.infradead.org
From: Romain Izard <romain.izard.pro@gmail.com>
Subject: Re: UBIFS master node corruption
Date: Fri, 1 Jun 2012 09:04:23 +0000 (UTC)
Message-ID: <jqa0im$9gb$1@dough.gmane.org>
References: <jq7t2r$md2$1@dough.gmane.org> <4FC87383.2020303@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2012-06-01, Adrian Hunter <adrian.hunter@intel.com> wrote:

>> Have you ever encountered this kind of issue before ?
>
> You need to make sure you have this patch from the 
> linux-2.6.32.y branch of linux-stable:
>

I got it from Artem Bityutskiy's ubifs-v2.6.32.git repository on 
git.infradead.org, as commit ea0d024b63251232c60d76990e96d4453b5ceec1.
The tests were run with all the patches from this repository merged,
until the following patch:

> commit 6fef28bc82d0592d939e4c662449e93cbcfd08be
> Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date:  2012-01-09 15:33:21
> Subject: x86: fix gcc 4.6 compilation

I also verified the subject of all the newer patches on this branch
until now, but they do not seem to be related to my case.


With the same subject, I also have in my repository the following patch:

> commit d6a68cebd4838e2d273d717f7258601454901359
> Author: Anatolij Gustschin <agust@denx.de>
> Date:   Thu Jul 7 12:25:02 2011 +0200
>
>    UBIFS: fix master node recovery
>    
>    When the 1st LEB was unmapped and written but 2nd LEB not,
>    the master node recovery doesn't succeed after power cut.
>    We see following error when mounting UBIFS partition on NOR
>    flash:
>    
>    UBIFS error (pid 1137): ubifs_recover_master_node: failed to recover master node
>    
>    Correct 2nd master node offset check is needed to fix the
>    problem. If the 2nd master node is at the end in the 2nd LEB,
>    first master node is used for recovery. When checking for this
>    condition we should check whether the master node is exactly at
>    the end of the LEB (without remaining empty space) or whether
>    it is followed by an empty space less than the master node size.
>    
>    Artem: when the error happened, offs2 = 261120, sz = 512, c->leb_size = 262016.
>    
>    Signed-off-by: Anatolij Gustschin <agust@denx.de>
>    Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
>
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> index 5256f42..2c98d77 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -273,7 +273,8 @@ int ubifs_recover_master_node(struct ubifs_info *c)
> 				if (cor1)
> 					goto out_err;
> 				mst = mst1;
> -			} else if (offs1 == 0 && offs2 + sz >= c->leb_size) {
> +			} else if (offs1 == 0 &&
> +				   c->leb_size - offs2 - sz < sz) {
> 				/* 1st LEB was unmapped and written, 2nd not */
> 				if (cor1)
> 					goto out_err;
>


>From what I understand of the user-space application running on the
devices, there are many operations related to switching UBI and UBIFS to
a read-only mode, to support a 'boot snapshot' feature implemented with
Linux suspend. Since the patch you indicated me was related to changing
the read-only property of the volume, I guess I should continue to
search in this direction.

-- 
Romain Izard
