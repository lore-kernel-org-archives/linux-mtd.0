Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vMxs-0001BJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 18:32:32 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org,
        ahennessy@mvista.com, ds@schleef.org, jonas.holmberg@axis.com,
        cwryu@debian.org, eauth@softsys.co.at
Subject: Re: Flash driver probe/commandset separation.
References: <Pine.LNX.4.33.0105021131120.1390-100000@xanadu.home> <5116.988817985@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 03 May 2001 11:32:14 -0600
In-Reply-To: David Woodhouse's message of "Wed, 02 May 2001 16:39:45 +0100"
Message-ID: <m33damuyn5.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> nico@cam.org said:
> >  Personally I think it would be best to send the curent code to Linus
> > and resend another update eventually when the new stuff would have
> > been proven stable.
> 
> > 	"release early, release often" 
> 
> Yes, you're probably right.
> 
> TODO list then:
> 
> 	1. Make cfi_cmdset_000[12].c compile again :)
> 	2. Fix the partition stuff as discussed, removing VIRTUAL_ER
> 	3. Sanity check DiskOnChip and NFTL drivers. 
        4. Don't hardcode the cmdset in cfi_jedec.

I keep using very different flash chips so I want one probe path for
all of the chips looks good. 

Note there is a good argument for joining the probe paths
Handling chip interleaving, unless we can make it simple
we don't want that duplicated many times.

I'll try to have something working for 2 & 4 by the end of today.  Any
hints on why the cmdset drivers don't compile?

Eric
