Received: from [195.23.16.24] (helo=bipbip.grupopie.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hvthg-00031t-EB
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 12:29:29 +0100
Message-ID: <46669A89.3010500@grupopie.com>
Date: Wed, 06 Jun 2007 12:29:13 +0100
From: Paulo Marques <pmarques@grupopie.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [Patch 05/18] fs/logfs/logfs.h
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184303.GF8952@lazybastard.org>
In-Reply-To: <20070603184303.GF8952@lazybastard.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> --- /dev/null	2007-03-13 19:15:28.862769062 +0100
> +++ linux-2.6.21logfs/fs/logfs/logfs.h	2007-06-03 19:34:07.000000000 +0200
> @@ -0,0 +1,398 @@
> +/*
> + * fs/logfs/logfs.h
> + *
> + * As should be obvious for Linux kernel code, license is GPLv2
> + *
> + * Copyright (c) 2005-2007 Joern Engel
> + *
> + * Private header for logfs.
> + */
> +#ifndef fs_logfs_logfs_h
> +#define fs_logfs_logfs_h
> +
> +#define __CHECK_ENDIAN__
> +
> +
> +#include <linux/crc32.h>
> +#include <linux/fs.h>
> +#include <linux/kallsyms.h>

Including kallsyms.h is not really needed in this header file, is it?

I don't have time / knowledge to review the rest of the code, but I 
always keep an eye out for kallsyms usage...

-- 
Paulo Marques - www.grupopie.com

"Very funny Scotty. Now beam up my clothes."
