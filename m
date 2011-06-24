Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaD7g-0002We-Jm
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 20:37:06 +0000
Received: by vxd3 with SMTP id 3so2795323vxd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 13:36:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308945343.13493.25.camel@koala>
References: <4DB033E4.6030105@parrot.com> <4DB06693.5000100@parrot.com>
	<1303460103.2757.48.camel@localhost>
	<BANLkTimwOp4uPfQ0udLDycor2MjotUxiHw@mail.gmail.com>
	<1308945343.13493.25.camel@koala>
Date: Fri, 24 Jun 2011 16:36:52 -0400
Message-ID: <BANLkTim-1VxX9bypbTbO=jm9dGykZ8Dviw@mail.gmail.com>
Subject: Re: bbt and bitflip
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2011 at 3:55 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> If you confirm that everything is great and robust when the on-flash BBT
> gets corrupted - the NAND core for sure notices any corruptions and
> falls-back to the traditional scanning method and restores the on-flash
> BBT - then I apologize for saying that I do not trust it. Also, I do not
> really know the details of this, so I may be completely wrong.
>

I'm still trying to pinpoint the cause of the BBT corruptions that I
encountered, but _if_ they were caused by bit-flips, then it
definitely appears that your initial statement was accurate: the
devices were in many cases unbootable because the corrupted BBT was
treated as legit.

This also seems to be the case when looking at the code in nand_bbt.c:
if an ECC error is encountered in read_bbt(), it prints a warning but
then continues to process the BBT data.  Maybe there's an additional
assumption that I'm overlooking, but at a glance it seems like that
would allow bit errors to accumulate and wrongly flag good blocks as
bad.

-- 
Matthew L. Creech
