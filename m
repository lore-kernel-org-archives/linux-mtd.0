Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
From: David Woodhouse <dwmw2@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<1186146543.2931.82.camel@pmac.infradead.org>
	<20070803131815.GG19344@lazybastard.org>
	<6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 04 Aug 2007 13:33:14 +0100
Message-Id: <1186230794.22190.28.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-08-03 at 12:45 -0700, Jared Hulbert wrote:
> We can't very well just wait seconds for the chip to become available.
>  We could count waiting processes, but even it there is one process in
> the queue, seconds is a long time to wait. 

Even if there's another runnable process which _isn't_ blocked on the
chip?

-- 
dwmw2
