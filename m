Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPBwS-0001Yw-3H
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 08:59:00 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6A8rhdQ020883
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jul 2009 04:53:43 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6A8wpWh256082
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jul 2009 04:58:51 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6A8woSl003190
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jul 2009 04:58:50 -0400
Subject: Re: [PATCH Resend2] Remove 'SBC8240 Wind River' Device Driver Code
From: Subrata Modak <subrata@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1247216007.29541.2.camel@macbook.infradead.org>
References: <20090701135247.27488.10776.sendpatchset@subratamodak.linux.ibm.com>
	<1246846628.5743.2.camel@subratamodak.linux.ibm.com>
	<1247205588.20721.353.camel@localhost.localdomain>
	<1247206539.6630.0.camel@subratamodak.linux.ibm.com>
	<4A56DD51.5040703@gmail.com>
	<1247209961.6630.3.camel@subratamodak.linux.ibm.com>
	<1247210095.20721.362.camel@localhost.localdomain>
	<1247215625.6630.6.camel@subratamodak.linux.ibm.com>
	<1247216007.29541.2.camel@macbook.infradead.org>
Content-Type: text/plain
Date: Fri, 10 Jul 2009 14:28:44 +0530
Message-Id: <1247216324.6630.10.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: carolyn.j.smith@exgate.tek.com, Stephen Rothwell <sfr@canb.auug.org.au>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Jim Cromie <jim.cromie@gmail.com>,
	Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	linux-next <linux-next@vger.kernel.org>, linux-mtd@lists.infradead.org,
	Linuxppc-dev <Linuxppc-dev@ozlabs.org>,
	Scott Wood <scottwood@freescale.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-10 at 09:53 +0100, David Woodhouse wrote:
> On Fri, 2009-07-10 at 14:17 +0530, Subrata Modak wrote:
> > Is it possible to get this patch through and before 2.6.31 stable is
> > released ?
> 

Hi David,

> Hm, I was ignoring this until I was sure all the last-minute fixes for
> 2.6.31 were out of the way; I was planning to submit it for 2.6.32.
> 
> Do we really need to submit it for 2.6.31? It's not a regression, is it?
> It's been like this for _ages_.

True. But it gives annoying build fails on randconfig next trees. And
we(Sachin & myself) has been reporting it from March/April. If you feel
there is still room to be pushed to 2.6.31, then please do it. Else,
2.6.32 will be fine. Thanks for your support.

Regards--
Subrata

> 
