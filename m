Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LhgG3-0005ds-DI
	for linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 08:27:22 +0000
Message-ID: <49B8C742.80902@nokia.com>
Date: Thu, 12 Mar 2009 10:26:42 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
Subject: Re: UBIFS recovery truncates file to zero size
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>	<70F6AAAFDC054F41B9994A9BCD3DF64E08F94AF6@exch01-aklnz.MARINE.NET.INT>
	<870F4B77E68142C19452EA191DE5A0F5@sky>
In-Reply-To: <870F4B77E68142C19452EA191DE5A0F5@sky>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iram Shahzad wrote:
> Thanks Brijesh, Adrian, Reuben for your replies.
> 
> I understood, but please let me confirm further.
> 
> For the write back enabled case, I was expecting the
> following behaviour:
>     power went down before the file is sync-ed, so
>     on the next booting the file will be in its old state,
>     that is it will contain the contents which it had before
>     this write.
> 
> But instead of being in the old state, it becomes empty file.
> Is this really expected(correct) behaviour?

No.  How were you updating the file?
