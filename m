Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLDqO-0006cs-7u
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 13:58:04 +0000
Date: Mon, 8 Oct 2012 15:57:58 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: kyak <bas@bmail.ru>
Subject: Re: output file cannot be in the UBIFS root directory check is not
 working quite well
In-Reply-To: <alpine.LNX.2.02.1210051949390.1375@bas>
Message-ID: <alpine.DEB.2.00.1210081556130.19047@lnxricardw.se.axis.com>
References: <alpine.LNX.2.02.1210032322590.1375@bas>
 <alpine.LNX.2.02.1210051949390.1375@bas>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 5 Oct 2012, kyak wrote:

> I observe the same problem with any other directory (namely, with my
> /home, which is not reabable).
>
> When one of the directories in "-d" hierarchy is not readable, 
> mkfs.ubifs will fail all the time, thinking that the output file is 
> located in UBIFS root directory.

I can agree with you that the error message looks wrong for this case, but 
what is the point of attempting to create a file system image from a 
directory tree which is not readable?

/Ricard

>
> On Wed, 3 Oct 2012, kyak wrote:
>
>> Hi,
>>
>> Consider the following sequence of commands:
>>
>> cd ~
>> mkdir -p /tmp/wtf/wtf1
>> chmod u-r /tmp/wtf
>> mkfs.ubifs -m 4096 -e 516096 -c 4095 -d /tmp/wtf/wtf1 -o mytest.img
>> Error: output file cannot be in the UBIFS root directory
>>
>> mytest.img is not inside /tmp/wtf/wtf1, but mkfs.ubifs fails because /tmp/wtf
>> is not readable.
>> It seems that implementation of in_path(..) in mkfs.ubifs.c is not quite
>> correct to handle this type of situations.
>>
>> If you are wondering, my /home is not readable, and this prevents me from
>> building any ubifs image inside of /home/user.
>>
>> Thanks in advance.
>>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
