Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MtG5F-0008JT-H4
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 07:28:18 +0000
Subject: Re: [PATCH/mtd-utils] add a "ubirsvol" tool to resize UBI volume.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnaud Mouiche <arnaud.mouiche@thomson.net>
In-Reply-To: <4AC36DA2.6060304@thomson.net>
References: <4AC36DA2.6060304@thomson.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Oct 2009 10:23:44 +0300
Message-Id: <1254381824.32310.14.camel@localhost>
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

On Wed, 2009-09-30 at 16:39 +0200, Arnaud Mouiche wrote:
> This is nearly a copy/paste from ubirmvol
> 
> Signed-off-by: Arnaud Mouiche <arnaud.mouiche@thomson.net>
> ---
>  ubi-utils/Makefile       |    2 +-
>  ubi-utils/src/ubirsvol.c |  246 
> ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 247 insertions(+), 1 deletions(-)
>  create mode 100644 ubi-utils/src/ubirsvol.c

Could you please re-send without line-wrapping:

Please, refer:
Documentation/SubmittingPatches
Documentation/email-clients.txt

E.g., git send-email will work just fine.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
