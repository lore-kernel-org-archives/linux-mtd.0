Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hqm8N-0006rN-Oq
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 04:23:56 -0400
Message-ID: <4653FA11.7090403@indefia.com>
Date: Wed, 23 May 2007 11:23:45 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: Jonathan Kotta <jpkotta@gmail.com>
Subject: Re: trouble with mounting ext2/jffs2
References: <47c31da80705221208g11463f3bpdba6bea4fbd9747a@mail.gmail.com>
In-Reply-To: <47c31da80705221208g11463f3bpdba6bea4fbd9747a@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jonathan Kotta wrote:
> # mount -t jffs2 /dev/mtdblock0 /mnt
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 0, bad_blocks 10, c->nr_blocks 2048
> mount: mounting /dev/mtdblock0 on /mnt failed
>   
Can you try to mount /dev/mtdblock0 after doing flash_eraseall /dev/mtd0 
(without -j)
As far as I see jffs2 doesn't like an empty flash with cleanmarkers. But 
it works fine with an all-empty flash. I think cleanmarkers are written 
as data is written.

Another (and maybe better ?) way to go is
* create a jffs2 image with mkfs.jffs2
* erase the flash with -j so that cleanmarkers are written
* and then use nandwrite to write your image to mtd.

Regards,
-- 
Semih Hazar
