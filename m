Subject: Re: [PATCH v7 5/5]: mtdoops: refactor as a kmsg_dumper
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091015094815.36f5872c@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094815.36f5872c@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Oct 2009 07:32:42 +0300
Message-Id: <1256272362.29885.197.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-15 at 09:48 +0200, Simon Kagstrom wrote:
> The last messages which happens before a crash might contain interesting
> information about the crash. This patch reworks mtdoops using the
> kmsg_dumper support instead of a console, which simplifies the code and
> also includes the messages before the oops started.
> 
> On oops callbacks, the MTD device write is scheduled in a work queue (to
> be able to use the regular mtd->write call), while panics call
> mtd->panic_write directly. Thus, if panic_on_oops is set, the oops will
> be written out during the panic.
> 
> A parameter to specify which mtd device to use (number or name), as well
> as a flag, writable at runtime, to toggle wheter to dump oopses or only
> panics (since oopses can often be handled by regular syslog).
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
> ---
> ChangeLog:
> 	* (Vimal Singh) Correct Kconfig instructions on how to load
> 	  the module
> 	* Correct kfree of unallocated area
>         * More descriptive error message on wrong module parameters
> 	* Rebase against new patch 4 (use container_of instead of private
>           pointer)
> 
>  drivers/mtd/Kconfig   |    5 +-
>  drivers/mtd/mtdoops.c |  211 ++++++++++++++++++++-----------------------------
>  2 files changed, 88 insertions(+), 128 deletions(-)

Looks good, thanks for doing this. Did you actually test this with
oopses and panics, with and without panic_on_oops?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
