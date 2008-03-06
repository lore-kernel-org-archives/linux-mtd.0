Received: from wa-out-1112.google.com ([209.85.146.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXGJP-0000CS-CX
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 13:39:08 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2150893wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Mar 2008 05:39:05 -0800 (PST)
Message-ID: <bae050c10803060539y16c65e26o181ef7b26ce008cf@mail.gmail.com>
Date: Thu, 6 Mar 2008 21:39:05 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: UBI: question about ubi_leb_change
In-Reply-To: <1204807835.23706.38.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803060426l2b90f9e2n4a0cd3e0dd1c4d19@mail.gmail.com>
	<1204807835.23706.38.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi,
>
> On Thu, 2008-03-06 at 20:26 +0800, Nancy wrote:
> > Hi,
> >     As I know, ubi_leb_change only accept a whole LEB data as one of
> > its parameter.
> Correct.
>
> >     If file system modify a little data which in a old mapped LEB, it
> > needs to read the whole old mapped LEB data in its buffer first, then
> > do the little modification, finally deliver to ubi_leb_change?  Is
> > that right?
> This is what can be done. But file systems should not normally do this,
> because it is inefficient. It is more efficient to do out-of-place
> updates, which means writing data to somewhere else (a free LEB), and
> treat the older data as obsolete. This is what JFFS2 and UBIFS do.
>
> UBIFS does use the in-place update method you have described, but very
> rarely. It uses it only when the FS is nearly full, and only as
> last-resort method of updating the FS index, when out-of-place updates
> are impossible.

Thank you for your information!  It do help a lot !

> >     when remove files, there's only inodes .....some file system meta
> > data changed,
> > but the real file data still exist which means the LEB still mapped.
> > Then when you write new data to this very LEB( but contains only
> > trash), maybe this time, your new data is a whole LEB size.  Still
> > goes the process:  read the mapped LEB old data to buffer,  replace
> > the old data with the new one in buffer, deliver to ubi_leb_change?
> > Really like that?
>
> If you have an LEB, and the contents of LEB is not needed, you should
> just unmap it and write your new data. No need to read it.
>

   Yes, but in FTL layer, it don't know whether the old mapped LEB is
useful or not until
the new mapped LEB which data stored in a write_cache have to be write
to PEB. The
write_cache maybe full filled with new data or just a little new data,
others have to be read from the old mapped PEB

http://lists.infradead.org/pipermail/linux-mtd/2008-January/020381.html
 suggest to use
ubi_leb_change.   Which force the write_cache to read a whole LEB(old
mapped) back first.
That waste so much time, in fact, can't bare, too slow!

    FTL is using in-place update,although write to different PEB,  the
unchange data have to be read back no matter those data is useful or
not ( cause in FTL layer it doesn't know it is useful or not)

    Or FTL can have a same idea like UBIFS, implement log to make
out-place change become reality .....  Is that possible?

    Thanks in advance!


--
Best wishes,
Nancy
