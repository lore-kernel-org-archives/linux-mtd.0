Subject: Re: cfi_{build,send_gen}_cmd bloats, how to uninline?
From: David Woodhouse <dwmw2@infradead.org>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@helsinki.fi>
In-Reply-To: <Pine.LNX.4.64.0805061305270.1888@wrl-59.cs.helsinki.fi>
References: <Pine.LNX.4.64.0805030002240.3985@wrl-59.cs.helsinki.fi>
	<1210068189.25560.759.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0805061305270.1888@wrl-59.cs.helsinki.fi>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 May 2008 14:18:16 +0100
Message-Id: <1210079896.25560.764.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-05-06 at 13:56 +0300, Ilpo Järvinen wrote:
> > Were you testing with only a single interleave/bankwidth enabled, or did
> > you have them all supported? It's the single-geometry case where we 
> > expect it to all fall out and the inlines to be really trivial.
> 
> I had allyesconfig-like setting (minus some DEBUG configs), so I suppose 
> it had all of them? 
> 
> Is there still something else related than those MAP_BANK_WIDTH_xx and 
> MTD_CFI_Ix I should tune if I want to verify that things really become 
> as trivial as expected (I'll have to this ain't the most simplest case
> to understand :-))?

Nope. Just set precisely one MAP_BANK_WIDTH_xx and precisely once
MTD_CFI_Ix, and it should be a lot smaller. Both set to 1 should be the
smallest.

> > I suspect that we should make the inlining optional though -- a lot of
> > people are building generic kernels with CFI support these days, or just
> > not bothering to optimise their config.
> 
> It would definately be a good thing to find out some arrangement to such 
> case too, worst case offender was 60k in some skbuff.h function, these 
> are of the same magnitude.
> 
> For me it's not even clear if in practical cases only one of them would be 
> strictly necessary? ...Many of the defconfigs seem to have a handful of 
> them enabled, leaving considerable amount of code there (though I doubt  
> that defconfigs are a good measure for anything). Because of a 
> considerable number of call sites, even a small per site bloat easily 
> grows to mind-boggling numbers.

Yep. I'd certainly be interested in a patch which moves these out of
line, as long as it doesn't screw up the simple one-geometry case. 

I suspect that once we start building with '--combine -fwhole-program'
the compiler should be able to get this right for itself.

-- 
dwmw2
