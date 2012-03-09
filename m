Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5vmb-0003J9-7W
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:06:41 +0000
Message-ID: <1331284134.22872.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: MIPS: lantiq: reintroduce support for cmdline
 partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 09 Mar 2012 11:08:54 +0200
In-Reply-To: <4F59C630.3060501@openwrt.org>
References: <1330016389-20973-1-git-send-email-blogic@openwrt.org>
 <1331282453.22872.29.camel@sauron.fi.intel.com>
 <4F59C630.3060501@openwrt.org>
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

On Fri, 2012-03-09 at 09:58 +0100, John Crispin wrote:
> On 09/03/12 09:40, Artem Bityutskiy wrote:
> > On Thu, 2012-02-23 at 17:59 +0100, John Crispin wrote:
> >> From: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> >>
> >> Since commit ca97dec2ab5c87e9fbdf7e882e1820004a3966fa the
> >> command line parsing of MTD partitions does not work anymore.
> >>
> >> Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> >> Signed-off-by: John Crispin <blogic@openwrt.org>
> >
> 
> Hi Artem,
> 
> i have tested this patch using arch/mips/configs/xway_defconfig and
> gcc4.6+linaro
> 
> i will try a build with your config in a moment
> 
> which git-tree are you building on top of ?

l2-mtd.git: http://git.infradead.org/users/dedekind/l2-mtd.git

-- 
Best Regards,
Artem Bityutskiy
