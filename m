Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUi0B-00023B-Rj
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 16:22:36 +0000
Received: by wwi18 with SMTP id 18so4497443wwi.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 09:22:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307607194.7374.49.camel@localhost>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307607194.7374.49.camel@localhost>
Date: Thu, 9 Jun 2011 09:22:32 -0700
Message-ID: <BANLkTik9T_R5xZO5_GrzyznxwNnpv4931g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 9, 2011 at 1:13 AM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> Brian, would you please send a new series? I suggest you the following
> order of things.
>
> 1. clean-up of non-DEBUG() messages.
> =A0 1.1. go through all printks and check if KERN_* is ok, fix. E.g.,
> =A0 =A0 =A0 =A0I can see that all KERN_DEBUG should become KERN_INFO
> =A0 1.2. go through all printks and check if the function name prefix
> =A0 =A0 =A0 =A0makes sense there - kill those which do not.
>
> =A0 Also, while doing this, keep in mind that messages will be later
> =A0 turned into dev_* (dev_info(), dev_err(), etc) so they will be
> =A0 automatically prefixed with the device name which is already some
> =A0 identification of the source of the message.
>
> =A0 1.3. turn messages to dev_*
> =A0 1.4. make another pass and do all the lines consolidations,
> =A0 =A0 =A0 =A0alignments, punctuation, etc etc.
>
> 2. clean-up of DEBUG() cruft.
> =A0 2.1 change DEBUG() with dev_dbg()
>
> =A0 Kill all function name prefixes as well. The rationale is: dev_dbg()
> =A0 already adds function name prefixe (and process id) if dynamic
> =A0 debugging is enabled. In case of debugging with DEBUG macro, you
> =A0 anyway have to change the code (adding #define DEBUG) so you might
> =A0 easily defind pr_fmt at the same time for youself.
>
> How does this sound to you?

Sounds good. Will send patches later today, I think.

> FWIW: I've moved the patches I pushed from the master branch to the
> "brian" branch of l2-mtd-2.6.git tree. But they will not be useful
> for you, I guess.

Thanks, although I will have to rework all of them :)

Brian
