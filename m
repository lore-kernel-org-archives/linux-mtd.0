Received: from nf-out-0910.google.com ([64.233.182.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H4xPk-0004DR-E0
	for linux-mtd@lists.infradead.org; Thu, 11 Jan 2007 05:44:10 -0500
Received: by nf-out-0910.google.com with SMTP id i2so842684nfe
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Jan 2007 02:44:01 -0800 (PST)
Message-ID: <37d33d830701110244m58afec33hcf77323e4dc550f3@mail.gmail.com>
Date: Thu, 11 Jan 2007 10:44:01 +0000
From: "Sandeep Kumar" <sandeepksinha@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: max_ec value is shown as 1
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I was recently trying to create a volume on a UBI device and i could
not understand the following.

[root@localhost ubi]# cat /proc/mtd

dev:    size   erasesize  name
mtd0: 02000000 00020000 "mtdram test device"
mtd1: 04000000 00004000 "NAND simulator partition"

[root@localhost 0]# modprobe ubi mtd=0
[root@localhost ubi]# ls /sys/class/ubi
ubi0  version

[root@localhost ubi]#ubimkvol 0 1024 2MB dynamic vol0 ubi0


[root@localhost ubi]#cd /sys/class/ubi/ubi0/
[root@localhost ubi0]# cat max_ec
1

Well, Can anyone help me in determining that why the max_ec is shown as 1.

-- 
Regards,
Sandeep





 	
If the facts don't fit the theory, change the facts.
