Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184IB6-0000I9-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 10:51:52 +0100
Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 183wXZ-0005mF-00
	for linux-mtd@lists.infradead.org; Tue, 22 Oct 2002 11:45:37 +0100
Date: Tue, 22 Oct 2002 12:39:36 +0200
From: Frank Neuber <neuber@convergence.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021022103936.GA24369@jupiter>
References: <20021018104910.GA11807@jupiter> <26791.1034943288@passion.cambridge.redhat.com> <20021019164445.GA9364@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021019164445.GA9364@wohnheim.fh-wedel.de>
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

On Sat, Oct 19, 2002 at 06:44:45PM +0200, Jörn Engel wrote:
> On Fri, 18 October 2002 13:14:48 +0100, David Woodhouse wrote:
> > neuber@convergence.de said:
> > > Now I'm looking for the same feature to pass the physically
> > > informations to the kernel (struct map_info). I could add this simply
> > > to the cmdline.c file based on the parse_cmdline_partitions function.
> > 
> > That seems like a relatively sensible addition to physmap.c. You could make 
> > it take the probe type that way too...
> > 
> >  'physmap=0xe0000000,0x100000,16,cfi'
> 
> Hmm, somewhere in my collection of yet-to-be-committed patches, I have
> a variant of the physmap driver that does exactly this and is capable
> of mapping up to eight independent devices. Interested?
> 
Yes, it would be nice to test your code :-)
Maybe we can do this more generic to add this to cmdline.c.
What do you think?
 Frank

-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
