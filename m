Received: from code-monsters.com ([65.67.50.169] helo=smash.codemonsters.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gsdg-0002sn-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 19:24:20 +0000
Message-ID: <000f01c1c157$47698de0$5a01a8c0@devicemonsters.com>
From: "Brian P. Austin" <baustin@codemonsters.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.21.0203011346350.795-100000@ba.devicemonsters.com>  <10097.1015010046@redhat.com>
Subject: Re: Reproduction of NFTL Bug with DOC 2000 288MB FULL DEBUG 
Date: Fri, 1 Mar 2002 13:28:34 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I shut down syslog, and everything is going out to the terminal now,
however, it just keeps scrolling

 _DoC_WaitReady called for out-of-line wait

accross all my tty's, and I can't stop it!

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Brian P. Austin" <baustin@codemonsters.net>
Cc: <linux-mtd@lists.infradead.org>
Sent: Friday, March 01, 2002 1:14 PM
Subject: Re: Reproduction of NFTL Bug with DOC 2000 288MB FULL DEBUG


>
> Hmm. Did you do this from scratch, starting by reformatting the NFTL
again?
> It doesn't look like it.
>
> Use the M-Systems DFORMAT (version 4.2) if you can, rather than
nftl_format.
> If you do use nftl_format, make sure the NFTL kernel module isn't loaded
> while you do so.
>
> Then get logs again, preferably over a serial console, because syslog is
> lossy.
>
> I may have a 288MiB unit here, in fact - I'll see if I can reproduce it
> myself.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
