Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxeb2-0000yh-VW
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 18:31:13 +0000
Received: by mail-pf0-x232.google.com with SMTP id e6so60995157pfk.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 11:30:16 -0700 (PDT)
Date: Fri, 21 Oct 2016 11:30:12 -0700
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 25/26] ubifs: Implement UBIFS_FLG_ENCRYPTION
Message-ID: <20161021183012.GC90712@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-26-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477054121-10198-26-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 02:48:40PM +0200, Richard Weinberger wrote:
> @@ -190,6 +191,10 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  				   sizeof(policy)))
>  			return -EFAULT;
>  
> +		err = ubifs_enable_encryption(c);
> +		if (err)
> +			return err;
> +
>  		err = fscrypt_process_policy(file, &policy);

Is ubifs_enable_encryption() being done with proper locking and authorization?
As-is, anyone can call this at any time if they can open some file on UBIFS.

FYI, the approach being taken for ext4 is that the encryption feature flag has
to be explicitly turned on before FS_IOC_SET_ENCRYPTION_POLICY will work.

Eric
