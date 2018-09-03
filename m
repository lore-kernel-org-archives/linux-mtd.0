Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwpQG-0002l9-MD
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2018 14:01:46 +0000
From: Richard Weinberger <richard@nod.at>
To: cgxu519 <cgxu519@gmx.com>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2: add additinal sanity check for
 jffs2_acl_from_medium()
Date: Mon, 03 Sep 2018 16:01:31 +0200
Message-ID: <2672376.Ws11GeDHN2@blindfold>
In-Reply-To: <56f970fc-ac3b-94d8-0f00-5db3fa68ca65@gmx.com>
References: <20180902154443.4776-1-cgxu519@gmx.com>
 <CAFLxGvyVmdDk8RqK5y8Q2eDxx4kLPhOJJ8e6TUpx=_E7_u+d-w@mail.gmail.com>
 <56f970fc-ac3b-94d8-0f00-5db3fa68ca65@gmx.com>
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

Am Montag, 3. September 2018, 15:28:31 CEST schrieb cgxu519:
> On 09/03/2018 04:45 PM, Richard Weinberger wrote:
> > On Sun, Sep 2, 2018 at 5:45 PM Chengguang Xu <cgxu519@gmx.com> wrote:
> >> In the case ACL_USER and ACL_GROUP we check if value has exceeded end,
> >> add same check in the case ACL_OTHER as well.
> > Did you hit a problem in that area or was this found by review?
> >  From looking at the code I'd say it is fine as is.
> > In the ACL_MASK/_OTHER case we don't look into the entry object like
> > ACL_USER/_GROUP
> > do, we immediately break the switch and run another round in the for loop.
> > And here we do:
> >                  entry = value;
> >                  if (value + sizeof(struct jffs2_acl_entry_short) > end)
> >                          goto fail;
> >
> > Which is what your additional check does. So, we'd check twice.
> > What do I miss?
> 
> You are right, it is actually not needed. Sorry, please just drop the patch.

No problem, that's why we have a review process. :-)

Thanks,
//richard
