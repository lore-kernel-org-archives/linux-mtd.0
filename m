Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2X8-0008Me-3E
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 07:09:38 +0000
Message-ID: <4A7E7453.6010103@gmail.com>
Date: Sun, 09 Aug 2009 10:01:39 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Timo Lindfors <lindi@kurp.hut.fi>
Subject: Re: [PATCH] jffs2dump: rewrite --help output to be more suitable
	for help2man
References: <kr8wi9et0l.fsf@lindi1.lan>
In-Reply-To: <kr8wi9et0l.fsf@lindi1.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/28/2009 12:05 AM, Timo Lindfors wrote:
> From: Timo Juhani Lindfors<timo.lindfors@iki.fi>
>
> $ help2man /usr/sbin/jffs2dump | man /dev/stdin
>
> currently creates badly formatted output like
>
> -b          --bigendian                 image is big endian
> -l          --littleendian              image   is   little
> endian  -c          --content                   dump  image
> contents  -e  fname    --endianconvert=fname        convert
> image endianness, output to file fname -r         --recalc-
>
> This patch modifies the --help output for jffs2dump to be more
> suitable for help2man and thus makes it possible to easily create
> manual pages that stay up-to-date.
>
> Signed-off-by: Timo Juhani Lindfors<timo.lindfors@iki.fi>

Looks good to me. Pushed to the mtd-utils git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
