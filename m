Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11lTL1-0006Ev-00
	for mtd@infradead.org; Wed, 10 Nov 1999 08:42:43 +0000
To: "Jon Burford" <jburford@xsilogy.com>
Cc: mtd@infradead.org
Subject: Re: IGEL DOC2000 flash driver performance 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 10 Nov 1999 08:42:36 +0000
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11lTKu-0001lb-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jburford@xsilogy.com said:
> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> <HTML>
> <HEAD> <META content="text/html; charset=iso-8859-1"
> http-equiv=Content-Type> <META content="MSHTML 5.00.2614.3401"
> name=GENERATOR> <STYLE></STYLE> </HEAD> <BODY bgColor=#ffffff> <DIV>
> <FONT face=Arial size=2>I have been using the IGEL flash driver on a
> Linux  2.2.12 system now for several months.&nbsp; One very annoying
> "feature" is that  it causes the entire OS to hang for 2-5 seconds
> after mounting or moderate write  operations.&nbsp;

Urgh. HTML.

>  I am wondering if anyone has encountered  this problem and/or may
> have some advice for me.&nbsp; Does the MTD DOC2000  driver suffer
> from this behavior and can it be patched into a 2.2.12  kernel?&nbsp;
> Any other thoughts?</FONT></DIV>

The bad news is: yes, the MTD DoC2000 driver does suffer from this behaviour.
It disables interrupts for the whole time it's dealing with the flash, even
when it's folding Virtual Unit Chains.

The good news is that there's no real need for it to do so, and hence it won't
be like that for long. I know exactly how I'm going to deal with it, but I
just haven't done it yet. I want to be 100% sure that my NFTL support is
correct before I make life more complex by enabling threadedness in the driver.

And yes, it can be patched into a 2.2.12 kernel - I've only used it as 
modules, but with a little hacking you can compile it into the kernel. I know 
that people on this list have done so - prod them to provide patches.

Remember that it's still only beta though.

----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
