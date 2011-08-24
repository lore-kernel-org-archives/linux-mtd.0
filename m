Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwCZR-0003WD-9e
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 12:28:38 +0000
Date: Wed, 24 Aug 2011 14:28:31 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/5] mtd: remove MEMSETOOBSEL macro definition
In-Reply-To: <1314145056-5233-3-git-send-email-computersforpeace@gmail.com>
Message-ID: <Pine.LNX.4.64.1108241427380.13510@lnxricardw.se.axis.com>
References: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
	<1314145056-5233-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 24 Aug 2011, Brian Norris wrote:

> MEMSETOOBSEL is completely unused and useless. Remove the definition.
>
> Note: it's probably best not to use this ioctl number in the future for
> MTD, since that may cause conflicts between old kernels and new user
> software (or new kernels and old user software). This shouldn't be much
> problem.

Perhaps this should be noted as a comment in the code, rather than just=20
removing the line. Such information tends to get forgotten sooner or later=
=20
otherwise.

>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> include/mtd/mtd-abi.h |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index 2f7d45b..f0e8027 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -112,7 +112,7 @@ struct otp_info {
> #define MEMUNLOCK=09=09_IOW('M', 6, struct erase_info_user)
> #define MEMGETREGIONCOUNT=09_IOR('M', 7, int)
> #define MEMGETREGIONINFO=09_IOWR('M', 8, struct region_info_user)
> -#define MEMSETOOBSEL=09=09_IOW('M', 9, struct nand_oobinfo)
> +
> #define MEMGETOOBSEL=09=09_IOR('M', 10, struct nand_oobinfo)
> #define MEMGETBADBLOCK=09=09_IOW('M', 11, __kernel_loff_t)
> #define MEMSETBADBLOCK=09=09_IOW('M', 12, __kernel_loff_t)
> --=20
> 1.7.5.4

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
