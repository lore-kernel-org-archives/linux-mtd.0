Subject: Re: Unlocking with Intel J3 series flash
From: David Woodhouse <dwmw2@infradead.org>
To: MikeW <mw_phil@yahoo.co.uk>
In-Reply-To: <loom.20070731T181922-722@post.gmane.org>
References: <20070731153547.GA24705@marvin.netwinder.org>
	<loom.20070731T181922-722@post.gmane.org>
Content-Type: text/plain
Date: Tue, 31 Jul 2007 22:33:17 +0100
Message-Id: <1185917597.3083.127.camel@pmac.infradead.org>
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

On Tue, 2007-07-31 at 16:23 +0000, MikeW wrote:
> It would be nice to keep pejorative and uninformative naming
> out of the codebase - may I suggest MTD_POWERON_LOCK and
> MTD_CHIP_UNLOCK.
> 
> But you get the idea - STUPID tells you nothing except the lack of
> patience of the originator ;) 

It's true. Who knew Intel would come up with _more_ ways of breaking
locking, thus making MTD_STUPID_LOCK ambiguous? :)

-- 
dwmw2
