Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LhipX-0001EB-Rf
	for linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 11:12:10 +0000
Date: Thu, 12 Mar 2009 11:11:25 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
Subject: Re: UBIFS recovery truncates file to zero size
Message-ID: <20090312111125.GB6995@shareable.org>
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>
	<70F6AAAFDC054F41B9994A9BCD3DF64E08F94AF6@exch01-aklnz.MARINE.NET.INT>
	<870F4B77E68142C19452EA191DE5A0F5@sky> <49B8C742.80902@nokia.com>
	<B2B24529967640E8A501ADADDE1E9908@sky>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B2B24529967640E8A501ADADDE1E9908@sky>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iram Shahzad wrote:
> >>For the write back enabled case, I was expecting the
> >>following behaviour:
> >>    power went down before the file is sync-ed, so
> >>    on the next booting the file will be in its old state,
> >>    that is it will contain the contents which it had before
> >>    this write.
> >>
> >>But instead of being in the old state, it becomes empty file.
> >>Is this really expected(correct) behaviour?
> >
> >No.  How were you updating the file?
> 
> The file is updated by a Java application in the following way.
> 
> -----
> FileOutputStream str = new FileOutputStream(aFilename);

"new FileOutputStream" truncates the file.

> I switch off the power after confirming that the str.close() has been
> executed.
> 
> P.S:
> If I add str.getFD().sync(); after the str.flush(), the file looks good in
> the next boot. However my question still remains for the case
> when I do not call str.getFD().sync:
> "why the file becomes empty rather than being in its old state?".

str.getFD().sync() won't be reliable if you lose power _between_ "new
FileOutputStream" and sync().  If that happens, the file may still be
truncated.

If you are just appending data, use "new FileOutputStream(aFileName,
true)", write, flush, sync, close.

If you are changing the file contents, instead write to a temporary
file in the same directory, then sync the temporary file (after
flush), then do an atomic rename over the original file, then open the
directory and sync that somehow.

-- Jamie
