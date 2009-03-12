Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lhi6s-0007wS-TM
	for linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 10:26:02 +0000
Message-ID: <49B8E317.2010901@nokia.com>
Date: Thu, 12 Mar 2009 12:25:27 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
Subject: Re: UBIFS recovery truncates file to zero size
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>	<70F6AAAFDC054F41B9994A9BCD3DF64E08F94AF6@exch01-aklnz.MARINE.NET.INT>	<870F4B77E68142C19452EA191DE5A0F5@sky>
	<49B8C742.80902@nokia.com> <B2B24529967640E8A501ADADDE1E9908@sky>
In-Reply-To: <B2B24529967640E8A501ADADDE1E9908@sky>
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
>>> For the write back enabled case, I was expecting the
>>> following behaviour:
>>>     power went down before the file is sync-ed, so
>>>     on the next booting the file will be in its old state,
>>>     that is it will contain the contents which it had before
>>>     this write.
>>>
>>> But instead of being in the old state, it becomes empty file.
>>> Is this really expected(correct) behaviour?
>> No.  How were you updating the file?
> 
> The file is updated by a Java application in the following way.
> 
> -----
> FileOutputStream str = new FileOutputStream(aFilename);
> // some write here
> str.flush();
> str.close();
> -----
> 
> I switch off the power after confirming that the str.close() has been
> executed.
> 
> P.S:
> If I add str.getFD().sync(); after the str.flush(), the file looks good in
> the next boot. However my question still remains for the case
> when I do not call str.getFD().sync:
> "why the file becomes empty rather than being in its old state?".
> 
> Thanks
> Iram
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

What makes you think that:

FileOutputStream str = new FileOutputStream(aFilename);

does not truncate the file to zero length?
