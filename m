Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jwFi-0001sS-Og
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 08:29:02 +0100
Message-Id: <5.2.1.1.0.20030805091433.00c4e370@192.168.2.1>
Date: Tue, 05 Aug 2003 09:28:27 +0200
To: manningc2@actrix.gen.nz
From: llandre <r&d@wawnet.biz>
In-Reply-To: <20030804205021.A547E4AF4@blood.actrix.co.nz>
References: <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
 <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: yaffs@toby-churchill.org
cc: linux-mtd@lists.infradead.org
cc: bakker@thorgal.et.tudelft.nl
Subject: Re: Can't load yaffs.o (unresolved symbol __get_mtd_device)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > I'm using recent YAFFS sources downloaded via CVS on Aug, 1st with the
> > kernel linuxppc_devel_2.4.21-pre5.
> > I succesfully built the yaffs module but I can't load it with the insmod
> > command.
> >
> > Here what I get when trying to load:
> >
> > bash-2.05# /sbin/insmod -v yaffs.o
> > Using yaffs.o
> > Symbol version prefix ''
> > yaffs.o: unresolved symbol __get_mtd_device
> > bash-2.05#
> >
> > In the kernel's symbol list (System.map) I see the get_mtd_device symbol.
> > Why does the dynamic linker add two underscores '__'?
> > How to solve the problem?
>
>I think you are using an inconsistent version of mtd.
>
>The mtd I have here (definitely not the latest!) exports the symbol
>__get_mtd_device from mtdcore.c

Charles,

could you kindly send me the mtd you work with or tell me where I can 
download it?


> >
> > Thanx in advance and best regards.
> >
> > PS: I posted the message to the YAFFS's ml too, but unfortunately I got no
> > answers :-(
>
>Sorry I have been very ill the last two weeks.

Sorry for my unkind statement. I did not mean to pretend an answer but I 
incorrectly thought this mailing list was almost abandoned (I clearly made 
a terrible mistake!). Is it a available on the web an archive (something 
like The linux-mtd Archives)?

I apologize again and I thank for your help.


llandre  
