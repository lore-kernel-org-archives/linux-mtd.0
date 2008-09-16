Subject: Re: [PATCH V2] [MTD] m25p80.c extended jedec support
From: David Woodhouse <dwmw2@infradead.org>
To: Chen Gong <g.chen@freescale.com>
In-Reply-To: <1221545652-2280-1-git-send-email-g.chen@freescale.com>
References: <1221545652-2280-1-git-send-email-g.chen@freescale.com>
Content-Type: text/plain
Date: Mon, 15 Sep 2008 23:36:37 -0700
Message-Id: <1221546997.3106.54.camel@macbook.infradead.org>
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

On Tue, 2008-09-16 at 14:14 +0800, Chen Gong wrote:
> BTW, dave, I don't find any other fixes in this file recently. What do
> you mean something has been there in the git tree, which git tree ?

http:// or git:// git.infradead.org/mtd-2.6.git

Most of your patch is already there (and thus also in linux-next).
Please could we have an incremental patch?

What happens if you call spi_write_then_read(spi, x, x, x, 5) on a
device which is only expecting to return 3 bytes. Does the call return
failure? Or just pad to 5 bytes with zeroes?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
