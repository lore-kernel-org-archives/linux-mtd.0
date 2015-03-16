Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXZS0-0001KZ-CG
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 18:09:17 +0000
Received: by pdbcz9 with SMTP id cz9so64785179pdb.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 11:08:55 -0700 (PDT)
Date: Mon, 16 Mar 2015 11:08:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: fix missing brace control flow
Message-ID: <20150316180844.GK32500@ld-irv-0074>
References: <1424725642-26270-1-git-send-email-computersforpeace@gmail.com>
 <54EB99F1.4040608@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54EB99F1.4040608@nod.at>
Cc: linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 23, 2015 at 10:21:53PM +0100, Richard Weinberger wrote:
> Am 23.02.2015 um 22:07 schrieb Brian Norris:
> > commit 0e707ae79ba3 ("UBI: do propagate positive error codes up") seems
> > to have produced an unintended change in the control flow here.
> > 
> > Completely untested, but it looks obvious.
> > 
> > Caught by Coverity, which didn't like the indentation. CID 1271184.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Should go into 4.0, I expect.
> 
> Good catch, patch tested and applied!

Is this going in 4.0? It fixes a typo in a hastily-applied patch that
made it to 4.0-rc1.

I'm also not sure I understand the role of the +linux-next and +master
branches in linux-ubifs.git. Typically 'next' means for the current+1
release (i.e., 4.1), while 'not-next' (i.e., your master branch?) would
be for the current release (4.0). But you have +master based on top of
+linux-next.

Brian
