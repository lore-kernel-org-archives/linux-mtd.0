Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LLJZj-00035z-WF
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2009 15:47:08 +0000
Message-ID: <49677171.3080300@users.sourceforge.net>
Date: Fri, 09 Jan 2009 16:46:57 +0100
From: =?UTF-8?B?QW5kZXJzIEdyYWZzdHLDtm0=?=
 <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Matt Witherspoon <spoon@vt.edu>
Subject: Re: BUG in jffs2 with MTD map using cached mapping
References: <1231256507.49637bbb174b6@webmail.vt.edu>
In-Reply-To: <1231256507.49637bbb174b6@webmail.vt.edu>
Content-Type: text/plain; charset=UTF-8
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

Matt Witherspoon wrote:
> I performed a bisection and the offending commit is
> 205c109a7a96d9a3d8ffe64c4068b70811fef5e8. Before this commit, neither the BUG
> nor the node CRC failure occured.
> 
> One notable difference between my board and Mainstone is that my flash chip is
> using the 0002 command set.
> 
> I'm stumped at this point... Any suggestions on where to dig further?

I'd say that the BUG_ON is a secondary error. A broken error path.

http://lists.infradead.org/pipermail/linux-mtd/2008-April/021473.html
