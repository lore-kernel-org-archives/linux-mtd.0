Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jcaeo-0002ed-5Y
	for linux-mtd@lists.infradead.org; Fri, 21 Mar 2008 06:23:14 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1333755wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Mar 2008 23:23:12 -0700 (PDT)
Message-ID: <bae050c10803202323h371409dbg59517d86194ebf69@mail.gmail.com>
Date: Fri, 21 Mar 2008 14:23:12 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: UBIFS: Does ubifs have volumes size min limitation?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi,
    The total size of mtd partitions which will be attached by ubi is 50MiB,
    #ubimkvol -d 0 -n 0 -N ubifs -s 47MiB
   # mount -t ubifs ubi0:ubifs /mnt/1
   UBIFS error (pid 807): validate_sb: bad lsave_cnt
   UBIFS error (pid 807): validate_sb: bad superblock
   mount: mounting ubi0:ubifs on /mnt/1 failed: Invalid argument

   It is OK when the volume size is large.
   Does ubifs have volumes size min limitation? why? and what is it exactly?

--
Best wishes,
Nancy
