Received: from mail05b.webhosting-verizon.net ([209.238.3.61])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17K4ss-0003QH-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 23:22:02 +0100
From: "David Cooper" <david@forcedpotato.com>
To: <manningc2@actrix.gen.nz>,
	"Linux MTD" <linux-mtd@lists.infradead.org>
Subject: RE: X Windows Performance with DOC 2000
Date: Mon, 17 Jun 2002 18:30:59 -0400
Message-ID: <AIEOIMKIOAAJKHJOGAEFIEDKCEAA.david@forcedpotato.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020615223847.5D54913E6E@dragon.actrix.co.nz>
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

No good.

I tried turning the swap partition off and also using an external IDE drive
for the swap partition.

In both cases I get the same result as before, X is launched but when the
screen goes blank it never recovers or gives me any graphics output.

Any other suggestions?

Thanks,

David Cooper



-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Charles Manning
Sent: Saturday, June 15, 2002 6:32 PM
To: David Cooper; Linux MTD
Subject: Re: X Windows Performance with DOC 2000


On Fri, 14 Jun 2002 15:09, David Cooper wrote:
> Hello,
>
> I am using a 2.4.2 Kernel re-compiled with the MTD subsystem on a 144 MB
> DiskOnChip.
>
> I can boot from the DOC and do most things except X refuses to run.  When
I
> run X from the DOC it switches to a blank screen and just sits there.  The
> only way to recover is to perform a hard reset or cycle the power.
>
> Running X from an IDE hard disk using the same platform does not seem to
be
> a problem.
>
> Has anyone else encountered this problem?  Any suggestions as to what I
> could try?
>

Hunch: Because X is big-n-fat, maybe it needs swap space. Doing swap onto a
DOC would, I hunch,  suck fiercely (if it can be done at all).  Maybe try
mounting DOC for the filesystem and keep an IDE for swap. Maybe look at
/proc/swaps on the two boots and see if they tell you anything.

-- Charles

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
