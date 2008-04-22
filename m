Subject: Re: [2.6 patch] mtd: make onenand_scan_bbt() static
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@kernel.org>
In-Reply-To: <20080414142036.GU6695@cs181133002.pp.htv.fi>
References: <20080414142036.GU6695@cs181133002.pp.htv.fi>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 15:57:46 +0100
Message-Id: <1208876266.9212.606.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-04-14 at 17:20 +0300, Adrian Bunk wrote:
> This patch makes the needlessly global onenand_scan_bbt() static.

Nak. It's not unlikely that a board driver will need this. It just
introduces a gratuitous difference between NAND and OneNAND.

-- 
dwmw2
