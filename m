Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G7RoV-0004GD-VO
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 03:03:51 -0400
Message-ID: <44CDAB1D.3010708@yandex.ru>
Date: Mon, 31 Jul 2006 11:02:53 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: question: the performance of jffs2 on UBI
References: <49eab5c80607270530j469f2585w45fbe1d6449c2921@mail.gmail.com>	
	<44C8BD55.3040604@yandex.ru> <44C8C07D.2050909@yandex.ru>
	<625fc13d0607301034i40bd9583na4c8c6fa2c0f4230@mail.gmail.com>
In-Reply-To: <625fc13d0607301034i40bd9583na4c8c6fa2c0f4230@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: falls huang <falls.huang@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> Just a note, you lose compression if you do that.  AFAIK, jffs2 is the
> only in-kernel filesystem that supports transparent read/write
> compression.
> 

Yeah, that's true. Although Reiser4 claims t osupport it. Nevertheless, 
I didn't try it.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
