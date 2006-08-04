Received: from smtp.imp.bg.ac.yu ([147.91.50.101])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8uup-0007h6-Ps
	for linux-mtd@lists.infradead.org; Fri, 04 Aug 2006 04:20:30 -0400
Message-ID: <004101c6b79e$d241a0f0$c6345b93@VLADIMIR>
From: "Iva Salom" <diva@kondor.imp.bg.ac.yu>
To: <dedekind@infradead.org>
Subject: Fw: Problem with mounting JFFS2
Date: Fri, 4 Aug 2006 10:20:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
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


----- Original Message ----- 
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: "Iva Salom" <diva@kondor.imp.bg.ac.yu>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, August 03, 2006 4:44 PM
Subject: Re: Problem with mounting JFFS2

Hi Artem!

> Hello Iva,
>
> On Thu, 2006-08-03 at 12:51 +0200, Iva Salom wrote:
>> I am a beginner in all these embedded linux - mtd - jffs stuff. I am
>> using Intel FLASH 28F320 (2 interleaved 16b chips of 8MB, so we have
>> 32bit buswidth) (CFI) with TMS320C5471 platform. I turnd on MTD
>> support, so I have 5 partitions: bootloader (/dev/mtd0), bootloader
>> parameters (/dev/mtd1), kernel image (/dev/mtd2), ROMFS SDRAM image
>> (/dev/mtd5), primary file system, which is romfs (/dev/mtd3) and I
>> want the second to be jffs2 (/dev/mtd4):
>
> Sorry, I didn't get it what's the question/problem. The output you
> provided looks OK. If you don't want all this output - just disable
> JFFS2 debugging. Or you deliberately enabled it?
Yes, I enabled it because the first time I tried to mount jffs2 it just
 stoped without any message. I hopped that I will get some warning or
 something but it just stops each time at the same point and all those
 messages didn't help me a lot. As I understood, there are several threads
 running, so using my TEST outputs I found 3 functions where it stops but, I
 would say, with no reason. So I expect that something else is the problem,
maybe something I haven't enabled?


> BTW, your original message included HTML and was not rejected by a
> mistake. Please, don't send HTML messages.
 Sorry, it was my first time, now I think I know what was the mistaque.

> Regards,
> Artem.

 Thanks!
Iva
