From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1105569824.3896.44.camel@weaponx.rchland.ibm.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain
Date: Thu, 13 Jan 2005 07:54:15 +0000
Message-Id: <1105602855.30759.33.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 16:43 -0600, Josh Boyer wrote:
> CRCs are needed.  Or rather, some form of checksum is needed.  Bits flip
> during operation on NOR as well.  I've seen it happen.  It's rare, but
> as David put it in an IRC conversation "it's a sanity check on the
> hardware".

More than just the hardware -- it's not just bit flips. The name CRC is
often the canary which warns of corruption due to the arch having broken
fixups for misaligned loads/stores, for example.

Shit happens. You can either work that out for yourself, or just blindly
trust everything on the medium and end up with inconsistent data
structures and entirely bizarre and uninterpretable failure modes. 

-- 
dwmw2
