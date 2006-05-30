Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl7EC-0001eV-Jn
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:38:03 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060530161035.GC26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
	<1149004893.32620.6.camel@sauron.oktetlabs.ru>
	<20060530161035.GC26220@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 30 May 2006 20:37:23 +0400
Message-Id: <1149007043.32620.23.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-30 at 18:10 +0200, Jörn Engel wrote:
> Artem, for some reason I can't seem to either understand you or change
> your mind.  You firmly want to keep mtd->type for a reason I cannot
> understand.  And I firmly believe that mtd->type is useless at best
> and outright harmful at worst.  Most likely one of us is wrong, but
> since we can't reach common grounds, I stopped arguing with you.  It
> is pointless, sadly.

As you're removing an already existing field, *you* should prove why it
is useless, not me. I provide you a silly use-case: i want to print a
type of flash my JFFS2 file system is working on - why mustn't I?

Again, I'm not against your claen-up, OK? But do one thing at a time
please, not 2 at once. Introduce capabilities, but don't touch mtd->type
please, why isn't this possible?

At last, if you hate mtd->type, remove it later by one patch (I hope
this won't happen :-) ).

Do you see my point?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
