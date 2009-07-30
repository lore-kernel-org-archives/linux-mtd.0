Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWWiR-0005lh-Bi
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 14:34:48 +0000
Received: by qw-out-1920.google.com with SMTP id 5so985085qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 07:34:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A71AD5E.4080704@uiuc.edu>
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
	<4A719A27.8050509@linutronix.de>
	<ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
	<4A71A483.30507@linutronix.de>
	<ce9ab5790907300714u5c88f1cdk8c0387de5ba9f413@mail.gmail.com>
	<4A71AD5E.4080704@uiuc.edu>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 30 Jul 2009 20:04:22 +0530
Message-ID: <ce9ab5790907300734l134c8d4agcf8b22b40129b8d9@mail.gmail.com>
Subject: Re: [PATCH] [mtd] fixed faulty check
To: Stoyan Gaydarov <sgayda2@uiuc.edu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: kay.sievers@vrfy.org, David.Woodhouse@intel.com,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	gregkh@suse.de, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 7:55 PM, Stoyan Gaydarov<sgayda2@uiuc.edu> wrote:
> vimal singh wrote:
>
> On Thu, Jul 30, 2009 at 7:17 PM, Sebastian Andrzej
> Siewior<bigeasy@linutronix.de> wrote:
>
>
> vimal singh wrote:
>
>
> What if you go to 'err_out' due to some other error?? Do not you need
> to free 'info'?
>
>
> We have to and of_flash_remove() takes care of it.
>
>
>
>
> Does this mean that the original patch is fine or does it still need the
> kfree? From what i understand when going to err_out it will take care of
> info using of_flash_remove() so then it is not needed in the if check.

Yes.
But I think, you should still correct freeing 'mtd_list' in the label,
when you jump there even before memory gets allocated for that.

-vimal

>
> -Stoyan
>
> that's correct...
>
>
>
> The initial patch would be shorter if
> =A0dev_set_drvdata(&dev->dev, info);
> would be moved prior the kzalloc()
>
> Sebastian
>
>
>
>
>
