Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QPIci-0005PF-ND
	for linux-mtd@lists.infradead.org; Wed, 25 May 2011 18:16:01 +0000
Received: by wwb39 with SMTP id 39so6506763wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2011 11:15:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303459329.2757.40.camel@localhost>
References: <1301903526.2760.38.camel@localhost>
	<1303283589-14415-1-git-send-email-computersforpeace@gmail.com>
	<1303459329.2757.40.camel@localhost>
Date: Wed, 25 May 2011 11:15:58 -0700
Message-ID: <BANLkTi=61rg=ZLrDpWSDrz1_gfuQAgCzRw@mail.gmail.com>
Subject: Re: [RFC] mtd: nand: separate chip options / bbt_options
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Again, sorry for the wait time on this. I've been busy. Now I'm
addressing most of these topics and will send a patch soon. I haven't
completely answered the following question, though.

On Fri, Apr 22, 2011 at 1:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-04-20 at 00:13 -0700, Brian Norris wrote:
>> Other things to consider (not yet implemented):
>> * Is it safe to move NAND_CREATE_EMPTY_BBT to bbm.h and require it to be
>> =A0 put in bbt_options? It seems not to be used by any in-kernel drivers
>> =A0 so it's only likely to mess with independent drivers...
>
> What exactly this option mean and how could it be used?

I'm not entirely sure how it would be used (perhaps ask Sebastian, the
one who introduced it in commit 453281a9), but I have an idea what it
means.

It seems that (when combined with NAND_BBT_CREATE) this flag causes
nand_scan_bbt() / check_create() to skip the scanning portion of
creating a bad block table, effectively leaving an empty bad block
table. According to the commit message:
    it will create an empty BBT table without considering vendor's BBT
    information. Vendor's information may be unavailable if the NAND
    controller has a different DATA & OOB layout or this information may be
    allready purged.

I'm prepared to simply move this over to bbm.h (next to
NAND_BBT_CREATE) if it's worth saving. Otherwise, it can just as
easily be dumped.

Brian
