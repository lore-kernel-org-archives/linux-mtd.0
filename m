Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqyY-0003z8-EN
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:45:23 +0000
Received: by fxm14 with SMTP id 14so4249719fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:45:20 -0700 (PDT)
Subject: Re: [PATCH 5/6] mtdinfo: add regioninfo/sectormap display
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307427548-29306-5-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-5-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 10:41:03 +0300
Message-ID: <1307432463.11104.65.camel@localhost>
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

On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
> @@ -58,14 +60,15 @@ static const char optionsstr[] =
>  "-m, --mtdn=<MTD device number>  MTD device number to get information about\n"
>  "-u, --ubi-info                  print what would UBI layout be if it was put\n"
>  "                                on this MTD device\n"
> +"-s, --sector-map                print sector map\n"
>  "-a, --all                       print information about all MTD devices\n"
>  "-h, --help                      print help message\n"
>  "-V, --version                   print program version";
>  
>  static const char usage[] =
> -"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-h] [-V] [--mtdn <MTD device number>]\n"
> +"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-s] [-h] [-V] [--mtdn <MTD device number>]\n"
>  "\t\t[--ubi-info] [--help] [--version]\n"
> -"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-h] [-V] [--ubi-info] [--help]\n"
> +"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-s] [-h] [-V] [--ubi-info] [--help]\n"
>  "\t\t[--version]\n"
>  "Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
>  "Example 2: " PROGRAM_NAME " -m 1 - print information about MTD device number 1\n"
> @@ -78,6 +81,7 @@ static const char usage[] =
>  static const struct option long_options[] = {
>  	{ .name = "mtdn",      .has_arg = 1, .flag = NULL, .val = 'm' },
>  	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
> +	{ .name = "sector-map",.has_arg = 0, .flag = NULL, .val = 's' },

Is sector-map a good name? May be we should call this feature "lock
info" or something which suggests this is about detailed lock
information? In this case you should also print an error message if the
ISLOCKED ioctl is not supported. Probably adding a "islocked_supported"
flag to 'struct mtd_info' (similarly to sysfs_supported) makes sense?
Then you could just check this flag and refuse -s option?

Also, could we avoid using term sector because it is overloaded and
confusing. Could you please use term "eraseblock" instead (in prints and
in internal names)?

Or you meant that this is like general per-sector info? So if we have
more information to print, we add it there? In this case, could you
please print "bad" or something for bad eraseblocks as well?

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
