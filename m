Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ42y-0002tY-RX
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 19:56:33 +0000
Subject: Re: [PATCH] ubifs: allow encryption ioctls in compat mode
To: Eric Biggers <ebiggers3@gmail.com>, linux-mtd@lists.infradead.org
References: <1482174768-104224-1-git-send-email-ebiggers3@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-fsdevel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <6632424c-ab12-3923-e27f-12d24ca3168c@nod.at>
Date: Mon, 19 Dec 2016 20:56:08 +0100
MIME-Version: 1.0
In-Reply-To: <1482174768-104224-1-git-send-email-ebiggers3@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19.12.2016 20:12, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The ubifs encryption ioctls did not work when called by a 32-bit program
> on a 64-bit kernel.  Since 'struct fscrypt_policy' is not affected by
> the word size, ubifs just needs to allow these ioctls through, like what
> ext4 and f2fs do.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ubifs/ioctl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> index 78d7136..da519ba 100644
> --- a/fs/ubifs/ioctl.c
> +++ b/fs/ubifs/ioctl.c
> @@ -217,6 +217,9 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case FS_IOC32_SETFLAGS:
>  		cmd = FS_IOC_SETFLAGS;
>  		break;
> +	case FS_IOC_SET_ENCRYPTION_POLICY:
> +	case FS_IOC_GET_ENCRYPTION_POLICY:
> +		break;

Whoops, since I tested most of the time on an ARM board, this was unnoticed. :-D

Thanks,
//richard
