Subject: Re: JFFS2 softlinks problem
From: David Woodhouse <dwmw2@infradead.org>
To: Jakub Bednar <bednar@hnilux.racom.cz>
In-Reply-To: <20070519115535.A8761@hnilux.racom.cz>
References: <20070519115535.A8761@hnilux.racom.cz>
Content-Type: text/plain
Date: Mon, 21 May 2007 11:24:25 -0400
Message-Id: <1179761066.2771.3.camel@shinybook.infradead.org>
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

On Sat, 2007-05-19 at 11:55 +0200, Jakub Bednar wrote:
> How is it possible? Can something got wrong in RAM? Moving erase
> blocks can broke links?

Double-check your CPU's fixups for unaligned loads/stores.

-- 
dwmw2
