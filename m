Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1PyH-0006Ak-Pv
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2004 09:43:51 -0400
Message-ID: <004601c48dce$33b3fe70$0260a8c0@p4p800>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <05b901c48c7f$df752c70$fd0ba8c0@briantpc><200408280106.25436.dominik.karall@gmx.net>
	<4130EBF7.70101@inf.u-szeged.hu>
Date: Sun, 29 Aug 2004 08:39:49 -0500
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Subject: Re: Error: jffs2_decompress returned -5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> 0x06 means ZLIB. (you can check it in jffs2.h)
> 
> Is there CONFIG_JFFS2_ZLIB in your kernel config?
> 

Ah no, that's not set.  I'll check turn that on and try again Monday.

-Brian
