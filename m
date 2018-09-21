Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3AYa-0006pB-33
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2018 01:48:33 +0000
Received: by mail-qt1-x844.google.com with SMTP id x23-v6so316010qtr.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2018 18:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180916215735.31393-1-richard@nod.at>
 <CACPK8Xd_fNNEYbtY6HEnB6kOnqTWBC5stPVUbc2gMHpne4J6jQ@mail.gmail.com>
 <2090091.R1QOzN4fXt@blindfold>
In-Reply-To: <2090091.R1QOzN4fXt@blindfold>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Sep 2018 11:12:25 +0930
Message-ID: <CACPK8XfnV=MOLqLL3UK7FP+oRCt1NLLgB-OdNEGWXwyFWVu_+g@mail.gmail.com>
Subject: Re: [PATCH] Revert "ubifs: xattr: Don't operate on deleted inodes"
To: Richard Weinberger <richard@nod.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 koen.vandeputte@ncentric.com, Eddie James <eajames.ibm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Sep 2018 at 16:40, Richard Weinberger <richard@nod.at> wrote:
>
> Am Donnerstag, 20. September 2018, 04:30:41 CEST schrieb Joel Stanley:
> > On Mon, 17 Sep 2018 at 07:30, Richard Weinberger <richard@nod.at> wrote:
> > >
> > > This reverts commit 11a6fc3dc743e22fb50f2196ec55bee5140d3c52.
> > > UBIFS wants to assert that xattr operations are only issued on files
> > > with positive link count. The said patch made this operations return
> > > -ENOENT for unlinked files such that the asserts will no longer trigger.
> > > This was wrong since xattr operations are perfectly fine on unlinked
> > > files.
> > > Instead the assertions need to be fixed/removed.
> > >
> > > Cc: <stable@vger.kernel.org>
> > > Fixes: 11a6fc3dc743 ("ubifs: xattr: Don't operate on deleted inodes")
> > > Reported-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > Signed-off-by: Richard Weinberger <richard@nod.at>
> >
> > The bad commit 11a6fc3dc743 was included in 4.18.7, and broke our
> > systems which use overlayfs on top of ubifs.
> >
> > This patch didn't apply cleanly for me to 4.18.8 (an encoding issue?),
> > but I did a revert of the offending commit which did the trick.
> >
> > Tested-by: Joel Stanley <joel@jms.id.au>
>
> Thanks a lot for testing and sorry for the breakage. :-(

No worries. How do you plan to get this fix in? It would be good to
get it in master asap, so we can get it backported in the next wave of
stable releases.

Cheers,

Joel
