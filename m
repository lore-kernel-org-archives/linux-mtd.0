Date: Mon, 19 Jul 2004 15:24:45 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?=Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <1090246707.13401.18.camel@famine>
Message-ID: <Pine.LNX.4.58.0407191522360.4985@localhost.localdomain>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
	<1089759689.8822.18.camel@imladris.demon.co.uk>
	<1089792912.7607.22.camel@famine> <1090246707.13401.18.camel@famine>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: 8BIT
Cc: linux-mtd@lists.infradead.org, ecos-discuss@sources.redhat.com
Subject: Re: JFFS2 eats memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 Jul 2004, [ISO-8859-1] ØyvindHarboe wrote:

> It crashes during garbage collect.
> 
> How does this fix look?

Suboptimal. You refrain from freeing if(jeb->gc_node) but that's going to 
mean that every time GC frees such a node you're not claiming the memory 
back? Can't you adjust gc_node instead?

Standard comments about 8-char indentation and "==NULL" being horrid also 
apply :)

-- 
dwmw2
