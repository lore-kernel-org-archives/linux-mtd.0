Date: Fri, 10 Apr 2009 15:06:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [PATCH 2/4] [MTD] Add MEMERASE64 ioctl for >4GiB devices
Message-Id: <20090410150614.b2c6f7ab.akpm@linux-foundation.org>
In-Reply-To: <a95a62fe0904082252h41afa872j2ef6fb9d1d76dc27@mail.gmail.com>
References: <a95a62fe0904082252h41afa872j2ef6fb9d1d76dc27@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 8 Apr 2009 22:52:28 -0700
Kevin Cernekee <kpc.mtd@gmail.com> wrote:

> Subject: [PATCH 2/4] [MTD] Add MEMERASE64 ioctl for >4GiB devices

triviata:

The text inside [] is usually removed by the patch recipient - the []
denotes transient information such as "patch" and the kernel version,
etc.

The preferred form for patch titles is

	subsytem-identifier: what-i-did-to-it

so this patch should have been

	mtd: add MEMERASE64 ioctl for >4GiB devices

> 
> @@ -427,20 +428,32 @@ static int mtd_ioctl(struct inode *inode, struct
> file *file,

Your email client is wordwrapping the text.
