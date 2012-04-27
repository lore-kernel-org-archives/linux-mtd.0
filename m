Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNoZg-00029e-5C
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 17:03:16 +0000
Received: by dadn15 with SMTP id n15so1552758dad.16
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 10:03:13 -0700 (PDT)
Message-ID: <4F9AD14E.9060008@gmail.com>
Date: Fri, 27 Apr 2012 10:03:10 -0700
From: David Daney <ddaney.cavm@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 1/2] MIPS: Kbuild: remove -Werror
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/27/2012 06:48 AM, Artem Bityutskiy wrote:
> From: Artem Bityutskiy<artem.bityutskiy@linux.intel.com>
>
> MIPS build fails with the standard W=1 Kbuild switch with because of the
> -Werror gcc switch.
>
> This patch removes the gcc switch to make W=1 work. Mips is the only
> architecture I know which does not build with W=1 and this upsets my aiaiai
> scripts. And in general, you never know which warnings newer versions of gcc
> will start emiting so having -Werror by default is not the best idea.
>
> Signed-off-by: Artem Bityutskiy<artem.bityutskiy@linux.intel.com>

I think the warning messages are enough, we don't need to break things.

Acked-by: David Daney <david.daney@cavium.com>

> ---
>   arch/mips/Kbuild |    5 -----
>   1 files changed, 0 insertions(+), 5 deletions(-)
>
> diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
> index 7dd65cf..0d37730 100644
> --- a/arch/mips/Kbuild
> +++ b/arch/mips/Kbuild
> @@ -1,8 +1,3 @@
> -# Fail on warnings - also for files referenced in subdirs
> -# -Werror can be disabled for specific files using:
> -# CFLAGS_<file.o>  := -Wno-error
> -subdir-ccflags-y := -Werror
> -
>   # platform specific definitions
>   include arch/mips/Kbuild.platforms
>   obj-y := $(platform-y)
