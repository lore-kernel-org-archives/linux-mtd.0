Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZkvB-0005v9-9h
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 14:30:18 +0000
Received: by pzk1 with SMTP id 1so1721153pzk.16
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 07:30:13 -0700 (PDT)
Subject: Re: "warning!: only 995 of 1984 eraseblocks have valid erase counter"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
Date: Thu, 23 Jun 2011 17:30:57 +0300
In-Reply-To: <2016071dvg4slfufk95id9ov68n2kvbp4j@4ax.com>
References: <o4krv69m77vomji84cs3flljf6obpgfgcs@4ax.com>
	<1308820444.19443.0.camel@sauron>
	<2016071dvg4slfufk95id9ov68n2kvbp4j@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308839462.23597.5.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-23 at 11:19 +0200, Gilles wrote:
> On Thu, 23 Jun 2011 12:14:01 +0300, Artem Bityutskiy
> <dedekind1@gmail.com> wrote:
> >I think it is self-explanatory. Please, ask specific question. WRT to
> >consequences - it should not be critical.
> 
> I went ahead, answered yes, and it seems to work OK, but I was curious
> to understand what the message really means.

What exactly is unclear in the messages? :-)

> Before reflashing memory with an image, does ubiformat always warn the
> user that the empty blocks after the image will have their erase
> counter set to the average computed from the used blocks, regardless
> of their actual usage so far?

Yes. If you properly use tools - you should never see the warnings. Most
probably you flash images using UBI-unaware tools, or you erase the
flash using UBI-unaware tools like flash_erase or do it in u-boot.

But I agree that ubiformat could probably be smarter and avoid printing
this warning if half of the flash is UBI-formatted and the other half is
empty.

Current logic is - if not everything is UBI-formatted - warn. But it
could be - if not everything is UBI-formatted and the eraseblocks are
not empty - warn. Feel free to send a patch :-)

-- 
Best Regards,
Artem Bityutskiy
