Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hsjar-0006e6-2b
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 14:05:38 -0400
Date: Mon, 28 May 2007 21:07:13 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
To: dedekind@infradead.org
Subject: Re: Some issues with the AT91 dataflash driver...
Message-ID: <20070528210713.7365ef34@newbox>
In-Reply-To: <1180374280.3642.114.camel@sauron>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 28 May 2007 20:44:40 +0300
Artem Bityutskiy wrote:

> On Sun, 2007-05-27 at 21:12 +0200, Haavard Skinnemoen wrote:
> > On Sun, 27 May 2007 20:08:53 +0200
> > Haavard Skinnemoen <hskinnemoen@atmel.com> wrote:
> > 
> > > Now that I've got the CRC errors sorted out, I'll try bisecting it.
> > 
> > Done. git-bisect blames this commit:
> 
> Hi,
> 
> whats mtd->writesize of the flash? Do you have the debugging output log?
> 

Hi Artem,

According to the source of at91_dataflash.c :
 device->writesize = pagesize;

 page size for AT45DB642 is 1056

BR,
Ivan
