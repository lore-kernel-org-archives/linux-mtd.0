Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LhgaE-0003N3-UF
	for linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 08:48:14 +0000
Received: from m2.gw.fujitsu.co.jp ([10.0.50.72])
	by fgwmail6.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	n2C8lRTK023752 for <linux-mtd@lists.infradead.org> (envelope-from
	iram.shahzad@jp.fujitsu.com); Thu, 12 Mar 2009 17:47:27 +0900
Received: from smail (m2 [127.0.0.1])
	by outgoing.m2.gw.fujitsu.co.jp (Postfix) with ESMTP id 04E9A45DE51
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 17:47:27 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (s2.gw.fujitsu.co.jp [10.0.50.92])
	by m2.gw.fujitsu.co.jp (Postfix) with ESMTP id DB0FA45DD79
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 17:47:26 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 92DDBE18001
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 17:47:26 +0900 (JST)
Received: from ml14.s.css.fujitsu.com (ml14.s.css.fujitsu.com [10.249.87.104])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 0F6E21DB803A
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 17:47:26 +0900 (JST)
Received: from ml14.css.fujitsu.com (ml14 [127.0.0.1])
	by ml14.s.css.fujitsu.com (Postfix) with ESMTP id DA2DF9F5F7C
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 17:47:25 +0900 (JST)
Received: from sky (x154150.ao.fst.fujitsu.com [10.90.154.150])
	by ml14.s.css.fujitsu.com (Postfix) with SMTP id 95D939F5F7A
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Mar 2009 17:47:25 +0900 (JST)
Message-ID: <B2B24529967640E8A501ADADDE1E9908@sky>
From: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>	<70F6AAAFDC054F41B9994A9BCD3DF64E08F94AF6@exch01-aklnz.MARINE.NET.INT>
	<870F4B77E68142C19452EA191DE5A0F5@sky> <49B8C742.80902@nokia.com>
Subject: Re: UBIFS recovery truncates file to zero size
Date: Thu, 12 Mar 2009 17:49:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> For the write back enabled case, I was expecting the
>> following behaviour:
>>     power went down before the file is sync-ed, so
>>     on the next booting the file will be in its old state,
>>     that is it will contain the contents which it had before
>>     this write.
>> 
>> But instead of being in the old state, it becomes empty file.
>> Is this really expected(correct) behaviour?
> 
> No.  How were you updating the file?

The file is updated by a Java application in the following way.

-----
FileOutputStream str = new FileOutputStream(aFilename);
// some write here
str.flush();
str.close();
-----

I switch off the power after confirming that the str.close() has been
executed.

P.S:
If I add str.getFD().sync(); after the str.flush(), the file looks good in
the next boot. However my question still remains for the case
when I do not call str.getFD().sync:
"why the file becomes empty rather than being in its old state?".

Thanks
Iram
