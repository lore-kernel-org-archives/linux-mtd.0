Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c0k4-0004ln-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 09:30:32 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.0-24 #47347)
 id <0GIT00L01MKUC8@asu.edu> for linux-mtd@lists.infradead.org; Wed,
 29 Aug 2001 01:36:30 -0700 (MST)
Date: Wed, 29 Aug 2001 01:36:54 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:(
In-reply-to: <3B8C9DC5.F3185B18@dgt-lab.com.pl>
To: Wojciech Kromer <krom@dgt-lab.com.pl>
Cc: mtd <linux-mtd@lists.infradead.org>
Message-id: <999074214.32409.1.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ>
 <3B8C86BD.5C4FBCF9@dgt-lab.com.pl> <999069428.31681.12.camel@russ>
 <3B8C9DC5.F3185B18@dgt-lab.com.pl>
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

On 29 Aug 2001 09:46:13 +0200, Wojciech Kromer wrote:
> >
> > I don't know what an "MDC" is, mut whatever changes your bus timings
> 
> I can only change wait-states in ORx (option register in MPC850).
> But just mounting jffs2 still takes about 2 min :(
> 
> -Are thre any settings in JFFS2 code, or in MTD code?
> -Maybe I can enlarge some buffers? But I don't know where.

jffs2 has to scan the entire medium at mount. Also, if there are
"unformatted" sectors, it erases them (so the first mount will be slower
than subsequent mounts). Did you look at you data sheets and see if that
is as tight as the timing can be?
