Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZfXE-0005GI-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:32:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F16pVyLridnGiAw8HQE00022566@hotmail.com> 
References: <F16pVyLridnGiAw8HQE00022566@hotmail.com> 
To: "invictus rm" <invictus_rm@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 on MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:32:06 +0100
Message-ID: <14793.1028068326@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

invictus_rm@hotmail.com said:
>  I am not copying the jffs2 image on to the /dev/mtd3 before mouting
> but  rather copying the files after mounting ( i mean putting the
> required files  after i have mounted the /dev/mtdblock3)

> The reason why i am doing this is becoz i do not need the directory
> structure of a regular filesystem.

Well, mkfs.jffs2 can happily make an image of a file system with no 
subdirectories too.

> Does this make any difference in terms of flash usage as compared to
> the  case where i would have copied the jffs2.img to mtd3 and then
> mounted it . 

Basically, no. The image created by mkfs.jffs2 will be _slightly_ smaller 
to start with, because it's not created incrementally. The difference 
should be negligible though, and will go away when the flash gets 
garbage-collected anyway.

--
dwmw2
