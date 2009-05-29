Subject: Re: [PATCH 3/4] [MTD] compat_ioctl cleanup
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <a95a62fe0904082253i119f8660y6a73835a163394f5@mail.gmail.com>
References: <a95a62fe0904082253i119f8660y6a73835a163394f5@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 29 May 2009 15:58:06 +0100
Message-Id: <1243609086.19886.179.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-08 at 22:53 -0700, Kevin Cernekee wrote:
> 
> +static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
> +       unsigned long arg)
> +{
> +       struct mtd_file_info *mfi = file->private_data;
> +       struct mtd_info *mtd = mfi->mtd;
> +       void __user *argp = (void __user *)arg;

Shouldn't that be 'argp = compat_ptr(arg)' ?
 
-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
