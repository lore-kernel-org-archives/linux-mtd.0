Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dwz86-0002nv-SL
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2005 05:20:16 -0400
Date: Mon, 25 Jul 2005 11:20:12 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050725092012.GC10616@wohnheim.fh-wedel.de>
References: <BAY17-F15C6182BFC9EEA8E5AD337E8CA0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F15C6182BFC9EEA8E5AD337E8CA0@phx.gbl>
Cc: dedekind@yandex.ru, tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 25 July 2005 17:10:22 +0800, zhao forrest wrote:
> +		node = (struct jffs2_unknown_node *)&buf[current_oob + c->fsdata_pos];
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This part of the patch bugs me a little, even though it's not your
fault.  buf should be of type void*, not char* or unsigned char*.
After that conversion, most casts in this function should go away.

Forrest, if you get bored easily, this would be a nice change.

Rest of the patch looks fine, as far as I'm concerned.  Thanks.

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
