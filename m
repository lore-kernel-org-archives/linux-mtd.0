Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpS0t-0003Cv-0s
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 09:29:06 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <410653C0.3070609@yandex.ru>
References: <410653C0.3070609@yandex.ru>
Content-Type: text/plain
Message-Id: <1090934568.20889.162.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Tue, 27 Jul 2004 15:22:48 +0200
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: bugreport
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-27 at 15:08, Artem B. Bityuckiy wrote:
> Hello.
> 
> There is a bug in jffs2 module registration function - super.c line 293:
> the init_jffs2_fs function doesn't properly perform
> the de-initialization in case of failures on lines 315 and 321.
> The jffs2_inode_cachep is also not feed.
> 
> I Tried to send a patch bit mailman soesn't gieve me...  

I think you meant that one, right ?

Thanks, fixed in CVS

tglx


@@ -330,6 +330,7 @@
  out_compressors:
        jffs2_compressors_exit();
  out:
+       kmem_cache_destroy(jffs2_inode_cachep);
        return ret;
 }
