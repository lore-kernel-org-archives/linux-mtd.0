Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWCaJ-0008VN-6i
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 06:43:07 -0500
From: Ian Campbell <icampbell@arcom.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1101121532.8191.7437.camel@hades.cambridge.redhat.com>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
	<1100962661.8600.41.camel@localhost.localdomain>
	<20041120163510.GD7984@ku-gbr.de>
	<1100968467.7949.8.camel@localhost.localdomain>
	<1101119250.2922.276.camel@icampbell-debian>
	<1101120637.2922.283.camel@icampbell-debian>
	<1101121532.8191.7437.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Mon, 22 Nov 2004 11:42:07 +0000
Message-Id: <1101123727.2922.292.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-22 at 11:05 +0000, David Woodhouse wrote:
> On Mon, 2004-11-22 at 10:50 +0000, Ian Campbell wrote:
> > Gah! Looks like I spoke to soon. Even with both of these patches I still
> > see the BUG_ON, I've turned off pre-empt as well.
> 
> Quick fix... 

It's looking good. Many thanks!
Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
