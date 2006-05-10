Received: from pat.uio.no ([129.240.10.6])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FdoHS-0007ks-VE
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 08:59:17 -0400
Received: from mail-mx6.uio.no ([129.240.10.47])
	by pat.uio.no with esmtp (Exim 4.43) id 1FdoHQ-0001Q2-Fs
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 14:59:04 +0200
Received: from grid.uio.no ([129.240.86.18] helo=AAAA)
	by mail-mx6.uio.no with smtp (Exim 4.43) id 1FdoHN-0001Q3-IT
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 14:59:01 +0200
Message-ID: <019301c67431$86902150$0100a8c0@AAAA>
From: "Aleksandr Konstantinov" <aleksandr.konstantinov@fys.uio.no>
To: <linux-mtd@lists.infradead.org>
References: <018301c6742d$c17ad200$0100a8c0@AAAA> <4461E09C.9070304@yandex.ru>
Date: Wed, 10 May 2006 15:59:08 +0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Subject: Re: Hanging rm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for answer. But it looks like the problem probalby was in a way I 
compiled kernel. After recompiling everything works. Sorry.

But I have a related question. Is it possible to upgrade JFFS2 driver 
without upgrading kernel?

A.K.



----- Original Message ----- 
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
To: "Aleksandr Konstantinov" <aleksandr.konstantinov@fys.uio.no>
Cc: <linux-mtd@lists.infradead.org>
Sent: Wednesday, May 10, 2006 3:46 PM
Subject: Re: Hanging rm


> Aleksandr Konstantinov wrote:
>>  Hello,
>>
>> I have AT91RM9200 CPU on custom board with JFFS2 root filesystem and 
>> kernel 2.6.12.3 with JFFS debugging enabled.
>> If I try to remove file 'rm' hangs with 0 CPU usage. There are no 
>> messages from JFFS2 printed.
>> If I press Ctrl-C message below is printed. Could You please help me?
> I think I saw the error, upgrading JFFS2 has to help.
>
> -- 
> Best Regards,
> Artem B. Bityutskiy,
> St.-Petersburg, Russia. 
