Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdo5f-0007QF-7u
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 08:47:02 -0400
Message-ID: <4461E09C.9070304@yandex.ru>
Date: Wed, 10 May 2006 16:46:20 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Aleksandr Konstantinov <aleksandr.konstantinov@fys.uio.no>
References: <018301c6742d$c17ad200$0100a8c0@AAAA>
In-Reply-To: <018301c6742d$c17ad200$0100a8c0@AAAA>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Hanging rm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Aleksandr Konstantinov wrote:
>  Hello,
> 
> I have AT91RM9200 CPU on custom board with JFFS2 root filesystem and 
> kernel 2.6.12.3 with JFFS debugging enabled.
> If I try to remove file 'rm' hangs with 0 CPU usage. There are no 
> messages from JFFS2 printed.
> If I press Ctrl-C message below is printed. Could You please help me?
I think I saw the error, upgrading JFFS2 has to help.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
