Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jmHq-0000QT-Bu
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 21:50:34 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: llandre <r&d@wawnet.biz>, linux-mtd@lists.infradead.org
Date: Tue, 5 Aug 2003 08:54:30 +1200
References: <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
In-Reply-To: <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
MIME-Version: 1.0
Message-Id: <20030804205021.A547E4AF4@blood.actrix.co.nz>
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

On Monday 04 August 2003 21:18, llandre wrote:
> Hi all,
>
> I'm using recent YAFFS sources downloaded via CVS on Aug, 1st with the
> kernel linuxppc_devel_2.4.21-pre5.
> I succesfully built the yaffs module but I can't load it with the insmod
> command.
>
> Here what I get when trying to load:
>
> bash-2.05# /sbin/insmod -v yaffs.o
> Using yaffs.o
> Symbol version prefix ''
> yaffs.o: unresolved symbol __get_mtd_device
> bash-2.05#
>
> In the kernel's symbol list (System.map) I see the get_mtd_device symbol.
> Why does the dynamic linker add two underscores '__'?
> How to solve the problem?

I think you are using an inconsistent version of mtd.

The mtd I have here (definitely not the latest!) exports the symbol 
__get_mtd_device from mtdcore.c

>
> Thanx in advance and best regards.
>
> PS: I posted the message to the YAFFS's ml too, but unfortunately I got no
> answers :-(

Sorry I have been very ill the last two weeks.

-- CHarles
