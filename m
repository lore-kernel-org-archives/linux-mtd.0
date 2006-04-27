Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FZAmi-0006oF-Ne
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 14:00:17 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1FZAmY-0000Bf-23
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 20:00:02 +0200
Received: from vpn49.rz.tu-ilmenau.de ([141.24.172.49])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2006 20:00:02 +0200
Received: from andre.puschmann by vpn49.rz.tu-ilmenau.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2006 20:00:02 +0200
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Date: Thu, 27 Apr 2006 19:55:41 +0200
Message-ID: <e2qvnp$jgi$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: register mtdchar devices in sysfs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi folks,
i am trying to get mtdchar devices to work with sysfs + udev.
my goal is that every mtd-partition gets a device attribute called 
partname which i can use in my udev-rules to give them explicit names 
like /dev/filesystem or /dev/kernel (instead of /dev/mtd0 and /dev/mtd1 
in case that they change their order on the flash device).
to do so i modified mdrchar.c a little bit to add a attribute "partname" 
in every specific sysfs-folder.
well, this is working so far with a dummy entry "partname" but how can i 
get the specific partition name stored in "struct mtd_info*" out of 
"struct class_device" to set it correctly in read_partname()???

thank you in advance

regards
andré



my code looks like this:
<code>
static ssize_t read_partname( struct class_device *cd, char *buf)
{
	return snprintf(buf, 265, "%s\n", "partname");
}
static CLASS_DEVICE_ATTR( partname, S_IRUGO, read_partname, NULL );

static void mtd_notify_add(struct mtd_info* mtd)
{
	struct class_device *class_dev;

	if (!mtd)
		return;

	class_dev = class_device_create(mtd_class, NULL, 					 
MKDEV(MTD_CHAR_MAJOR, mtd->index*2),
			NULL, "mtd%d", mtd->index);
	if (!class_dev)
		return;

	class_device_create_file(class_dev,&class_device_attr_partname);

	class_device_create(mtd_class, NULL,
			    MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
			    NULL, "mtd%dro", mtd->index);

}
</code>
