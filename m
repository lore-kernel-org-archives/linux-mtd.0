Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vQuw-0001V4-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 22:45:47 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Flash driver probe/commandset separation.
References: <m33damuyn5.fsf@DLT.linuxnetworx.com> <Pine.LNX.4.33.0105021131120.1390-100000@xanadu.home> <5116.988817985@redhat.com> <17287.988926013@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 03 May 2001 15:45:52 -0600
In-Reply-To: David Woodhouse's message of "Thu, 03 May 2001 22:40:13 +0100"
Message-ID: <m3r8y6p0mn.fsf@DLT.linuxnetworx.com>
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

> ebiederman@lnxi.com said:
> >  Note there is a good argument for joining the probe paths Handling
> > chip interleaving, unless we can make it simple we don't want that
> > duplicated many times.
> 
> True. The build_cmd et al macros prevent duplication to a certain extent. 
> 
> > I'll try to have something working for 2 & 4 by the end of today.  Any
> > hints on why the cmdset drivers don't compile? 
> 
> I changed the chip driver registration stuff. They need to have a 
> struct mtd_chip_driver and set mtd->fldrv to point to it. 

I'll look I currently have the simply moved the destroy function into
cfi_probe.  

> And I'd like to 
> make the inter_module_xxx stuff go away completely - maybe they can 
> register with the code in chipreg instead, and get cfi_probe to look them 
> up that way. That can wait a little while though - I'm not sure that's the 
> correct approach (because they're not actually probes).

Right, but something smiliar code work.  Or we could make them serve
dual duty.  

Eric
