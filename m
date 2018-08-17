Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqYiv-0005gh-TV
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 06:59:07 +0000
Received: by mail-qk0-x244.google.com with SMTP id p15-v6so3828811qke.11
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2018 23:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
In-Reply-To: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Aug 2018 16:28:42 +0930
Message-ID: <CACPK8XfSDwVCJPCcTmNxi16LkR5RPHT8uOBxPGgcyE-PvTLcXg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 1/2] mtd: spi-nor: fix options for
 mx66l51235f
To: a.soldatov@yadro.com
Cc: linux-mtd@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Aug 2018 at 00:30, Alexander Soldatov <a.soldatov@yadro.com> wrote:
>
> Currently in driver spi-nor there is a line for mx66l51235l.
> According to Macronix site there is no such part number.
> The chip detected as such is actually mx66l51235f.
>
> According to the datasheet for mx66l51235f,
> "The device default is in 24-bit address mode" (section 9-10).
> Hence we removed SPI_NOR_4B_OPCODES option with this commit.
>
> Cc: stable@vger.kernel.org
> Fixes: d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>

Tested-by: Joel Stanley <joel@jms.id.au>

Thanks for fixing this Alexander.

Cheers,

Joel
