Subject: Re: Clobbered file after jffs2 mount
From: David Woodhouse <dwmw2@infradead.org>
To: Jon Ringle <jringle@vertical.com>
In-Reply-To: <46F3FE02.7020800@vertical.com>
References: <46F3FE02.7020800@vertical.com>
Content-Type: text/plain
Date: Sat, 22 Sep 2007 00:38:39 +0100
Message-Id: <1190417919.7150.180.camel@pmac.infradead.org>
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

On Fri, 2007-09-21 at 13:23 -0400, Jon Ringle wrote:
> Hello,
> 
> This falls under the category of bizarre behavior and I'm hoping someone 
> on this list can help.

Yes, that is indeed bizarre.

> I have a jffs2 filesystem on my target (IXP455 processor) running Linux 
> 2.6.16.29. Sometimes the first time that Linux mounts the jffs2 
> filesystem after reflashing the jffs2 image, sshd would strangely 
> misbehave and not allow incoming connections. After much 
> troubleshooting, it was discovered that the md5sum of the sshd file was 
> different than the expected md5sum. However, if the system is rebooted, 
> then sshd works correctly and the md5sum of sshd on the target magically 
> corrected itself to the expected value.

My first inclination is to suspect that somehow the pages of sshd got
scribbled on in RAM. Is the corruption repeatable? 

Can you instrument jffs2_read_inode_range() to print a hex dump of the
"offending" bytes as soon as they've been read?

Can you boot directly into a shell (init=/bin/sh) and then md5sum the
offending file?

-- 
dwmw2
