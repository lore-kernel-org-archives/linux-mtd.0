Received: from ro-out-1112.google.com ([72.14.202.179])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Il3ct-0002Zp-As
	for linux-mtd@lists.infradead.org; Thu, 25 Oct 2007 15:24:03 +0100
Received: by ro-out-1112.google.com with SMTP id a14so849688rof
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Oct 2007 07:22:55 -0700 (PDT)
Date: Thu, 25 Oct 2007 09:22:25 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Duke <ezbonites@gmail.com>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071025092225.410ca383@weaponx.rchland.ibm.com>
In-Reply-To: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 25 Oct 2007 09:06:29 -0500
Duke <ezbonites@gmail.com> wrote:

> Hi All,
> What's the deal with "too few erase blocks" message?
> Is one block too few for a jffs2 partition?
> My block size if 256K and I created a small jffs2 256K partition for
> read/writing.
> Is this really too small for jffs2? If so, is there anything I can do for this?

Yes, it's too small.  JFFS2 requires a certain percentage of blocks in
the partition to be reserved for it's usage.  At one point, it was 5
eraseblocks.

The only solution that I know of is to grow your partition to cope with
that limitation.

josh
