From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1067856319.11251.47.camel@linuxdev.icampbell.arcom.cc>
References: <1067856319.11251.47.camel@linuxdev.icampbell.arcom.cc>
Content-Type: text/plain
Message-Id: <1067858096.3423.431.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 03 Nov 2003 11:14:56 +0000
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: ilookup used in fs/jffs2/gc.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-11-03 at 10:45 +0000, Ian Campbell wrote:
> JFFS2 in CVS has recently (version 1.122) started using the ilookup
> function which is not available in any 2.4 kernels (at least it isn't in
> 2.4.22 or 2.4.19)
> 
> Is a compatmac.h entry likely to be possible for this function, or is
> there some other work around which can be used on 2.4 kernels? 

I just added ilookup-2.4.23.patch to the CVS tree, which contains both
the ilookup() implementation and another race fix which is required for
2.4. 

They have been sent to Marcelo, and should be turning up in 2.4.23
shortly. 

-- 
dwmw2
