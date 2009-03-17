Received: from mail1.navico.com ([194.19.84.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjO1p-0001xo-4l
	for linux-mtd@lists.infradead.org; Tue, 17 Mar 2009 01:23:43 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [patch 4/9] jffs2: force the jffs2 GC daemon to behave a bitbetter
Date: Tue, 17 Mar 2009 14:23:24 +1300
Message-ID: <70F6AAAFDC054F41B9994A9BCD3DF64E090D7857@exch01-aklnz.MARINE.NET.INT>
In-Reply-To: <49BEE0B1.7020507@magtech.com.au>
References: <200902112127.n1BLR2HX031153@imap1.linux-foundation.org><Pine.LNX.4.64.0902121016250.19761@lnxricardw.se.axis.com>
	<49BEE0B1.7020507@magtech.com.au>
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
To: "Aras Vaichas" <arasv@magtech.com.au>,
	"Ricard Wanderlof" <ricard.wanderlof@axis.com>
Cc: dilinger@debian.org, akpm@linux-foundation.org, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, dilinger@queued.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have also noticed the performance degredation caused by the jffs2
garbage collection. The solution we used to this problem on our product
was to do 'pkill -STOP jffs2_gcd' very early in the boot process, then
right at the end of my boot script put 'sleep 90 && pkill -CONT
jffs2_gcd &'

This sped the boot time up a lot.

Reuben

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Aras Vaichas
Sent: Tuesday, 17 March 2009 12:29 p.m.
To: Ricard Wanderlof
Cc: dwmw2@infradead.org; akpm@linux-foundation.org; dilinger@debian.org;
linux-mtd@lists.infradead.org; dilinger@queued.net
Subject: Re: [patch 4/9] jffs2: force the jffs2 GC daemon to behave a
bitbetter

Ricard Wanderlof wrote:
> On Wed, 11 Feb 2009, akpm@linux-foundation.org wrote:
>
>  =20
>> I've noticed some pretty poor behavior on OLPC machines after bootup,

>> when gdm/X are starting.  The GCD monopolizes the scheduler (which in

>> turns means it gets to do more nand i/o), which results in processes=20
>> taking much much longer than they should to start.
>>    =20
>
> Can't really comment on how well the patch works, but we've also=20
> noticed a similar slowdown on our systems during startup, so the idea=20
> as such is welcome at any rate.
>  =20
I just posted a message to linux-arm-kernel regarding a similar problem
I have an at91rm9200 based machine with NAND and JFFS2.

I suspected that garbage collection was causing delays of up to 3+
seconds during which time my watchdog patting daemon was not being
scheduled ...

This was causing the watchdog timer to reset my machine but *only* when
it was under significant NAND load  i.e. boot time, loading up the main
application while GCD was running.

My solution was to double the watchdog timeout.

Aras

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email
______________________________________________________________________

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
