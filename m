Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIKSU-00069H-Lz
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 02:21:34 -0400
Message-ID: <43324D42.5060407@yandex.ru>
Date: Thu, 22 Sep 2005 10:20:50 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Andrew Lunn <andrew@lunn.ch>
References: <20050921211326.GK8421@lunn.ch>
In-Reply-To: <20050921211326.GK8421@lunn.ch>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Another compiler error: sumtool.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Lunn wrote:
> Hi Folks
> 
> Thanks to Artem's fix i can now compile jffs2 without write buffer
> support. However the sumtool does not compile.....
> 
> lunn@londo:~/pkgs/mtd/mtd/util$ make
> gcc -I../include -O2 -Wall -g -c -o sumtool.o sumtool.c -g -Wp,-MD,.sumtool.c.dep
> sumtool.c:66: error: static declaration of 'target_endian' follows non-static declaration../include/mtd/jffs2-user.h:22: error: previous declaration of 'target_endian' was here
> make: *** [sumtool.o] Error 1

Hmm, I did not enable EBS and did not test how it works. If you have 
small NOR flash, don't use EBS. EBS may make things worse on small NORs 
- both because of wasting space and because NOR+EBS looks like NAND for 
JFFS2 (jffs2_can_mark_obsolete() is 0 at os-linux.h), which leads to 
greater CPU load on mount (much more nodes to check). I believe Ferenc 
should write about this in a Readme file or in the EBS config help.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
