Received: from mail-out.m-online.net ([212.18.0.9])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO5JH-0001bT-Dm
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 09:18:40 +0000
From: Detlev Zundel <dzu@denx.de>
To: Mark Mason <mason@postdiluvian.org>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
References: <20101129195014.19224240@wker>
	<20101129203306.GA22692@postdiluvian.org>
	<1291261659.14534.13.camel@koala>
	<20101202041048.GA5998@postdiluvian.org>
Date: Thu, 02 Dec 2010 10:17:36 +0100
In-Reply-To: <20101202041048.GA5998@postdiluvian.org> (Mark Mason's message of
	"Wed, 1 Dec 2010 23:10:48 -0500")
Message-ID: <m2hbew355b.fsf@ohwell.denx.de>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

[...]

>>From the same project, I do have some improvements to the MPC8315 NAND
> driver that allows higher bus throughput during erase cycles.  There's
> a chance that this is applicable to other NAND controllers, but my
> experience is limited.  I'd be more than happy to share my work with
> someone who has an interest in the 83xx, and I promise that I will do
> a better job at the details than I did with the CPUs in question.

Please do post your changes to the linuxppc-dev[1] mailing list.  There
are a lot of people with interst on the 83xx chips there.

Thanks!
  Detlev

[1] https://lists.ozlabs.org/listinfo/linuxppc-dev

--
DENX Software Engineering GmbH,      MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-40 Fax: (+49)-8142-66989-80 Email: dzu@denx.de
