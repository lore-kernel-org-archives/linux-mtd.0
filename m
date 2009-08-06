Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MZ4QY-0004WR-9n
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 14:58:51 +0000
Date: Thu, 6 Aug 2009 16:58:42 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
Message-ID: <20090806145842.GA14994@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1239366655.3390.14.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1239366655.3390.14.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2009-04-10 15:30:55 [+0300]:

Sorry for late reply. You killed from To/Cc in the thread and I received
this email just via the mailing list which I read irregulary.

>On Mon, 2009-03-23 at 23:42 +0100, Sebastian Andrzej Siewior wrote:
>> this is difficult because it depends on CONFIG_JFFS2_FS_WRITEBUFFER
>> 
>
>So do you still support your patches?
Well, at that time I received a bug report where someone was using
dataflash with jffs2 so I tried to clean it up.

>I think that if your patches
>
>a. do not break anything
The breakage was that one person showed up and comlained about longer
first time mount time which was critical for him because it was
production/test or something like that and the timeframe was fixed,
short or something like that.

>b. have at least some improvements, even if they do not work for all
>cases
The improvement was that flash_eraseall did not attempt to create erase
markers on data flash. And something dependent on a kernel option which
userland could not know. Therefore the clean thing was to remove the
clean marker all together but this breaks your point a
So adding an option which sets the sate of CONFIG_JFFS2_FS_WRITEBUFFER
in kernel might be a solution.

>then we may just take them.
I don't use JFFS2 anymore so I would leave as it. If someone needs/wants
to fix it, he can take the patches probably as it since the jffs2
doesn't change much these days. Unless you really want me get it fixed
some way but I doubt it :)

>Artem Bityutskiy (???????????????? ??????????)

Sebastian
