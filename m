Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DaCoP-0000HY-Mr
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 09:17:42 -0400
Message-ID: <4291D7D0.7010305@yandex.ru>
Date: Mon, 23 May 2005 17:17:04 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230940590.25999@kukac.halom.u-szeged.hu>
	<1116846559.16577.18.camel@sauron.oktetlabs.ru>
In-Reply-To: <1116846559.16577.18.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][03/03] nandsim own geometry
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> is it possible to avoid such a changes in nand_ids.c ?
> AFAICS, your patch assumes that one should recompile nand_ids when
> nandsim configuration has been changed. It shouldn't be so I think.
> 
> 
> I'd better do:
> 1. initialize all the needed fields in 'struct mtd_info' and 'struct
> nand_chip' in case of a custom chip in _nandsim_.
> 2. Introduce some special option (say, NAND_SKIP_READ_ID for this-
> 
>>options) which tells nand_scan not to read NAND chip's ID.
> 

Or better try to make it such a way, that it doesn't affect nand_base or 
nand_ids, even if it will be not very pretty. Otherwise tglx1 may veto this.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
