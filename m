Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8rZx-0000qo-PN
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 08:32:30 +0000
Subject: Re: [RFC] mxc nand controller updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20091112073630.GV30179@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1257925792.21596.858.camel@localhost>
	<20091112073630.GV30179@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Nov 2009 10:32:11 +0200
Message-Id: <1258101131.21596.1189.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vladimir Barinov <vova.barinov@gmail.com>, mathieu.berland@eads.com,
	jbe@pengutronix.de, linux-mtd@lists.infradead.org,
	Eric Benard <ebenard@eukrea.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-11-12 at 08:36 +0100, Sascha Hauer wrote:
> Hi Artem,
> 
> On Wed, Nov 11, 2009 at 09:49:52AM +0200, Artem Bityutskiy wrote:
> > On Wed, 2009-10-21 at 16:13 +0200, Sascha Hauer wrote:
> > > Hi all,
> > > 
> > > Here are several patches for the mxc nand controller. At the end
> > > of this series we are able to use this driver with the i.MX25/35
> > > SoCs. Please review and test if you do not want to see your boards
> > > break ;)
> > 
> > Just tried to pull your tree, but could not - there were confilicts.
> > Could you please provide a branch/patches against the mtd-2.6 tree?
> 
> I updated the tree, the branch is still the same.
> 
> Thanks
>   Sascha

I've pulled your stuff to my l2-mtd-2.6 tree to the dunno branch, so
there are less chances your pull request will be missed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
