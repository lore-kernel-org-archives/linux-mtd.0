Date: Tue, 18 Dec 2007 15:46:41 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Limited support of NAND features in MTD.
In-Reply-To: <20071218151800.GG1741@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0712181544510.1344@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
> On Tue, 18 December 2007 15:06:50 +0000, Alexey Korolev wrote:
> > > 
> > > What does cached read do?
> > > 
> > Performs cached read operations :)
> 
> Who would have thought? :)
> 
> > It is a feature of NAND devices. It increases performance if we have 
> > request to read sequentally large amount of data from NAND. 
> 
> Do you have a little more information on this?  Where does the cache
> reside?  How big is it?  Who controls it?  How does it interact with
> writes? ...
>
Ok. Alexander will send more detailed info now.  
> Possibly the best answer would be a link to a datasheet.
> 
Ok. Just a second I will try to find a link to an open datasheet. 
Thanks,
Alexey
