Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Duro1-0000Lk-Im
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 09:06:46 -0400
Message-ID: <42DCFABE.7040002@yandex.ru>
Date: Tue, 19 Jul 2005 17:06:06 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: jp.francois@cynove.com
References: <1121776529.2565.34.camel@fedorabox>
In-Reply-To: <1121776529.2565.34.camel@fedorabox>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Understanding jffs2 warning message
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jean-Philippe Francois wrote:
> I am doing some test on a JFFS2 file system.
> It is installed on a Macronix Flash 29LV320, with top boot block.
> The part are cfi probed, and it works (almost) fine.
> 
> I am doing some tar/untar loop [1]. Every six or seven loop, I have a
> serie of 8 warning messages :
> 
> Node totlen on flash (0xffffffff) != totlen in node ref (0x00001040)
> Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
You don't do unclean reboots? If not, this is wierd. This means that the 
node on flash is somehow got corrupted.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
