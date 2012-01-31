Message-ID: <4F27AA98.2090602@freescale.com>
Date: Tue, 31 Jan 2012 16:47:20 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <20120130094610.GA15596@pengutronix.de> <4F2671C3.6000809@freescale.com>
 <20120130104428.GB15596@pengutronix.de> <4F267F21.1030204@freescale.com>
 <20120130114131.GC15596@pengutronix.de>
In-Reply-To: <20120130114131.GC15596@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
> CCing Marek, he can say more about the U-Boot side probably...
>
>>> Bootloaders may also need to write to NAND. So, they need to share the
>> Do you mean the uboot may write something to the NAND?
>> Could you show me some more detail cases?
> U-Boot has NAND support in mainline, for barebox it is work-in-progress.
> Both can and do write to NAND (kernel, rootfs), because both have
> established procedures to do so (and maybe don't want to rely on
> third-party tools like kobs-ng).
>
ok.

What's about to add a module_param() to enable/disable the BBT for GPMI?
What's your suggestion?


Br
Huang Shijie
