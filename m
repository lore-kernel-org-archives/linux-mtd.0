Received: from co203.xi-lite.net ([149.6.83.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqqNW-0003Rf-2z
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 15:37:10 +0000
Message-ID: <4ABB921B.8090500@parrot.com>
Date: Thu, 24 Sep 2009 17:36:59 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: UBIFS and hardware ECC of all FF pages of MLC NAND
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com>
In-Reply-To: <4ABB7224.8000804@nokia.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	Darwin Rambo <drambo@broadcom.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter a écrit :
> Darwin Rambo wrote:
> 
>> 2. for initial downloading, should an ECC be programmed on all FF data pages? Is there any correction advantage?
> 
> In your case, as you have discovered, you must not program ECC for FF pages at
> the end of eraseblocks.
> 
The tricky part is when you read FF pages with ecc in mtd. You will get
an ecc error.

If the ecc writing is done on software you can always xor the ecc code
to make it "FF for FF data".
But if everything is done by hardware...


Matthieu
