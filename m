Received: from av5-1-sn1.fre.skanova.net ([81.228.11.111])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgPFW-000872-HG
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 10:15:03 -0500
From: "Per Hedblom" <per.hedblom@abem.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Mon, 20 Dec 2004 16:14:55 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1103553294.5917.49.camel@localhost.localdomain>
Message-Id: <20041220151456.33CA537E68@smtp3-1-sn1.fre.skanova.net>
Cc: linux-mtd@lists.infradead.org
Subject: RE: question about placement of JFFS2_SB_FLAG_MOUNTING  flag.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Monday, December 20, 2004 3:35 PM
> 
> No, you're just masking another problem. Where and why did it stop?
> 
The  mount goes into an endless loop at 
nodemgmt.c, line 586 , ic = jffs2_raw_ref_to_ic(ref);

The comments in the jffs2_mark_node_obsolete made me think that the flag was
wrong.

I have the D1 log so some hints on what I should look for would be helpful.
/Per
