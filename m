From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1101123638.2922.289.camel@icampbell-debian>
References: <1099057831.24918.1684.camel@icampbell-debian>
	<1101121681.8191.7439.camel@hades.cambridge.redhat.com>
	<1101123638.2922.289.camel@icampbell-debian>
Content-Type: text/plain
Message-Id: <1101123745.8191.7441.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 22 Nov 2004 11:42:25 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] fix detection of redboot fis partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-22 at 11:40 +0000, Ian Campbell wrote:
> On Mon, 2004-11-22 at 11:08 +0000, David Woodhouse wrote:
> > On Fri, 2004-10-29 at 14:50 +0100, Ian Campbell wrote:
> > > The patch (against BK) below sorts these out. Is it OK to commit to MTD
> > > CVS and then send to Linus?
> > 
> > Please commit them. I'll put them in the BK tree for pulling after
> > 2.6.10 is released.
> 
> Done. 
> 
> Would you object to my updating the sbc_gxx.c map driver as well? It has
> gotten rather out of sync with the code we are currently running. 
> 
> The patch is pretty huge but I've attached it anyway... It adds support
> for the SRAM device and updates the partitioning code, I think I also
> lindented it at some point in the last couple of years as well.

Go for it.

-- 
dwmw2
