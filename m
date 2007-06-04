Received: from mailer.gwdg.de ([134.76.10.26])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hv8wW-0000KB-57
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 05:33:45 -0400
Date: Mon, 4 Jun 2007 10:17:47 +0200 (MEST)
From: Jan Engelhardt <jengelh@linux01.gwdg.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 05/18] fs/logfs/logfs.h
In-Reply-To: <200706032350.57556.arnd@arndb.de>
Message-ID: <Pine.LNX.4.61.0706041017270.20829@yvahk01.tjqt.qr>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184303.GF8952@lazybastard.org>
	<200706032350.57556.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	=?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
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


>On Sunday 03 June 2007, Jörn Engel wrote:
>> +/**
>> + * struct logfs_device_ops - device access operations
>> + *
>> + * @read:                      read from the device
>> + * @write:                     write to the device
>> + * @erase:                     erase part of the device
>> + */
>> +struct logfs_device_ops {
>> +       int (*read)(struct super_block *sb, loff_t ofs, size_t len, void *buf);
>> +       int (*write)(struct super_block *sb, loff_t ofs, size_t len, void *buf);
>> +       int (*erase)(struct super_block *sb, loff_t ofs, size_t len);
>> +};
>
>I wonder if there is a way to document the prototypes of these function
>pointers with kerneldoc, other than having a typedef for each.
>
>What brought me to this point is that I first assumed they would return
>the number of bytes transferred, like read/write file operations, where
>your functions return zero on success.

read/write functions returning bytes written would return ssize_t,
just as vfs_read and vfs_write do.



	Jan
-- 
