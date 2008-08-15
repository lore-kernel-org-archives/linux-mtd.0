Subject: Re: [PATCH 1/1] MTD Maps: initial driver for using gpios to assist
	in addressing of parallel flash as is on the tinyboards
From: David Woodhouse <dwmw2@infradead.org>
To: Bryan Wu <cooloney@kernel.org>
In-Reply-To: <1218789421-9995-1-git-send-email-cooloney@kernel.org>
References: <1218789421-9995-1-git-send-email-cooloney@kernel.org>
Content-Type: text/plain
Date: Fri, 15 Aug 2008 10:29:53 +0100
Message-Id: <1218792593.3184.71.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-15 at 16:37 +0800, Bryan Wu wrote:
> +#define pr_devinit(fmt, args...) ({ static const __devinitconst char
> __fmt[] = fmt; printk(__fmt, ## args); })

You've added that macro twice in MTD code already -- and now you're
adding it twice more (although I suspect only one was intentional).
Where are we with putting it in include/linux/ where it belongs?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
