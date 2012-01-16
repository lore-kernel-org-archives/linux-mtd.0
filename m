Received: from nm8-vm2.bullet.mail.ne1.yahoo.com ([98.138.90.156])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmhlv-0004w1-2z
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 08:18:32 +0000
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
 <1326630286.2201.3.camel@koala>
Message-ID: <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
Date: Mon, 16 Jan 2012 00:18:27 -0800 (PST)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: Re: Corrupted UBIFS, bad CRC
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1326630286.2201.3.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: Karsten Jeppesen <arm9263@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Of course I can. Anything I can do to help.

I put it on one of my outside servers and I put as well the /dev/mtd4 as the ubi0_0 you asked for:

<http://download.gnist.skov.com/corrupt_mtd4_20120116.img>
and
<http://download.gnist.skov.com/ubi0_0_20120116.img>

Have a nice one,

Karsten



----- Original Message -----
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
Cc: ubifs <linux-mtd@lists.infradead.org>
Sent: Sunday, January 15, 2012 1:24 PM
Subject: Re: Corrupted UBIFS, bad CRC

On Thu, 2012-01-12 at 05:47 -0800, Karsten Jeppesen wrote:
> Hi Guys,

Can you make a dump of your UBI volume and share it with me?

dd if=/dev/ubi0_0 of=ubi.img

and share ubi.img with me?
