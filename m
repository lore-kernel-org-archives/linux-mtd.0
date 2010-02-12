Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nfv8t-0002y9-Tk
	for linux-mtd@lists.infradead.org; Fri, 12 Feb 2010 13:01:12 +0000
Subject: Re: Why erase_pending_blocks in write_super? (was: [PATCH] JFFS2:
	Erase max 3 EB's in ...)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF36A0B5DE.926C06F6-ONC12576C8.004392D1-C12576C8.0044B7AA@transmode.se>
References: <DIIE.00001DD8002443BF@mail.auerswald.de>
	<OF36A0B5DE.926C06F6-ONC12576C8.004392D1-C12576C8.0044B7AA@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Feb 2010 14:59:42 +0200
Message-ID: <1265979582.29027.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Kai-Uwe Bloem <kai-uwe.bloem@auerswald.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-12 at 13:30 +0100, Joakim Tjernlund wrote:
> > So, can you please enlighten me? What's the advantage of having the pending
> > list erased in write_super? Can I possibly remove it without experiencing
> > other problems?
> 
> Me too wants to know :)

I believe there is no reason. This is why I suggested to move it to the
BGT.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
