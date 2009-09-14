Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MnCX1-0006CK-PR
	for linux-mtd@lists.infradead.org; Mon, 14 Sep 2009 14:27:56 +0000
Subject: Re: UBIFS Error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: JerinJacob <jerin.jacob@maxim-ic.com>
In-Reply-To: <4AAA4005.9080707@maxim-ic.com>
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>
	<4AAA4005.9080707@maxim-ic.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Sep 2009 17:27:20 +0300
Message-Id: <1252938440.5060.102.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > And finally, could you please try to reproduce this problem with
> > nandsim:
> > http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim
> >   
>  >>> Unfortunately, I couldn't reproduce the problem with nandsim.It 
> works with nansim.
> However i couldn't test with 1GiB nandsim as it needs 1GiB ram.Tested 
> with 512MiB nandsim.
> 
> I guess it is a could be data corruption either in platform  specific 
> driver or ubifs.
> Is there any way we can validate the platform specific nand driver ?
> Please let me know your views on this?
> 
> Actually we are in the process of migrating from yaffs to ubifs, The 
> same test application works  with
> yaffs as well.

I've created this piece of documentation for you:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

Please, validate your flash driver/HW.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
