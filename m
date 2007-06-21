Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1Bx0-0004B7-Q9
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 21:59:13 -0400
Received: by ug-out-1314.google.com with SMTP id t39so483419ugd
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jun 2007 18:59:09 -0700 (PDT)
Message-ID: <625fc13d0706201852g5348a209q82c5cc5b9dc42bf6@mail.gmail.com>
Date: Wed, 20 Jun 2007 20:52:27 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Mark A. Greer" <mgreer@mvista.com>
Subject: Re: [PATCH][MTD] Add COMPATIBLE_IOCTL() for MEMGETOOBSEL
In-Reply-To: <20070620235245.GA12800@mag.az.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070620235245.GA12800@mag.az.mvista.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/20/07, Mark A. Greer <mgreer@mvista.com> wrote:
> The flash_eraseall MTD utility uses the MEMGETOOBSEL so add a
> COMPATIBLE_IOCTL() entry for it.
>
> Signed-off-by: Mark A. Greer <mgreer@mvista.com>
> ---
> I know MEMGETOOBSEL is supposed to be obsolete but flash_eraseall uses
> it so...
>
> Also, MEMSETOOBSEL is used by nandwrite.c but that ioctl doesn't appear
> to be implemented so I didn't add it.  My util source is
> http://ftp.linux.org.uk/pub/people/dwmw2/mtd/cvs/mtd/util/
> in case I'm looking at old source.

You are.  But it's still the same in the current code:

http://git.infradead.org/?p=mtd-utils.git;a=summary

And now that you've found MEMSETOOBSEL being used but not implemented,
I'll have to go figure out what that's about.

Curse you Mark!  ;)

josh
