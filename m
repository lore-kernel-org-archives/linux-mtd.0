Received: from nz-out-0102.google.com ([64.233.162.201])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FegJK-0006pO-IR
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 18:40:43 -0400
Received: by nz-out-0102.google.com with SMTP id k1so514679nzf
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 May 2006 15:40:32 -0700 (PDT)
Message-ID: <c384c5ea0605121540g29f6d612u1642b051a10cba77@mail.gmail.com>
Date: Sat, 13 May 2006 00:40:32 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
In-Reply-To: <1147393699.12030.37.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
	<44635DD6.10805@arcom.com>
	<1147393699.12030.37.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Do not oops when configured flash size is less then
	chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

On 5/12/06, David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2006-05-11 at 16:52 +0100, David Vrabel wrote:
> > This sounds like a valid, if unlikely, board configuration.  e.g., a
> > board with chips fitted that are larger than the chip-select memory
> > window.
>
> An alternative plan is to (warn and) artificially reduce mtd->size so
> that it fits in the map. That way, you at least get to use the region of
> the flash that you can address.
>
Thanks for reviewing my problem description and patch.

I did indeed try a few things to make this automagically work, but
then decided that this clashed with the definition of the 'fixed flash
size configuration' in the kernel configuration.
(And I am not familiar enough with the MTD code to just twiddle with
variables of which I have no idea about subtle assumptions and/or
interdependencies within MTD.)

Instead, I think just warning the user properly is the best solution.

Regards,

Leon.
