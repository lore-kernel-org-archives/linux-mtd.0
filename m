From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4162AABC.9060809@yandex.ru>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<416127B7.3070505@yandex.ru>
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>
	<41614B2F.8060901@yandex.ru>
	<1096895892.30942.614.camel@hades.cambridge.redhat.com>
	<41615BA7.60801@yandex.ru>
	<1096899817.30942.618.camel@hades.cambridge.redhat.com>
	<4162AABC.9060809@yandex.ru>
Content-Type: text/plain
Message-Id: <1096994744.30942.905.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 05 Oct 2004 17:45:44 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-10-05 at 18:07 +0400, Artem B. Bityuckiy wrote:
> Hello David, Josh. What did we decided about the GC thread?
> 
> I offered to create checkpoints from the GC thread. Are there some 
> reasons not to do so? There was one - the GC thread isn't always 
> enabled. But we may require it be enabled if checkpoints are enabled...

Checkpoints are an optimisation -- so is the GC thread. I'm perfectly
happy with the idea that killing the GC thread also stops checkpoints
from happening.

> May be we create ICP during GC process, or on iget() call, or on
> iput() call? But I have arguments against these...

I was thinking of doing it during a normal write to the file, or during
garbage collection of a node belonging to the file.

But I think we can play with ideas on _when_ to call this once you've
actually implemented the functions which does it :)

-- 
dwmw2
