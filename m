Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmP8k-0001qL-RI
 for linux-mtd@lists.infradead.org; Sun, 15 Jan 2012 12:24:51 +0000
Received: by eaaa13 with SMTP id a13so780592eaa.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jan 2012 04:24:47 -0800 (PST)
Subject: Re: Corrupted UBIFS, bad CRC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
Date: Sun, 15 Jan 2012 14:24:36 +0200
In-Reply-To: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326630286.2201.3.camel@koala>
Mime-Version: 1.0
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-01-12 at 05:47 -0800, Karsten Jeppesen wrote:
> Hi Guys,

Can you make a dump of your UBI volume and share it with me?

dd if=/dev/ubi0_0 of=ubi.img

and share ubi.img with me?
