Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOkd9-0005Ay-QO
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 05:58:12 +0000
Received: by eyh6 with SMTP id 6so2348858eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 22:58:09 -0700 (PDT)
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>, Russell King
	<rmk+kernel@arm.linux.org.uk>
In-Reply-To: <20110523113709.4357b4ba.randy.dunlap@oracle.com>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	<20110523113709.4357b4ba.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 08:53:51 +0300
Message-ID: <1306216431.2785.46.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Marc Zyngier <Marc.Zyngier@arm.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-23 at 11:37 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix build warnings in physmap.h:
> 
> include/linux/mtd/physmap.h:25: warning: 'struct platform_device' declared inside parameter list
> include/linux/mtd/physmap.h:25: warning: its scope is only this definition or declaration, which is probably not what you want
> include/linux/mtd/physmap.h:26: warning: 'struct platform_device' declared inside parameter list
> include/linux/mtd/physmap.h:27: warning: 'struct platform_device' declared inside parameter list
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Oh, this was missed during review.  This was introduced in
b7281ca2a4b00044c60c25059f467d05772cdbe3 which is going in via Russel's
tree, so I guess Russel could pick up your patch.

CCed relevant people.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
