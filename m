Received: from mga01.intel.com ([192.55.52.88])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5xwu-0000rx-VM
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 11:25:29 +0000
Message-ID: <1331292467.29445.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: MIPS: lantiq: reintroduce support for cmdline
 partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 09 Mar 2012 13:27:47 +0200
In-Reply-To: <1330016389-20973-1-git-send-email-blogic@openwrt.org>
References: <1330016389-20973-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org,
 Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-02-23 at 17:59 +0100, John Crispin wrote:
> From: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> 
> Since commit ca97dec2ab5c87e9fbdf7e882e1820004a3966fa the
> command line parsing of MTD partitions does not work anymore.
> 
> Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> Signed-off-by: John Crispin <blogic@openwrt.org>

Pushed to l2-mtd.git and added:
Cc: stable@kernel.org [3.2+]

since this is a regression. Please, confirm that CCing the stable tree
is fine with you.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
