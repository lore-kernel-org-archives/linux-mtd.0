Received: from cc60549-a.deven1.ov.home.nl ([217.120.140.54]
	helo=server.grimmerink.dhs.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QUbl-0004I3-QC
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 17:07:26 +0100
From: Pieter Grimmerink <mailinglists@grimmerink.nl>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 12 Jun 2003 18:06:42 +0200
References: <200306111831.07071.mailinglists@grimmerink.nl>
	<1055410352.2097.446.camel@passion.cambridge.redhat.com>
In-Reply-To: <1055410352.2097.446.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <200306121806.42197.mailinglists@grimmerink.nl>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: Errors compiling current mtd CVS version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 12 June 2003 11:32, David Woodhouse wrote:
> Why are you using amd_flash.c and not the
> non-deprecated drivers?

I was not really using them, but they turned out to be in the defconfig f=
ile=20
of my arch (cris). Quickly removed that.

> > #include <linux/sched.h> seems to be missing in fs/jffs2/write.c
> > (error on 'current')
>
> That one is unexpected -- can you give more details?

Must have been my fault, probably because I didn't do a clean rebuild aft=
er I=20
tried to find the reason for the previous errors.
Now it compiles again without <linux/sched.h>

Regards,

Pieter
