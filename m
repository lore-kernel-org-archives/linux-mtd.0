Subject: Re: mkfs.jffs2 not compiling, which acl.h?
From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@kaigai.gr.jp>
In-Reply-To: <457AE718.1090707@kaigai.gr.jp>
References: <4576CC07.2000107@valcom.com>
	<1165505164.5253.370.camel@pmac.infradead.org>
	<457AE718.1090707@kaigai.gr.jp>
Content-Type: text/plain
Date: Sun, 10 Dec 2006 11:53:21 +0000
Message-Id: <1165751601.5253.486.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Glen Johnson <gjohnson@valcom.com>, KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-12-10 at 01:40 +0900, KaiGai Kohei wrote:
> The common format is defined as a leading 'posix_acl_xattr_header' and
> an array of 'posix_acl_xattr_entry'. All of them are represented in
> little-endian ordering.
> 
> Thus, we can assume the same format as ext3 (and any filesystem) uses.
> Is it OK? 

That's fine then -- I just wanted to check. Thanks.

-- 
dwmw2
