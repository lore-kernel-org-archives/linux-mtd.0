Subject: RE: Clobbered file after jffs2 mount
From: David Woodhouse <dwmw2@infradead.org>
To: Jon Ringle <JRingle@vertical.com>
In-Reply-To: <4DD3AF7ECBBC43409BA36508938D01851B006C@CVAEX1.VERTICAL.COM>
References: <4DD3AF7ECBBC43409BA36508938D01851B006C@CVAEX1.VERTICAL.COM>
Content-Type: text/plain
Date: Sat, 22 Sep 2007 02:51:01 +0100
Message-Id: <1190425861.7150.212.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-09-21 at 21:35 -0400, Jon Ringle wrote:
> I tried init=/bin/sh on a first boot after reflash and the md5sum of
> sshd was correct. I then rebooted again normally and the ssh keys were
> generated. When I logged in, the md5sum of sshd was wrong. The
> corruption that I observe is always the same incorrect md5sum.

But there's no corruption on the _flash_ -- if you boot with
init=/bin/sh again after the keys are generated, you again get the
_correct_ md5sum? I'm fairly certain of that, since the failure mode
you'll get if you manage to scribble on the flash is that the data CRC
will fail and you'll get zeroes where the offending nodes go missing.

It's going to be something scribbling on the RAM pages after the file is
read from the file system. Be thankful it looks fairly repeatable. Can
you put a hardware watchpoint on the offending page in the page cache,
after it's read? And can you disable _everything_ in the system which
uses DMA, one at a time?

-- 
dwmw2
