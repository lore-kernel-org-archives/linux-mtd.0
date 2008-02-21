Subject: Re: [PATCH] [JFFS2] Fix free space leaking
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080221111148.GA10791@lazybastard.org>
References: <20071113102323.GA5933@damir.rnd.local>
	<1202293219.25864.45.camel@gentoo-jocke.transmode.se>
	<20080221111148.GA10791@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Feb 2008 20:39:29 +0900
Message-Id: <1203593969.15409.45.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Damir Shayhutdinov <lost404@gmail.com>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-02-21 at 12:11 +0100, Jörn Engel wrote:
> No idea, but it might help to add dwmw2 to Cc:.

dwmw2 moderately confused by it. I don't see why it's correct to account
for the space as 'free' when it isn't really. If it's causing a
persistent leak, shouldn't we deal with that when the block is erased
instead?

-- 
dwmw2
