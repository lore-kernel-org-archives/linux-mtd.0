Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16OwQ0-00075T-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 07:48:05 +0000
Subject: Re: Problem with cfi_probe.c and Intel chip
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alice Hennessy <ahennessy@mvista.com>, linux-mtd@lists.infradead.org
In-Reply-To: <17564.1010702853@redhat.com>
References: <3C3E1515.CD99EB0@mvista.com>   <17564.1010702853@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 11 Jan 2002 08:57:58 +0100
Message-Id: <1010735878.1306.4.camel@pcjonashg>
Mime-Version: 1.0
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

On Thu, 2002-01-10 at 23:47, David Woodhouse wrote:
> 
> ahennessy@mvista.com said:
> > I just tried the latest code  and discovered that the command used
> > before the query command  and also to return to read mode  in
> > cfi_probe.c  has been changed to 0xF0 - it used to be 0xFF .  The
> > board I'm testing on has an Intel strata chip and is not responding to
> > the query.  If I use 0xFF, then everything is fine.  AMD chips seems
> > to be happy with either command (
> 
> I seem to recall someone complaining before, and having to change it. But 
> if so, I don't see why it only came in with the jedec-probe stuff. 
> 
> Three options:
> 1. Change it to 0xFF and see if anyone screams.

I will! Toshiba 8MiB (TC58FVT641FT) won't leave autoselect mode if you
change that. Then amd_flash_probe (and jedec_probe I suppose) will not
be able to detect "mirrors" of previously found chips.

/Jonas

> 2. Make it send both 0xFF and 0xF0.
> 3. Make it work out what type of chip it's talking to and send the _right_ 
> 	command.
> 
> 
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
