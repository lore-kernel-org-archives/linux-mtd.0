Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R8CFH-0001ah-Cc
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 14:33:24 +0000
Received: by wyi11 with SMTP id 11so5359789wyi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Sep 2011 07:33:21 -0700 (PDT)
Subject: Re: [PATCHv8] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Mon, 26 Sep 2011 17:36:07 +0300
In-Reply-To: <1317047152-18809-1-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1317047152-18809-1-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1317047776.9442.10.camel@sauron>
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

On Mon, 2011-09-26 at 16:25 +0200, David Wagner wrote:
> +MODULE_PARM_DESC(volume,
> +       "Format: volume=<ubi_num>:<vol_id>\n"
> +       "Create a ubiblk device at init time.  Useful for mounting it as root "
> +       "device."); 

Sorry, you still did not change the documentation. It should describe
what this parameter is. Now I see that it requires volume ID.

-- 
Best Regards,
Artem Bityutskiy
