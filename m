Received: from mirapoint3.brutele.be ([212.68.203.242] ident=mirapoint)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NuHa-0003lW-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 12:23:38 +0000
Date: Mon, 16 Dec 2002 13:54:14 +0100
From: Geoffroy Stevenne <geof@hellea.com>
To: linux-mtd@lists.infradead.org
Subject: Re: writing new BBRAM driver
Message-Id: <20021216135414.6d72949c.geof@hellea.com>
In-Reply-To: <Pine.LNX.4.31.0212161057400.28011-100000@www.optixsoft.de>
References: <D3AF5F134D627243993F2F2FC32EE4D229C4A7@mailman.eason.com>
	<Pine.LNX.4.31.0212161057400.28011-100000@www.optixsoft.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi,

On Mon, 16 Dec 2002 11:14:41 +0100 (MET)
Tobias Otto-Adamczak <toa@indakom.de> wrote:

> Alex Pavloff, 2002-12-13, 15:45h:
> 
> > Hi there folks.  I've written the struct mtd_info functions for a
> > 128KB BBRAM driver for my companies new board.  It's horribly
> > simple, as most of it is actually done by a gate array on the board,
> > so from kernel land its just poking ioports.  Easy stuff.

Great! If it works with the versalogic board it will be tested
here with a 512KB BBRAM.  Of course I'll provide maximum feedback
(maybe patches if any required). Thanks!

--
Geoffroy
