Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOjVU-00073K-Kc
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 12:50:14 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: "Sourabh Jain (R&D - Telecom)" <sourabh.jain@matrixcomsec.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Cc: "Vamsi S (R&D - Telecom)" <vamsi.s@matrixcomsec.com>,
 "Rajdeep Vaghasia (Software Development - Telecom)"
 <rajdeep.vaghasia@matrixcomsec.com>,
 "Shailesh Panchal (Software Development - Telecom)"
 <shailesh.panchal@matrixcomsec.com>
Subject: Re: UBIFS node corruption issue
Date: Fri, 01 Jun 2018 14:49:56 +0200
Message-ID: <2203231.iLWHeG1VOg@blindfold>
In-Reply-To: <CAAR3sxPDomY9SzdUt=FAJsaMFUqJMpDviNc4dFbz4WZaX8f8oQ@mail.gmail.com>
References: <CAAR3sxP_JEXoA6JMN6FgDp8p1PsmDG9JONJXEbz-APZoOjrKBA@mail.gmail.com>
 <CAFLxGvxBF1hrr8dh5xfH3WMj3ND64OftOv_OvPjjdXYE9iBXsA@mail.gmail.com>
 <CAAR3sxPDomY9SzdUt=FAJsaMFUqJMpDviNc4dFbz4WZaX8f8oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 1. Juni 2018, 14:23:05 CEST schrieb Sourabh Jain (R&D - Telecom):
> >> What can be the problem?
> >
> > Well, UBIFS' index tree seems to reference a LEB (or part of a LEB)
> > which is empty.
> > This can have tons of reasons. Starting from MTD drivers bugs to UBIFS bugs.
> 
> There is one observation, i have read all the VID header from the PEB
> and there is
> no header having LEB number 328, which causing problem.
> Why there is mapping for LEB Number 328 in index tree?

Depends. Maybe the PEB behind the LEB was erased by mistake.
I have seen such driver bugs.
 
> 
> >> How we can resolve this issue?
> >>
> >> Please suggest us necessary action to be taken. Also, please inform us
> >> if any further input is required from us.
> >
> > Are you facing this problem on more than one target, and is it reproducible?
> 
> We are facing this problem in some boards.
> there is another problem in which the root file system become read
> only but actually it is r/w.

Do you face this issues also on a recent kernel?

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
