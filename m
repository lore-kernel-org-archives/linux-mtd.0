Received: from b19.xdsl.pgtc.com ([65.163.80.19] helo=bitworks.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178nj6-0006cQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 20:49:20 +0100
Received: from rsmth [192.168.0.18] by bitworks.com [127.0.0.1] with SMTP (MDaemon.v2.7.SP4.R) for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 14:37:16 -0500
From: "Richard A. Smith" <rsmith@bitworks.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"rminnich@lanl.gov" <rminnich@lanl.gov>
Cc: "linuxbios@lanl.gov" <linuxbios@lanl.gov>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 17 May 2002 14:48:33 -0500
Reply-To: "Richard A. Smith" <rsmith@bitworks.com>
In-Reply-To: <Pine.LNX.4.33.0205170948210.11746-100000@snaresland.acl.lanl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Re: Getting big flash onto motherboards. Will CF work? what will?
Message-ID: <MDAEMON-F200205171437.AA371570MD57739@bitworks.com>
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

On Fri, 17 May 2002 09:57:31 -0600 (MDT), Ronald G Minnich wrote:

>Are there other options? These are 1U or .8U spaces most likely, and so a
>big PCI card is out of the question -- that's needed for Myrinet. There
>are no ISA slots. There are two IDE headers, and possibly a SCSI header. A
>very low profile PCI card might work. The only option I was aware of was
>IDE->CF adapaters. Is there something else I should look at?

The IDE->CF is probally your best option. If you can't find a small
PCI card with flash on it.
I think that in read only mode you probally won't have any issues. 
Especially since these things won't power cycle much...

However if you do have  a problem...

<Shameless Plug>
Bitworks, Inc has an IDE to CF adapter that we have used in some of
our products.  We call it the BitDrive.

We could modify this board for you so that it ran off the 12V supply
rather than the 5V and add in a 5V Linear LDO regulator with a large
cap on the 5V rail such that the CF would have lots of clean power
long after the main power died.  This should insure that the CF's
don't die due to power issues.

In qty. of 1000 I'm pretty sure we can be pretty close to the cost of
purchasing an off-the-shelf adapter.

Give me me a ring if your interested.

BTW.. We could also build you a low profile Flash memory PCI card but
I think that will be more expensive.

</Shameless Plug>
--
Richard A. Smith                         Bitworks, Inc.               
rsmith@bitworks.com               479.846.5777 x104                        
Sr. Design Engineer        http://www.bitworks.com   
