Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cOVl-0001UK-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Feb 2002 10:25:37 +0000
Date: Sun, 17 Feb 2002 11:36:30 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: "Brian J. Fox" <bfox@ua.com>
cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
   joern@wohnheim.fh-wedel.de
Subject: Re: MTD concat layer
In-Reply-To: <E16c6Gf-0000m9-00@speedy.datawave.net>
Message-ID: <Pine.LNX.4.21.0202171132030.24980-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Sat, 16 Feb 2002, Brian J. Fox wrote:

> 
>    From: Robert Kaiser <rob@sysgo.de>
>    Date: Sat, 16 Feb 2002 12:03:27 +0100 (MET)
> 
>    On Sat, 16 Feb 2002, David Woodhouse wrote:
> 
>    > 
>    > rob@sysgo.de said:
>    > > OK, just to be clear about this: If my erase function is asked to
>    > > erase -say-  1.5 blocks, what should it do: 
>    > 
>    > -EINVAL.
> 
>    OK, but is the function allowed to erase blocks up to the point
>    where it hits the partial block request ? That would make it simpler,
>    especially in the presence of variable block sizes.
> 
> *No*, you should *not* erase some blocks and return an error.
> 

Hmm, would you care to elaborate why ?

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
