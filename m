From: David Woodhouse <dwmw2@infradead.org>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <1065460247.1884.188.camel@hermes>
References: <200310060645.BAA09508@lists.linuxppc.org>
	 <1065460247.1884.188.camel@hermes>
Content-Type: text/plain
Message-Id: <1065460574.22491.243.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 06 Oct 2003 18:16:14 +0100
Content-Transfer-Encoding: 7bit
cc: j.murali@gdatech.co.in
cc: linux-mtd@lists.infradead.org
cc: linuxppc embedded <linuxppc-embedded@lists.linuxppc.org>
Subject: Re: cfi probe for two different flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-10-06 at 11:10 -0600, Gary Thomas wrote:
> This question would be best asked of the MTD folks (cc'd), but I think
> you'll need a customized "map" function that recognizes these two FLASH
> device types and creates the appropriate MTD sub-devices appropriately.

What Gary said.

If you poke around in drivers/mtd/maps you'll find useful examples of
such, including how to concatenate them together into one logical MTD
device and have a file system spanning them both, etc.

-- 
dwmw2
