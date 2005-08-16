Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E53oT-0002e0-Jh
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 11:57:22 -0400
Date: Tue, 16 Aug 2005 17:57:03 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vitaly Bordug <vbordug@ru.mvista.com>
Message-ID: <20050816155703.GA21462@wohnheim.fh-wedel.de>
References: <200508161441.KAA07341@www21.ureach.com>
	<43020232.60908@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43020232.60908@ru.mvista.com>
Cc: manboot@ureach.com, linux-mtd@lists.infradead.org
Subject: Re: Intel NOR flash(P30) query
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 August 2005 19:11:46 +0400, Vitaly Bordug wrote:
> 
> I'm not an MTD guru, but...

No shame in that.

> Manjula D wrote:
> >Hi All,
> >Iam a newbie to mtd. We have a MPC8272 custom board with INTEL
> >TE28F640P30B85 (P30-CFI compilant)NOR boot Flash and NAND flash
> >with JFFS2 filesystem running linux-2.4.20-8.
> >The NOR Flash need not have any partition/filesystem.
> >My requirement is to have an application to copy an image from
> >the NAND Flash to the NOR Flash.
> >My current understanding is 
> >Under RAM/ROM/Flash chip drivers on selecting, 
> >Detect flash chips by Common Flash Interface (CFI) probe :
> >  cfi_probe_init() will register with the mtd_chip_driver.
> >Support for Intel/Sharp flash chips:
> >  cfi_cmdset_0001.c contains the list of commands supported by
> >  Intel.
> >  
> >1) I need to understand how the application views the NOR flash
> >    once it is registered as a mtd device.
> The answer is trivial - as mtd device. You can enable support for mtd as 
> character or block devices - thus you will have say /dev/mtdchar1 to 
> work from your application.

Almost correct.  See:
http://www.linux-mtd.infradead.org/faq/general.html

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
