Received: from mail.auriga.ru ([80.240.102.102])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaBPT-0002jm-1Z
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2004 06:43:20 -0400
Message-ID: <40CED3EB.6090204@auriga.ru>
Date: Tue, 15 Jun 2004 14:48:11 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: Andriy Korud <a.korud@vector.com.pl>
References: <80908CC5B2C9DB47AAF8C77892FCB44315F7B2@lion.vector.com.pl>
In-Reply-To: <80908CC5B2C9DB47AAF8C77892FCB44315F7B2@lion.vector.com.pl>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CLEANMARKER node found at has totlen 0xc != normal 0x0  ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andriy Korud wrote:

>Hi, 
>I'm playing with jffs2 on NAND chips (Samsung 128Mbyte), MTD CVS is week old and kernel is 2.6.5.
>
>I'm making image with 
>./mkfs.jffs2 -b --eraseblock=131072 --pagesize=2048 -p -r /test_root -v -o test_root.img
>
>and then copy it with cp (nandwrite seems to have problems wiht endianess). Everything work fine except on mounting filesystem I have messages:
>
>CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
>CLEANMARKER node found at 0x00020000 has totlen 0xc != normal 0x0
>CLEANMARKER node found at 0x00040000 has totlen 0xc != normal 0x0
>....
>and so on for every block.
>
>  
>
Cleanmarkers are not needed in jffs2 images that get written on nand, so 
create such images with --no-cleanmarkers option.

wbr, Dmitry
