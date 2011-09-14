Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R3u6A-0007Rr-Oa
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2011 18:22:15 +0000
Received: by wyh11 with SMTP id 11so2025764wyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Sep 2011 11:22:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUc4WemgB6sWeChR3dp2mWsaSQUDKmKOfE=C9FBdzfuc1w@mail.gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
	<1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUc4WemgB6sWeChR3dp2mWsaSQUDKmKOfE=C9FBdzfuc1w@mail.gmail.com>
Date: Wed, 14 Sep 2011 14:22:11 -0400
Message-ID: <CAN8TOE8JOLPeHn6m9cfQbisuBT2mJVeTAw6ONiF=pTKGSufgPg@mail.gmail.com>
Subject: Re: [PATCH 03/10] nandwrite: consolidate buffer usage
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: b35362@freescale.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 14, 2011 at 1:15 AM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> On Wed, Aug 31, 2011 at 16:00, Brian Norris wrote:
>> Instead of using two different output buffers for OOB data, let's just
>> use the same one for all output. This adds an extra memcpy, but it
>> simplifies some future work, so it's worth it.
>
> could it be done by pulling out the pointer ? =A0make oobbuf a "char *",
> rename existing oobbuf to like "char _oobbuf[]", and then assign
> oobbuf to the relevant buffer and assume it's always set ...

It could be done this way, but actually, this patch was not intended
to stand alone; it was a precursor to removing one of the buffers from
nandwrite.c, as done in patch 07/10:
   mtdutils: move OOB auto-layout into libmtd's mtd_write
>From the comment in patch 07:
   "This patch also cleans up a need for an extra OOB buffer in nandwrite."

So I'd actually recommend that Artem push this patch (patch 03) out of
'master' and into the 'brian' branch, then we can review the final
product there. In the end, I intended nandwrite to only have a single
buffer for OOB, instead of having a read buffer and an oob buffer. We
would simply pass our unmodified OOB data to mtd_write() and then to
the new MEMWRITE ioctl, where the kernel would do AUTO or PLACE
layouts for us depending on the mode we chose.

Of course, this is just the ideal approach; many kernels will not
support MEMWRITE yet, so they would fall back to the old code. That's
what patch 07 did; it cut out one buffer and moved the old layout code
into its own libmtd function, legacy_auto_oob_layout().
legacy_auto_oob_layout allocates its own buffer when needed; this part
is very inefficient (and actually has a memory leak now that I look at
it...) Perhaps the "legacy" handling should be reviewed a little more
to prevent too many trivial buffers and memcpy's.

If nothing else, I will at least need to send a v2 for patch 07 so we
free `tmp_buf' in `legacy_auto_oob_layout()'. But it'd be better just
to completely rework that function's buffers...

Brian
