Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8cCp-0005rO-1B
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2005 05:44:51 -0500
Date: Tue, 8 Mar 2005 11:44:52 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gareth Bult <gareth@linux.co.uk>
Message-ID: <20050308104452.GA3508@wohnheim.fh-wedel.de>
References: <1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
	<20050307210745.GD26318@wohnheim.fh-wedel.de>
	<1110231980.11310.40.camel@squizzey.bult.co.uk>
	<20050307220138.GF26318@wohnheim.fh-wedel.de>
	<1110234038.11284.62.camel@squizzey.bult.co.uk>
	<20050307224238.GH26318@wohnheim.fh-wedel.de>
	<1110278011.11697.17.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110278011.11697.17.camel@squizzey.bult.co.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 March 2005 10:33:31 +0000, Gareth Bult wrote:
> 
> would make a lot of sense.
> 
> At the end of the day and at the moment, I'm probably the only one using
> the new driver so it's really not an issue .. I was really just talking
> about "good form" when releasing updates ..

I largely agree with the "good form" aspect.  Trouble with mtd is that
some of the interfaces are really broken.  And for user-visible
interfaces, there is no sane way to change them - ever.  So I
implemented a new interface, trying to make that one as good as
possible.

So I'll add the rename option and code.

Jörn

-- 
When I am working on a problem I never think about beauty.  I think
only how to solve the problem.  But when I have finished, if the
solution is not beautiful, I know it is wrong.
-- R. Buckminster Fuller
