Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZg4M-0003Hc-1q
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 09:19:26 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QZg4G-00017T-6V
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 11:19:20 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jun 2011 11:19:20 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jun 2011 11:19:20 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: "warning!: only 995 of 1984 eraseblocks have valid erase counter"
Date: Thu, 23 Jun 2011 11:19:08 +0200
Message-ID: <2016071dvg4slfufk95id9ov68n2kvbp4j@4ax.com>
References: <o4krv69m77vomji84cs3flljf6obpgfgcs@4ax.com>
	<1308820444.19443.0.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Jun 2011 12:14:01 +0300, Artem Bityutskiy
<dedekind1@gmail.com> wrote:
>I think it is self-explanatory. Please, ask specific question. WRT to
>consequences - it should not be critical.

I went ahead, answered yes, and it seems to work OK, but I was curious
to understand what the message really means.

Before reflashing memory with an image, does ubiformat always warn the
user that the empty blocks after the image will have their erase
counter set to the average computed from the used blocks, regardless
of their actual usage so far?

It's just for my education. Thank you.
