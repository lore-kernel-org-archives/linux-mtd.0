Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1784H0-0002Jx-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 20:17:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020515184359.301BD36F9@sitemail.everyone.net> 
References: <20020515184359.301BD36F9@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 15 May 2002 20:17:17 +0100
Message-ID: <17838.1021490237@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

zeusj@firstlinux.net said:
> 1.Is the command"cp jffs.img /dev/mtdblock0" after booting result as
> same as to burn the jffs.img into flash chip(which is presented as
> mtdblock0)with kernel Image? 

Yes.

> 2.Is "cp somefile /dev/mtd0" as same as "cp somefile /dev/mtdblock0"? 

No. The block device erases it first.

> 3.by the way , May I know the reason that you dont register the master
>  MTD like you register the MTD partition?(just like hda and hda1,2,3...) 

Just a historical accident; the current partitioning code is just a hack.


--
dwmw2
