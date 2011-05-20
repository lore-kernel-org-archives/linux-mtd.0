Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNM34-00056t-Jl
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 09:31:11 +0000
Received: by fxm14 with SMTP id 14so3333009fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 02:31:07 -0700 (PDT)
Subject: Re: [ubifs] "cannot parse device table file 'device_table.txt'"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
In-Reply-To: <9ms9t650c8kmhe1ed5gdb7mv7cqdovcrca@4ax.com>
References: <9ms9t650c8kmhe1ed5gdb7mv7cqdovcrca@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 12:27:17 +0300
Message-ID: <1305883637.2630.123.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 12:49 +0200, Gilles wrote:
> Hello
> 
> I'd like to compile Ubifs in uClinux, but am getting the following
> error:
> ===========
> ...
> /usr/src/uClinux-dist/user/mtd-utils/mkfs.ubifs --squash-uids -m 2048
> -e 204800 -c 1024 -d /usr/src/uClinux-dist/romfs -D device_table.txt
> -o /usr/src/uClinux-dist/images/rootfs.ubifs
> 
> Error: count cannot be zero if increment is non-zero
> Error: cannot parse '/dev/mtdblock0     b       640     0       0 31
> 0       0       1       -'
> Error: cannot parse device table file 'device_table.txt'
> make[5]: *** [image.rootfs.ubifs.force] Error 255
> ===========

It seems like that device table line is indeed incorrect, or what do you
expect mkfs.ubifs to do?


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
