Subject: Re: [PATCH] [MTD] OneNAND: Invalidate bufferRAM after erase
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <45CC4341.8080803@nokia.com>
References: <45CAF583.8000709@nokia.com>
	<002f01c74bdf$98098760$c7a3580a@swcenter.sec.samsung.co.kr>
	<45CC4341.8080803@nokia.com>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 15:17:39 +0000
Message-Id: <1171034259.29713.53.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kyungmin Park <kmpark@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-02-09 at 11:47 +0200, Adrian Hunter wrote:
> OneNAND has internal bufferRAMs.  The driver keeps track of
> what is in the bufferRAM to save having to load from the
> NAND core.  After an erase operation, the driver must
> mark bufferRAM invalid if it refers to the erased block.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com> 

I've pulled from the onenand git tree and applied this extra patch.

-- 
dwmw2
