Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkrWe-0003NO-1F
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 11:41:48 +0000
Date: Fri, 16 Sep 2016 13:41:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/17] UBI: introduce the VID buffer concept
Message-ID: <20160916134116.6cde2723@bbrezillon>
In-Reply-To: <d371d725-8bde-5347-445c-5849c22b5b7a@nod.at>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473087908-27862-18-git-send-email-boris.brezillon@free-electrons.com>
 <d371d725-8bde-5347-445c-5849c22b5b7a@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 Sep 2016 13:38:27 +0200
Richard Weinberger <richard@nod.at> wrote:

> Boris,
> 
> On 05.09.2016 17:05, Boris Brezillon wrote:
> > +/**
> > + * ubi_get_vid_hdr - Get the VID header attached to a VID buffer
> > + * @vidb: the VID buffer to free  
> 
> Copy paste error?

Yep. Will fix that.

> 
> > + */
> > +static inline struct ubi_vid_hdr *ubi_get_vid_hdr(struct ubi_vid_io_buf *vidb)
> > +{
> > +	return vidb->hdr;  
> 
> I guess in future there will be a second parameter to return the nth header located
> on the buffer?

Exactly.

> 
> Thanks,
> //richard
