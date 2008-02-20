Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRqtE-0005LC-9R
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 15:29:46 +0000
Date: Wed, 20 Feb 2008 16:29:10 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [PATCH 2.6.25-rc2] block2mtd: logging typo fixes
Message-ID: <20080220152910.GB5539@lazybastard.org>
References: <chaz20080220150021.GM4539@artesyncp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <chaz20080220150021.GM4539@artesyncp.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 February 2008 15:00:21 +0000, Stephane Chazelas wrote:
> 
> this patch addresses a number of small issues mainly regarding
> the output made by this driver to dmesg:
>   - Some of the blkmtd's had not been changed to block2mtd which
>     caused display problem
>   - the parse_err() macro was displaying "block2mtd: " twice
> 
> Signed-off-by: Stephane Chazelas <stephane.chazelas@emerson.com>
Acked-by: Joern Engel <joern@lazybastard.org>

David, please apply.

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
