Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFzZB-0003dX-Kd
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 09:05:23 +0000
Subject: Re: [PATCH v2] mkfs.ubifs: Add support for symlinks in device table
To: David Engraf <david.engraf@sysgo.com>, richard@nod.at,
 linux-mtd@lists.infradead.org, goliath@sigma-star.at
References: <20170518133854.20744-1-david.engraf@sysgo.com>
 <20170523065252.6257-1-david.engraf@sysgo.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <f0cb1c68-6923-9a95-05d5-d24a7101a398@sigma-star.at>
Date: Wed, 31 May 2017 11:04:59 +0200
MIME-Version: 1.0
In-Reply-To: <20170523065252.6257-1-david.engraf@sysgo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Applied to mtd-utils.git.

Thanks,

David

On 05/23/2017 08:52 AM, David Engraf wrote:
> It is not possible to change ownership for symlinks in the device table file.
> This patch adds support for symlinks equal to mkfs.jffs2 and updates the
> sample device table file. The permission entry for symlinks in the device
> table must be set to 0777.
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>
> ---
>  jffsX-utils/device_table.txt      |  1 +
>  ubifs-utils/mkfs.ubifs/devtable.c | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/jffsX-utils/device_table.txt b/jffsX-utils/device_table.txt
> index 394a62b..8930cae 100644
> --- a/jffsX-utils/device_table.txt
> +++ b/jffsX-utils/device_table.txt
> @@ -14,6 +14,7 @@
>  #	c	Character special device file
>  #	b	Block special device file
>  #	p	Fifo (named pipe)
> +#	l	Link
>  # uid is the user id for the target file, gid is the group id for the
>  # target file.  The rest of the entried apply only to device special
>  # file.
> diff --git a/ubifs-utils/mkfs.ubifs/devtable.c b/ubifs-utils/mkfs.ubifs/devtable.c
> index dee035d..3b46abc 100644
> --- a/ubifs-utils/mkfs.ubifs/devtable.c
> +++ b/ubifs-utils/mkfs.ubifs/devtable.c
> @@ -33,9 +33,10 @@
>   * c  Character special device file
>   * b  Block special device file
>   * p  Fifo (named pipe)
> + * l  Link
>   *
> - * Don't bother with symlinks (permissions are irrelevant), hard links (special
> - * cases of regular files), or sockets (why bother).
> + * Don't bother with hard links (special cases of regular files), or sockets
> + * (why bother).
>   *
>   * Regular files must exist in the target root directory. If a char, block,
>   * fifo, or directory does not exist, it will be created.
> @@ -177,6 +178,11 @@ static int interpret_table_entry(const char *line)
>  		case 'b':
>  			mode |= S_IFBLK;
>  			break;
> +		case 'l':
> +			mode |= S_IFLNK;
> +			if ((mode & 0777) != 0777)
> +				return err_msg("link permission must be 0777");
> +			break;
>  		default:
>  			return err_msg("unsupported file type '%c'", type);
>  	}
> 
