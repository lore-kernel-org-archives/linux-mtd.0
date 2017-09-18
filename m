Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtq8c-0003DO-A3
 for linux-mtd@lists.infradead.org; Mon, 18 Sep 2017 07:06:40 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Jaap de Jong <jaap.dejong@nedap.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubi resize shrink volume
Date: Mon, 18 Sep 2017 09:06:34 +0200
Message-ID: <2434284.gX760p0sQM@blindfold>
In-Reply-To: <14138f20-e173-aa12-fcb2-65839de513f0@nedap.com>
References: <f91150f4-8aff-1069-afaf-d602c4494fdc@nedap.com>
 <CAFLxGvzz0zvvvVuEJzmzHJH_z-5QzHGEETh6v2HUzLqpB6pJaQ@mail.gmail.com>
 <14138f20-e173-aa12-fcb2-65839de513f0@nedap.com>
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

Am Montag, 18. September 2017, 08:34:34 CEST schrieb Jaap de Jong:
> On 15-09-17 20:30, Richard Weinberger wrote:
> > On Fri, Sep 15, 2017 at 8:34 AM, Jaap de Jong <jaap.dejong@nedap.com> 
wrote:
> >> Hi All!
> >> 
> >> I've seen a several (old) posts regarding this subject and I was
> >> wondering
> >> what the status at this moment is.
> >> 
> >> Is there any implementation available that is able to shrink a ubi
> >> volume,
> >> so that it will move used blocks at the end to the front?
> > 
> > Not sure if I got your use case, but you can do this in userspace.
> > 
> > If you're asking whether it is possible to shrink UBIFS, no, this is
> > not possible.
> 
> Sorry for the confusion.
> Yes, I want to shrink of a not-mounted UBIFS preferably in u-boot.
> In the posts I read it should not be that hard to do, so I was wondering
> if anyone had taken the effort to implement this...

Nope. So far nobody cared enough about this feature.
Please note that many other major filesystems alos don't support this.
Such das XFS.

Thanks,
//richard
