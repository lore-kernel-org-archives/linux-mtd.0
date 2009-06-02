Date: Tue, 2 Jun 2009 15:11:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gerard Lledo <gerard.lledo@gmail.com>
Subject: Re: [PATCH] [JFFS2] jffs2_start_garbage_collect_thread() return
	value cleanup
Message-Id: <20090602151112.376ca436.akpm@linux-foundation.org>
In-Reply-To: <1243944686-7039-2-git-send-email-gerard.lledo@gmail.com>
References: <20090602113216.GA3513@tank>
	<1243944686-7039-1-git-send-email-gerard.lledo@gmail.com>
	<1243944686-7039-2-git-send-email-gerard.lledo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, gerard.lledo@gmail.com, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue,  2 Jun 2009 15:11:26 +0300
Gerard Lledo <gerard.lledo@gmail.com> wrote:

> There is no user of this return value in the kernel.  Change it to return void
> instead.

Both these patches were missing your signed-off-by:.  As your first
version of the first patch wasn't missing it, I added it to both these
patches, OK?
