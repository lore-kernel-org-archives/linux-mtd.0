Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16OnoL-0006Yu-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2002 22:36:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C3E1515.CD99EB0@mvista.com> 
References: <3C3E1515.CD99EB0@mvista.com> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem with cfi_probe.c and Intel chip 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Jan 2002 22:47:33 +0000
Message-ID: <17564.1010702853@redhat.com>
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

ahennessy@mvista.com said:
> I just tried the latest code  and discovered that the command used
> before the query command  and also to return to read mode  in
> cfi_probe.c  has been changed to 0xF0 - it used to be 0xFF .  The
> board I'm testing on has an Intel strata chip and is not responding to
> the query.  If I use 0xFF, then everything is fine.  AMD chips seems
> to be happy with either command (

I seem to recall someone complaining before, and having to change it. But 
if so, I don't see why it only came in with the jedec-probe stuff. 

Three options:
1. Change it to 0xFF and see if anyone screams.
2. Make it send both 0xFF and 0xF0.
3. Make it work out what type of chip it's talking to and send the _right_ 
	command.



--
dwmw2
