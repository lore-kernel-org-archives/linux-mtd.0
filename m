Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kUC3-0006Lc-Vy
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 20:43:32 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: llandre <r&d@wawnet.biz>
References: <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
	<5.2.1.1.0.20030805091433.00c4e370@192.168.2.1>
In-Reply-To: <5.2.1.1.0.20030805091433.00c4e370@192.168.2.1>
MIME-Version: 1.0
Message-Id: <20030806194320.68FDE14DF8@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: yaffs@toby-churchill.org
Subject: Re: Can't load yaffs.o (unresolved symbol __get_mtd_device)
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 06 Aug 2003 19:43:33 -0000

On Tuesday 05 August 2003 19:28, llandre wrote:
> > > I'm using recent YAFFS sources downloaded via CVS on Aug, 1st with the
> > > kernel linuxppc_devel_2.4.21-pre5.
> > > I succesfully built the yaffs module but I can't load it with the
> > > insmod command.
> > >
> > > Here what I get when trying to load:
> > >
> > > bash-2.05# /sbin/insmod -v yaffs.o
> > > Using yaffs.o
> > > Symbol version prefix ''
> > > yaffs.o: unresolved symbol __get_mtd_device
> > > bash-2.05#
> > >
> > > In the kernel's symbol list (System.map) I see the get_mtd_device
> > > symbol. Why does the dynamic linker add two underscores '__'?
> > > How to solve the problem?
> >
> >I think you are using an inconsistent version of mtd.
> >
> >The mtd I have here (definitely not the latest!) exports the symbol
> >__get_mtd_device from mtdcore.c
>
> Charles,
>
> could you kindly send me the mtd you work with or tell me where I can
> download it?
>

I would suggest you resolve the real problem.

What is happening is that:


Old code that exports __get_mtd_device
```````````````````````````````````````````````````````````````
yaffs calles get_mtd_device()
get_mtd_device()  is a wrapper for __get_mtd_device
__get_mtd_device is exported by mtd


New code that exports get_mtd_device
```````````````````````````````````````````````````````````````
yaffs calles get_mtd_device()
get_mtd_device is exported by mtd

Thus it seems the  mtd header files you are including are inconsistent with 
the mtd you have in the kernel. Likely the cure is just fixing up your 
include paths.

Just 'bypassing' the problem is likely to create further (hidden) problems.

Hope that helps
-- CHarles
