Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7Qkw-0005b2-QL
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2011 11:18:39 +0000
Received: by wyb28 with SMTP id 28so1439805wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Apr 2011 04:18:37 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: onenand: add ecclayout and subpage_sft for
	none-flex 4kb page onenand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1302087977-25062-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1302087977-25062-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Apr 2011 14:15:55 +0300
Message-ID: <1302088555.2742.49.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-06 at 14:06 +0300, Roman Tereshonkov wrote:
> So as the ecclayout and suppage size for 4kb page
> Flex- and none-Flex OneNAND are different
> the new values for none-Flex 4kb page OneNAND memory are added.
> 
> The introduced ecclayout and suppage size are based on specification
> 4Gb M-die OneNAND Flash (KFM4G16Q4M, KFN8G16Q4M). Rev. 1.3, Apr. 2010
> 
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
>  drivers/mtd/onenand/onenand_base.c |   41 ++++++++++++++++++++++++++++++-----
>  1 files changed, 35 insertions(+), 6 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
