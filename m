Received: from carisma.slowglass.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184IHA-0000Lg-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 10:58:08 +0100
Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 184IkA-0000Yr-00
	for linux-mtd@lists.infradead.org; Wed, 23 Oct 2002 11:28:06 +0100
Date: Wed, 23 Oct 2002 12:27:09 +0200
From: Frank Neuber <neuber@convergence.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021023102709.GA28181@jupiter>
References: <20021018104910.GA11807@jupiter> <26791.1034943288@passion.cambridge.redhat.com> <20021019164445.GA9364@wohnheim.fh-wedel.de> <20021022103936.GA24369@jupiter> <20021022170803.GA9161@wohnheim.fh-wedel.de> <20021023094928.GA27905@jupiter> <20021023100618.GB13926@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021023100618.GB13926@wohnheim.fh-wedel.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, Oct 23, 2002 at 12:06:19PM +0200, Jörn Engel wrote:
> On Wed, 23 October 2002 11:49:28 +0200, Frank Neuber wrote:
> > > Ok, enough rambling. Try this patch:
> > > http://wh.fh-wedel.de/~joern/software/kernel/mtd.patch.mphysmap.2.4.19-untested
> > But this is not what I need :-(
> 
> Argl! Sorry, my bad. Try the attached file instead.
Ahh, much more better. This is a good starting point. Thanks!
I try to make this more generic (if time left :-)))

 Frank
-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
