Received: from wproxy.gmail.com ([64.233.184.194])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrLmZ-0005O2-06
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 14:46:24 -0500
Received: by wproxy.gmail.com with SMTP id 36so37077wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Jan 2005 11:46:16 -0800 (PST)
Message-ID: <6934efce05011911462552f555@mail.gmail.com>
Date: Wed, 19 Jan 2005 11:46:16 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501191648070.8174@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501131219480.17331@phoenix.infradead.org>
	<1105619501.26551.163.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.58.0501131317560.17331@phoenix.infradead.org>
	<6934efce05011810013ea479b@mail.gmail.com>
	<Pine.LNX.4.58.0501191309140.8174@phoenix.infradead.org>
	<Pine.LNX.4.58.0501191648070.8174@phoenix.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: CRC on Read-Only partition
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The question is: if we've read page and encounter ECC error, is it
> possible that if we re-read it several times we will have no errors? This
> means does NAND technology assume random occasional bit flips which go
> away after we re-read page?

Whether or not the error goes away was not the point.  My point is
that with NAND you can get errors even with RO data.  That's all.
 
> P.S. :
> Toshiba's guide stands bit flipping is possible, but they stay until block
> is erased. Re-read as many times as yiu want - you will still have this
> bit error. But this doesn't mean block is bad - erase the block and be
> happy.

I think the real question is whether the likelyhood of errors getting
past the NAND's ECC is > or < than the users tolerance level.  I don't
believe that the answer should be terribly different for RO or RW
data.  Yet this depends on temperature, frequency of read, and yes
even solar flares :)  Therefore the answer is different for a set top
box with an expected useful life of 2 years and a car.
