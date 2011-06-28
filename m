Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbXcw-0000BX-W6
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 12:42:52 +0000
Received: by pwi3 with SMTP id 3so120246pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 05:42:43 -0700 (PDT)
Subject: Re: [Ubifs] Reboot -> "recovery needed"?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
Date: Tue, 28 Jun 2011 15:43:33 +0300
In-Reply-To: <1bij07h511u24jct1qrpvo4622jogipiuj@4ax.com>
References: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
	<1309246418.23597.31.camel@sauron>
	<45ej07pjslh20fb66illqsmn9r0au0fejb@4ax.com>
	<1309260162.23597.66.camel@sauron>
	<gfej07dg451r0l2co91fuvn4k2ujktk1ta@4ax.com>
	<1309261088.23597.68.camel@sauron>
	<enfj071fg5ebr0n2u15t2nogem32afb5kh@4ax.com>
	<1309263271.23597.70.camel@sauron>
	<1bij07h511u24jct1qrpvo4622jogipiuj@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309265018.23597.74.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 14:33 +0200, Gilles wrote:
> On Tue, 28 Jun 2011 15:14:27 +0300, Artem Bityutskiy
> <dedekind1@gmail.com> wrote:
> >Then you do not have to worry about UBIFS recovery - it will be quick
> >and will do almost nothing - just check that everything is all-right and
> >mark the master node as clean.
> 
> What is the command for this? Google says that it's part of the Ubifs
> source code:
> 
> www.spinics.net/lists/stable-commits/msg11702.html

This all is done automatically by UBIFS, you do not have to worry. Just
make sure you sync before reboot.

-- 
Best Regards,
Artem Bityutskiy
