Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HlbS-00027S-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 13:54:46 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6C0080IDDBG8@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Fri, 29 Nov 2002 15:24:48 +0100 (MET)
Date: Fri, 29 Nov 2002 15:23:00 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS/MTD and Raw access
In-reply-to: <541025071C7AC24C84E9F82296BB9B950807D2@OPTEX1.optex.local>
To: John Hall <john.hall@optionexist.co.uk>
Cc: simon@baydel.com, Damien GERANTON <dgeranton@alpha3i.com>,
 MTD mailing list <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200211291523.00197.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <541025071C7AC24C84E9F82296BB9B950807D2@OPTEX1.optex.local>
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

On Friday 29 November 2002 14:04, John Hall wrote:
> On 29 November 2002 12:35 Thomas Gleixner <tglx@linutronix.de> wrote:
> > For NAND see http://www.linux-mtd/tech/nand.html
>
> You mean http://www.linux-mtd.infradead.org/tech/nand.html
Yep
> I found a small bug on the page that caused all the text from "HOWTO
> implement NAND support" onwards to be in h2. Patch is here:
>
> diff -u nand.html.orig nand.html
> --- nand.html.orig      Fri Nov 29 13:02:46 2002
> +++ nand.html   Fri Nov 29 13:03:49 2002
> @@ -191,7 +191,7 @@
>  </p>
>
>  <hr>
> -<h2>JFFS2 specific information <h2>
> +<h2>JFFS2 specific information</h2>
>  <h3>JFFS2 Out of Band usage</h3>
>
>  <h4>Nand chips with 256 byte pagesize and 8 byte OOB size</h4>
>
Thanks
-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
