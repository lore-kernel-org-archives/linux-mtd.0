Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSw4H-0005dh-B2
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2004 06:27:49 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id CEC1D22967
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2004 14:26:59 +0300 (MSK)
Message-ID: <4195EF83.8050104@yandex.ru>
Date: Sat, 13 Nov 2004 14:26:59 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 prints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I wonder, is there some reasons why JFFS2 doesn't use some macros to 
output information? My be in order to be eCos-compatable? Or may be it 
is just dirty work and nobody has time to do it?

I mean, why do not we introduce macros like:

/* JFFS2 message */
#define JFFS2MSG(fmt, args...) \
     printk(KERN_NOTICE fmt, args);

/* JFFS2 debug message */
#define JFFS2DMSG(level, fmt, args...) \
     do { \
         if (level <= JFFS2_DEBUG_LEVEL) \
             printk(KERN_DEBUG "(%d) %s(): " fmt, level, __FUNCTION__, 
args); \
     }while(0)

/* JFFS2 warning message */
#define JFFS2EMSG(fmt, args...) \
     do { \
         printk(KERN_ERR "JFFS2 Warning! %s(): " fmt, __FUNCTION__, args); \
     } while(0)

/* JFFS2 error message */
#define JFFS2EMSG(fmt, args...) \
     do { \
         printk(KERN_ERR "JFFS2 Error! %s(): " fmt, __FUNCTION__, args); \
     } while(0)

It is not very readable to use output like this:
D1(printk(KERN_DEBUG "bababa"));

But the main thing why I think it would be nice to introduce macros like 
these is that the messages will be a bit standard. I mean that all 
errors will have the same prefix. It is useful when you develop JFFS2 
with debugging output on. In this case you will just s/JFFS2 Error and 
see all the error messages. But currently, it is hard to find all the 
error messages in JFFS2 because some of them use prefix "Error", some 
just contain the word "failed", etc.

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
