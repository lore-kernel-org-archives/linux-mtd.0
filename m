Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: David Woodhouse <dwmw2@infradead.org>
To: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
In-Reply-To: <1179215126.21753.40.camel@localhost.localdomain>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
	<1179189724.3482.24.camel@shinybook.infradead.org>
	<1179215126.21753.40.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 15 May 2007 15:51:10 +0800
Message-Id: <1179215471.2859.139.camel@shinybook.infradead.org>
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

On Tue, 2007-05-15 at 09:45 +0200, Hans-Christian Egtvedt wrote:
> What I would have liked was a possibility to choose which read/write
> operations should be used when using my developing machine, but for
> the kernel I boot my embedded target with I would like an optimized
> jffs2 driver.
> 
> Use native endianess by default, but have a possibility to override at
> runtime.

I suppose I wouldn't be _entirely_ averse to a 'JFFS2_BI_ENDIAN' option
which stores a flag in the jffs2_sb_info. It means we need an extra
argument je32_to_cpu() et al., but that isn't particularly evil.

-- 
dwmw2
