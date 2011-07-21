Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qjv5I-00065v-Sw
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2011 15:22:45 +0000
Received: by vws8 with SMTP id 8so1199415vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Jul 2011 08:22:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
References: <CAJcvjphp3Cjew0=P6LWQ05Hb6HWpPy3D2FOBd8J5KwVGQpwcwA@mail.gmail.com>
	<CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
Date: Thu, 21 Jul 2011 11:22:38 -0400
Message-ID: <CAJcvjpg5i0uxn=n+SHMpm7yXirWkbrsdOiQiTTFP+K+b2-C6UA@mail.gmail.com>
Subject: Re: UBIFS support for SLC and MLC
From: John <jtburch62@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I think the first "read disturb" that is discussed in the FAQ is a
> rather specific case: repeated READs of a page cause bit-flips on that
> same page. =A0The solution is simply to correct the block on-flash
> ("scrub" it) whenever a bit-flip is detected.

Got it.  That makes sense.

> Then there's a more general "read disturb" case, which is called the
> "paired pages" problem in the FAQ: repeated READs of a page (A) cause
> bit-flips on some *other* page (B). =A0This is trickier to handle,
> because READs may be happening all the time on A, while B isn't
> accessed for a long time. =A0In that case, the bit-flips on B will have
> a chance to accumulate, potentially beyond the point at which we can
> repair them. =A0This case is basically the same as the "program disturb"
> case -- it will be handled just fine, but only as long as the pages in
> question are read periodically.
>
> Hence the need for the "flash crawler" mentioned in the FAQ, which
> puts an upper bound on the length of time any flash page will go
> without being read. =A0As far as I know (someone please correct me --
> and update the FAQ -- if this is wrong), UBIFS itself doesn't
> implement this crawling right now. =A0So depending on the strength of
> your ECC algorithm, propensity of your flash to experience bit-flips,
> and how often certain parts of the filesystem are accessed, you could
> potentially experience corruption if you've got a filesystem where
> certain parts are read/written often, and other parts sit idly for
> extended periods of time (probably months).
>
> It's worth noting that some of the problems noted from the UBIFS FAQ
> also apply to next-generation SLC. =A0For example, many new SLC chips
> already require at least 4-bit BCH correction (this used to only be
> the case for MLC). =A0Their eraseblock life-cycle has also steadily
> decreased (although this is offset by increasing capacities, since UBI
> does wear leveling). =A0And their tendency to experience problems such
> as read/program disturb has gone up compared to previous-gen SLC.
>
> So the FAQ is slightly out of date in this regard: you may have to
> take many of these issues into consideration regardless of whether you
> go with SLC or MLC. =A0Hope this helps.
>
> --
> Matthew L. Creech
>

So, in summary, it sounds like UBIFS handles any SLC/MLC artifact that
results in bit-errors on the same page as is being read; but it does
not handle any SLC/MLC artifact that results in bit-errors on pages
other than the one being read.  Do you concur?

(Due to different physical characteristics and manufacturing processes
for older SLC versus new SLC and MLC, I'm ignoring whether the
artifacts are due to "read disturb", "program disturb", or either
combined with "paired pages".)

Thanks,
John
