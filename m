Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDbAe-0001f7-7s
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 11:06:24 +0000
Received: by pvg7 with SMTP id 7so178925pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Nov 2010 04:06:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1288781721-31771-2-git-send-email-roman.tereshonkov@nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
	<1288781721-31771-2-git-send-email-roman.tereshonkov@nokia.com>
Date: Wed, 3 Nov 2010 20:06:21 +0900
Message-ID: <AANLkTikXCXdHh_pU3QS-QS+o0UWctqqwjxa2U5fDkmkF@mail.gmail.com>
Subject: Re: [PATCHv2 1/3] mtd: onenand: add option and variable for cache
	program feature
From: Kyungmin Park <kyungmin.park@samsung.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Wed, Nov 3, 2010 at 7:55 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> A new option is added for cache program feature. A new variable
> ongoing is introduced for onenand_chip to handle the multi-command
> cache program operation.
>
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
> =A0include/linux/mtd/onenand.h | =A0 12 ++++++++++++
> =A01 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
> index 0c8815b..6da3fe3 100644
> --- a/include/linux/mtd/onenand.h
> +++ b/include/linux/mtd/onenand.h
> @@ -137,6 +137,14 @@ struct onenand_chip {
> =A0 =A0 =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*bbm;
>
> =A0 =A0 =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*priv;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Shows that the current operation is composed
> + =A0 =A0 =A0 =A0* of sequence of commands. For example, cache program.
> + =A0 =A0 =A0 =A0* Such command status OnGo bit is checked at the end of
> + =A0 =A0 =A0 =A0* sequence.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0ongoing;
> =A0};
>
> =A0/*
> @@ -171,6 +179,9 @@ struct onenand_chip {
> =A0#define ONENAND_IS_2PLANE(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0)
> =A0#endif
>
> +#define ONENAND_IS_CACHE_PROGRAM(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 (this->options & ONENAND_HAS_CACHE_PROGRAM)
> +
> =A0/* Check byte access in OneNAND */
> =A0#define ONENAND_CHECK_BYTE_ACCESS(addr) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(addr & 0x1)
>
> @@ -181,6 +192,7 @@ struct onenand_chip {
> =A0#define ONENAND_HAS_UNLOCK_ALL =A0 =A0 =A0 =A0 (0x0002)
> =A0#define ONENAND_HAS_2PLANE =A0 =A0 =A0 =A0 =A0 =A0 (0x0004)
> =A0#define ONENAND_HAS_4KB_PAGE =A0 =A0 =A0 =A0 =A0 (0x0008)
> +#define ONENAND_HAS_CACHE_PROGRAM =A0 =A0 =A0(0x0010)
> =A0#define ONENAND_SKIP_UNLOCK_CHECK =A0 =A0 =A0(0x0100)
> =A0#define ONENAND_PAGEBUF_ALLOC =A0 =A0 =A0 =A0 =A0(0x1000)
> =A0#define ONENAND_OOBBUF_ALLOC =A0 =A0 =A0 =A0 =A0 (0x2000)
> --
> 1.7.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
