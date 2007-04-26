Subject: Re: corruption of JFFS2 filesystem, csize is set to 0 after moving
	a block
From: David Woodhouse <dwmw2@infradead.org>
To: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
In-Reply-To: <1177599259.18969.111.camel@localhost.localdomain>
References: <1177599259.18969.111.camel@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 16:43:57 +0100
Message-Id: <1177602237.2755.414.camel@pmac.infradead.org>
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

On Thu, 2007-04-26 at 16:54 +0200, Hans-Christian Egtvedt wrote:
> Hello,
> 
> When I stress the JFFS2 filesystem by copying files around on the root
> (/) I end up with a corrupted filesystem after a reboot. The system just
> hangs after the kernel is done booting:
> Freeing init memory: 56K (90000000 - 9000e000)
> 
> Where I should get:
> init started:  BusyBox v1.4.2 (2007-04-17 15:34:55 CEST) multi-call
> binary
> etc...
> 
> I copy and remove files until I reach "cp: write error: No space left on
> device"
> 
> I extracted the filesystem from my flash device (Atmel AT49BV642D) and
> did a dump. Here I can see that some of the nodes have a csize set to 0
> for vital files such as libdl-0.9.28.so.

There's not necessarily anything wrong with that.

> Any pointers to where I should start debugging, what can go wrong?
> 
> I can provide jffs2dump's, logs or images if needed.

Take a copy of the image, then work out where the kernel is stuck. Use
SysRq-P and/or SysRq-T, and if it's in JFFS2 try running with
CONFIG_JFFS2_FS_DEBUG=1 (and with 'verbose' on the command line), and
capture all the output on a serial console.

-- 
dwmw2
