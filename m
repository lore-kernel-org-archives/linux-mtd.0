Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bmwwu-0001lE-1O
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 11:54:36 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <1090337308.15094.2.camel@famine>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
	<1089759689.8822.18.camel@imladris.demon.co.uk>
	<1089792912.7607.22.camel@famine> <1090246707.13401.18.camel@famine>
	<Pine.LNX.4.58.0407191522360.4985@localhost.localdomain>
	<1090250145.14173.3.camel@famine>
	<1090285839.4149.8.camel@localhost.localdomain>
	<1090305682.14825.2.camel@famine>
	<1090331120.4614.3.camel@localhost.localdomain>
	<1090337308.15094.2.camel@famine>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jul 2004 11:54:29 -0400
Message-Id: <1090338869.4614.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2004-07-20 at 17:28 +0200, Øyvind Harboe wrote:
> tir, 20.07.2004 kl. 15.45 skrev David Woodhouse:
> > On Tue, 2004-07-20 at 08:41 +0200, Øyvind Harboe wrote:
> > > What if gc_node points to the last node?
> > 
> > Then you just finished garbage collecting the eraseblock in question.
> > You should have a single node which is now first_node and last_node, and
> > which is obsolete. You can just set gc_node to NULL.
> 
> Setting gc_node to NULL crashed when I tried it.

Crashed how? It should be trivially fixable.

-- 
dwmw2
