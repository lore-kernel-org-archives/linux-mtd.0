Received: from [195.205.16.233] (helo=dgt-lab.com.pl)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eXp8-0002Nq-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 09:14:14 +0100
Message-ID: <3B95E021.39CD7C6D@dgt-lab.com.pl>
Date: Wed, 05 Sep 2001 10:19:45 +0200
From: Wojciech Kromer <krom@dgt-lab.com.pl>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:(
References: <3B9377A9.B69881E4@dgt-lab.com.pl>  <3B937537.D636406C@dgt-lab.com.pl> <3B8CB316.4A421C81@dgt-lab.com.pl> <999074214.32409.1.camel@russ> <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ> <3B8C86BD.5C4FBCF9@dgt-lab.com.pl> <999069428.31681.12.camel@russ> <3B8C9DC5.F3185B18@dgt-lab.com.pl> <21505.999075348@redhat.com> <25302.999077097@redhat.com> <3238.999519992@redhat.com> <4189.999520431@redhat.com> <3B937AC5.1B60C506@dgt-lab.com.pl>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> But mount time is still the same
>
> sh-2.03# time mount /dev/mtdblock0 /mnt -t jffs2
> real    1m55.648s
> user    0m0.000s
> sys     1m55.630s
>

Do You know any other file-system which give me:
-I can use it as root-fs
-fast reading from flash
-compresion
-writing could be slow

--
* * * * * * * * * * * *
* per pedes ad astra! *
* * * * * * * * * * * *    mailto:krom@dgt-lab.com.pl
