Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHEL7-000499-MA
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:32:18 +0000
Received: by bwz5 with SMTP id 5so3960938bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:32:12 -0800 (PST)
Subject: Re: [PATCH 01/10] mtd-utils: nanddump: Allow 64-bit lengths
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:31:58 +0200
Message-ID: <1289647918.2218.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Jehan Bing <jehan@orb.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-03 at 01:27 -0700, Brian Norris wrote:
> We should allow the dump length to be 64-bit, especially since the value
> was read in as a "long long" by strtoll().
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  nanddump.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/nanddump.c b/nanddump.c
> index 86a71c9..fe29596 100644
> --- a/nanddump.c
> +++ b/nanddump.c
> @@ -83,7 +83,7 @@ static bool			noecc = false;		// don't error correct
>  static bool			noskipbad = false;	// don't skip bad blocks
>  static bool			omitoob = false;	// omit oob data
>  static unsigned long long	start_addr;		// start address
> -static unsigned long		length;			// dump length
> +static unsigned long long	length;			// dump length
>  static const char		*mtddev;		// mtd device name
>  static const char		*dumpfile;		// dump file name
>  static bool			omitbad = false;

This patch does not apply. Which version of MTD utils do you use? This
change was done long time ago by the following commit:

commit b16c1b630491a461b3ebb55d714d7bb0cd122737
Author: Grant Erickson <gerickson@nuovations.com>
Date:   Sun Sep 7 20:45:21 2008 +0000

    nanddump: Qualifier Clean-up
    
    Static-qualified all globals except 'main' because they have no use
    beyond file scope.
    Constant-qualified MTD device and input positional parameter globals.
    Constant-qualified argv array.
    
    Signed-off-by: Grant Erickson <gerickson@nuovations.com>
    Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
    Signed-off-by: Josh Boyer <jwboyer@gmail.com>

Forgot to git-pull ? :-))))

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
