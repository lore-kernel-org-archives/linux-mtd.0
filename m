Received: from mail-px0-f196.google.com ([209.85.216.196])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MK4nD-00076A-Da
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 06:20:30 +0000
Received: by pxi34 with SMTP id 34so1930792pxi.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Jun 2009 23:20:09 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Jun 2009 13:20:09 +0700
Message-ID: <a1fb7300906252320k655298dcg33f56ca702736ac@mail.gmail.com>
Subject: jffs2 on ubi volume
From: Thang Dao Duy <hanbaoquansexy@gmail.com>
To: manoj23@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

manoj23@gmail.com wrote:

>Answering my own question, I got it to work by creating a /dev/ubi0_1
>device file and then using ubiupdatevol.

>>./ubimkvol /dev/ubi0 -s25MiB -Nubivol1 -n1
>> mknod /dev/ubi0_1 c 253 2
>> ./ubiupdatevol /dev/ubi0_1 sum.jffs2.rootfs
>> mkdir /tmp/flash


Command ubimkvol will create a device /dev/ubi0_1, so "mknod
/dev/ubi0_1 c 253 2" may be unnecessary.

manoj23@gmail.com wrote:

>> mount -t jffs2 /dev/mtdb-nvdata /tmp/flash

jffs2 file system does not work on UBI API, it works on MTD API. so we
cannot mount jffs2 on ubi volume. We can use ubifs on ubi volume:

mount -t ubifs ubi0_1 /mnt/
