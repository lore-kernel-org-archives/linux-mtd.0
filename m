Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lhhr5-0003EJ-Qk
	for linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 10:09:43 +0000
Subject: Re: UBIFS recovery truncates file to zero size
From: Artem Bityutskiy <dedekind@infradead.org>
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
In-Reply-To: <B2B24529967640E8A501ADADDE1E9908@sky>
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>
	<70F6AAAFDC054F41B9994A9BCD3DF64E08F94AF6@exch01-aklnz.MARINE.NET.INT>
	<870F4B77E68142C19452EA191DE5A0F5@sky> <49B8C742.80902@nokia.com>
	<B2B24529967640E8A501ADADDE1E9908@sky>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Mar 2009 13:08:42 +0200
Message-Id: <1236856122.21691.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-12 at 17:49 +0900, Iram Shahzad wrote:
> >> For the write back enabled case, I was expecting the
> >> following behaviour:
> >>     power went down before the file is sync-ed, so
> >>     on the next booting the file will be in its old state,
> >>     that is it will contain the contents which it had before
> >>     this write.
> >> 
> >> But instead of being in the old state, it becomes empty file.
> >> Is this really expected(correct) behaviour?
> > 
> > No.  How were you updating the file?
> 
> The file is updated by a Java application in the following way.
> 
> -----
> FileOutputStream str = new FileOutputStream(aFilename);
> // some write here
> str.flush();
> str.close();
> -----

Please, check whether str.flush()/str.close() cause fsync()/sync().

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
