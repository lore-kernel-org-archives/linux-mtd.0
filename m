Subject: Re: [PATCH v2] mtd: Do not corrupt backing device of device node inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan Kara <jack@suse.cz>
In-Reply-To: <20100504111947.GB3398@quack.suse.cz>
References: <1272922368-18517-1-git-send-email-kirill@shutemov.name>
	<20100504111947.GB3398@quack.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 04 May 2010 17:19:17 +0300
Message-ID: <1272982757.3702.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-04 at 13:19 +0200, Jan Kara wrote:
> On Tue 04-05-10 00:32:48, Kirill A. Shutemov wrote:
> > We cannot modify file->f_mapping->backing_dev_info, because it will corrupt
> > backing device of device node inode, since file->f_mapping is equal to
> > inode->i_mapping (see __dentry_open() in fs/open.c).
> > 
> > Let's introduce separate inode for MTD device with appropriate backing
> > device.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill@shutemov.name>
>   The patch now looks correct to me. Acked-by: Jan Kara <jack@suse.cz>
> 

Is this -stable material?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
