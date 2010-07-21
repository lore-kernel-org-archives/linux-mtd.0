Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObW6Z-0006gT-6m
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 10:00:47 +0000
Subject: Re: [PATCH v2 2/6] mtd-utils/nanddump.c: Robust pretty hexdump
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1279560796-6388-1-git-send-email-norris@broadcom.com>
References: <1279437819.16247.19.camel@localhost.localdomain>
	<1279560796-6388-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 12:54:06 +0300
Message-ID: <1279706046.2306.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-19 at 10:33 -0700, Brian Norris wrote:
> These should be what you were looking for.
> 
> Adapted code from the linux kernel hex_dump_to_buffer() (lib/hexdump.c)
> to provide a more robust hexdump for the pretty option. Now, nanddump
> can print out any size of OOB (or page for that matter...) without
> having to worry about non-multiples of 16.
> 
> This also provides ability to dump ASCII format next to the hex output
> once additional command-line flags are added.
> 
> Tested with Samsung K9GAG08U0D
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

Pushed all 3 to mtd-utils, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
