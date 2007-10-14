Subject: Re: [PATCH] mtd: fix mtdconcat for subpage-write NAND
From: David Woodhouse <dwmw2@infradead.org>
To: Chris Paulson-Ellis <chris@edesix.com>
In-Reply-To: <feng7u$sfs$1@sea.gmane.org>
References: <feng7u$sfs$1@sea.gmane.org>
Content-Type: text/plain
Date: Sun, 14 Oct 2007 13:32:53 +0100
Message-Id: <1192365173.13901.48.camel@pmac.infradead.org>
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

On Fri, 2007-10-12 at 10:54 +0100, Chris Paulson-Ellis wrote:
> This allows the mtdconcat driver to work with NAND flash devices that support sub-page writes.
> 
> Signed-off-by: Chris Paulson-Ellis <chris@edesix.com>

Applied by hand; thanks. For future reference, please note your mailer
mangled the whitespace -- please test sending patches to yourself first,
then save them and attempt to apply them yourself.

-- 
dwmw2
