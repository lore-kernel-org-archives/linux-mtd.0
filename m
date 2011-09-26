Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R8B3b-0000ef-Lo
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 13:17:17 +0000
Received: by eyd9 with SMTP id 9so4276307eyd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Sep 2011 06:17:13 -0700 (PDT)
Subject: Re: [PATCHv7] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Mon, 26 Sep 2011 16:20:04 +0300
In-Reply-To: <1317040680-6199-1-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1317040680-6199-1-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1317043212.9442.8.camel@sauron>
Mime-Version: 1.0
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-embedded <linux-embedded@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-09-26 at 14:38 +0200, David Wagner wrote:
> 	* "volume" parameter: pass the volume name instead of the volume ID

Sorry if I was not clear, but it should accept both name and number.
Take a look at UBI - it first checks if the string is a number, if yes -
tries to open by number, if this fails, tries to treat this as a name
and open by name.

And AFAICS, you did not change the documentation for the "volume" module
parameter.


-- 
Best Regards,
Artem Bityutskiy
