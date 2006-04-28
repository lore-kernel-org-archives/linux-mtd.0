Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FZLj1-0006Nh-Ke
	for linux-mtd@lists.infradead.org; Fri, 28 Apr 2006 01:41:09 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
In-Reply-To: <e2qvnp$jgi$1@sea.gmane.org>
References: <e2qvnp$jgi$1@sea.gmane.org>
Content-Type: text/plain
Date: Fri, 28 Apr 2006 09:40:34 +0400
Message-Id: <1146202834.4054.1.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: register mtdchar devices in sysfs
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-04-27 at 19:55 +0200, Andre Puschmann wrote:
> hi folks,
> i am trying to get mtdchar devices to work with sysfs + udev.
> my goal is that every mtd-partition gets a device attribute called 
> partname which i can use in my udev-rules to give them explicit names 
> like /dev/filesystem or /dev/kernel (instead of /dev/mtd0 and /dev/mtd1 
> in case that they change their order on the flash device).
> to do so i modified mdrchar.c a little bit to add a attribute "partname" 
> in every specific sysfs-folder.
> well, this is working so far with a dummy entry "partname" but how can i 
> get the specific partition name stored in "struct mtd_info*" out of 
> "struct class_device" to set it correctly in read_partname()???
I wonder, why mtd->name is not suitable?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
