Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRSj7-0004cd-Sx
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 17:27:34 +0000
Received: by wwb39 with SMTP id 39so4024997wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 10:26:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DDE0991.8040900@linutronix.de>
References: <1301903526.2760.38.camel@localhost>
	<1303283589-14415-1-git-send-email-computersforpeace@gmail.com>
	<1303459329.2757.40.camel@localhost>
	<BANLkTi=61rg=ZLrDpWSDrz1_gfuQAgCzRw@mail.gmail.com>
	<4DDE0991.8040900@linutronix.de>
Date: Tue, 31 May 2011 10:25:41 -0700
Message-ID: <BANLkTinq9BbK5VbHW8hFe17r1r24cDZ9Yg@mail.gmail.com>
Subject: Re: [RFC] mtd: nand: separate chip options / bbt_options
From: Brian Norris <computersforpeace@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sebastian,

On Thu, May 26, 2011 at 1:04 AM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> It is kinda required here :) The long story:
> The NAND-controller needs the complete OOB area for ECC. So we have no
> room for BBT in OOB. Therefore we use BBT table on flash without the
> recognition marking in the OOB area.

I assume you're using CREATE_EMPTY_BBT along with the new flag
NAND_USE_FLASH_BBT_NO_OOB, then? FYI, I'm reworking that option as
well so please review my patches.

> On the second
> scan we use the on-flash BBT information (which is created by mtd) so it
> is not empty again.

I'm a little confused here. Who/what gives the on-flash BBT
information? It seems to me like a combination of the
"FLASH_BBT_NO_OOB" options and "CREATE_EMPTY_BBT" will leave you with
an empty, flash-based BBT that is stored in-band. It would not contain
any manufacturer info, as you stated that "information in OOB is
lost."

Anyway, it looks like this option may be worth saving, but I'm just
trying to get a handle of the rationale and usage so that we can
properly document it.

Brian
