Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4nRF-00065S-F7
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 01:41:49 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1212398wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Jun 2008 18:41:48 -0700 (PDT)
Message-ID: <bae050c10806061841j27dab8cp48ac7b75dadf7cd1@mail.gmail.com>
Date: Sat, 7 Jun 2008 09:41:47 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Alaor Koppe" <alakoppe@gmail.com>
Subject: Re: NAND and vfat
In-Reply-To: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/7/08, Alaor Koppe <alakoppe@gmail.com> wrote:
> I have mounted my jfss2 on NAND Flash and created my file.img (with
> fat12 filesystem) and when I try to mount I get:
>
> # mount -t msdos file.img fat -o loop,ro
> FAT: bogus number of reserved sectors
> VFS: Can't find a valid FAT filesystem on dev loop0.
> mount: Mounting /mnt/file.img on /mnt/fat failed: Invalid argument

How you create the file.img?
I can use
#mount -t vfat -o loop file.img /mnt    on top of JFFS2, but cannot on
top of UBIFS

-- 
Best wishes,
Nancy
