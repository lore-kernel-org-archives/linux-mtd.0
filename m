From: Marek Vasut <marek.vasut@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Date: Tue, 31 Jan 2012 12:37:33 +0100
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <4F27AA98.2090602@freescale.com> <20120131092412.GA2471@pengutronix.de>
In-Reply-To: <20120131092412.GA2471@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201311237.33997.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > What's about to add a module_param() to enable/disable the BBT for GPMI?
> > What's your suggestion?
> 
> I'd make it board specific rather than a module parameter like most
> other drivers seem to do.
> 
> Thanks,
> 
>    Wolfram

Actually it's not board specific. You can run various bootloaders or various 
bootstrap tools on any of those boards. Though pdata seems ok for the default 
case, maybe we should have a simple way to override this?

M
