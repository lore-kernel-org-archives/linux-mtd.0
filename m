Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EkkSl-00024G-3T
	for linux-mtd@lists.infradead.org; Fri, 09 Dec 2005 10:47:17 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id CEA764733B
	for <linux-mtd@lists.infradead.org>;
	Fri,  9 Dec 2005 18:46:29 +0300 (MSK)
Message-ID: <4399A6D5.9050304@yandex.ru>
Date: Fri, 09 Dec 2005 18:46:29 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [PATCH] MTD + 2.6.13/2.6.14 OOPS in class_device_create() fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Current MTD CVS head oopses in class_device_create().

This are because there is 2 calls in mtdchar.c which look like this:

class_device_create(mtd_class, NULL, MKDEV(MTD_CHAR_MAJOR, 
mtd->index*2), NULL, "mtd%d", mtd->index);

This is perfectly fine with 2.6.15-rc5, where class_device_create() has 
the following prototype:

struct class_device *class_device_create(struct class *cls, struct 
class_device *parent, dev_t devt, struct device *device, char *fmt, ...)

But it causes oops in 2.6.14.3, where class_device_create() has the 
following (different) prototype:

struct class_device *class_device_create(struct class *cls, dev_t devt, 
struct device *device, char *fmt, ...)

I.e., one more argument 'parent' was introduced in 2.6.15-rc5. And since 
the function accepts any number of arguments, it compiles well, but 
doesn't work.

Usually problems like this are solved by means of 
include/linux/mtd/compatmac.h, but in this case I have no idea how to 
solve this gracefully there.

As 2.6.15 is not yet out and 2.6.14 is still used, I offer the attached 
hotfix for now.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
