Subject: Re: [PATCH 2/4] [RFC] [MTD] cfi_probe: remove Intel chip workaround
From: David Woodhouse <dwmw2@infradead.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
In-Reply-To: <1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2008 09:52:19 -0400
Message-Id: <1216993939.28941.139.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-07-22 at 09:38 +0200, Uwe Kleine-König wrote:
> For me this workaround breaks detection of a M29W128GL flash because it
> doesn't switch to CFI Query mode after writing 0xff.
> 
> This workaround was introduced in 2004 between v2.6.8-rc1 and
> v2.6.8-rc2 in CVS revision 1.77 of cfi_probe.c.  ("Send 0xFF to switch Intel
> chips back to read mode too. Some of them ignore 0xF0")
> 
> Alternatively writing 0xff *before* 0xf0 works with the M29W128GL.

That's probably what you should do then; your patch as it stands would
break Intel chips, wouldn't it?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
