From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1124758473.29360.0.camel@windu.rchland.ibm.com>
References: <0ILH00A5RUY3DW@mmp1.samsung.com>
	<1124613404.3407.31.camel@localhost.localdomain>
	<1124758473.29360.0.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Tue, 23 Aug 2005 09:06:02 +0100
Message-Id: <1124784363.5248.43.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: LTP fs test results on OneNAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-08-22 at 19:54 -0500, Josh Boyer wrote:
> Isn't fsx-linux part of the LTP now?

Yes, although LTP by default invokes it in a mode which tries shared
writable mmap, and fails quite quickly.

-- 
dwmw2
