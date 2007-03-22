Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HUNi7-0002y5-1V
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 09:52:12 -0400
Subject: Re: JFFS2 SUMMARY nodes aren't working
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <46028675.30200@ru.mvista.com>
References: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
	<46028675.30200@ru.mvista.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 22 Mar 2007 14:52:09 +0100
Message-Id: <1174571529.26465.311.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-22 at 16:36 +0300, Vitaly Wool wrote:
> Joakim Tjernlund wrote:
> 
> >On a fresh JFFS2 root FS image with summary nodes there is no
> >difference in mount time when enabling summary support in kernel(2.6.20,
> >powerpc).
> >  
> >
> Can you please elaborate on how you got the image with summary nodes?

>From my JFFS2 build script:
mkfs.jffs2 -e 0x20000 -b -d jffs2root -o "${JFFS2FILE}.tmp" || exit
sumtool -e 0x20000 -b -i "${JFFS2FILE}.tmp" -o "${JFFS2FILE}" || exit


sumtool --version
sumtool: revision 1.9
> 
> Vitaly
> 
> 
