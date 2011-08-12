Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QrlpG-00024U-DF
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 07:06:39 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 5/5] mtdinfo: consolidate help as display_help()
Date: Fri, 12 Aug 2011 09:06:20 +0200
References: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
	<1313079580-22144-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313079580-22144-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201108120906.20453.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 11 August 2011 18:19:40 Brian Norris wrote:
> The help message for mtdinfo is unnecessarily disjointed. It is split
> into three strings which reuse the PROGRAM_NAME string inefficiently and
> don't have a consistent style.
> 
> This fixup should provide a cleaner look with aligned columns and
> easier-to-read source code.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v3: indented help message properly
> 
>  ubi-utils/mtdinfo.c |   52 ++++++++++++++++++++++++++------------------------
>  1 files changed, 27 insertions(+), 25 deletions(-)
> 
> diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
>[ ... ]
> +static void display_help(void)
> +{
> +	printf(
> +		"%1$s version %2$s - a tool to print MTD information.\n"
> +		"\n"
> +		"Usage: %1$s <MTD node file path> [--map | -M] [--ubi-info | -u]\n"
> +		"       %1$s --all [--ubi-info | -u]\n"
> +		"       %1$s [--help | --version]\n"
> +		"\n"
> +		"Options:\n"
> +		"-u, --ubi-info                  print what would UBI layout be if it was put\n"
> +		"                                on this MTD device\n"
> +		"-M, --map                       print eraseblock map\n"
> +		"-a, --all                       print information about all MTD devices\n"
> +		"                                Note: `--all' may give less info per device\n"
> +		"                                than, e.g., `mtdinfo /dev/mtdX'\n"
> +		"-h, --help                      print help message\n"
> +		"-V, --version                   print program version\n"
> +		"\n"
> +		"Examples:\n"
> +		"  %1$s /dev/mtd0             print information MTD device /dev/mtd0\n"
> +		"  %1$s /dev/mtd0 -u          print information MTD device /dev/mtd0\n"
> +		"\t\t\t\tand include UBI layout information\n"

 Any reason this line, and only this line,
 uses tabs (\t) for formatting whilst every
 other line uses spaces?  (FWIW, I prefer
 spaces, but more importantly think there
 should be some consistency.)

 Yes, this is pedantic trivia!  ;-)
cheers!
	-blf-
-- 
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
