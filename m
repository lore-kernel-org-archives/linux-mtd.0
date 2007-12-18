Date: Tue, 18 Dec 2007 16:07:46 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Limited support of NAND features in MTD.
In-Reply-To: <Pine.LNX.4.64.0712181544510.1344@pentafluge.infradead.org>
Message-ID: <Pine.LNX.4.64.0712181557130.1344@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
	<Pine.LNX.4.64.0712181544510.1344@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

> Possibly the best answer would be a link to a datasheet.

>> Yeah. I know this feature. If I properly understand the real purpose
>> of
>> it is mostly related for FTL but could be used for FS as well. 
>> You are right it make sense to try it. But I do not know when it will
>> be possible to do 
>> this. Usually this feature is called as Internal data move in NAND
>> specs. 

> At least I would like to know what the conditions are.  Can the
> command
> copy whole blocks only?  If it can copy single pages, can it copy any
> pages or just the Nth page of one block to the Nth page of another?

> If any page can be copied to any other page, it should be quite useful
> for any non-compressed filesystem.  YAFFS, old LogFS, anything that
> does
> XIP, possibly UBI,...

I think those links will describe internal data move well.

http://download.micron.com/pdf/technotes/nand/tn2915.pdf 
http://www.st.com/stonline/products/literature/an/10061.htm 

Here is a link about cached read in addition to Alexander's description. 
http://download.micron.com/pdf/technotes/nand/tn2901.pdf 

Thanks,
Alexey
