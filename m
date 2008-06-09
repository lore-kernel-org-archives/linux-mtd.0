Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5cze-0002uG-2b
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 08:44:46 +0000
Message-ID: <484CED7C.9050700@grandegger.com>
Date: Mon, 09 Jun 2008 10:44:44 +0200
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] [NAND] driver extension to support NAND on TQM85xx
	modules
References: <4847A8DA.6010406@grandegger.com>
	<1212825701.32207.403.camel@pmac.infradead.org>
	<20080607114438.GA23329@polina.dev.rtsoft.ru>
	<484C1F6C.9000108@grandegger.com>
	<0909149cc236822d193338c5eeb4e4b4@kernel.crashing.org>
In-Reply-To: <0909149cc236822d193338c5eeb4e4b4@kernel.crashing.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, avorontsov@ru.mvista.com,
	David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Segher Boessenkool wrote:
>> I see. I think I should then also post the bindings (update of
>> booting-without-of.txt) separately.
> 
> Yes please.  They are much easier to review that way (and they
> should be reviewed as a separate entity anyway).

I just sent the patch "[PATCH] booting-without-of: add more bindings for
FSL UPM driver" describing the binding separately.

Wolfgang.
