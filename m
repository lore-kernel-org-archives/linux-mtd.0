From: David Woodhouse <dwmw2@infradead.org>
To: Gerrit Van de Velde <gvd@denayer.wenk.be>
In-Reply-To: <1078156118.4832.7.camel@nios>
References: <1078156118.4832.7.camel@nios>
Content-Type: text/plain
Message-Id: <1078157135.6336.823.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 01 Mar 2004 16:05:36 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 strange behaveour
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-03-01 at 16:48 +0100, Gerrit Van de Velde wrote:
>  I get following strange errors during startup:
> JFFS: Failed to mount device 1f:02.

Nothing strange there. There's no JFFS file system; JFFS fails to mount.
Why did you even build it into your kernel?

JFFS2 works though:

> rootfs                   13312      3920      9392  29% /
> /dev/mtdblock2           13312      3920      9392  29% /

That's normal behaviour for recent kernels, whatever the rootfs actually
is.


-- 
dwmw2
