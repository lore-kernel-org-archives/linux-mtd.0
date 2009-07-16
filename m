Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRNia-0007fG-3d
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 09:57:39 +0000
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
In-Reply-To: <4A5E1D1A.3090705@s5r6.in-berlin.de>
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>
	<1247640750.11353.6.camel@localhost.localdomain>
	<4A5E1D1A.3090705@s5r6.in-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 12:57:12 +0300
Message-Id: <1247738232.11353.90.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Subrata Modak <subrata@linux.vnet.ibm.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 20:16 +0200, Stefan Richter wrote:
> Artem Bityutskiy wrote:
> > On Wed, 2009-07-15 at 07:49 +0530, Subrata Modak wrote:
> >> Following fix is inspired by David Howells fix few days back:
> >> http://lkml.org/lkml/2009/7/9/109,
> >>
> >> Signed-off-by: Subrata Modak<subrata@linux.vnet.ibm.com>,
> >> ---
> > 
> > Removed junk comma at the end of "signed-off-by" and pushed to
> > the ubifs-2.6.git tree:
> > 
> > http://git.infradead.org/ubifs-2.6.git?a=commit;h=5c1507e6097c4abc13bbad69de137366c9043f22
> > 
> > Thanks.
> > 
> 
> The changelog of the patch is bad.  "Fix compilation warning" is not 
> correct.  It should be "suppress compilation warning" or "annotate 
> unitialized variable" or whatever --- i.e. it should say what it does.

For me this sounds the same. But probably your version is better
English. I'll change this.

> Furthermore, since the 3 lines context around the change in the diff do 
> not reveal why the chosen "fix" is correct and desirable, the changelog 
> should also leave a note why it's done this way.

The changelog says which kind of warning is fixed, I though it is
obvious what is the warning. At lease for me it would.

But if Subrata sends me the warning he sees, I'll change that.
Thankfully I did not push the patch to ubifs-2.6.git/linux-next
which I never re-base, but pushed it to master which I do rebase
and it is documented here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

So I may just amend the commit's message.

> The patch form David Howells which is quoted here has an equally bad 
> subject, but at least its changelog goes on to explain what the patch 
> really does and why it does it in the proposed way.

Well, I just thought this type of warnings and way of fixing is very
standard because I saw many similar fixes all over the place.

Anyway, amended the patch like this so far:
http://git.infradead.org/ubifs-2.6.git?a=commit;h=5c1507e6097c4abc13bbad69de137366c9043f22

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
