Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl7Sq-0002FY-Kw
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:53:48 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0605301226001.16927@localhost.localdomain>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
	<1149004893.32620.6.camel@sauron.oktetlabs.ru>
	<20060530161035.GC26220@wohnheim.fh-wedel.de>
	<Pine.LNX.4.64.0605301226001.16927@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 30 May 2006 20:52:31 +0400
Message-Id: <1149007951.32620.25.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	David Woodhouse <dwmw2@infradead.org>
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

On Tue, 2006-05-30 at 12:32 -0400, Nicolas Pitre wrote:
> I'm firmly with you and so far I agree 100% with your effort.  The 
> cleanups you're providing are much appreciated.
> 
> However Artem might have a point.  You probably should leave mtd->type 
> alone, at least for now.  It is good to not depend on it anymore but it 
> probably still has its informative value, just like name string attached 
> to MTD partitions.  If it should go then it should be removed at the 
> very end when no one uses it anymore.
> 
Fair enough.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
