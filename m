Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16P9P9-0007nr-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 21:40:03 +0000
Message-ID: <3C3F5ECD.97773673@mvista.com>
Date: Fri, 11 Jan 2002 13:53:17 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: "Eric W. Biederman" <ebiederman@lnxi.com>
CC: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Problem with cfi_probe.c and Intel chip
References: <3C3E1515.CD99EB0@mvista.com> <17564.1010702853@redhat.com>
		<m3sn9d8zs3.fsf@DLT.linuxnetworx.com> <3C3E48B6.C9FF834D@mvista.com> <m3ita83a6f.fsf@DLT.linuxnetworx.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

"Eric W. Biederman" wrote:

> Alice Hennessy <ahennessy@mvista.com> writes:
>
> > array
> > mode (0xff) would be necessary before the query command so I'm not sure why
> > my board is having problems.  Even if the bios has issued a command to the
> > flash
> > between power up and cfi_probe,  I don't think read array command is necessary
> > between commands.
> > If my board is the only Intel with a problem, then I need to investigate it
> > further.
>
> That would certainly be useful.  My real suspicion is that this code hasn't
> been utilized all that much, and we are entering it's first real
> stabalization phase.  Since all I did was comment out what looked like
> redundant code, I actually think you are the second person to notice
> this.   Personally I have deal with boot block type flash memory,
> which may have different characteristics than other intel product lines.
>
> Having a couple of people get a firm grasp on what things cause
> problems, is probably needed right now.  So if you come up with
> anything interesting I'd be glad to hear it.
>
> Eric

I will do that.

Alice
