Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvU2-00032M-TB
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:05:15 +0000
Received: by wyf23 with SMTP id 23so1531102wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 03:05:13 -0800 (PST)
Subject: Re: [PATCH 3/3] mtd: Add mtdswap block driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <20110222162143.GA13529@angel.research.nokia.com>
References: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
	<1297692971-7399-4-git-send-email-jarkko.lavinen@nokia.com>
	<1298038470.5623.50.camel@localhost>
	<20110222162143.GA13529@angel.research.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 13:03:49 +0200
Message-ID: <1298631829.2798.59.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-02-22 at 18:21 +0200, Jarkko Lavinen wrote:
> On Fri, Feb 18, 2011 at 04:14:30PM +0200, ext Artem Bityutskiy wrote:
> > ... what's the problem with re-trying the erase operation - it
> > looks like over-design.
> 
> > Is it please possible to remove this config option?
> 
> I have a Hynix SLC OneNand spec which says an erase block with an
> erase failure or a write error should not be re-written or erased
> again but instead just garbage collected and marked bad.
> 
> If I switch permanently to the strict erase failure handling, bad
> block marking could be too sensitive for some devices expecting
> retries.
> 
> If I switch permanently to the lenient mode, mtdswap would retry
> failed erases which would be against chip spec of at least the one
> OneNand chip I am working with.
> 
> If I remove the config option it would then mean strict handling
> only.

Please, make the option to be a module parameter.

And add this description to the parameter description. Probably this
amount of text is too much for MODULE_PARM_DESC() - put less there, and
put the details to a comment near that MODULE_PARM_DESC().

IOW, I'm not against this option, I'm against making it Kconfig option.

Thanks a lot!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
