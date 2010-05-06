Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9v3Y-0002hz-PZ
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 06:59:37 +0000
Subject: Re: [PATCH v4] mtd: Do not corrupt backing device of device node inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
In-Reply-To: <1273074054-11849-1-git-send-email-kirill@shutemov.name>
References: <1273074054-11849-1-git-send-email-kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 May 2010 09:39:19 +0300
Message-ID: <1273127959.3702.200.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, stable@kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-05 at 18:40 +0300, Kirill A. Shutemov wrote:
> We cannot modify file->f_mapping->backing_dev_info, because it will corrupt
> backing device of device node inode, since file->f_mapping is equal to
> inode->i_mapping (see __dentry_open() in fs/open.c).
> 
> Let's introduce separate inode for MTD device with appropriate backing
> device.
> 
> Signed-off-by: Kirill A. Shutemov <kirill@shutemov.name>
> ---
> Changelog:
>  v3 -> v4:
>   - Use igrab() instead of __iget inside the inode_lock;
>   - Add stable@ to CC list.
>  v2 -> v3:
>   - Rebase to mtd-2.6.git.
>  v1 -> v2:
>   - Fix error handling based on comments by Jan Kara.

Pushed to l2-mtd-2.6.git / dunno

Also added Jan's ack which disappeared in v4

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
