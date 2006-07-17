Received: from mfront7.mail.yandex.net ([213.180.223.96])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G2QOd-0003y2-Mb
	for linux-mtd@lists.infradead.org; Mon, 17 Jul 2006 06:32:20 -0400
Date: Mon, 17 Jul 2006 14:32:02 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <44BB6722.000003.20811@mfront7.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: sudharshana@motorola.com
Subject: Re: Nand read/write
In-Reply-To: <B7803DC652E2F9458758AEBB6A5FD60FF88D90@ZMY16EXM67.ds.mot.com>
References: <B7803DC652E2F9458758AEBB6A5FD60FF88D90@ZMY16EXM67.ds.mot.com>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>I have the following scenario on an embedded Linux application.
>
>There is a partition in the NAND flash memory (with RAW type, no file
>system), which will be mounted and used for read/write. As an
>application which performs "read"/"write" on this partition after
>mounting, should it be assumed that "bad block algorithm" is covered? Or
>application has to handle the same?

Nope. But UBI can do a lot. Try to look at it.
