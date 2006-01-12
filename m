Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ewvme-0001J0-Mx
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2006 01:18:10 -0500
Received: by wproxy.gmail.com with SMTP id 70so326072wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jan 2006 22:18:00 -0800 (PST)
Message-ID: <29f916510601112218j3aaace0ct63bb1dd8b6d9ef4f@mail.gmail.com>
Date: Thu, 12 Jan 2006 01:18:00 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: "ghannon@cspi.com" <ghannon@cspi.com>
In-Reply-To: <852570F3.00522FB1.00@pine.cspi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <852570F3.00522FB1.00@pine.cspi.com>
Cc: linux-mtd@lists.infradead.org, Peter Wippich <pewi@gw-instruments.de>
Subject: Re: sector locks handling for J3 flashes?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ghannon,

Could you please share the code for lock / unlock.
I presume that it must be based on ioctl calls to mtd , same as like
what netlfash does with -l option ?'

Our flash corruption is pretty much random as of now.
Sometimes within a week on new boards (and while running itself, no
resets) and sometimes as much as 3 weeks.
Suspecting some hardware isssues, but difficult to convince them !

Our requirement is pretty much similar to you, to avoid corruption
lock some flash sectors.  No permanent lock desired.

The fact you mentioned of unlock "feature" wasnt known to me, thanks a
lot for the timely tip.

One more thing, I happened to have put some traces in the lock /
unlock handlers attached to MTD layer.
And I observed that when netflash tried to unlock, erase, write,  lock
 the registers value dumped were ff which became fc after lock.
Just curious to know if these are correct as I am confused from the
data sheet on which register is this actually .. is it the status
register ? Block Status register ?

Regards,
Alfred


On 1/11/06, ghannon@cspi.com <ghannon@cspi.com> wrote:
>
> On Wed, 11 Jan 2006, alfred hitch wrote:
>
> > I am actually surprised that noone is running his / her boards with
> > flash sectors locked ?
>
> > I am new to embedded designs, but wont this be a pretty standard /
> > accepted practice to lock your flash sectors ?
>
> We are also using that same part and we were having some flash
> corruption at reboot, although I think it was due to an
> error in the reset timing on the board.
>
> I keep the flash locked at all times except to reflash our firmware.
> The locking and unlocking is all handled  by a userspace tool
> we wrote up and the reflashing script takes care of doing the
> unlock/lock around the programming step.
>
> I could send you the code if you would like.
>
> Also, one thing about the J3 part is that any "unlock" of
> a block unlocks the whole flash, and a lock only locks one block.
> The linux mtd drivers do not take this into consideration.
> Although I think the lazy unlock mentioned would not have a
> problem with it, it would just never find anything locked once
> it unlocked the first block.
>
> The rev D of J3 allows you to make certain sectors permanently locked,
> so that an unlock of one area will not unlock sectors that are
> setup to not allow unlocking.   Be careful though, or your can turn your
> flash into rom very easily if you have no way of stopping the code
> before it sets up these bits.
>
> Gary Hannon
>
>
>
>
>
>
>
