Received: from pegasus.siol.net ([193.189.160.25])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AywvD-0006hl-81
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2004 17:46:11 +0000
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
	1cbf71897a39210db31154c99f0b4628)
	<20040304174610.NSEJ15612.pegasus@kudu.siol.net>
	for <linux-mtd@lists.infradead.org>;
	Thu, 4 Mar 2004 18:46:10 +0100
Received: from [192.168.0.107] ([193.95.213.209]) by kudu.siol.net
	1cbf71897a39210db31154c99f0b4628)
	<20040304174609.SKIP1595.kudu@[193.95.213.209]>
	for <linux-mtd@lists.infradead.org>;
	Thu, 4 Mar 2004 18:46:09 +0100
From: Matthias Gorjup <gorjup@norik.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 4 Mar 2004 18:45:05 +0100
References: <Pine.LNX.4.10.10403022036240.1720-100000@mail.hurricane.at>
	<1078325271.4619.3.camel@hades.cambridge.redhat.com>
In-Reply-To: <1078325271.4619.3.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200403041845.05058.gorjup@norik.com>
Subject: Re: Speed of writing to flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03 March 2004 15:47, you wrote:
> On Tue, 2004-03-02 at 20:40 +0100, Matthias Gorjup wrote:
> > Hi, thanks for the prompt answer. But in the kernel 2.4.20 that we are
> > using, there is not "erase suspend" supported - as I could understand
> > from the source code. And there is no EraseSuspend variable anywhere in
> > the mtd source code of the kernel 2.4.20.
> > Could you give us some info about what else could be wrong?
>
> Please don't top-post. Your reply should be underneath the _selectively_
> quoted parts of the original reply.
>
> You could try updating to the latest code, in that case. Or use
> profiling to see where it's spending all its time when it's slow.
OK, I will try... before doing that just one question:
- when I tried to simply copy 2 MB large file from NFS mounted file system to 
the flash file system, it took me from 5 to 20 minutes. It took me 5 minutes 
after rebooting and over 20 minutes after doing it for the fourth time (with 
no rebooting in between). Is 5 minutes normal for writing such a big file to 
flash file system?


Best Regards

Matthias Gorjup
www.norik.com
