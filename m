Subject: Re: 2.6.24.4: problem accessing nand based cramfs
From: David Woodhouse <dwmw2@infradead.org>
To: mtddev@sc-software.com
In-Reply-To: <Pine.LNX.4.64.0804101338190.1418@sc-software.com>
References: <Pine.LNX.4.64.0804101338190.1418@sc-software.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 10:03:13 +0100
Message-Id: <1208941393.9212.735.camel@pmac.infradead.org>
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

On Mon, 2008-04-14 at 08:22 -0700, mtddev@sc-software.com wrote:
> 
> I have an SMC card w a cramfs rootfs on it.
> I'm trying to replace an fs driver I wrote on 2.5.13 for the same SMC.
> I thought I could do it more cleanly and easily now... 
> I've defined a plaform driver and, correctly or 
> incorrectly hooked the nand code that calls nand_scan, so as to call my
> probe code to do my partition mapping.

Does it correctly detect the NAND chip?  It would probably help if you
show your driver.

-- 
dwmw2
