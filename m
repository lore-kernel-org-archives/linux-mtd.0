Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LhatL-0007Ra-8n
	for linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 02:43:45 +0000
Received: from m1.gw.fujitsu.co.jp ([10.0.50.71])
	by fgwmail6.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	n2C2glfV001653 for <linux-mtd@lists.infradead.org> (envelope-from
	iram.shahzad@jp.fujitsu.com); Thu, 12 Mar 2009 11:42:47 +0900
Received: from smail (m1 [127.0.0.1])
	by outgoing.m1.gw.fujitsu.co.jp (Postfix) with ESMTP id EB8BD45DD76
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 11:42:46 +0900 (JST)
Received: from s1.gw.fujitsu.co.jp (s1.gw.fujitsu.co.jp [10.0.50.91])
	by m1.gw.fujitsu.co.jp (Postfix) with ESMTP id 71F0945DD75
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 11:42:46 +0900 (JST)
Received: from s1.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s1.gw.fujitsu.co.jp (Postfix) with ESMTP id 527EF1DB8015
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 11:42:46 +0900 (JST)
Received: from m108.s.css.fujitsu.com (m108.s.css.fujitsu.com [10.249.87.108])
	by s1.gw.fujitsu.co.jp (Postfix) with ESMTP id EBA5A1DB801F
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 11:42:45 +0900 (JST)
Received: from m108.css.fujitsu.com (m108 [127.0.0.1])
	by m108.s.css.fujitsu.com (Postfix) with ESMTP id AA167B68009
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 11:42:45 +0900 (JST)
Received: from sky (x154150.ao.fst.fujitsu.com [10.90.154.150])
	by m108.s.css.fujitsu.com (Postfix) with SMTP id 0222AB68006
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 11:42:44 +0900 (JST)
Message-ID: <870F4B77E68142C19452EA191DE5A0F5@sky>
From: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>
	<70F6AAAFDC054F41B9994A9BCD3DF64E08F94AF6@exch01-aklnz.MARINE.NET.INT>
Subject: Re: UBIFS recovery truncates file to zero size
Date: Thu, 12 Mar 2009 11:44:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Brijesh, Adrian, Reuben for your replies.

I understood, but please let me confirm further.

For the write back enabled case, I was expecting the
following behaviour:
    power went down before the file is sync-ed, so
    on the next booting the file will be in its old state,
    that is it will contain the contents which it had before
    this write.

But instead of being in the old state, it becomes empty file.
Is this really expected(correct) behaviour?

Thanks
Iram

----- Original Message ----- 
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
To: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>; 
<linux-mtd@lists.infradead.org>
Sent: Thursday, March 12, 2009 3:13 AM
Subject: RE: UBIFS recovery truncates file to zero size


> The file is kept in the kernel write-back cache, until it is synced by
> the user (eg. A sync() or fsync() call) or the kernel decides to write
> it back (seems to be after 30 seconds by default).
>
> You can disable write back cache, but if you make lots of small writes
> to the file this will cause more wear on the flash. It is better to call
> fsync() when you want the data to be saved.
>
> See http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback
>
> Also be carefull to note the comment about making your updates atomic.
> Just adding the odd fsync() is not going to truely guarenteed your data
> is not going to get fried.
>
> Reuben
>
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Iram Shahzad
> Sent: Wednesday, 11 March 2009 10:16 p.m.
> To: linux-mtd@lists.infradead.org
> Subject: UBIFS recovery truncates file to zero size
>
> Hi
>
> I am having the following problem with UBIFS (Linux 2.6.25 +
> ubifs-v2.6.25).
> Please could you tell me if this is a known issue.
>
> Problem
>    If the power is switched off abruptly while a file is being written,
>    in the next boot the contents of the file is lost. That is, the file
>    becomes zero sized. The problem is reproducable.
>
> Thanks in advance.
> Iram
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
