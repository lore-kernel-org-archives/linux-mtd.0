Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2X8l-0003cV-KP
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2004 11:35:20 -0400
Message-ID: <4135EC08.7010304@setabox.com>
Date: Wed, 01 Sep 2004 23:34:32 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: Kuefmann Andreas ICM CP RD SD 1 <andreas.kuefmann@siemens.com>
References: <7F3FE9B2FBF6194691BC493C6699C0B1568B8D@mchh9esa.mchh.siemens.de>
In-Reply-To: <7F3FE9B2FBF6194691BC493C6699C0B1568B8D@mchh9esa.mchh.siemens.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: how to change size of MTD partitions at runtime
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Kuefmann Andreas ICM CP RD SD 1 wrote:

>Hi all,
>
>I'm searching for a solution to dynamically change the size of
>MTD partitions at runtime.
>
>This functionality is required for a flash update of kernel and/or
>rootfs in the special case that the new kernel/rootfs is larger
>than the old one. (in an embedded environment)
>
>1.)
>there is no problem in erasing the flash, e.g eraseall /dev/mtd?,
>(acting from a chrooted environment)
>
>2.)
>However, reprogramming the flash with a larger image (now
>exceeding the limits of the previous partition) isn't as
>easy as a cp newimage.img /dev/mtd?.
>
>The MTD layer will still rely on the (old) partition sizes
>that were valid during system startup. (taken over from a
>U-BOOT environment)
>  
>
I'm using the proc filesytem to dynamically change the mtd partition 
sizes on my flash at runtime. I added a function to mtdcore.c that looks 
like this:
static int mtd_write_proc (struct file *filp, const char *buf, unsigned 
long count, void *data) 
{
    int value;
    struct mtd_info *this;
    unsigned long pos = (unsigned long)(filp->f_pos);
   
    down(&mtd_table_mutex);

    while (pos < count) {
       /* Get the partition number. */
       if (pos == 0) {
          value = antoi(buf, pos, count);
          this = mtd_table[value];
       }
       /* Change size of the partition (in Mb). */
       if (pos == 2) {
          value = antoi(buf, pos, count);
          this->size = value*1024*1024;
       }  
       pos++;
    }
    up(&mtd_table_mutex);
    return count;
}
The partition table values can be changed by writing the partition 
number and size (in megabytes) to /proc/mtd: echo 1 3 > /proc/mtd ||
||I'm not sure if this is the best way to dynamically change the 
partition sizes at runtime, nor is it very safe.

>My question now is:
>- How can I manage to force a re-read of the partition table?
>
>
>  
>
Where do you keep your partition table? I'm using a cramfs filesystem 
and LinuxBIOS on nand flash. I reserve the first block of the flash to 
store a partition table, bad block list, and other information. I have a 
set of user space utilites for reading and writing the partition table.

--
William J Beksi

>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
