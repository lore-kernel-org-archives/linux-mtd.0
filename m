Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N6g20-0003yg-IZ
	for linux-mtd@lists.infradead.org; Sat, 07 Nov 2009 07:48:24 +0000
Subject: Re: Corrupted ubifs after reboot (from the debugger)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricardo <ricardo.ribalda@gmail.com>
In-Reply-To: <aa76a2be0911040826w5e5ce3bah7afa3fdbf92ae8a2@mail.gmail.com>
References: <aa76a2be0911030732n74406409v62ae64244ef358a6@mail.gmail.com>
	<1257319048.21596.74.camel@localhost>
	<aa76a2be0911040826w5e5ce3bah7afa3fdbf92ae8a2@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 07 Nov 2009 09:48:03 +0200
Message-Id: <1257580083.21596.102.camel@localhost>
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

On Wed, 2009-11-04 at 17:26 +0100, Ricardo wrote:
> Hello
> 
>   I am using the 2.6.31 from linus tree.

Update it please, with
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

>  I will merge the tree from
> infreadead.org/mtd-2.6 right now.

No, use ubifs-v2.6.31.git.

>  Will this version be able to restore
> the broken partition or it wont corrupt future partitions?

I think it will not fix it, but will prevent this corruption.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
