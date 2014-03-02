Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WK7b8-0000Lx-Ge
 for linux-mtd@lists.infradead.org; Sun, 02 Mar 2014 14:42:36 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org,
 chuck@mds.com
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
Date: Sun, 2 Mar 2014 15:42:09 +0100
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <201403012022.10111.marex@denx.de> <5312C17A.6010600@mds.com>
In-Reply-To: <5312C17A.6010600@mds.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201403021542.09196.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday, March 02, 2014 at 06:28:26 AM, Chuck Peplinski wrote:
> Sorry about top posting.

You are sorry, yet you did it again :-(

> I am also using this n25q512.  My working code includes a fix similar to
> what Song posted.  I don't consider it elegant.  The problem is that
> this 25q512 apparently behaves in a unique fashion.  If you read the
> status register instead of the flag status register, reads work but
> erases and writes fail.  I know this from a couple of days of
> debugging.

So does the SR and FSR not toggle the bit 7 at the same time or what ?

> You must respond to the flag status register.

What do you mean by "respond" ?

> Yes, this is
> different from every other part.
> 
> Some possible solutions are:
> - hard code support for this device, as Song did.
> - add some other abstraction that affects support for every other part.
> I leave the decision to you, but neither sounds very pretty.
> 
>      Chuck
> 
> On 3/1/2014 1:22 PM, Marek Vasut wrote:
> > To me, it looks like FSR bit 7 and SR bit 7 should toggle exactly at the
> > same time and exactly for the same events. Can you try for example
> > reading them both and checking that the bit 7 really toggles at
> > different times please?
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Best regards,
Marek Vasut
