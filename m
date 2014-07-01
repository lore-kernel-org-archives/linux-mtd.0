Message-ID: <53B2D378.7010006@infradead.org>
Date: Tue, 01 Jul 2014 08:27:52 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
To: Seunghun Lee <waydi1@gmail.com>, dedekind1@gmail.com,
 adrian.hunter@intel.com
Subject: Re: [PATCH] UBIFS: fix some comments
References: <1404225925-3347-1-git-send-email-waydi1@gmail.com>
In-Reply-To: <1404225925-3347-1-git-send-email-waydi1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/01/14 07:45, Seunghun Lee wrote:
> This patch fixes some comments about return type.
> 
> Signed-off-by: Seunghun Lee <waydi1@gmail.com>
> ---
>  fs/ubifs/recovery.c |    4 ++--
>  fs/ubifs/scan.c     |    5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> index c14adb2..933dda5 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -629,8 +629,8 @@ static void drop_last_node(struct ubifs_scan_leb *sleb, int *offs)
>   *
>   * This function does a scan of a LEB, but caters for errors that might have
>   * been caused by the unclean unmount from which we are attempting to recover.
> - * Returns %0 in case of success, %-EUCLEAN if an unrecoverable corruption is
> - * found, and a negative error code in case of failure.
> + * Returns the scaned information on success and a negative error code on

                  scanned

> + * failure.
>   */
>  struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
>  					 int offs, void *sbuf, int jhead)
> diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
> index 58aa05d..327d84a 100644
> --- a/fs/ubifs/scan.c
> +++ b/fs/ubifs/scan.c
> @@ -131,7 +131,8 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
>   * @offs: offset to start at (usually zero)
>   * @sbuf: scan buffer (must be c->leb_size)
>   *
> - * This function returns %0 on success and a negative error code on failure.
> + * This function returns the scaned information on success and a negative error

                                scanned

> + * code on failure.
>   */
>  struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
>  					int offs, void *sbuf)


-- 
~Randy
