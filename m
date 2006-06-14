Received: from nf-out-0910.google.com ([64.233.182.186])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqVjJ-0003n1-En
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 09:48:30 -0400
Received: by nf-out-0910.google.com with SMTP id o63so88621nfa
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 06:48:20 -0700 (PDT)
Message-ID: <fe810cf0606140648w47571167x364d815181d18453@mail.gmail.com>
Date: Wed, 14 Jun 2006 17:48:19 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD: mphysmap driver resurrection
In-Reply-To: <1150292033.3176.127.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0606140613k7ea7918fl48ead339530c4cb6@mail.gmail.com>
	<1150292033.3176.127.camel@pmac.infradead.org>
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/14/06, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2006-06-14 at 17:13 +0400, Alexander Belyakov wrote:
> > The patch just contains mphysmap driver code from one of the latest
> > CVS snapshots.
>
> Nak. We ought to be able to use the existing physmap driver for this,
> and just register multiple platform_devices for it.

Ok. Just posted it in case of unintentional (as Josh mentioned) driver
exclusion.

btw, is it possible to find somewhere a kind of list of
features/drivers/patches which were removed/reverted during migration
to GIT?

Thanks,
Alexander
