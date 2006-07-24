Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G4ync-0006d3-TE
	for linux-mtd@lists.infradead.org; Mon, 24 Jul 2006 07:40:40 -0400
Date: Mon, 24 Jul 2006 13:40:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Subject: Re: how to use jff2 on UBI layer?
Message-ID: <20060724114007.GB20849@wohnheim.fh-wedel.de>
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1153737968.16170.19.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org, haver@vnet.ibm.com,
	'Marteo Tim' <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 July 2006 14:46:08 +0400, Artem B. Bityutskiy wrote:
> On Thu, 2006-07-20 at 11:45 +0200, Jörn Engel wrote:
> > As of now, it is impossible, sorry.  UBI exports an interface
> > completely different from MTD, so JFFS2 cannot work on UBI.  What I
> > used was a glue layer, called gluebi, that converts the UBI interface
> > into an MTD interface.  But in its current form, that is still
> > unacceptable, so I'm working on changing the code.
> 
> IMO, it would be much saner to do the following:
> 
> Change JFFS2 and introduce I/O abstraction to it. E.g., add an io.c file
> with basic I/O functions like
> jffs2_read()/jffs2_write()/jffs2_point()/jffs2_erase(). Then you could
> add different I/O back-ends, like UBI. Note, even now we already have 2
> I/O back-ends: MTD and eCos. Then it would be a matter of adding one
> more I/O back-end - UBI.

Feel free to send a patch.

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
