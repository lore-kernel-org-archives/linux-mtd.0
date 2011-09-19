Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5W95-0000iM-Dz
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 05:11:55 +0000
Received: by fxg7 with SMTP id 7so4367669fxg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Sep 2011 22:11:53 -0700 (PDT)
Subject: Re: DocG3 patch
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 19 Sep 2011 08:14:34 +0300
In-Reply-To: <87ipoq417s.fsf@free.fr>
References: <87ipoq417s.fsf@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316409280.24366.60.camel@sauron>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-09-18 at 12:03 +0200, Robert Jarzmik wrote:
> Hello Artem,
> 
> It's been 2 months, and I had no news.
> The DocG3 driver was submitted and not reviewed in [1] and [2].
> 
> Could you merge the patch into your tree please (patch in [2]) ?

Oh, I missed your v2 completely.

The problem I see with this driver is that it uses sysfs interfaces for
debugging purposes. You should not do this - we have debugfs for stuff
like that.  I suggest you to just kill sysfs interfaces and re-send your
patch. You can later add debugfs interfaces instead.

-- 
Best Regards,
Artem Bityutskiy
