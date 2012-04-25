Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN6TH-0007OU-Ro
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 17:57:45 +0000
Received: by ghbf11 with SMTP id f11so417397ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 10:57:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335362618-4559-10-git-send-email-hechtb@gmail.com>
References: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
 <1335362618-4559-10-git-send-email-hechtb@gmail.com>
Date: Wed, 25 Apr 2012 10:57:40 -0700
Message-ID: <CAN8TOE9fnQJb6ivwg997cE93g+PcxvvgZzGHsm2Ua6o_ZzH=HQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] mtd: sh_flctl: Use user oob data in hardware ECC
 mode
From: Brian Norris <computersforpeace@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 25, 2012 at 7:03 AM, Bastian Hecht <hechtb@googlemail.com> wrote:
> In hardware ecc mode, the flctl now writes and reads the oob data
> provided by the user. Additionally the ECC is now returned in normal
> page reads, not only when using the explicit NAND_CMD_READOOB command.

I don't know about the HW-specific details here, but read/write
data+OOB seems good.

Acked-by: Brian Norris <computersforpeace@gmail.com>

If these patches are accepted, I will try to make sure this driver
switches to conditionally reading/writing OOB in my patch series. Keep
an eye out for them, though.

BTW, from the changes I'm seeing in this patch series, your driver was
previously fairly broken. Or at least, several features of it were...
Good luck with the cleanup!

Brian
