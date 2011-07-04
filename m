Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QdclY-0000pw-To
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2011 06:36:21 +0000
Received: by iwn35 with SMTP id 35so5217957iwn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Jul 2011 23:36:19 -0700 (PDT)
Subject: Re: [PATCH] mtd: plat-nand: Fixup kerneldoc for struct
	platform_nand_chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 04 Jul 2011 09:37:16 +0300
In-Reply-To: <1309521075-18106-1-git-send-email-tklauser@distanz.ch>
References: <1309521075-18106-1-git-send-email-tklauser@distanz.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309761441.23597.210.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Randy Dunlap <rdunlap@xenotime.net>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-07-01 at 13:51 +0200, Tobias Klauser wrote:
> The set_parts and priv members of struct platform_nand_chip where
> removed in commit c36a6ef3845262ade529afb9f458738b1f196f83 but the
> kerneldoc wasn't updated.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
