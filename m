Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G7U5i-0008AL-Bj
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 05:29:50 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6V9TaZh019875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jul 2006 05:29:36 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k6V9Tamq201678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jul 2006 05:29:36 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k6V9TZRr015632
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jul 2006 05:29:35 -0400
Subject: Re: how to use jff2 on UBI layer?
From: Frank Haverkamp <haver@vnet.ibm.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <44CDB4A4.1010809@yandex.ru>
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>
	<20060724114007.GB20849@wohnheim.fh-wedel.de>
	<44C8B789.4030505@yandex.ru>
	<625fc13d0607301228y2bfd2c62q462c508d57a32043@mail.gmail.com>
	<44CDAF7D.4040300@yandex.ru>  <44CDB4A4.1010809@yandex.ru>
Content-Type: text/plain
Date: Mon, 31 Jul 2006 11:29:33 +0200
Message-Id: <1154338173.6068.37.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	Marteo Tim <tim.marteo@gmail.com>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2006-07-31 at 11:43 +0400, Artem B. Bityutskiy wrote:
> Artem B. Bityutskiy wrote:
> 
> >> For what it's worth, I personally prefer the gluebi approach.  Or at
> >> least it's design.  I don't see why UBI cannot add_mtd_device for
> >> every volume that is found within the overall MTD given to it.

UBI was and is intended to smoothly integrate in Davids MTD
architecture. Therefor I strongly agree with Josh (and Joern) that an
MTD device should be created for each UBI volume.

This would help to plug-into the existing architecture nicer and it
would make it easier for others to combine the UBI layer with existing
code. The UBI user should not be forced to add a comatibility layer
underneath his existing software to have UBI support. If he discovers
later on that he gets a benefit from using UBI directly, it is fine, but
not in the first place.

> > 
> > Just because it's strange from the design POV. UBI != MTD device 
> > semantically => any attempt to access UBI as MTD device is a dirty hack.

This is only the current UBI implementation. The UBI design would also
be implementable as MTD device itself. I think it is not "a dirty hack".

> 
> Err, I have to refine my position Of course, the idea itself is OK - it 
> is useful to make MTD-oriented software work on top of UBI. But it is 
> still a hack, just because UBI != MTD subset, strictly speaking.

You say "the idea itself is OK" and in the next sentence you call it
"still a hack". What is it now in your eyes "OK" or "a hack"?

> 
> But again, see in my previous mail, JFFS2's gluebi port has little to do 
> with a transparent MTD emulation layer. At lease the gluebi I'm aware of.
> 

The gluebi implementation I have seen, seems to me the best compromise
to allow UBI being something different than an MTD, but still providing
the integration of UBI into the MTD framework, which from my perspective
the best way to advertise UBI.

It is good that you came up with your JFFS2/UBI integration proposal,
since it shows, how one could use UBI volumes intead of using MTDs.

I reviewed it, and came to the conclusion, that adding a full new
io-layer to JFFS2 is currently overkill. The situation might be
different if David thinks that your io-layer is usefull for his further
plans with JFFS2. But until I have seen such a statement from him, I
would rather like to see Joerns approach with the MTDs being created by
his gluebi-code in the ubi-2.6.git. I think it is more usefull to have
those MTDs, than adding new io-layers to any other code, which may want
to use the UBI feaures, e.g. cramfs, squashfs, maybe even VFAT stuff.

MTD is already an abstraction and enables layering. Adding more and
especially unique layers is from my view not the best choice. 

If you think that MTD as abstraction layer is not sufficient or ugly, it
is a completely different discussion which should be done with David
directly. Please do not use UBI to try to introduce your own abstraction
style and layers. Instead talk to David about MTD2 or similar.

Please also refer to http://www.faqs.org/rfcs/rfc1925.html (6a) which
was intended for the networking topic, but may also apply here.

Frank
