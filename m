Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 19:46:23 +0100
Message-Id: <1151433983.6394.230.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@pentafluge.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-27 at 14:38 -0400, Nicolas Pitre wrote:
> OK, but I think this should all be done within cfi_udelay().  Or maybe 
> not since cfi_udelay() is used by other chip drivers.  

I'm not sure I follow that argument. cfi_udelay() is used in basically
the same circumstances by other chip drivers, so why not do it there
instead of open-coding it?

-- 
dwmw2
