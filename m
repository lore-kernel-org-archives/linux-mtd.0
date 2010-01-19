Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXBoB-0001Fe-T8
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 10:59:44 +0000
Subject: Re: one time programmable flash (OTP)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <804f0d21001190234t3d576efdi2b915b97df379f65@mail.gmail.com>
References: <804f0d21001190234t3d576efdi2b915b97df379f65@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Jan 2010 12:58:41 +0200
Message-Id: <1263898721.2891.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2010-01-19 at 11:34 +0100, Arno Steffen wrote:
> Is there any support by kernel to have access (write/read) to that OPT area?
> The flash (MT29F1G) on my omap board has OTP blocks.
> What do I have to do to get it and how to use?
> I've been searching a lot in the net, but hasn't been succesful with
> that, except for Blackfin's build-in OTP.

OneNAND has, and there is some support in the kernel.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
