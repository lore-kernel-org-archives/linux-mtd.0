Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtWxZ-0008D8-Ag
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 05:47:34 +0000
Message-ID: <1372657883.22014.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH [mtd-utils]] fix build errors w/newer kernel headers &
 glibc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 01 Jul 2013 08:51:23 +0300
In-Reply-To: <1368030373-32584-1-git-send-email-vapier@gentoo.org>
References: <1368030373-32584-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-08 at 12:26 -0400, Mike Frysinger wrote:
> Building with linux-headers-3.9 and glibc-2.17 fails like so:
> In file included from summary.h:15:0,
>                  from jffs2dump.c:37:
> /usr/include/linux/uio.h:16:8: error: redefinition of 'struct iovec'
>  struct iovec

Pushed to mtd-utils, thanks!
-- 
Best Regards,
Artem Bityutskiy
