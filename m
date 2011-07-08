Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qf2aG-00027q-Qb
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 04:22:33 +0000
Received: by vws8 with SMTP id 8so1489725vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 21:22:27 -0700 (PDT)
Subject: Re: [PATCH 1/3] Makefile: fix "version.h" build for cross-compiling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 08 Jul 2011 06:57:40 +0300
In-Reply-To: <CAMjpGUdvJ_kvH9ifM+1mPTtt9ZZUOyNn4RkygiFXT_BGAUui8w@mail.gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
	<CAN8TOE8LpRd+nMiwYFEAFG1gLmPuC8--FjkOxEbBS+iE7NnWTQ@mail.gmail.com>
	<CAMjpGUdvJ_kvH9ifM+1mPTtt9ZZUOyNn4RkygiFXT_BGAUui8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310097465.32086.4.camel@sauron>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-07 at 17:12 -0400, Mike Frysinger wrote:
> On Thu, Jul 7, 2011 at 17:09, Brian Norris wrote:
> > On Thu, Jul 7, 2011 at 1:48 PM, Mike Frysinger wrote:
> >> i dont think it's just a matter of "diff build dir for diff
> >> toolchains, so common version.h is ok".  it's a matter of "building
> >> out of tree should build out of tree".
> >
> > OK, but what is the point of in- vs. out-of-tree? So that we can have
> > a readonly source directory where the mtd-utils code stays?
> 
> this one imo, but maybe Artem can speak to the origins (which predate
> my contributions)

Sorry, I do not know about the origins, I came into MTD area when most
of the things have been already implemented and worked.

-- 
Best Regards,
Artem Bityutskiy
