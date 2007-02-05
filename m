Received: from nz-out-0506.google.com ([64.233.162.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HDuyc-0002Qq-7U
	for linux-mtd@lists.infradead.org; Sun, 04 Feb 2007 22:57:15 -0500
Received: by nz-out-0506.google.com with SMTP id i11so2406996nzi
	for <linux-mtd@lists.infradead.org>;
	Sun, 04 Feb 2007 19:57:09 -0800 (PST)
Date: Mon, 5 Feb 2007 11:57:08 +0800
From: "xun" <xun.global@gmail.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>,
 "rdkehn" <rdkehn@yahoo.com>
References: <mailman.1.1170608405.20957.linux-mtd@lists.infradead.org>
	<200702051043121404211@gmail.com>
Subject: Re: Re: jffs2, program can't run
Message-ID: <200702051157062342875@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>Date: Sun, 4 Feb 2007 05:26:21 -0800 (PST)
>>From: Doug Kehn <rdkehn@yahoo.com>
>>Subject: Re: jffs2, program can't run
>>To: linux-mtd <linux-mtd@lists.infradead.org>
>>Message-ID: <116087.21586.qm@web51908.mail.yahoo.com>
>>Content-Type: text/plain; charset=iso-8859-1
>>
>>Hi,
>>
>>--- "xun.global" <xun.global@gmail.com> wrote:
>>
>>>     I use jffs2 on my at91rm9200 board with
>>> dataflash, but i find sometimes the program (auto
>>> run after mount the filesystem) dies when it open a
>>> file on dataflash, even if i reboot the system. But
>>> when the program dies, it can run by hand start it. 
>>>     Could someone can help me. Thank you.
>>> 
>>
>>How does the program die?  Segment Fault or failure to
>>load a library needed by the program?
>>
>>What kernel version are you using?
>>
>>Are your observations similar to those reported in:
>>
>>http://lists.infradead.org/pipermail/linux-mtd/2007-January/017252.html
>>
>>Regards,
>>...doug
>>
>>
>>
>> 
>>____________________________________________________________________________________
>>TV dinner still cooling? 
>>Check out "Tonight's Picks" on Yahoo! TV.
>>http://tv.yahoo.com/
    My kernel is 2.6.16.16 with AT45DB642 dataflash
    The program isn't dies always, but it return none message, when it dies, such as segment
 Fault or failure to load a library. But it can run well if I run ./filename when it dies.
    It dies when open a file but not return anything. I heard someone say when jffs2 mount
 successful, don't open file to read or write immediately, just wait 30-40 seconds, Maybe 
it scan the flash after mount. Is that right?
Regards  
    
