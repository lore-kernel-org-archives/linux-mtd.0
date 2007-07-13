Subject: Re: [Resend][Patch] drivers/mtd/maps/tqm8xxl.c: Do some cleanups
From: David Woodhouse <dwmw2@infradead.org>
To: WANG Cong <xiyou.wangcong@gmail.com>
In-Reply-To: <20070713034822.GA2370@localhost.localdomain>
References: <20070712150135.GA4102@localhost.localdomain>
	<1184256718.32199.111.camel@weaponx.rchland.ibm.com>
	<20070713034822.GA2370@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 13 Jul 2007 10:56:42 +0100
Message-Id: <1184320602.2785.18.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kirk@hpc.ee.ntu.edu.tw, akpm@osdl.org, LKML <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-07-13 at 11:48 +0800, WANG Cong wrote:
>                 if(map_banks[idx] == NULL) {
>                         ret = -ENOMEM;
> -                       /* FIXME: What if some MTD devices were probed already? */
> +                       /* FIXME: What if some MTD devices were probed
> +                       already? */
>                         goto error_mem;
>                 } 


That's just horrid. Leave it as it was.

-- 
dwmw2
