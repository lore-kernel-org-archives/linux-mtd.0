Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GCEoT-00086a-W5
	for linux-mtd@lists.infradead.org; Sun, 13 Aug 2006 08:11:44 -0400
Message-ID: <44DF16CC.3070708@yandex.ru>
Date: Sun, 13 Aug 2006 16:10:52 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: John <john@arrows.demon.co.uk>
Subject: Re: OneNAND - Cannot mount jffs2 partition
References: <Pine.LNX.4.33.0608131059220.32638-100000@arrows.demon.co.uk>
In-Reply-To: <Pine.LNX.4.33.0608131059220.32638-100000@arrows.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello John,

John wrote:
> Questions:
>   Is this a suitable pair of commands?
>    $ flash_eraseall -j /dev/mtd5
>    $ mount -t jffs2 /dev/mtdblock5 /mnt/onenand
Yeah, I believe this is the right commands and should work.

>   Would they work on an ordinary NAND device?
Yeah, and even on NOR.

>   Should I be using the NFTL code is some way?
Nope.

>   What is the likely underlying cause of the error message
>       "Cowardly refusing to erase blocks on filesystem with
>        no valid JFFS2 nodes"
Hmm, JFFS2 is complaining that you feed it with a flash which is neither 
empty nor contains a valid JFFS2 FS image.

Try to avoid using -j ans see what happens. You also may try to enable 
JFFS2's debugging prints.

I personally have never used OneNAND, and AFAIK it is rather new in MTD.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
