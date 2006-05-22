Received: from soundwarez.org ([217.160.171.123])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fi9ie-0005Ty-Bm
	for linux-mtd@lists.infradead.org; Mon, 22 May 2006 08:41:22 -0400
From: Kay Sievers <kay.sievers@vrfy.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148299024.12285.26.camel@pmac.infradead.org>
References: <000c01c67d89$93035ae0$253682a4@nap.st.com>
	<1148299024.12285.26.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Mon, 22 May 2006 14:09:48 +0200
Message-Id: <1148299789.26156.3.camel@pim.off.vrfy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Davide CASCONE <davide.cascone@st.com>,
	Christian Gierke <ch@gierke.de>
Subject: Re: latest patch download
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-22 at 12:57 +0100, David Woodhouse wrote:
> On Mon, 2006-05-22 at 12:21 +0200, Davide CASCONE wrote:
> > I have visited the suggested web-address
> > http://git.infradead.org/?p=mtd-2.6.git with the latest updates; how
> > can download the latest version of all files (mtd and jffs2)? Are
> > there available some patches to add all the latest updates on my Linux
> > release?
> 
> Hm, no -- I don't think there is a way to do that. It's a sensible
> feature request for gitweb though -- just being able to extract a diff
> between two branches (i.e. 'linus->master') would be useful.
> 
> The best answer I can give right now is just to install cogito and
> 'cg-diff -r linus', unless the gitweb authors want to tell me that
> gitweb _can_ do diffs between branches, and I've just missed it...

Something like this?:
  http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=HEAD;hp=v2.6.17-rc1

But you have to manually add ';hp=<tagname/hash>' to the url, for the
commit(parent) you want to base against

Kay
