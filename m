From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Liao <kevinliao@iei.com.tw>
In-Reply-To: <013301c3acf4$8d3033d0$f80a10ac@rdkevinliaonb>
References: <013301c3acf4$8d3033d0$f80a10ac@rdkevinliaonb>
Content-Type: text/plain
Message-Id: <1069065133.4490.53.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 17 Nov 2003 10:32:14 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Garbage collection problem for nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-11-17 at 18:21 +0800, Kevin Liao wrote:

> jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they all?
> jffs2: Couldn't find erase block to garbage collect!
> 
> It seems that the file content is still correct. Does anyone know what's
> wrong with it? Thanks a lot.

It's a harmless complaint which can probably just be disabled. A short
while after you write to the flash, we decide to flush the write-buffer.
We prefer to do that by garbage-collection rather than just by padding
it out with zeroes.... but as the message says, there's nothing to GC
from. So we pad it instead.

-- 
dwmw2
