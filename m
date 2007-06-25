Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2iBB-0008Ls-Ew
	for linux-mtd@lists.infradead.org; Mon, 25 Jun 2007 02:36:06 -0400
Received: by ug-out-1314.google.com with SMTP id t39so1213882ugd
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Jun 2007 23:36:03 -0700 (PDT)
Message-ID: <4dde4acb0706242336v5569a147l6a38bb146d417187@mail.gmail.com>
Date: Mon, 25 Jun 2007 12:06:02 +0530
From: "Midhun Agnihotram" <agnimidhun@gmail.com>
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: /proc/mtd file does not show partitions
In-Reply-To: <467A3861.2050801@cetrtapot.si>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4dde4acb0706192320n7ca4157q1219adfb68e50ce1@mail.gmail.com>
	<46791199.7020402@cetrtapot.si>
	<4dde4acb0706202201y7369cc33kc438f15f7091c18c@mail.gmail.com>
	<467A3861.2050801@cetrtapot.si>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Maybe
> http://www.infradead.org/pipermail/linux-mtd/2003-October/008643.html
> will help.

   I have tried as per your suggestion. One of the errors is gone now
(Empty flash at 0x0000fffc ends at 0x00010000..etc). But the second
error still exists (Erase at 0x003e0000 failed immediately: -EROFS. Is
the sector locked?.. etc..).

  I am using the mtd-utils of Redhat. When I say

# ./mkfs.jffs2  -l -o rootfs-jffs2.img -r rootfs  -e 0x20000 -p 0x400000

   The rootfs image created is of 1MB, even though the pad option has
been enabled to create an image size of 4MB.

   When I create a directory on the target, it says as follows:

# mkdir midhun
mkdir: cannot create directory 'midhun': No space left on device


   It seems like the pad option is not working or I made mistake in
the syntax (It did not give any error though). I am not able to write
as the file system is full.

   Is it so ?? Or is it some other problem??

Midhun.
