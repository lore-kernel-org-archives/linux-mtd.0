Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0606271454150.28771@localhost.localdomain>
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
	<1151433983.6394.230.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0606271454150.28771@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 21:05:14 +0100
Message-Id: <1151438714.6394.232.camel@pmac.infradead.org>
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

On Tue, 2006-06-27 at 15:16 -0400, Nicolas Pitre wrote:
> > I'm not sure I follow that argument. cfi_udelay() is used in basically
> > the same circumstances by other chip drivers, so why not do it there
> > instead of open-coding it?
> 
> The code simply ends up being simpler. 

OK, fine. If someone could send me a tested version with an appropriate
commit comment and Signed-off-by:, or better still stick it in a git
tree for me to pull from, I'll add it to my tree.

-- 
dwmw2
