Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NeVLH-0005DK-N5
	for linux-mtd@lists.infradead.org; Mon, 08 Feb 2010 15:16:08 +0000
Subject: Re: [PATCHv3 6/9] idr: Export idr_get_next()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1264798757.2785.36.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
	<1264798757.2785.36.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Feb 2010 17:14:48 +0200
Message-ID: <1265642088.2006.76.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	sf-linux-drivers <linux-net-drivers@solarflare.com>,
	David Woodhouse <dwmw2@infradead.org>,
	KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-29 at 20:59 +0000, Ben Hutchings wrote:
> idr_get_next() was accidentally not exported when added.  It is about
> to be used by mtdcore, which may be built as a module.
> 
> Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>

It is nicer to add an Ack you got from Hiroyuki. But I'll do this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
