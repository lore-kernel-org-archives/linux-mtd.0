Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxPEa-0007OU-NN
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 09:12:44 -0400
Message-ID: <42E637B5.9070204@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 15:16:37 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>
	<42E634D0.6090300@inf.u-szeged.hu> <42E6355C.4010700@yandex.ru>
In-Reply-To: <42E6355C.4010700@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:

> Ferenc Havasi wrote:
>
>> Martin, you may should try our Centralizes Summary (CS) patch. It stores
>> every relevant memory representation at umount time, so at mount (if the
>> previous unmount was a clean one) you need only to read it without any
>> scanning and rebuilding.
>>
>> It is downloadable from our web site
>> (http://www.inf.u-szeged.hu/jffs2/mount.php). I recommend the variant
>> which stores reference information on the first erase block.
>>
> Err, isn't your patch about speeding up scanning, not checking?
>
Erase Block Summary just speeds up scanning - every other processes work
as before.

Centralizes Summary work very differently. It stores all the relevant
memory representation (inode caches, list, ...) onto flash (so the
obscolated information is also stored) at umount time, so at mount time
it only have to restore no other scanning and building is necessery. It
is some kind of "hibernating".

Ferenc
