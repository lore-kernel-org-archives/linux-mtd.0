Received: from rwcrmhc13.comcast.net ([204.127.198.39])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DnITl-0007hu-2m
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 11:58:31 -0400
From: Charles Tilbury <charles.tilbury@comcast.net>
To: dedekind@infradead.org
Date: Tue, 28 Jun 2005 08:58:14 -0700
References: <200506271409.42449.charles.tilbury@comcast.net>
	<1119943436.16978.5.camel@sauron.oktetlabs.ru>
In-Reply-To: <1119943436.16978.5.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200506280858.14732.charles.tilbury@comcast.net>
Cc: linux-mtd@lists.infradead.org
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

Yes. Thanks.  Now, I am looking for a way to get the file systems unmounted 
upon loss of power.

Thanks Guys,
-=Charles Tilbury=-

On Tuesday 28 June 2005 12:23 am, Artem B. Bityuckiy wrote:
> On Mon, 2005-06-27 at 14:09 -0700, Charles Tilbury wrote:
> > I am using an ST Micro 64M byte x 8 bit flash part and JFFS2.  It mostly
> > works except that when the board reboots, JFFS2 reports CRC error
> > messages when the partition mounts again.  The strange part is that there
> > does not seem to be any data corruption or lost data.  Also, I do not see
> > any error messages while reading and writing.  However, the CRC errors
> > seem to accumulate over time.  Is there some way to prevent this from
> > happening?  Repair it?  Should I just ignore it?
>
> As Sergey said, these errors appear because of unclean reboots you do.
> Normally they are harmless. Yes, ignore them.
