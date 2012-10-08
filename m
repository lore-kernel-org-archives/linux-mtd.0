Received: from mail.bmail.ru ([194.67.1.203] helo=sovam.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLEVh-00079e-TS
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 14:40:47 +0000
Date: Mon, 8 Oct 2012 18:40:38 +0400 (MSK)
From: kyak <bas@bmail.ru>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: output file cannot be in the UBIFS root directory check is not
 working quite well
In-Reply-To: <alpine.DEB.2.00.1210081556130.19047@lnxricardw.se.axis.com>
Message-ID: <alpine.LNX.2.02.1210081833560.1375@bas>
References: <alpine.LNX.2.02.1210032322590.1375@bas>
 <alpine.LNX.2.02.1210051949390.1375@bas>
 <alpine.DEB.2.00.1210081556130.19047@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1691278037-1349707239=:1375"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1691278037-1349707239=:1375
Content-Type: TEXT/PLAIN; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

If a directory is not readable it only means that you can't list its 
contents. But it doesn't mean that you can't list contents of directories 
below that directory.

Once again, here is a simple (my) use case. My /home is not readable (i 
can't list its contents), and this prevents me from building any ubifs 
image inside of /home/user (which is readable).

I really hope i made myself clear this time.

On Mon, 8 Oct 2012, Ricard Wanderlof wrote:

>
> On Fri, 5 Oct 2012, kyak wrote:
>
>> I observe the same problem with any other directory (namely, with my
>> /home, which is not reabable).
>> 
>> When one of the directories in "-d" hierarchy is not readable, mkfs.ubifs 
>> will fail all the time, thinking that the output file is located in UBIFS 
>> root directory.
>
> I can agree with you that the error message looks wrong for this case, but 
> what is the point of attempting to create a file system image from a 
> directory tree which is not readable?
>
> /Ricard
>
>> 
>> On Wed, 3 Oct 2012, kyak wrote:
>> 
>>> Hi,
>>> 
>>> Consider the following sequence of commands:
>>> 
>>> cd ~
>>> mkdir -p /tmp/wtf/wtf1
>>> chmod u-r /tmp/wtf
>>> mkfs.ubifs -m 4096 -e 516096 -c 4095 -d /tmp/wtf/wtf1 -o mytest.img
>>> Error: output file cannot be in the UBIFS root directory
>>> 
>>> mytest.img is not inside /tmp/wtf/wtf1, but mkfs.ubifs fails because 
>>> /tmp/wtf
>>> is not readable.
>>> It seems that implementation of in_path(..) in mkfs.ubifs.c is not quite
>>> correct to handle this type of situations.
>>> 
>>> If you are wondering, my /home is not readable, and this prevents me from
>>> building any ubifs image inside of /home/user.
>>> 
>>> Thanks in advance.
>>> 
>> 
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> 
>
> -- 
> Ricard Wolf Wanderlöf                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
--8323328-1691278037-1349707239=:1375--
