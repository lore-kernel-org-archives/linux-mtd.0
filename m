Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZugA1-0003Tb-JL
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 12:30:30 +0000
Message-ID: <1446813006.20949.140.camel@gmail.com>
Subject: Re: [PATCH 3/5] UBI: Expose the bitrot interface
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co
Date: Fri, 06 Nov 2015 14:30:06 +0200
In-Reply-To: <563C9990.4040602@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
 <1446764217-15021-4-git-send-email-richard@nod.at>
 <1446811178.20949.111.camel@gmail.com> <563C9990.4040602@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-11-06 at 13:14 +0100, Richard Weinberger wrote:
> Am 06.11.2015 um 12:59 schrieb Artem Bityutskiy:
> > On Thu, 2015-11-05 at 23:56 +0100, Richard Weinberger wrote:
> > > +#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
> > > +#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
> > 
> > Could you please, add short comments telling what are these ioctls
> > about.
> 
> Sure.
> 
> Something like:
> 
> +/* Trigger re-read of a given PEB */

Something more end-user oriented. Trigger re-read does not tell the end
user anything, but "check if a PEB has bitflips" does tell exactly why
the ioctl exists.

> +#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
> +/* Trigger scrubbing of a given PEB */

Sounds good to me, although if you could also tell at the same time
whether this is unconditional or only if the PEB has bit-flips.

> +#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)

> While we're here, would it make sense to do a manpage for UBI's
> ioctl()s?

Well, more documentation is always a great thing, I invested a lot of
time into mtd web site at some point, and I think it payed off at the
end. Investing time into a man page would pay off too I believe.

Thanks!
