Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI1jt-0002Iy-MF
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 06:22:24 -0400
Message-ID: <43313429.6040701@yandex.ru>
Date: Wed, 21 Sep 2005 14:21:29 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Andrew Lunn <andrew@lunn.ch>, Josh Boyer <jdub@us.ibm.com>
References: <20050920211427.GF8421@lunn.ch>
In-Reply-To: <20050920211427.GF8421@lunn.ch>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: Compilation errors with latest CVS code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Lunn wrote:
> Hi folks
> 
> Im using the MTD CVS trunk from today along with Linux 2.6.13.  I'm
> not using NAND flash, NOR flash with transparent ECC or DataFlash, so
> i disabled JFFS2_FS_WRITEBUFFER. The compilation the fails:

Josh Boyer wrote:
 > Argh guys!  When compiling with CONFIG_JFFS2_FS_WRITEBUFFER not set we
 > get the following error:

I'll take care about this today.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
