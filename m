Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBjla-0000oH-Es
	for linux-mtd@lists.infradead.org; Wed, 03 Jun 2009 06:16:10 +0000
Received: by ewy21 with SMTP id 21so15341401ewy.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Jun 2009 23:15:32 -0700 (PDT)
Sender: =?UTF-8?Q?Gerard_Lled=C3=B3?= <raharu@gmail.com>
From: Gerard Lledo <gerard.lledo@gmail.com>
Date: Wed, 3 Jun 2009 09:09:37 +0300
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] [JFFS2] jffs2_start_garbage_collect_thread() return
	value cleanup
Message-ID: <20090603060937.GA2554@tank>
References: <20090602113216.GA3513@tank>
	<1243944686-7039-1-git-send-email-gerard.lledo@gmail.com>
	<1243944686-7039-2-git-send-email-gerard.lledo@gmail.com>
	<20090602151112.376ca436.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090602151112.376ca436.akpm@linux-foundation.org>
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

On Tue, Jun 02, 2009 at 03:11:12PM -0700, Andrew Morton wrote:
> On Tue,  2 Jun 2009 15:11:26 +0300
> Gerard Lledo <gerard.lledo@gmail.com> wrote:
> 
> > There is no user of this return value in the kernel.  Change it to return void
> > instead.
> 
> Both these patches were missing your signed-off-by:.  As your first
> version of the first patch wasn't missing it, I added it to both these
> patches, OK?
>

Thats fine.  I just forgot to add it.  Thanks, and sorry for the trouble/noise.
