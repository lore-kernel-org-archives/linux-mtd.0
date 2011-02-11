Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnu6m-0007ah-Ms
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:36:29 +0000
Received: by wyf22 with SMTP id 22so2417755wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:36:27 -0800 (PST)
Subject: Re: mount ubi volume fails: No such device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lars.michael@yahoo.com>
In-Reply-To: <571902.81856.qm@web30203.mail.mud.yahoo.com>
References: <571902.81856.qm@web30203.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:35:19 +0200
Message-ID: <1297434919.2760.36.camel@localhost>
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

On Fri, 2011-02-11 at 06:21 -0800, Lars Michael wrote:
> So I got 167 patches from the ubifs 2.6.29 back port tree, some of
> them
> looking very relevant. I did manage to format, attach and mount once,
> but it appears very unstable reporting more and more errors, like:

You definitely have to take patches from the back-port tree.

But, please, first make sure your subpage problem disappears by either
fixing your driver or by asking UBI to not use sub-pages.

Also, there is one critical patch missing in the back-port trees which I
have to put there, I'll do this shortly.

And Ideally, I need to back-port mtd tests fixes to back-port trees, but
I do not think I have time for that, you can try to do this yourself.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
