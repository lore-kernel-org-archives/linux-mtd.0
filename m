Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaO8q-0004I2-0O
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 07:18:28 +0000
Received: by fxm3 with SMTP id 3so1931768fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 00:18:27 -0700 (PDT)
Subject: Re: [PATCH 2/6] mtd-utils/nanddump.c: Robust pretty hexdump
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1278622209-20149-3-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
	<1278622209-20149-3-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 10:18:24 +0300
Message-Id: <1279437504.16247.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-08 at 13:50 -0700, Brian Norris wrote:
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

Could you please make this function completely independent? Later, if
needed, it should be possible to make it a library function and make
other mtd utils use it as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
