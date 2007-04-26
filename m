Subject: Re: OOPS at mount
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1177593359.2755.386.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177587937.8841.13.camel@gentoo-jocke.transmode.se>
	<1177590673.2755.369.camel@pmac.infradead.org>
	<1177591404.8841.18.camel@gentoo-jocke.transmode.se>
	<1177591781.2755.373.camel@pmac.infradead.org>
	<1177592422.8841.24.camel@gentoo-jocke.transmode.se>
	<1177592932.2755.383.camel@pmac.infradead.org>
	<1177593184.8841.29.camel@gentoo-jocke.transmode.se>
	<1177593359.2755.386.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 14:31:15 +0100
Message-Id: <1177594275.2755.398.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-26 at 14:15 +0100, David Woodhouse wrote:
> I haven't _quite_ placed my finger on a sequence of events which leads
> to you having a few older nodes of this inode and a later metadata
> node.
> 
> Had it been deleted while you were still using summary?

If it had, that could explain it.

You start off with this file starting in some eraseblock, with its
dirent, then filling a few more eraseblocks...

 ( D for dirent, I for data node ), [...] is an eraseblock.

1 [......DIIIIIIII]
2 [IIIIIIIIIIIIIII]
3 [IIIIIIIIIIIIIII]
4 [IIII...........]

You seem to have something which will 'touch' these files
in /tftpboot/download when you boot -- which is why I think we aren't
seeing the problem in the image you took. Note the change time on ino
#9943 is yesterday. So somewhere entirely different on the flash you'll
have one mode metadata node for the inode in question.

5 [.......I.......]

Now, you delete the file. You can immediately erase eraseblock #2 and
#3, but because you're using SUMMARY, you don't mark the nodes in the
other eraseblocks as obsolete. You delete the file you downloaded
immediately after the one we oopsed on too, so you erase eraseblock #4.

You do write out a deletion dirent, but I suspect that got erased
somehow later (perhaps when you weren't using SUMMARY?) 

So you're left with this on the medium.
1 [......DIIIIIIII]
 ...
5 [.......I.......]

And that's what caused the crash.

I've handwaved a bit about the deletion dirent going missing, so I'm
still not 100% convinced but I'm fairly sure it's disabling summary
which was the problem.

I wonder if we should seek out obsolete nodes and mark them as such, if
we're mounted on a filesystem with summary nodes when summary support is
deleted.

Then again, why in hell is !jffs2_can_mark_obsolete() when we have
summary support anyway?

-- 
dwmw2
