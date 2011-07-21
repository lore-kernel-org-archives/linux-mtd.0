Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjveG-0007pO-Dg
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2011 15:58:53 +0000
Received: by vws8 with SMTP id 8so1235797vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Jul 2011 08:58:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJcvjpg5i0uxn=n+SHMpm7yXirWkbrsdOiQiTTFP+K+b2-C6UA@mail.gmail.com>
References: <CAJcvjphp3Cjew0=P6LWQ05Hb6HWpPy3D2FOBd8J5KwVGQpwcwA@mail.gmail.com>
	<CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
	<CAJcvjpg5i0uxn=n+SHMpm7yXirWkbrsdOiQiTTFP+K+b2-C6UA@mail.gmail.com>
Date: Thu, 21 Jul 2011 11:58:46 -0400
Message-ID: <CAPBSBxrvbet8q0jJZh6waJOoSTW5CaVTXmyksdZAtCX5nRsZ5Q@mail.gmail.com>
Subject: Re: UBIFS support for SLC and MLC
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: John <jtburch62@gmail.com>
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

On Thu, Jul 21, 2011 at 11:22 AM, John <jtburch62@gmail.com> wrote:
>
> So, in summary, it sounds like UBIFS handles any SLC/MLC artifact that
> results in bit-errors on the same page as is being read; but it does
> not handle any SLC/MLC artifact that results in bit-errors on pages
> other than the one being read. =A0Do you concur?
>

Yes, I think that sums it up.  Technically I think UBI handles the bit
errors and UBIFS is oblivious to them, but that's mostly an irrelevant
distinction for a UBIFS user.

It seems like like we really ought to implement this sort of periodic
"scrubbing" at the UBI level.  It fits right in with the other things
UBI does, like wear leveling, which abstract away the details of flash
management from upper layers like UBIFS.  And the "scrubbing
threshold" (how often we need to scrub pages) is similar in many
respects to the wear-leveling threshold, and may vary depending on the
characteristics of the underlying flash device.

At a glance, it looks like "nandsim" only simulates bit flips on the
same page being programmed.  A good first step might be to modify it
to simulate the more difficult read-disturb ("page pairing") case, so
that we can simulate MLC-like devices better.

--=20
Matthew L. Creech
