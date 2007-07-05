Subject: RE: Nand dump Jffs2
From: David Woodhouse <dwmw2@infradead.org>
To: Eric <liuhxshanghai@263.net>
In-Reply-To: <20070705063927.E85B615DF8A@smtp.263.net>
References: <20070705063927.E85B615DF8A@smtp.263.net>
Content-Type: text/plain
Date: Thu, 05 Jul 2007 10:02:33 -0400
Message-Id: <1183644153.2797.3.camel@shinybook.infradead.org>
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

On Thu, 2007-07-05 at 14:38 +0800, Eric wrote:
> It seems that  kernel v2.4.27 does not take the advantage of Nand
> flash OOB area at all. I donnot know if this is true. 

The 2.4 kernel does not support NAND flash at all, IIRC. Certainly JFFS2
in the 2.4 kernel does not.

-- 
dwmw2
