Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mr4uV-0004fB-Eh
	for linux-mtd@lists.infradead.org; Fri, 25 Sep 2009 07:08:11 +0000
Subject: Re: UBIFS and hardware ECC of all FF pages of MLC NAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4ABB921B.8090500@parrot.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com>  <4ABB921B.8090500@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Sep 2009 10:05:09 +0300
Message-Id: <1253862309.3778.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Darwin Rambo <drambo@broadcom.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-24 at 17:36 +0200, Matthieu CASTET wrote:
> Adrian Hunter a écrit :
> > Darwin Rambo wrote:
> > 
> >> 2. for initial downloading, should an ECC be programmed on all FF data pages? Is there any correction advantage?
> > 
> > In your case, as you have discovered, you must not program ECC for FF pages at
> > the end of eraseblocks.
> > 
> The tricky part is when you read FF pages with ecc in mtd. You will get
> an ecc error.
> 
> If the ecc writing is done on software you can always xor the ecc code
> to make it "FF for FF data".
> But if everything is done by hardware...

Right, which means the UBI/UBIFS flasher should be smart and skip
0xFF-ed NAND pages at the end of eraseblocks. This adds some complexity
to the flasher, thought. And here:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_format_det

I even described in details the flashing algorithm with my limited
English vocabulary :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
