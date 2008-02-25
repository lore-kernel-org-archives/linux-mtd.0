Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTYAw-0002rc-8U
	for linux-mtd@lists.infradead.org; Mon, 25 Feb 2008 07:55:03 +0000
Received: by fg-out-1718.google.com with SMTP id 22so1105263fge.26
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Feb 2008 23:55:00 -0800 (PST)
Message-ID: <fe810cf0802242348w625a7e7bj1a5476d6c79662@mail.gmail.com>
Date: Mon, 25 Feb 2008 10:48:10 +0300
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "Pavel Machek" <pavel@ucw.cz>
Subject: Re: jffs2: -ENOSPC when truncating file?!
In-Reply-To: <20080223235742.GE2202@elf.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080223235742.GE2202@elf.ucw.cz>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 24, 2008 at 2:57 AM, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>  I'm trying to free space by truncating big file, and I get:
>
>  root@fic-gta01:~# ls -al gps.nmea
>  -rw-r--r--    1 root     root      2332070 Feb 19 22:13 gps.nmea
>  root@fic-gta01:~# > gps.nmea
>  -sh: cannot create gps.nmea: No space left on device
>  root@fic-gta01:~# rm gps.nmea
>  root@fic-gta01:~# > gps.nmea
>  root@fic-gta01:~#
>
>  :-(
>
>  Kernel is not-so-ancient, on openmoko:

Hi!

JFFS2 has known bug in GC leading to -ENOSPC upon file removal. Time
ago I've sent a patch with detailed explanations of what is going on.
Probably your case is the same.

Here is the patch
http://lists.infradead.org/pipermail/linux-mtd/2007-December/020091.html
(though infradead mailing list archive is missing most of messages
from this thread)

And here are some details
http://lists.infradead.org/pipermail/linux-mtd/2007-June/018756.html

Alexander
