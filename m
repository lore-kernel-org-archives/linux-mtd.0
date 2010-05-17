Subject: Re: [PATCH v5] mtd: Do not corrupt backing device of device node inode
From: David Woodhouse <dwmw2@infradead.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
In-Reply-To: <AANLkTimB1DsCd8HuMDc9jgVOnOAE_PVd2ktssp3TIwxc@mail.gmail.com>
References: <AANLkTimB1DsCd8HuMDc9jgVOnOAE_PVd2ktssp3TIwxc@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 17 May 2010 15:10:41 +0100
Message-ID: <1274105441.6930.6920.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jan Kara <jack@suse.cz>, Artem Bityutskiy <dedekind1@gmail.com>,
	linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-17 at 16:55 +0300, Kirill A. Shutemov wrote:
> +       if (!mtd->inode) {
> +               struct inode *mtd_inode;
> +               mtd_inode = new_inode(mtd_inode_mnt->mnt_sb);
> +               if (!mtd_inode) {
> +                       put_mtd_device(mtd);
> +                       ret = -ENOMEM;
> +                       goto out;
> +               }
> +               mtd_inode->i_mode = S_IFCHR;
> +               mtd_inode->i_rdev = inode->i_rdev;
> +               if (mtd->backing_dev_info) {
> +                       mtd_inode->i_data.backing_dev_info =
> +                               mtd->backing_dev_info;
> +               }
> +
> +               if (unlikely(cmpxchg(&mtd->inode, NULL, mtd_inode))) {
> +                       /* Somebody has already initialized mtd->inode
> */
> +                       iput(mtd_inode);
> +               }
> +       }
> +
> +       igrab(mtd->inode); 

Now you're just reimplementing iget().

Can we just use iget_locked() to get the appropriate inode (using the
mtd device number as the inode number)? Then we don't need to bother
storing it in mtd->inode at all, and we can iput() the last refcount on
it when the chardevice is closed -- we don't need it to stick around
until the MTD device is destroyed.

-- 
dwmw2
