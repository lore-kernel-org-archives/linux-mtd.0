From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>
References: <00bf01c76c1c$36997820$c7a3580a@swcenter.sec.samsung.co.kr>
	<1174555734.17249.218.camel@sauron>
	<00f801c76cdd$164a9fb0$c7a3580a@swcenter.sec.samsung.co.kr>
	<46038887.6040301@nokia.com>
Subject: RE: [PATCH/RFC] OneNAND simulator support
Date: Fri, 23 Mar 2007 17:15:42 +0900
Message-ID: <010901c76d23$75fa0130$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <46038887.6040301@nokia.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> ext Kyungmin Park wrote:
> > To Adrian,
> > 
> > After patch http://git.infradead.org/?p=mtd-
> > 
> > It don't pass the oobtest since I assume oob passed at 
> first, but oobtest don't
> > do that.
> > Basically I optimizeed it for JFFS2. 
> > Do I revert it or do nothing? please give your opinion.
> 
> 
> How about this: (NB I haven't tried it but maybe it works ;-)
> 

Yes, it works well, it passed test on both onenand and simulator.
It works as I expected when use the JFFS2.
Thank you

I will commit it.

Thank you,
Kyungmin Park
