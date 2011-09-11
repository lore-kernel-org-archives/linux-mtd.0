Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2icX-0005Za-G8
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 11:54:46 +0000
Received: by pzk4 with SMTP id 4so6553543pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 04:54:43 -0700 (PDT)
Subject: Re: [PATCH 04/12] mtd: move mtd_oob_mode_t to shared kernel/user space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 14:57:09 +0300
In-Reply-To: <1314755147-17756-5-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
	<1314755147-17756-5-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315742234.18731.32.camel@sauron>
Mime-Version: 1.0
Cc: b35362@freescale.com, Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-30 at 18:45 -0700, Brian Norris wrote:
> -	mtd_oob_mode_t mode = ops->mode;
> +	uint8_t mode = ops->mode;

...
>  struct mtd_oob_ops {
> -	mtd_oob_mode_t	mode;
> +	uint8_t		mode;
>  	size_t		len;
>  	size_t		retlen;
>  	size_t		ooblen;

It is good to use __u8 in ioctls for this field.

But for internal usage there is no need to make it uint8_t, just use
'int' instead. All modern CPUs will anyway reserve 32 bits for this.

And unnecessary usage of the 8-bits restriction only imposes more
unnecessary limitations to the compiler/CPU. Using 'int' is instead
making CPU/compiler use the native integer type.

BTW, you may also re-arrange this data structure and make it 8-bytes
smaller on 64-bit architectures. Indeed, it has 'size_t' and 'uint8_t *'
fields, which are 64-bits, and it has one 'uint32_t        ooboffs;',
which is 32-bits and is also padded. If you put 'int mode' and 'uint32_t
ooboffs' together, you'll save 2 paddings. But this is optional.


-- 
Best Regards,
Artem Bityutskiy
