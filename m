Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSD04-0002Qq-Jn
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 18:52:09 +0000
Received: by fxm14 with SMTP id 14so1286396fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 11:52:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307038511-5968-1-git-send-email-computersforpeace@gmail.com>
References: <1307038511-5968-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 2 Jun 2011 14:51:45 -0400
Message-ID: <BANLkTim3uCTqGav2PkJ6D2DfZBjKRg2gcw@mail.gmail.com>
Subject: Re: [RFC] nanddump: skip bad blocks, print full length with --omitbad
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 2, 2011 at 14:15, Brian Norris wrote:
> I'm not sure the original intended use of nanddump's '--omitbad' option,
> but as described below, it doesn't seem to make the most sense to me.
> I'm curiouse whether this change should be implemented as yet another
> new nanddump option (perhaps a '--skipbad' vs. '--omitbad'? this starts
> getting confusing) or if we can simply modify the old behavior of
> '--omitbad'.

pretty sure the opt operates as i intended.  sounds like you want to
add --skipbad.
-mike
