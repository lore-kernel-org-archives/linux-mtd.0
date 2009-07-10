Subject: Re: [PATCH Resend2] Remove 'SBC8240 Wind River' Device Driver Code
From: David Woodhouse <dwmw2@infradead.org>
To: subrata@linux.vnet.ibm.com
In-Reply-To: <1247215625.6630.6.camel@subratamodak.linux.ibm.com>
References: <20090701135247.27488.10776.sendpatchset@subratamodak.linux.ibm.com>
	<1246846628.5743.2.camel@subratamodak.linux.ibm.com>
	<1247205588.20721.353.camel@localhost.localdomain>
	<1247206539.6630.0.camel@subratamodak.linux.ibm.com>
	<4A56DD51.5040703@gmail.com>
	<1247209961.6630.3.camel@subratamodak.linux.ibm.com>
	<1247210095.20721.362.camel@localhost.localdomain>
	<1247215625.6630.6.camel@subratamodak.linux.ibm.com>
Content-Type: text/plain
Date: Fri, 10 Jul 2009 09:53:27 +0100
Message-Id: <1247216007.29541.2.camel@macbook.infradead.org>
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
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-10 at 14:17 +0530, Subrata Modak wrote:
> Is it possible to get this patch through and before 2.6.31 stable is
> released ?

Hm, I was ignoring this until I was sure all the last-minute fixes for
2.6.31 were out of the way; I was planning to submit it for 2.6.32.

Do we really need to submit it for 2.6.31? It's not a regression, is it?
It's been like this for _ages_.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
