Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0rNq-0006M3-N2
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 06:42:55 +0000
Date: Thu, 22 Oct 2009 08:42:42 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on
	oopses and panics
Message-ID: <20091022084242.6d559ed8@marrow.netinsight.se>
In-Reply-To: <1256193368.29856.466.camel@localhost>
References: <20091015093133.GF10546@elte.hu>
	<20091015161052.0752208e@marrow.netinsight.se>
	<20091015154640.GA11408@elte.hu>
	<20091016094601.4e2c2d3e@marrow.netinsight.se>
	<20091016080935.GA3895@elte.hu>
	<1255681467.32489.360.camel@localhost>
	<20091016112556.6902b2dc@marrow.netinsight.se>
	<20091016101045.GA3263@elte.hu>
	<20091016140918.3981cfa2@marrow.netinsight.se>
	<1255952922.32489.505.camel@localhost>
	<20091019125017.GA9030@elte.hu>
	<alpine.LFD.2.00.0910220832580.9771@eeepc.linux-foundation.org>
	<20091022082500.602f9a7d@marrow.netinsight.se>
	<1256193368.29856.466.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Removing some people from Cc:)

On Thu, 22 Oct 2009 09:36:08 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > I would put it all through Artems MTD tree then so that we keep the new
> > API and the user of it close together then.
> 
> It's dwmw2's tree actually. I just act as his secretary :-)
> 
> David, could you push this patch to your tree? Ingo's and Linus' acks
> are there, AFAIU.

I know it's Davids tree :-)

I just thought it would be a good idea to keep everything together
through your tree first before asking David to merge it.


But it's better to take in only the core patch first as you suggest.

// Simon
