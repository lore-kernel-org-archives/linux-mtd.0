Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpUQr-00061s-3n
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 12:04:05 -0400
Message-ID: <41066966.8070107@yandex.ru>
Date: Tue, 27 Jul 2004 18:40:38 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <410653C0.3070609@yandex.ru>
	<1090934568.20889.162.camel@thomas.tec.linutronix.de>
In-Reply-To: <1090934568.20889.162.camel@thomas.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: bugreport
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thomas Gleixner wrote:
> On Tue, 2004-07-27 at 15:08, Artem B. Bityuckiy wrote:
> 
>>Hello.
>>
>>There is a bug in jffs2 module registration function - super.c line 293:
>>the init_jffs2_fs function doesn't properly perform
>>the de-initialization in case of failures on lines 315 and 321.
>>The jffs2_inode_cachep is also not feed.
>>
>>I Tried to send a patch bit mailman soesn't gieve me...  
> 
> 
> I think you meant that one, right ?
> 
> Thanks, fixed in CVS
> 
> tglx
> 
> 
> @@ -330,6 +330,7 @@
>   out_compressors:
>         jffs2_compressors_exit();
>   out:
> +       kmem_cache_destroy(jffs2_inode_cachep);
>         return ret;
>  }
> 
Not only. The "go out" in case of jffs2_compressors_init() failure 
doesn't free /proc resources...

I tried to send the following patch as the attached file (now I'll try
to just insert the text):


-- super.c	2004-07-18 18:44:42.000000000 +0400
+++ /home/dedekind/tmp/super_fixed.c	2004-07-26 15:05:34.000000000 +0400
@@ -318,7 +318,7 @@
  	ret =
  	if (ret) {
  		printk(KERN_ERR "JFFS2 error: Failed to initialise compressors\n");
-		goto out;
+		goto out_proc;
  	}
  	ret = jffs2_create_slab_caches();
  	if (ret) {
@@ -336,10 +336,12 @@
  	jffs2_destroy_slab_caches();
   out_compressors:
  	jffs2_compressors_exit();
+ out_proc:
  #ifdef CONFIG_JFFS2_PROC
          jffs2_proc_exit();
  #endif
   out:
+        kmem_cache_destroy(jffs2_inode_cachep);
  	return ret;
  }


Note - the patch is just to show the problem and doesn't pretent to be 
applied as is.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
