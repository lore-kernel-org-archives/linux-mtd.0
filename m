From: David Woodhouse <dwmw2@infradead.org>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <4014E81E.4090808@arcom.com>
References: <3FD998F6.9000303@arcom.com> <3FDDD939.8030302@arcom.com>
	 <4014E81E.4090808@arcom.com>
Content-Type: text/plain
Message-Id: <1075129557.24024.81.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 26 Jan 2004 15:05:58 +0000
Content-Transfer-Encoding: 7bit
cc: Linux MTD List <linux-mtd@lists.infradead.org>
Subject: Re: cfi_cmdset_0002 -- erase suspends broken.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-26 at 10:12 +0000, David Vrabel wrote:
> > The problem with the occasional bit errors appears to only occur 
> > when the erase is suspended for a write so I've temporarily disabled
> > that.
> 
> Seems I left the patch off that does this.

Thanks. Wanna go ahead and commit it?

> The message in this transmission is sent in confidence for the
> attention of the addressee only and should not be disclosed to any
> other party. Unauthorised recipients are requested to preserve this
> confidentiality. Please advise the sender if the addressee is not
> resident at the receiving end.  Email to and from Arcom is
> automatically monitored for operational and lawful business reasons.

Not appropriate for a mailing list. If your management and/or lawyers
are incompetent enough to think this is at _all_ useful or enforceable,
and if they _really_ insist on making their level of competence publicly
known with every mail sent out from your company address, then please
use a different mail account for posting to the list.

You're welcome to use your @infradead.org account for list traffic if
you want, btw.

-- 
dwmw2
