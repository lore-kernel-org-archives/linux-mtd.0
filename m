Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qvu86-0006sJ-A9
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 16:47:11 +0000
Received: by wwf10 with SMTP id 10so222155wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 09:47:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron>
	<20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
	<Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
Date: Tue, 23 Aug 2011 09:47:05 -0700
Message-ID: <CAN8TOE-jYm3pRa3utwnqYRB=DonxboW7PfFq-CqdqG+_OzCh9A@mail.gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	=?ISO-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 22, 2011 at 11:48 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>>>> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
>>>>> 1) Broken "noecc" writes; `nandwrite -n -o' does not work on my
>>>>> =A0 hardware, at least, without these patches
>
> This particular issue was fixed in a patch by Peter Wippich on June 6th:
>
> http://lists.infradead.org/pipermail/linux-mtd/2011-June/036016.html

Right, I actually found this patch already and have it lined up in my
test kernel, but apparently my issue is separate.

I will try to describe my issue further on the thread for patch 1.
Jason Liu has asked about the details there.

> I could test patch 1 of this set to see if it accomplishes the same thing=
,
> but initially to me it seems that the issue has already been fixed, albei=
t
> perhaps not pushed yet?

I am now doubting that my fix will solve your problem like Peter
Wippich's patch did. I believe the problem I am having is specifically
related to my NAND controller's characteristics (how it handles ECC).

So for hardware on which Peter's fix solves your problems, I suppose I
would be interested mostly in seeing if my patch *breaks* your build.
FYI, I already see an issue for those who use both the builtin
`nand_write_page_raw()' and `nand_write_buf()' functions. It can be
fixed if you amend my patch with the following. I can resend later,
but test these for breakage if you can!

--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1898,7 +1898,8 @@ out:
 static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *ch=
ip,
                                const uint8_t *buf)
 {
-       chip->write_buf(mtd, buf, mtd->writesize);
+       if (buf)
+               chip->write_buf(mtd, buf, mtd->writesize);
        chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
