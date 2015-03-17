Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXnUv-0002Lc-8E
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2015 09:09:13 +0000
Message-ID: <1426583329.1567.117.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: fix missing brace control flow
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Tue, 17 Mar 2015 11:08:49 +0200
In-Reply-To: <55071F1D.3040308@nod.at>
References: <1424725642-26270-1-git-send-email-computersforpeace@gmail.com>
 <54EB99F1.4040608@nod.at> <20150316180844.GK32500@ld-irv-0074>
 <55071F1D.3040308@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-03-16 at 19:21 +0100, Richard Weinberger wrote:
> Hi!
> 
> Am 16.03.2015 um 19:08 schrieb Brian Norris:
> > On Mon, Feb 23, 2015 at 10:21:53PM +0100, Richard Weinberger wrote:
> >> Am 23.02.2015 um 22:07 schrieb Brian Norris:
> >>> commit 0e707ae79ba3 ("UBI: do propagate positive error codes up") seems
> >>> to have produced an unintended change in the control flow here.
> >>>
> >>> Completely untested, but it looks obvious.
> >>>
> >>> Caught by Coverity, which didn't like the indentation. CID 1271184.
> >>>
> >>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >>> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> >>> ---
> >>> Should go into 4.0, I expect.
> >>
> >> Good catch, patch tested and applied!
> > 
> > Is this going in 4.0? It fixes a typo in a hastily-applied patch that
> > made it to 4.0-rc1.
> 
> That's the plan.
> 
> > I'm also not sure I understand the role of the +linux-next and +master
> > branches in linux-ubifs.git. Typically 'next' means for the current+1
> > release (i.e., 4.1), while 'not-next' (i.e., your master branch?) would
> > be for the current release (4.0). But you have +master based on top of
> > +linux-next.
> 
> I'm using Artem's scheme. next is the branch Linus pulls from.
> Artem, why are the two UBIFS fixes from master not in next?

Just wanted to keep them there for several days.

> I thought you want to send a pull request to Linus?

No, I was not going to send this for 4.0. There is one fix which looks
important, but on the other hand, I did not test it, and no one reported
this problem and said this patch helps, so I was not going to send it
earlier.

> If you want, I can do that. I'm anyway preparing some UBI fixes.

Yes, please, merge master to linux-next.
