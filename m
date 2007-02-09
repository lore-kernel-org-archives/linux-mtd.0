Subject: Re: [PATCH] [MTD] [NAND] Correctly validate out-of-band offset and
	length
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <45C0BCA5.40807@nokia.com>
References: <45C0BCA5.40807@nokia.com>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 15:02:55 +0000
Message-Id: <1171033375.29713.45.camel@pmac.infradead.org>
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

On Wed, 2007-01-31 at 17:58 +0200, Adrian Hunter wrote:
> Add checks to ensure that out-of-band reads and writes are
> not attempted with an invalid offset or length.  Specifically,
> the offset must be less than the size of oob for a page
> and the length must not go beyond the size of the device.
> Additionally the checks must adjust for auto-placement
> (MTD_OOB_AUTO) of oob data.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com> 

Applied; thanks.

-- 
dwmw2
