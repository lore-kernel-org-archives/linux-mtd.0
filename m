From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060530155001.GA26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 May 2006 16:55:02 +0100
Message-Id: <1149004502.2885.193.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-30 at 17:50 +0200, Jörn Engel wrote:
> Until recently, we had four different variants of jffs2 wbuf code,
> depending on the flash type.  I fail to see the difference between
> those four and have already merged two of them.  Unless I am missing
> something important, the other three can also be combined into one.
> 
> But doing so would result in something like
>         if ((mtd->type == MTD_NAND) || (mtd->type == MTD_SIBLEY) ||
>                         (mtd->type == MTD_ECCNOR) ||
>                         (mtd->type == MTD_DATAFLASH))

That's why we _also_ have the flags, and why we abstract that still
further in application-specific code, like jffs2_can_mark_obsolete()

But you seem to want to kill _both_ the type _and_ the flag -- you say
that you want the MTD_KF_NOR_WBUF_FLASH flag to go away. So explain --
what do you want to do instead?

-- 
dwmw2
