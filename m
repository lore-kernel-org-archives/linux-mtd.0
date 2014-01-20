Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5IG5-0006JH-C4
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 17:03:33 +0000
Date: Mon, 20 Jan 2014 14:03:24 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>, Rob Herring <rob.herring@calxeda.com>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>
Subject: Re: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Message-ID: <20140120170324.GA25652@localhost>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
 <20140117203347.GC3843@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA67E79@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA67E79@DBDE04.ent.ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Seif Mazareeb <seif@marvell.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, Jan 20, 2014 at 06:21:35AM +0000, Gupta, Pekon wrote:
[..]
> >
> >Pekon, do you think this binding proposal is good enough to describe OMAP NAND
> >ECC mode?
> >
> >I'm not implying we should deprecate the recently added "ti-nand-ecc-opt",
> >but just want to know it's eventually possible.
> >
> Yes, this is good approach for long-term, and it can replace "ti-nand-ecc-opt"
> "ti-nand-ecc-opt" is not new DT binding, it just got some new values added
> However, you have to convince DT Maintainers to get this in, and then deprecate
> other vendor specific bindings. It would be difficult to maintain backward
> compatibility to these bindings, if we move to 'nand-ecc-strength'.
> 

Putting the DT maintainers on the To: field to get some feedback.

> At some-point we need to get some concrete guidelines from DT Maintainers on
> how long we should support deprecated bindings in our code, And what is the
> age of DT binding. I think David Woodhouse should throw more light, as he had
> some discussions & ideas on about DT binding life, during a linux conference.
> 

That's a good question :-)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
