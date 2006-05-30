Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl216-0003K6-OI
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 07:04:10 -0400
Date: Tue, 30 May 2006 13:03:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060530110354.GA24129@wohnheim.fh-wedel.de>
References: <200605272120.19348.linux@johannes-niess.de>
	<625fc13d0605290629h4aabd512q5f53e06a5399fcf7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0605290629h4aabd512q5f53e06a5399fcf7@mail.gmail.com>
Cc: Johannes Niess <linux@johannes-niess.de>, linux-mtd@lists.infradead.org
Subject: Re: mtd2block should not expand sparse loopback files
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 May 2006 08:29:03 -0500, Josh Boyer wrote:
> On 5/27/06, Johannes Niess <linux@johannes-niess.de> wrote:
> 
> >I guess that the "fill with 1's" flash strategy is taking its toll together
> >with the "Clean" markers. Can I switch that off? Using
> >"mkfs.jffs2 --no-cleanmarkers"  does not help, as does  --eraseblock=0.
> 
> No you can't switch it off.  The filesystem will add them itself.

For now.  I have a patch pending that removes the cleanmarker
generation from jffs2.  Still needs some polishing, though.

Basically, if the mtd can do implicit erase, like any RAM, disk or
file-based device, there is no point in the cleanmarkers and jffs2
doesn't write them.  There might be other cases where they can be
omitted at well.

Jörn

-- 
He who knows that enough is enough will always have enough.
-- Lao Tsu
