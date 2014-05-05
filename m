Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhCZZ-0003Md-6B
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 06:40:21 +0000
Message-ID: <1399271969.17496.112.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: weaken the 'exclusive' constraint when opening
 volumes to rename
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 05 May 2014 09:39:29 +0300
In-Reply-To: <1397681253-5203-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1397681253-5203-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-04-16 at 17:47 -0300, Ezequiel Garcia wrote:
> The UBI volume rename ioctl (UBI_IOCRNVOL) open the volumes in exclusive
> mode. The volumes are opened for two reasons: to build a volume rename list,
> and a volume remove list.
> 
> However, the first open constraint is excessive and can be replaced by
> a 'read-write' open mode. The second open constraint is properly set as
> 'exclusive' given the volume is opened for removal and we don't want any
> users around.

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
