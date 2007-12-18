Date: Tue, 18 Dec 2007 15:06:50 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Limited support of NAND features in MTD.
In-Reply-To: <20071218142335.GD1741@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1831524198-670542418-1197990410=:31218"
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1831524198-670542418-1197990410=:31218
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

Hi Jörn

> > 
> > It is not a secret that current MTD supports very limited set of NAND
> > features. Some of missed features like partial page read or cached read
> > are able to improve file system performance and its implementation do
> > not require s/w redesign. 
> 
> What does cached read do?
> 
Performs cached read operations :). It is a feature of NAND devices. It increases performance if we have 
request to read sequentally large amount of data from NAND. 

> Another feature that could become useful would be the on-chip copying.
> With JFFS2 this is rare, but when doing GC or wear leveling in a fashion
> that keeps certain alignments intact, it could improve performance.
>
Yeah. I know this feature. If I properly understand the real purpose of
it is mostly related for FTL but could be used for FS as well. 
You are right it make sense to try it. But I do not know when it will be possible to do 
this. Usually this feature is called as Internal data move in NAND specs. 

Thanks,
Alexey
---1831524198-670542418-1197990410=:31218--
