Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L3RMb-00022F-4X
	for linux-mtd@lists.infradead.org; Fri, 21 Nov 2008 08:27:47 +0000
Date: Fri, 21 Nov 2008 09:27:28 +0100 (CET)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Ankur Maheshwari <ankur.maheshwari@gmail.com>
Subject: Re: Query on UBIFS usage
In-Reply-To: <8fbbfb6b0811201021l3f3d9aabr90d9c54b18555cfc@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0811210923110.631@vixen.sonytel.be>
References: <8fbbfb6b0811201021l3f3d9aabr90d9c54b18555cfc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: ankur_maheshwari@in.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Nov 2008, Ankur Maheshwari wrote:
> I am newbee to UBIFS. I have some basic doubts on using UBIFS.
> 
> 1. I read in UBIFS FAQ that it can not be used as NFS file system. I
> am bit confuse with the statement.
> Is it possible that I use UBIFS on one of Flash partition and at the
> same time do NFS (root fs mount as NFS) boot. Is there any issue with
> it.

It means you cannot _export_ through NFS an UBIFS file system. I.e. if your
system serves data through NFS, that data cannot be located (yet?) on an UBIFS
file system.

> 2. Can I use UBIFS with other Flash filesystem (like SquashFS-read
> only) on other partition of same flash.

Should work.

> 3. What will be better, keep using SquashFS(RO) or switch to UBIFS.

It depends on your application.
If you need to write to the file system, you cannot use SquashFS.
If you just need a read-only file system, I expect SquashFS to be the better
choise, as it should compress better. But performance may still differ, anyone
with actual figures?

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
