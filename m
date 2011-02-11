Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PntKA-0006tq-1u
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 13:46:14 +0000
Received: by wwb17 with SMTP id 17so2532589wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 05:46:12 -0800 (PST)
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 15:45:01 +0200
Message-ID: <1297431901.2760.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-02-06 at 15:17 +0200, Artem Bityutskiy wrote:
> Hi,
> 
> here is a better patch for recovery fix. Comparing to the previous
> patch-set now we make sure we keep write-buffer offset aligned to
> @c->max_write_size (64 in case of CFI NOR) as much as possible.
> 
> Also, I've merged the "Add comments" patch with the patch which adds
> the code.
> 
> You can find these patches also in the UBIFS git tree, 'cfi-nor-fix-v2'
> branch:
> git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v2
> 
> Please, test. These patches may break NAND setups as well, so anyone
> who is interested in having stable UBIFS in the next release, please,
> also test.

Just wanted to let everyone know that I'll need to work on a bit better
solution.

The reason is that LEB does not have to start at the max_write_size
boundary, and my v2 does not take that into account. Although for CFI
NOR case this should not matter, because LEB starts at offset 128 (UBI
headers take 64 bytes each). However, this might matter on some other
flash.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
