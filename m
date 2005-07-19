Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DupoF-0005gg-MM
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 06:58:50 -0400
Message-ID: <42DCDCDA.2090909@cetrtapot.si>
Date: Tue, 19 Jul 2005 12:58:34 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <42DCD1D3.8070303@cetrtapot.si> <42DCD6C1.6010509@yandex.ru>
In-Reply-To: <42DCD6C1.6010509@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Hinko Kocevar wrote:
> 
>> Hi,
>>
>> I'm trying to use latest MTD CVS snapshot to create jffs2 image and 
>> boot my ARM target using that image as rootfs. Booting halts at:
> 
> 
> How did you check that your (probably correct) image was correctly 
> written to the flash? May be there are some driver-level problems ? What 
> kind of flash is that ?
> 

Flash is NOR Intel E28F128J3A150.

I'm booting with NFS enabled kernel and rootfs over NFS, then erasing mtd 
partition that holds rootfs and then copying rootfs.jffs2 to mtd partition like 
this:

$ flash_eraseall /dev/mtd2
$ cp /tmp/rootfs.jffs2 /dev/mtd2

I can mount jffs2 partition afterwards with:
$ mount -t jffs2 /dev/mtdblock2 /mnt/jffs2
$ ls /mnt/jffs2/
bin      etc      linuxrc  proc     staging  usr
dev      lib      mnt      sbin     tmp      var

regards,
hk
-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
