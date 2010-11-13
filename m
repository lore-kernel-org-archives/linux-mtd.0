Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHDIO-0008Ow-VS
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 10:25:21 +0000
Received: by bwz5 with SMTP id 5so3930008bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 02:25:19 -0800 (PST)
Subject: Re: [PATCH 1/3] mtd: m25p80: Reinstate error print on unrecognized
	flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <fbcf2b0a4d8ebff3378b9522ce81ad82@localhost>
References: <fbcf2b0a4d8ebff3378b9522ce81ad82@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 12:25:07 +0200
Message-ID: <1289643907.2218.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-30 at 21:11 -0700, Kevin Cernekee wrote:
> Commit b34bc037b26e621e5fc13466767e4da110a7b3d3 removed the
> "unrecognized JEDEC id" error message, causing the probe function to
> silently abort if the flash ID is unrecognized.
> 
> It is desirable to produce diagnostic output in this situation so that
> the user has some idea what went wrong.

Pushed the series to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
