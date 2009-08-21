Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MeME8-0003W7-OX
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 04:59:53 +0000
Message-ID: <4A8E29A4.4010005@gmail.com>
Date: Fri, 21 Aug 2009 07:59:16 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Aras Vaichas <arasv@magellan-technology.com>
Subject: Re: ubifs mount problem: UBIFS error (pid 1152): validate_sb: bad
	superblock, error 8
References: <ed62800908192059g57e85893ga352793e52c43a65@mail.gmail.com>
In-Reply-To: <ed62800908192059g57e85893ga352793e52c43a65@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2009 06:59 AM, Aras Vaichas wrote:
> Hi,
>
> I've got UBI + UBIFS running as my root partition with 2.6.30, and I'm
> using mtd-utils from git downloaded just last week.
>
> I'm building my UBI image as per the instructions at:
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs
>
> I have successfully created UBI images, formatted, attached and
> mounted them. I'm not an expert, but I'm familiar with the procedure
> now.
>
> For some reason, I am now having problems mounting a known working
> image. The image contains 1 file with a "hello world" text string in
> it. I used to be able to mount it to my 8MB spare partition, but now
> it fails with:
>
> /root # mount -t ubifs ubi1:spareubi /mnt
> UBIFS error (pid 791): validate_sb: bad superblock, error 8
> mount: mounting ubi1:spareubi on /mnt failed: Invalid argument
>
> The strange thing is that I can format, attach and mount this *same*
> image to my other spare partition. It's like the NAND in this
> partition has some problem.

Just create 2 images - one for your 250MiB volume, the other one
for your 8MiB volume. There are several UBIFS parameters which
depend on the volume size, e.g., you may read this:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
