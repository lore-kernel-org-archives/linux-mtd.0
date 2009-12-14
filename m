Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKBPV-00010V-OC
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 13:56:30 +0000
Received: by iwn40 with SMTP id 40so1921842iwn.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Dec 2009 05:56:23 -0800 (PST)
Date: Mon, 14 Dec 2009 08:56:14 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: New mtd-utils release?
Message-ID: <20091214135614.GC16448@hansolo.jdub.homelinux.org>
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1260795633.11112.49.camel@localhost>
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@caiaq.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 14, 2009 at 03:00:33PM +0200, Artem Bityutskiy wrote:
>On Mon, 2009-12-14 at 20:14 +0800, Daniel Mack wrote:
>> Hi,
>> 
>> we're building mtd-utils with buildroot, and as we need a recent version
>> of it to get the ubi features, we currently check out a git snapshot as
>> tarball. Last week, for some reason the SHA1 ID we used (e783e75e0)
>> disappeared from the repository. (Just out of curiosity: what happened?
>> Was the tree rebased or filtered?).
>
>Dunno, but it must be me how made this crew-up, sorry. I cannot say
>exactly how it happened, but it was non-intentional. Probably pushed one
>patch version, then later amended it, and pushed it with --force. This
>should never be done, sorry.
>
>> However, this approach is somewhat hackish anyway, and we would much
>> more like to check out a version that is officially tagged.
>
>OK, I can tag them at the beginning of the next year. I'm having
>holydays in 10 min.
>
>>  Seeing the
>> last tag has been done ~17 month ago, I wonder whether there is any
>> change to get a new one soon?
>
>We usually use the master branch. And there is simply no one who cares
>about tags. But I can do this. You'll get a new tag when I come back
>from holydays, unless someone else tag it earlier.

I've avoided doing a release because there isn't a really good way to
correlate mtd-utils to kernel version.  I don't believe there have been
any on-disk (Ha!) UBIFS format changes, and UBI itself hasn't had format
changes for a long time, so it is probably safe to do that now.

Still, I would very much like to avoid having a compatiblity matrix like
the LTTng project does.

(Also, I believe nandwrite is _STILL_ broken with the OOB stuff.)

josh
