Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9NdY-0001i2-Fk
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 08:23:41 -0500
Date: Thu, 10 Mar 2005 13:23:17 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Wolfram Gettert <Wolfram.Gettert@mixed-mode.de>
In-Reply-To: <1110380223.422f0ebf951f5@intern.netexpress.de>
Message-ID: <Pine.LNX.4.58.0503101323010.4851@phoenix.infradead.org>
References: <1110380223.422f0ebf951f5@intern.netexpress.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bugreport: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'm having some trouble mounting a JFFS2 root partition as rw at
> boot/init time, and would appreciate any insight that you guys can
> provide.
>
General suggestions:

*	Make sure you use the latest mkfs.jffs2;
*	Try to exclude summary patch and to see what happens;
*	Enable JFFS2 debugging messages and provide the output in the next 
report;
*	Make sure you put your JFFS2 image on the flash correctly. To do 
this you might erase your flash (flash_eraseall -j), mount it and copy 
your files there by means of "cp -r -a";

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
