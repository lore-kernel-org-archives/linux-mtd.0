From: dwmw2@infradead.org (David Woodhouse)
Date: 24 Feb 2003 21:47:58 +0000
Subject: [PATCH] fix jffs2_get_ino_cache()
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E4BE@NT>
References: <00512BA4F9D3D311912A009027E9B8F407E4BE@NT>
Message-ID: <1046123278.2784.1.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-02-24 at 18:46, Dave Ellis wrote:
> This patch fixes a kernel oops that happens when a negative
> inode number is passed to jffs2_get_ino_cache(). The ino
> parameter should be uint32_t, not int since inodes are unsigned.

Applied; thanks. I'm suitably embarrassed :)

-- 
dwmw2
