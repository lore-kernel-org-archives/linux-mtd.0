Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4flg-0004fh-TJ
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 16:58:15 +0000
Date: Tue, 18 Dec 2007 08:57:58 -0800
From: David Brown <davidb@davidb.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: Limited support of NAND features in MTD.
Message-ID: <20071218165758.GA11634@old.davidb.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071218151800.GG1741@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 18, 2007 at 04:18:01PM +0100, Jörn Engel wrote:

>> Yeah. I know this feature. If I properly understand the real purpose of
>> it is mostly related for FTL but could be used for FS as well. 
>> You are right it make sense to try it. But I do not know when it will be possible to do 
>> this. Usually this feature is called as Internal data move in NAND specs. 
>
>At least I would like to know what the conditions are.  Can the command
>copy whole blocks only?  If it can copy single pages, can it copy any
>pages or just the Nth page of one block to the Nth page of another?

One problem with the on-chip copy is that ECC doesn't get corrected.  If
there are errors on readback, it will get written that way, and errors
would accumulate.

It is conceivable that the controller could do something intermediary, such
as read the data, and if the ECC needs no correction, write from the
on-chip cache, otherwise write the corrected data.

Dave
