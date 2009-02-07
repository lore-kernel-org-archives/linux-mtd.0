Received: from mail-fx0-f16.google.com ([209.85.220.16])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVlLQ-00007h-LO
	for linux-mtd@lists.infradead.org; Sat, 07 Feb 2009 11:27:35 +0000
Received: by fxm9 with SMTP id 9so368050fxm.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Feb 2009 03:27:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <498C40A2.8050100@billgatliff.com>
References: <200902031327.59536.corentincj@iksaif.net>
	<498BEBC8.3000302@yandex.ru> <498C40A2.8050100@billgatliff.com>
Date: Sat, 7 Feb 2009 12:27:30 +0100
Message-ID: <71cd59b00902070327u2185377r5735cdd1a68249b8@mail.gmail.com>
Subject: Re: Request for review: NandFS
From: Corentin Chary <corentin.chary@gmail.com>
To: Bill Gatliff <bgat@billgatliff.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind@yandex.ru>, linux-fsdevel@vger.kernel.org,
	Gregory CLEMENT <gclement@adeneo.adetelgroup.com>,
	HIBLOT Jean-Jacques <jjhiblot@adeneo.adetelgroup.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Please, think about joining us instead :-)
>>
>
> Of course, if NandFS is better than UBI/UBIFS, then maybe you should think
> about joining him instead!  :)

Yep, I think you should do that ! :)

Seriously, NandFS may not be scalable, but with checkpoints and
writeback it'll should get better performances than JFFS/YAFFS.
And as it only use mtd, it should be more easily portable to something
else that linux.

But I know that we now need scalable solutions, and it's why I work on
another project ( http://uffs.org/ ). What we are trying to do with
that is totaly different. We will try to do something portable (linux,
windows, fuse (for MacOSX and *BSD)). And more important we wan't to
make it work on raw NAND, *and* on block devices based on NAND. For
that we've got EBM, which is very similar to UBI (and uses UBI on
Linux) to talk to raw NAND or block devices. You may look at
http://uffs.org/pages/documentation .
For the core filesystem, we may make something new or use a modified
version of UBIFS (in this case, the project may be re-named).
Anyway, by working on UFFS, we will contribute to UBI/UBIFS and UBI2
(ebm on block devices will look like UBI2).


-- 
Corentin Chary
http://xf.iksaif.net
