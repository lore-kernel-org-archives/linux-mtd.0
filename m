Received: from rwcrmhc12.comcast.net ([216.148.227.85])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DnLHC-0000Sz-TL
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 14:57:44 -0400
From: Charles Tilbury <charles.tilbury@comcast.net>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 28 Jun 2005 11:57:39 -0700
References: <200506271409.42449.charles.tilbury@comcast.net>
	<200506280941.14702.charles.tilbury@comcast.net>
	<1119983460.12240.22.camel@hades.cambridge.redhat.com>
In-Reply-To: <1119983460.12240.22.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200506281157.39708.charles.tilbury@comcast.net>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: NAND flash question
Reply-To: charles.tilbury@comcast.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 28 June 2005 11:30 am, David Woodhouse wrote:
> On Tue, 2005-06-28 at 09:41 -0700, Charles Tilbury wrote:
> > In part, I want to get rid of the messages.  They make the marketing
> > guys nervous.  <<grin>>  I may just supress them using comments.  What
> > I really need is to make sure that the user land data gets flushed to
> > NAND before power loss.   That seems like a JFFS2 issue, do you agree?
>
> Not really. Userland data are flushed to the medium on fsync() or sync()
> just as with other file systems. If a write() call has _just finished
> when the power is lost, there's no guarantee that _any_ file system will
> have committed that write to the medium already. (Unless you were using
> O_SYNC, which we don't support for JFFS2).

How could one change the flush interval to around 100mS?  Or does that sound 
like a stupid idea?
