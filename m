Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Oo5d-0006aF-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2002 22:54:29 +0000
To: Alice Hennessy <ahennessy@mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem with cfi_probe.c and Intel chip
References: <3C3E1515.CD99EB0@mvista.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 10 Jan 2002 16:05:17 -0700
In-Reply-To: <3C3E1515.CD99EB0@mvista.com>
Message-ID: <m3k7upbydu.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Alice Hennessy <ahennessy@mvista.com> writes:

> Hello,
> 
> I just tried the latest code  and discovered that the command used
> before the query command  and also to
> return to read mode  in cfi_probe.c  has been changed to 0xF0 - it used
> to be 0xFF .  The board I'm testing
> on has an Intel strata chip and is not responding to the query.  If I
> use 0xFF, then everything is fine.  AMD chips
> seems to be happy with either command (I think because the
> AMD automatically returns to read mode after
> a command anyway).   It looks like this was changed with the jedec-probe
> 
> additions so maybe this is necessary
> for older jedec chips (which I haven't tested).

In this case it works for all of intel chips I have, so I thought the extra
0xFF in the reset, was put in by someone being extra careful, and not someone
having problems...

I'll reenable it in just a minute.

Eric
