Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTZca-0002iS-QB
 for linux-mtd@lists.infradead.org; Sun, 23 Aug 2015 18:03:57 +0000
Received: by obbhe7 with SMTP id he7so95904260obb.0
 for <linux-mtd@lists.infradead.org>; Sun, 23 Aug 2015 11:03:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1508211046210.10202@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1508211046210.10202@lnxricardw1.se.axis.com>
Date: Sun, 23 Aug 2015 20:03:31 +0200
Message-ID: <CAFLxGvw6dOG1Opwp8i9pW6o65HbYF-vu6iFpQmYOH_EMJqB2aA@mail.gmail.com>
Subject: Re: JFFS2 vs. UBIFS compression
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 21, 2015 at 11:00 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> I came across something odd that I wasn't really expecting the other day.
>
> On a JFFS2 file system, we have a file that is 12.25 MB in size. When
> written to an 8 MB partition, df reports that it occupies 5.9 MB. Writing
> a second copy of the file fails because the file system is full. Fair
> enough.
>
> On a similar UBIFS system (however in this case with a volume size of 32
> MB), the same file is reported by df to have occupied 7.9 MB. Writing
> multiple copies of the same file confirms that we can fit slightly more
> than 4 copies of the same file on the file system (32 MB / 7.9 MB yields
> 4.05), so 7.9 MB seems about right.
>
> Now I fully understand that getting df to report valid figures for
> compressed file systems is guesswork at best, but don't JFFS2 and UBIFS
> utilize the same compression algorithms? Consequently, the space used by
> especially large files (where the overhead is small) should be essentially
> the same for both file systems? If anything, one would expect that UBIFS,
> being newer, would better at compression than JFFS2.
>
> So what are we seeing here, is UBIFS more conservative in reporting disk
> usage, or is JFFS2 really better than UBIFS at file compression?

Both support zlib and lzo. Did you setup UBIFS and JFFS2 with the same
compression method?
Also keep in meed to run "sync" before using "df" on UBIFS.
Otherwise it will not write down to flash and report the uncompressed size.

HTH

-- 
Thanks,
//richard
