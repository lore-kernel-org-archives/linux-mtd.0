Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ZUf-0002ot-8o
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 08:14:10 +0000
Received: by wyb28 with SMTP id 28so3329883wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 01:14:08 -0700 (PDT)
Subject: Re: Mtd alignment bug affecting 1.4.X including current git
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kelly Anderson <kelly@silka.with-linux.com>
In-Reply-To: <4D9091B1.80002@silka.with-linux.com>
References: <4D9091B1.80002@silka.with-linux.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 11:11:45 +0300
Message-ID: <1301645505.2789.23.camel@localhost>
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

On Mon, 2011-03-28 at 07:48 -0600, Kelly Anderson wrote:
> Erasing 128 Kibyte @ 0 --  0 % complete.libmtd: error!: unaligned 
> address 2, mtd0 page size is 2048
> 
> /usr/sbin/flash_eraseall: /dev/mtd0: MTD writeoob failure: Invalid argument
> Erasing 128 Kibyte @ 20000 --  3 % complete.libmtd: error!: unaligned 
> address 131074, mtd0 page size is 2048

What are the flashe_eraseall options you use?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
