Subject: Re: Node CRC failures in latest mainline git?
From: David Woodhouse <dwmw2@infradead.org>
To: Bill Gatliff <bgat@billgatliff.com>
In-Reply-To: <489379A2.3060205@billgatliff.com>
References: <48913EA3.9080603@billgatliff.com>
	<4891431D.7030009@billgatliff.com>
	<1217624390.3719.32.camel@shinybook.infradead.org>
	<489379A2.3060205@billgatliff.com>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 22:14:22 +0100
Message-Id: <1217625262.3719.34.camel@shinybook.infradead.org>
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

On Fri, 2008-08-01 at 16:01 -0500, Bill Gatliff wrote:
> Well, it's a bazillion bad node CRCs, approximately.  But I don't know if that's
> why it doesn't mount, or not.  I haven't managed to catch the message--- if
> there is one.

More than the older kernels? If so, I suspect something broke in your
flash bus setup. Can you make it dump the first node it fails the CRC
on, and compare with what you read under a good kernel?

-- 
dwmw2
