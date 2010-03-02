Received: from www.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NmHtC-0002i7-Nw
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2010 02:31:19 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: Disadvantage of using yaffs checkpointing ?
Date: Tue, 2 Mar 2010 15:31:02 +1300
References: <cf70f0211003011801r33027ec8s78c9326f9d058c46@mail.gmail.com>
In-Reply-To: <cf70f0211003011801r33027ec8s78c9326f9d058c46@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201003021531.02989.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 02 March 2010 15:01:08 Shivdas Gujare wrote:
> Hi All,
>
> I am very new to mtd & yaffs and working on boottime optimization and
> found that yaffs checkpointing helps to mount
> yaffs2 very quickly. I tried it, and was able to save almost 4sec for
> 128MB partitioned nand.
>
> Since everything looks very good If I use yaffs checkpointing feature
> but have a doubt, are there any disadvantage of using check-pointing
> by default in final product?
>
> I understood that, check-pointing only disables boot time nand block
> scanning & marking it bad if found,
> and takes "system snapshot" while using "umount /dev/mtdblockN" which
> it use in next boot.
> So, If I decided to use "checkpointing" with "umount" while powering
> off the device in final product,
> are there going to be any problems I will face avoiding block scanning?
>
> Thanks lot for any help.
>

You would do better asking yaffs questions on the yaffs list.

http://www.aleph1.co.uk/mailman/listinfo/yaffs

-- Charles
