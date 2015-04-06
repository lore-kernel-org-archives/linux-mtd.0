Date: Sun, 5 Apr 2015 18:00:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: don't map the ROM table if no pmecc
 table offset in DT
Message-ID: <20150406010002.GH2677@norris-Latitude-E6410>
References: <1427955227-8927-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427955227-8927-1-git-send-email-josh.wu@atmel.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 02, 2015 at 02:13:47PM +0800, Josh Wu wrote:
> if atmel,pmecc-lookup-table-offset is not found in DT node, we don't
> need to map the ROM table as we will build a runtime gf table anyway.
> 
> Reported-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git.

Brian
