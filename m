Received: from rv-out-0708.google.com ([209.85.198.247])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6W3s-0008BP-UP
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 20:37:28 +0000
Received: by rv-out-0708.google.com with SMTP id c5so11280rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 13:37:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090519203014.GC27476@pengutronix.de>
References: <1232559685-2268-1-git-send-email-w.sang@pengutronix.de>
	<1232559685-2268-3-git-send-email-w.sang@pengutronix.de>
	<fa686aa40905190757w68b35333j6f0fa84ea253a486@mail.gmail.com>
	<20090519203014.GC27476@pengutronix.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 19 May 2009 14:36:59 -0600
Message-ID: <fa686aa40905191336u4578038hb504e33c79c2d884@mail.gmail.com>
Subject: Re: [PATCH 2/2] maps/mtd-ram: add an of-platform driver
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 19, 2009 at 2:30 PM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
>> This name is too generic for an of_platform device. =A0'mtd' needs to be
>> in there somewhere.
>
> Will "of-mtd-ram" do? (I'd think so)

fine by me.

g

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
