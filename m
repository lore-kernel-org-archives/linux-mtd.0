Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 156x1A-0003I2-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2001 17:15:48 +0100
Message-ID: <3B1BB589.5438513E@daniel.com>
Date: Mon, 04 Jun 2001 11:21:29 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: "Adam J. Bovill" <kiwi@dartmouth.edu>
CC: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: M-Sys Device question
References: <20010604012932.Y10746@dartmouth.edu>
Content-Type: text/plain; charset=us-ascii
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

Hi,

One thought: Upgrade the MTD code from the one that came with 2.4.5 to the
latest stuff in CVS. The stuff in the released
kernel is (usually) horribly out of date.

Since you got my email address, I presume you have access to the CVS (or the
HOWTO that tells you how to get to the CVS).

I personally don't use DOC, so cannot help you beyond this. Sorry :(

But the folks on the MTD list are very helpful. I'm copying this mail to the
list in case some one else has a solution.

Regarding your "Using IDE drive without any problems". Sigh. It is my firm
belief that no (power fail) reliable product can be made
where data is stored onto IDE flash drives.

So, unless you are doing a "one unit only project", you should worry about
using the IDE flash drive to write data to it. Read only should
not be an issue.

Vipin


"Adam J. Bovill" wrote:

> I have been working on an embedded firewall for a project at Dartmouth
> College.  We have been trying to get it to function properly.  We had it
> working, but then the device seemed to stop functioning.  fdisk no longer
> runs on it, and trying to run the nftl_format tool on /dev/mtd0 has
> problems:
>
> Phase 1. Checking and erasing Erase Zones from 0x00000000 to 0x02000000
> Erasing Zone #4095 @ 0x1ffe000
> Phase 2.a Writing NFTL Media Header and Bad Unit Table
> Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit
> Table
> Phase 3. Writing Unit Control Information to each Erase Unit
> MEMWRITEOOB at 200: Invalid argument
>
> this last line is repeated with increasing numbers.  And write errors
> are printed to the console.  I was wondering whether you had any
> thoughts or things that we could try to reinitialize the device so that
> it functions again. We are running 2.4.5 with the MTD drivers that are
> included in it.
>
> Thanks for any help, no worries if you have no thoughts on this... as we
> have an IDE drive that we are using without problems.
>
> Thanks,
> adam
>
