Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16svn4-0004uS-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 02:11:50 +0100
To: "Jeremy Jackson" <jerj@coplanar.net>
Cc: <linuxbios@lanl.gov>, <linux-mtd@lists.infradead.org>
Subject: Re: PIIX flashing woes with SST29EE010
References: <00fd01c1db72$f225c200$7e0aa8c0@bridge>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 03 Apr 2002 18:11:38 -0700
In-Reply-To: <00fd01c1db72$f225c200$7e0aa8c0@bridge>
Message-ID: <m33cycnu7p.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

"Jeremy Jackson" <jerj@coplanar.net> writes:

> (crossposted)
> FYI,
> 
> A problem I was having that *appeared* to be a problem with
> getting writes to the flash chip, wasn't
> 
> It turns out that SST's datasheet for SST29EE010 is incorrect.
> It turns out that the part I have *doesn't* respond to "new" style
> ID mode entry sequence, as indicated in the manual.
> It only responds to the "old" AA 55 80 AA 55 60 sequence.
> 
> I should have a generic PIIX map driver for MTD soon now.


So does jedec_probe work for you or do you need to patch it?

Eric
