Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvQBS-0001YZ-Mp
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 08:48:39 +0000
Received: by ywp17 with SMTP id 17so4139392ywp.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 01:48:35 -0700 (PDT)
Subject: Re: [RFC 4/5] mtd: move mtd_oob_mode_t to shared kernel/user space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 22 Aug 2011 11:50:22 +0300
In-Reply-To: <1313625029-19546-5-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-5-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314003028.2644.80.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> +/*
> + * oob operation modes
> + *
> + * MTD_OOB_PLACE:       oob data are placed at the given offset
> + * MTD_OOB_AUTO:        oob data are automatically placed at the free areas
> + *                      which are defined by the ecclayout
> + * MTD_OOB_RAW:         mode to read oob and data without doing ECC checking
> + */
> +typedef enum {
> +	MTD_OOB_PLACE,
> +	MTD_OOB_AUTO,
> +	MTD_OOB_RAW,
> +} mtd_oob_mode_t;

Could we get rid of this typedef and use anonymous enum instead:

enum {
	A,
	B,
};

Indeed, we do not need it, and we do not want to pollute the user-space
namespaces unnecessarily.

-- 
Best Regards,
Artem Bityutskiy
