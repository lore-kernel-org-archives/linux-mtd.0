From: David Woodhouse <dwmw2@infradead.org>
To: Eugeny Mints <eugeny.mints@auriga.ru>
In-Reply-To: <5B439D84E6653F4AA2E14A5D8898A7E163D806@auriga.auriga.ru>
References: <5B439D84E6653F4AA2E14A5D8898A7E163D806@auriga.auriga.ru>
Content-Type: text/plain
Message-Id: <1065712468.22298.1835.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 09 Oct 2003 16:14:29 +0100
Content-Transfer-Encoding: 7bit
cc: Dmitry Pervushin <dmitry.pervushin@auriga.ru>
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-09 at 19:04 +0400, Eugeny Mints wrote:
> Hello,
> 
> Could anybody help me to solve such a problem with JFFS2 and NAND flash:
> - the NAND flash Toshiba TC58256AFTI
> - kernel 2.4.22 with latest MTD and JFFS2 
> - handy-written miniport for the paticular flash chip

When you say 'latest' do you really mean that? NAND flash support in
JFFS2 has changed a _lot_ in the last weeks, and even in the last few
days.

> The device works OK almost in any case, but when I try to execute  while
> true; do dd if=/dev/zero of=/dev/mnt/foo count=1000; done after 10-15
> minutes the system hangs; I cannot login from console or via telnet, but
> it is still ping'able. I tried to use YAFFS, perform dd to device itself
> instead of file on the filesystem on top of flash - no hangs were
> observed.

Use SysRq-P and/or SysRq-T to see where the kernel is stuck. IF that
doesn't work, enable CONFIG_JFFS2_FS_DEBUG=1 and 
echo > /proc/sys/kernel/printk then watch the console, and see what the
last thing it says is.

-- 
dwmw2
