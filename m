Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmUGE-0001ft-12
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 16:48:22 +0000
Received: by bwz5 with SMTP id 5so5375840bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Feb 2011 08:48:20 -0800 (PST)
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20110207172523.11294ec5@wker>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<20110207172523.11294ec5@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Feb 2011 18:43:52 +0200
Message-ID: <1297097032.5938.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Holger Brunck <holger.brunck@keymile.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Detlev Zundel <dzu@denx.de>, Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
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

On Mon, 2011-02-07 at 17:25 +0100, Anatolij Gustschin wrote:
> 
> First test results with patches from cfi-nor-fix-v2 applied:
> 
> Test description:
> Using Spansion NOR Flash S29GL512P (2 x16 chips in a 32-bit bank).
> An application is continuously writing "ABC123" sequence in a file
> on the UBIFS partition. A system reset is performed simulating a
> power cut event. The board reboots, attaches UBI volume, mounts
> the UBIFS partition and starts the test application again. 
> 117 power cut test cycles succeeded, at next cycle the UBIFS
> partition recovery didn't succeed. Below is the kernel log with
> UBI/UBIFS debug enabled: 

Am I right that you see this even when you use the previous solution
where we set c->min_io_size to mtd->writebufsize?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
