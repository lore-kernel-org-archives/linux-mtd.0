Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JMC3-0006Rl-00
	for <linux-mtd@lists.infradead.org>; Sat, 15 Jun 2002 23:38:51 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: "David Cooper" <david@forcedpotato.com>,
	"Linux MTD" <linux-mtd@lists.infradead.org>
Subject: Re: X Windows Performance with DOC 2000
Date: Sun, 16 Jun 2002 10:32:01 +1200
References: <AIEOIMKIOAAJKHJOGAEFGECHCEAA.david@forcedpotato.com>
In-Reply-To: <AIEOIMKIOAAJKHJOGAEFGECHCEAA.david@forcedpotato.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020615223847.5D54913E6E@dragon.actrix.co.nz>
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

On Fri, 14 Jun 2002 15:09, David Cooper wrote:
> Hello,
>
> I am using a 2.4.2 Kernel re-compiled with the MTD subsystem on a 144 MB
> DiskOnChip.
>
> I can boot from the DOC and do most things except X refuses to run.  When I
> run X from the DOC it switches to a blank screen and just sits there.  The
> only way to recover is to perform a hard reset or cycle the power.
>
> Running X from an IDE hard disk using the same platform does not seem to be
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
