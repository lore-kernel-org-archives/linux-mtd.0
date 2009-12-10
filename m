Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIfFa-0001dl-31
	for linux-mtd@lists.infradead.org; Thu, 10 Dec 2009 09:23:58 +0000
Subject: Re: UBIFS on kernel 2.6.24?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
In-Reply-To: <200912101019.45873.david.jander@protonic.nl>
References: <200911231510.40294.david.jander@protonic.nl>
	<200912091140.03345.david.jander@protonic.nl>
	<1260356109.19669.1289.camel@localhost>
	<200912101019.45873.david.jander@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Dec 2009 11:23:26 +0200
Message-Id: <1260437006.12346.46.camel@localhost>
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

On Thu, 2009-12-10 at 10:19 +0100, David Jander wrote:
> > What I can say for sure is that I personally is not very interested in
> > solving problems for too old UBIFS code-base. Well, problems I can
> > reproduce here, in my setup, are OK, but subtle problems which I cannot
> > reproduce here are not OK - I really want to be sure UBI/UBIFS are
> > up-to-date and this is not something we already fixed.
> 
> I understand. All I wanted is to see if someone would jump up and say 
> something like: "Oh, no, this old version is known to be broken, you need some 
> important bug-fixes that went into the updates". That obviously didn't happen, 
> so I know what I am facing: Update to the latest version, test it thoroughly, 
> and hope for the best :-(

I'd put it this way: pull the back-port tree, try to reproduce the
problem, and come back if it is still there. This will be faster than
lengthy e-mail exchange :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
