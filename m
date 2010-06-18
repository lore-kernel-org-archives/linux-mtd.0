Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OPYnh-00023I-TX
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 10:27:54 +0000
Subject: Re: Fix mtd-utils bugs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "stanley.miao" <stanley.miao@windriver.com>
In-Reply-To: <4C1B2B65.3090606@windriver.com>
References: <1276248975-1822-1-git-send-email-stanley.miao@windriver.com>
	<1276422718.19028.211.camel@localhost>
	<1276424048.19028.217.camel@localhost> <4C1B2B65.3090606@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Jun 2010 13:24:23 +0300
Message-ID: <1276856663.19028.447.camel@localhost>
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

On Fri, 2010-06-18 at 16:16 +0800, stanley.miao wrote:
> Artem Bityutskiy wrote:
> > On Sun, 2010-06-13 at 12:51 +0300, Artem Bityutskiy wrote:
> >   
> >> On Fri, 2010-06-11 at 17:36 +0800, Stanley.Miao wrote:
> >>     
> >>> <snip>
> >>>       
> >> Please, make sure your submissions have proper version. I have limited
> >> amount of time and do not want to spend it figuring out which patch is
> >> the latest. Use the best kernel practices and apply prefix your stuff
> >> with [PATCHv3] or something like that.
> >>
> >> Could you please re-submit your latest version?
> >>     
> >
> > Also, it is nice to put a short changelog, but I can live without it.
> >   
> 
> Is the subject of every emails is the short changelog you wanted ?

Hi,

Sorry, I do not understand the question. I do not need changelogs. I
just noted that there are best practices, and people use changelogs. You
can take a look at lkml archives at patch series from good kernel
hackers for example.

If you asked whether the changelog should be in each patch - no, just in
the "0" patch, and just short.

Anyway, I just want you to re-send your up-to-date patches as a separate
series with a v2 prefix.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
