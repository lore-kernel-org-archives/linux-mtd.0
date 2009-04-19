Subject: Re: jffs2 filesystem/flash data integrity
From: David Woodhouse <dwmw2@infradead.org>
To: Manoj <manoj23@gmail.com>
In-Reply-To: <1c3f4270904181955g28d25ef5nef3cc3001c0d3a06@mail.gmail.com>
References: <1c3f4270904181955g28d25ef5nef3cc3001c0d3a06@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 19 Apr 2009 08:33:03 +0100
Message-Id: <1240126383.3589.46.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-04-18 at 19:55 -0700, Manoj wrote:
> Hi,
> 
> I have a jffs2 filesystem on NAND flash. After mounting the jffs2 fs,
> I create a 2MB file and make a copy of it using "cp" command. When I
> do a "diff" between two files, the files are same. Now, I unmount the
> fs and re-mount it. When I do a "diff" between the two files, they
> differ. Looking at the difference, I see that around 4K of data in one
> file has 0s in it. This 4K hole can be anywhere in the file.  There is
> no issue with a 1MB file.

Please reproduce with 'CONFIG_JFFS2_FS_DEBUG=1', capturing all kernel
message over a serial console. Also, take an image of the flash before
you remount it. Let me have both.

-- 
dwmw2
