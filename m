Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c0kw-0005lK-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 10:35:58 +0100
Date: Tue, 6 Aug 2002 11:35:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD Partition problems
Message-ID: <20020806093554.GA7162@wohnheim.fh-wedel.de>
References: <5.1.0.14.0.20020803112646.00ace9d8@64.170.22.132> <5.1.0.14.0.20020803074026.02927a48@64.170.22.132> <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01> <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01> <5.1.0.14.0.20020803074026.02927a48@64.170.22.132> <5.1.0.14.0.20020803112646.00ace9d8@64.170.22.132> <5.1.0.14.0.20020805140501.00af1850@ns.webzsite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5.1.0.14.0.20020805140501.00af1850@ns.webzsite.com>
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

On Mon, 5 August 2002 14:10:24 -0500, Vipin Malik wrote:
> Well, I think there is still a problem somewhere. Regardless of which 
> /dev/mtd<n> device is the actual physical partition (that was a good 
> academic discussion), JFFS2 never gets passed the /dev/mtd<n> device by me- 
> only the /dev/mtdblock<n> device.

I fail to see what was academic about that discussion. Is it academic,
if you pass /dev/hda1 (empty partition) or /dev/hda (whole disk with
root partition) to mke2fs? Try it and tell me again. :-)

> I can do a 'less -f /dev/mtdblock2' and see that's the partition that I 
> want to mount JFFS2 on (it's all formatted correctly). However, a 'mount -t 
> jffs2 /dev/mtdblock2 /mnt/flash' fails as JFFS2 sees a bunch of data to 
> whichever mtd device handle its been passed (by mtdblock2) and refuses to 
> mount as it cannot find any valid JFFS2 nodes there.

If it was formatted correctly, it should get mounted. But I have no
idea, what "it's all formatted correctly" or "JFFS2 sees a bunch of
data" means. Try doing a trivial format (eraseall /dev/mtd<n>) and
mount that. If that fails, show me that the partition has all 0xff and
the jffs2 messages and I will have a look. Until then, I consider this
to be pebkac.

Jörn

-- 
There's nothing better for promoting creativity in a medium than
making an audience feel "Hmm ­ I could do better than that!"
-- Douglas Adams in a slashdot interview
