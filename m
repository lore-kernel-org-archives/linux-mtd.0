Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EcjaO-0007sW-Te
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 08:13:58 -0500
Date: Thu, 17 Nov 2005 14:13:57 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Jander <david.jander@protonic.nl>
Message-ID: <20051117131357.GA26258@wohnheim.fh-wedel.de>
References: <200511171227.20593.david.jander@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200511171227.20593.david.jander@protonic.nl>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Performance of wear-levelling in JFFS2.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 November 2005 13:27:20 +0200, David Jander wrote:
> 
> I am wondering about how good wear-levelling really is in JFFS2. I have made 
> an experiment which ended with a "MTD do_write_buffer(): software timeout", 
> which really looks like flash is taking too long to write data because of it 
> beeing near end of life.

Nice experiment, although "really looks like" is not exactly a
comparable result.  How about changing one of the ram test drivers to
count the number of erases per block, let the experiment run for a
while and then print those number?

Jörn

-- 
Mac is for working, 
Linux is for Networking, 
Windows is for Solitaire! 
-- stolen from dc
