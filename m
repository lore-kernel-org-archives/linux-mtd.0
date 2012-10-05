Received: from mail.bmail.ru ([194.67.1.203] helo=sovam.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TKAHp-0007LU-3b
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 15:58:05 +0000
Received: from 95-26-121-16.broadband.corbina.ru (account bas@bmail.ru
 [95.26.121.16] verified)
 by mail-fe02.sovam.com (CommuniGate Pro SMTP 5.2.20)
 with ESMTPSA id 171950270 for linux-mtd@lists.infradead.org;
 Fri, 05 Oct 2012 19:57:53 +0400
Date: Fri, 5 Oct 2012 19:57:52 +0400 (MSK)
From: kyak <bas@bmail.ru>
To: linux-mtd@lists.infradead.org
Subject: Re: output file cannot be in the UBIFS root directory check is not
 working quite well
In-Reply-To: <alpine.LNX.2.02.1210032322590.1375@bas>
Message-ID: <alpine.LNX.2.02.1210051949390.1375@bas>
References: <alpine.LNX.2.02.1210032322590.1375@bas>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think the fact that i created that example directories in /tmp is 
misleading. 
This is not a tmpfs problem.

I observe the same problem with any other directory (namely, with my 
/home, which is not reabable).

When one of the directories in "-d" hierarchy is not readable, mkfs.ubifs 
will fail all the time, thinking that the output file is located in UBIFS 
root directory.

On Wed, 3 Oct 2012, kyak wrote:

> Hi,
>
> Consider the following sequence of commands:
>
> cd ~
> mkdir -p /tmp/wtf/wtf1
> chmod u-r /tmp/wtf
> mkfs.ubifs -m 4096 -e 516096 -c 4095 -d /tmp/wtf/wtf1 -o mytest.img
> Error: output file cannot be in the UBIFS root directory
>
> mytest.img is not inside /tmp/wtf/wtf1, but mkfs.ubifs fails because /tmp/wtf 
> is not readable.
> It seems that implementation of in_path(..) in mkfs.ubifs.c is not quite 
> correct to handle this type of situations.
>
> If you are wondering, my /home is not readable, and this prevents me from 
> building any ubifs image inside of /home/user.
>
> Thanks in advance.
>
