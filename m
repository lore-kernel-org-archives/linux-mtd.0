From: David Woodhouse <dwmw2@infradead.org>
To: "Chagas, Jason" <jason.chagas@intel.com>
In-Reply-To: <BF1FE1855350A0479097B3A0D2A80EE0025ACFE3@hdsmsx402.hd.intel.com>
References: 
	 <BF1FE1855350A0479097B3A0D2A80EE0025ACFE3@hdsmsx402.hd.intel.com>
Content-Type: text/plain
Message-Id: <1077182464.18703.310.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 19 Feb 2004 09:21:05 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Chaining "mtd_info->read" failed !
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-17 at 22:49 -0500, Chagas, Jason wrote:
> Note, "my_read" simply chains the original 'read' function call in the
> "mtd_info" structure. Should have been simple enough, however, when
> accessing flash, "my_read" receives a series of repeated messages with
> exactly the same values in "loff_t from" and "size_t len" until the
> kernel hangs and the kernel heartbeat LED stops blinking.  BTW, "size_t
> len" is equal to zero.
> 
> Am I missing something? Any ideas?

Sounds like your function is calling itself recursively till it uses up
all the kernel stack and dies.

-- 
dwmw2
