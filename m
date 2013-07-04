Received: from mail-ve0-x22e.google.com ([2607:f8b0:400c:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuYsE-0004Ca-8c
 for linux-mtd@lists.infradead.org; Thu, 04 Jul 2013 02:02:18 +0000
Received: by mail-ve0-f174.google.com with SMTP id oz10so657795veb.5
 for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2013 19:01:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1368030446-343-2-git-send-email-vapier@gentoo.org>
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <1368030446-343-2-git-send-email-vapier@gentoo.org>
Date: Wed, 3 Jul 2013 19:01:52 -0700
Message-ID: <CAN8TOE8zAiSxxB5X_wVJ+=Fi8tSDoFEDatRRY-qQy9805J5H=Q@mail.gmail.com>
Subject: Re: [PATCH [mtd-utils] 2/3] mtd-utils: new prompt() helper for
 talking to the user
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike, Artem,

I notice Artem just pushed this.

On Wed, May 8, 2013 at 9:27 AM, Mike Frysinger <vapier@gentoo.org> wrote:
> We've got a few tools that prompt the user for "yes/no" questions.
> Add a common helper to simplify the various implementations.
>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
...
> diff --git a/include/common.h b/include/common.h
> index d0c4146..4ffccea 100644
> --- a/include/common.h
> +++ b/include/common.h
> @@ -101,9 +102,45 @@ extern "C" {
>         fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
>  } while(0)
>
> +/**
> + * prompt the user for confirmation
> + */
> +static inline bool prompt(const char *msg, bool def)
> +{
> +       char *line = NULL;
> +       size_t len;
> +       bool ret = def;
> +
> +       do {
> +               normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n' : 'N');
> +               fflush(stdout);
> +
> +               while (getline(&line, &len, stdin) == -1) {
> +                       printf("failed to read prompt; assuming '%s'\n",
> +                               def ? "yes" : "no");
> +                       break;
> +               }
> +
> +               if (strcmp("\n", line) != 0) {
> +                       switch (rpmatch(line)) {

rpmatch() is not POSIX-compliant and is not available on my uclibc, so
this breaks my compile.

> +                       case 0: ret = false; break;
> +                       case 1: ret = true; break;
> +                       case -1:
> +                               puts("unknown response; please try again");
> +                               continue;
> +                       }
...

Brian
