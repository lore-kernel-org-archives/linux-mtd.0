Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf3T2-0006WL-EA
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 16:47:26 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <41C1FDFF.3020308@us.ibm.com>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
Content-Type: text/plain
Date: Thu, 16 Dec 2004 21:47:49 +0000
Message-Id: <1103233669.15929.81.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If you have any ideas or patches, feel free to submit them to the list. 
>   That's what JFFS3 was cloned for, and there isn't too much concern 
> with backwards compatibility.

Mmm,

blkmtd.c is pretty much a rewrite, less than half the size and uses the
system buffer cache instead of reading / writing directly to the device.
This boosts performance x 3 on read x lots on write. [I get x 100
faster] (albeit you lose bad block detection on write)

If anyone's interested in the code, let me know and I'll clean it up and
post it .. however it'll be a new file and not a patch.

I've only tested it on USB key flash, but I'm assuming it'll be similar
for any block device / hard disk / whatever ..

Gareth.

On Thu, 2004-12-16 at 15:28 -0600, Josh Boyer wrote:
> Gareth Bult (Encryptec) wrote:
> > Hi,
> > 
> >>There is one more feature pending that I know of.  Ferenc Havasi has
> >>some eraseblock summary changes that should help.  I believe the
> >>intention was to commit that to JFFS3, but I haven't seen it go in yet.
> > 
> > 
> > Ok, I have these and will be trying them presently .. 
> > 
> > just wondered if there was any way I could avoid running "patch" .. :)
> 
> Bug Ferenc to commit ;).  I'm not sure if he subscribes to this list or not.
> 
> Also, Artem Bityuckiy is working on an inode checkpoint feature for 
> JFFS3.  Once he gets it working, it should increase overall performance.
> 
> If you have any ideas or patches, feel free to submit them to the list. 
>   That's what JFFS3 was cloned for, and there isn't too much concern 
> with backwards compatibility.
> 
> josh
