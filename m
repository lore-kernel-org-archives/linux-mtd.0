Subject: Re: Flash_eraseall -j and cowardly refusing to mount
From: David Woodhouse <dwmw2@infradead.org>
To: "Phillips, Owain" <owain.phillips@siemens.com>
In-Reply-To: <4B760ED6D70BBC4EBFC0AEFDAFB2392A0AEB9FBC@NTHT202E.siemenscomms.co.uk>
References: <4B760ED6D70BBC4EBFC0AEFDAFB2392A0AEB9FBC@NTHT202E.siemenscomms.co.uk>
Content-Type: text/plain
Date: Mon, 07 Jan 2008 15:00:40 +0000
Message-Id: <1199718040.27304.12.camel@pmac.infradead.org>
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

On Mon, 2008-01-07 at 12:16 +0000, Phillips, Owain wrote:
> Hi linux-mtd@lists.infradead.org,
> 
> We just upgraded to mtd-utils-1.0.1 on our 2.6.23 target and I am
> getting problems with flash_eraseall -j where the mount fails.

It ought to be fixed by this:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=09b3fba5

-- 
dwmw2
