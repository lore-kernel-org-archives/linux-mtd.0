Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112gsk-0007Ju-00
	for mtd@infradead.org; Fri, 9 Jul 1999 21:04:27 +0100
Date: Fri, 9 Jul 1999 14:04:14 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: Response from M-Systems
In-Reply-To: <E112fiz-0001Z2-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990709135140.10548A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Fri, 9 Jul 1999, David Woodhouse wrote:

> I've heard again from Amir Ban, the Vice-President of R&D at M-Systems. He
> presents M-Systems concerns and reasoning for their behaviour. It remains to be
> seen whether this is a final response or whether they're still trying to reach
> a more useful conclusion.
> 
> My response to their concern about patent issues, of which RMS is probably 
> not going to approve, is also on the page:
> 
> 	http://www.linux-mtd.infradead.org/msys-response.html

Yeah, he wouldn't. The GPL is reasonably clear that you have to give up
patent rights. IBM's laywers and Apple's laywers both concure on this. If
you as a compay GPL an implementation for an algorithm then that company
must give free use patent rights to everyone who recieves a copy of the
code, which is effectively everyone.

Given his statements I would make 3 assertions
  #1 - We are already cloning your higher level software technologies, if
       you with hold hardware specs then not only will your competitors
       have the software that you are afraid of giving them, but your 
       customers also won't have support for your hardware on our
       platform! You loose both ways.
  #2 - Your hardware patents protect you from people cloning the actual
       hardware device

I can state from experiance that we have looked at using disk on a chip
here and rejected it because of their attitude towards us needing custom
drivers for QNX.

Personally I don't the NFTL is very interesting, the specs to access the
r/w/e the DoC hardware is what is important and probably is pretty trivial
to reverse engineer, stick a logic analyser on the chip's bus and voila :>

Jason





To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
