From: David Woodhouse <dwmw2@infradead.org>
To: Don Hiatt <don@motorola.com>
In-Reply-To: <FPEBLIAFGDEEOHHAGOKBAEGPCDAA.don@motorola.com>
References: <FPEBLIAFGDEEOHHAGOKBAEGPCDAA.don@motorola.com>
Content-Type: text/plain
Message-Id: <1070014673.10048.16.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 28 Nov 2003 10:17:53 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 conflicts with Native CFI?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-11-24 at 09:51 -0600, Don Hiatt wrote:
> Hello,
> 
> I have SA1110 board (based on Intrinsyc's cerfboard) that I am
> trying to get a 384MB DOC (2000, in DIP package) to work with.
> The DOC leaves on CS2 so has an base address of 0x10000000 and is
> attached to the address bus shifted up 2 lines as per M-SYS tech
> note. 

Play with the access macros in include/linux/mtd/doc2000.h. Can you show
a hex dump of the region 0x10000000-0x10008000 ?

-- 
dwmw2
