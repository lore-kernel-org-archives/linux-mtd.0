Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPAHs-00082S-E0
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 07:12:58 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6A77tWa032423
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jul 2009 03:07:55 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6A7Cmxr244090
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jul 2009 03:12:52 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6A7ClZM018963
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jul 2009 03:12:48 -0400
Subject: Re: [PATCH Resend2] Remove 'SBC8240 Wind River' Device Driver Code
From: Subrata Modak <subrata@linux.vnet.ibm.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <4A56DD51.5040703@gmail.com>
References: <20090701135247.27488.10776.sendpatchset@subratamodak.linux.ibm.com>
	<1246846628.5743.2.camel@subratamodak.linux.ibm.com>
	<1247205588.20721.353.camel@localhost.localdomain>
	<1247206539.6630.0.camel@subratamodak.linux.ibm.com>
	<4A56DD51.5040703@gmail.com>
Content-Type: text/plain
Date: Fri, 10 Jul 2009 12:42:41 +0530
Message-Id: <1247209961.6630.3.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: carolyn.j.smith@exgate.tek.com, Stephen Rothwell <sfr@canb.auug.org.au>,
	Linuxppc-dev <Linuxppc-dev@ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Jim Cromie <jim.cromie@gmail.com>,
	Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	linux-next <linux-next@vger.kernel.org>, linux-mtd@lists.infradead.org,
	Scott Wood <scottwood@freescale.com>, dwmw2@infradead.org,
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

On Fri, 2009-07-10 at 09:18 +0300, Artem Bityutskiy wrote:
> Subrata Modak wrote:
> > On Fri, 2009-07-10 at 08:59 +0300, Artem Bityutskiy wrote:
> >> On Mon, 2009-07-06 at 07:47 +0530, Subrata Modak wrote:
> >>> Hi,
> >>>
> >>> Is there somebody else whom i should also address to get an attention
> >>> for this patch ? I apolozise if i have not included someone. Kindly
> >>> connect to the concerned.
> >> I'm putting your patch to l2-mtd-2.6.git.
> > 
> > Thanks very much. Would i receive some automatic confirmation once it
> > make to Linus tree ?
> 
> I do not think so. I'm not MTD maintainer and in l2-mtd-2.6.git
> I just collect random patches, which the maintainer then usually
> takes from my tree.

Thanks. I just want this through before 2.6.31 stable is released, so
that the build fails does not occur on next trees based on that stable
one.

Regards--
Subrata

> 
