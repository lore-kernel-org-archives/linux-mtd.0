Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwYoS-0000lj-65
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 11:41:21 +0000
Received: by wwj40 with SMTP id 40so3689440wwj.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 03:41:18 -0800 (PST)
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 13:39:50 +0200
Message-ID: <1299497990.2746.31.camel@localhost>
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

Anatolij,

did these patches fix your issues. I know you found another one related
to unstable bits, but it is a separate issue. I need to make a decision
whether my patches go upstream the next merge window or they should
wait.

I have v3 of the patches, but they are not very different from v2. I
will send them out as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
