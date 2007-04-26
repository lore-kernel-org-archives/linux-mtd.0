Subject: Re: OOPS at mount
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1177587937.8841.13.camel@gentoo-jocke.transmode.se>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177587937.8841.13.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 12:57:34 +0100
Message-Id: <1177588654.2755.360.camel@pmac.infradead.org>
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

On Thu, 2007-04-26 at 13:45 +0200, Joakim Tjernlund wrote:
> searched for the inode's reported above and found:
> ~/jffs2 # find . -inum 9947 -print
> ./tftpboot/download/osappl02a-r8a-070207_1.powerpc.pkg
> ~/jffs2 # find . -inum 9049 -print
> ./tftpboot/download/cuboot01a-r8a-070129_1.ppc_8xx.rpm
> ~/jffs2 # find . -inum 9943 -print
> ./tftpboot/download/tuappl01a-r8a-070207_1.ppc_8xx.rpm
> ~/jffs2 # find . -inum 10580 -print
> ./tftpboot/download/cuappl01a-r8a-070213_10.ppc_8xx.rpm
> ~/jffs2 # find . -inum 11246 -print
> ./tftpboot/download/cuappl02a-r8a-070221_10.powerpc.pkg
> ~/jffs2 # find . -inum 6537 -print 
> ./tftpboot/download/osappl01a-r3b-1.ppc_8xx.rpm
> 
> These all old rpms of ours apps that has been downloaded and installed
> earlier.

Yeah, I'm seeing those.

I'm confused by the node CRC failure. Those nodes shouldn't even end up
in the lists because they should be discarded at scan time -- the reason
the CRC fails is because the 'JFFS2_NODE_ACCURATE' bit has been cleared.
They're obsolete nodes.

Oh. You're not using SUMMARY any more, are you? So you've been writing
to this with a mixture of jffs2_can_mark_obsolete() and 
!jffs2_can_mark_obsolete().  Which means that when I mount with summary
enabled, I expect those nodes to be valid. And you've since obsoleted
them with summaries disabled, and they're not.

I wonder if that's the root cause of the problem you were seeing too?
I'll build without summary and see...

-- 
dwmw2
