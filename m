Received: from lana.hrz.tu-chemnitz.de ([134.109.132.3])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXheh-00047i-Kv
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 18:50:56 +0000
Message-ID: <47D18E8C.5010307@informatik.tu-chemnitz.de>
Date: Fri, 07 Mar 2008 19:50:52 +0100
From: Markus Franke <Markus.Franke@informatik.tu-chemnitz.de>
MIME-Version: 1.0
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: Creating an Empty JFFS2 File System
References: <C3F6C181.DD74%gerickson@nuovations.com>
In-Reply-To: <C3F6C181.DD74%gerickson@nuovations.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Markus.Franke@informatik.tu-chemnitz.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Grant Erickson schrieb:
> Is creating an empty JFFS2 file system supported or is this a deprecated
> capability? The following steps seem to be incorrect or failing:
> 
>     # flash_eraseall -q -j /dev/mtd9
>     # mount -t jffs2 /dev/mtdblock9 /mnt

Does this work with NOR Flash as well?

Best regards,
Markus
