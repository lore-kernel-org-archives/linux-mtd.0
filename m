Received: from mailout1.echostar.com ([204.76.128.101])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQ64O-0004gb-Th
	for linux-mtd@lists.infradead.org; Tue, 18 May 2004 15:59:53 +0100
Message-ID: <C86A9402F6A07E47B2F50A302DFA9BAE044C61@alm-exch.europe.echostar.com>
From: "Teuling, Sieme" <Sieme.Teuling@echostar.com>
To: 'David Woodhouse' <dwmw2@infradead.org>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 18 May 2004 08:59:38 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: patch for nand support linux-2.4.21 jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ay!, I guess that means I'm looking at a fairly big merging effort, since
using 2.4.26 is unfortunally not an option for me (we already ported 2.4.21
to an embedded platform).

Do you guess merging the 2.4.26 mtd/jffs2 code into the 2.4.21 kernel is the
(feasible) approach which most likely will take the least effort?, or is
that likely just as much work as trying to merge the latest snapshot into
the 2.4.21 kernel?

Thanx in advance,

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org] 
Sent: Tuesday, May 18, 2004 4:29 PM
To: Teuling, Sieme
Cc: 'linux-mtd@lists.infradead.org'
Subject: Re: patch for nand support linux-2.4.21 jffs2?


On Tue, 2004-05-18 at 08:07 -0600, Teuling, Sieme wrote:
> Is this a known problem with a know solution?

Problem and solution are 2.4.21 and 2.4.26 respectively.

-- 
dwmw2
