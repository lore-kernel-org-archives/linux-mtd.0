Received: from smtp14.wanadoo.fr ([193.252.23.69])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DurxN-0000jD-Ss
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 09:16:28 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf1404.wanadoo.fr (SMTP Server) with ESMTP id C12C57000048
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 15:16:19 +0200 (CEST)
From: Jean-Philippe Francois <jp.francois@cynove.com>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <42DCFABE.7040002@yandex.ru>
References: <1121776529.2565.34.camel@fedorabox> <42DCFABE.7040002@yandex.ru>
Content-Type: text/plain
Message-Id: <1121778978.2565.43.camel@fedorabox>
Mime-Version: 1.0
Date: Tue, 19 Jul 2005 15:16:18 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Understanding jffs2 warning message
Reply-To: jp.francois@cynove.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-07-19 at 15:06, Artem B. Bityuckiy wrote:
> Jean-Philippe Francois wrote:
> > I am doing some test on a JFFS2 file system.
> > It is installed on a Macronix Flash 29LV320, with top boot block.
> > The part are cfi probed, and it works (almost) fine.
> > 
> > I am doing some tar/untar loop [1]. Every six or seven loop, I have a
> > serie of 8 warning messages :
> > 
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001040)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
> You don't do unclean reboots? If not, this is wierd. This means that the 
> node on flash is somehow got corrupted.
Well, things happen, so may be there was not so clean reboot :)
What happens to corrupted nodes ? Are they somehow garbage collected ?
If I use a partition without the top block, these warning messages do
not appear.

JP Francois
