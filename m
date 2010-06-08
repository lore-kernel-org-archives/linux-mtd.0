Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OM0lq-0005CN-Oq
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2010 15:31:19 +0000
Received: by pwj6 with SMTP id 6so73313pwj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Jun 2010 08:31:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTilYTO_TgJMVrkmY1yAUK5dGTjyzgNIhndNui3r1@mail.gmail.com>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763914.2106.1.camel@localhost>
	<AANLkTin31PwUfXVHGV89VGrWG89RbIcY1L1I_VEO7mSk@mail.gmail.com>
	<1276006648.5677.20.camel@localhost>
	<AANLkTilYTO_TgJMVrkmY1yAUK5dGTjyzgNIhndNui3r1@mail.gmail.com>
Date: Tue, 8 Jun 2010 11:23:11 -0400
Message-ID: <AANLkTil23ApPd97_nAsfu0c_mUdVcZEFwCW7St5V8pE0@mail.gmail.com>
Subject: Re: UBIFS failed to recover master node
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>
>> twebb, you did not enable debugging messages. But it looks like they are
>> not actually needed.
>
> I config'd kernel with...
> CONFIG_MTD_UBI_DEBUG=y
> CONFIG_UBIFS_FS_DEBUG=y
>
> Did I miss something else?
>

Never mind, I now see what I missed:  CONFIG_MTD_UBI_DEBUG_MSG=y
