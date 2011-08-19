Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuRbA-0002j2-8q
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 16:07:09 +0000
Received: by yic13 with SMTP id 13so2614767yic.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 09:07:05 -0700 (PDT)
Subject: Re: [PATCH] ubifs: Do not build debug messages with
	CONFIG_UBIFS_FS_DEBUG disabled
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michal Marek <mmarek@suse.cz>
Date: Fri, 19 Aug 2011 19:08:51 +0300
In-Reply-To: <1313769360.6607.70.camel@sauron>
References: <1313058586-24239-1-git-send-email-mmarek@suse.cz>
	<1313769360.6607.70.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313770135.6607.71.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-08-19 at 18:55 +0300, Artem Bityutskiy wrote:
> On Thu, 2011-08-11 at 12:29 +0200, Michal Marek wrote:
> > With
> >   $ grep -e UBIFS_FS_DEBUG -e DYNAMIC_DEBUG .config
> >   # CONFIG_UBIFS_FS_DEBUG is not set
> >   CONFIG_DYNAMIC_DEBUG=y
> > 
> > Debug messages are kept in the object files due to the
> > dynamic_pr_debug() macro, even if they are never going to be printed:
> >   $ make fs/ubifs/super.o
> >   $ strings fs/ubifs/super.o | grep 'compiled on'
> >   compiled on:         Aug 11 2011 at 12:21:38
> > 
> > Use plain printk to fix this.
> > 
> > Signed-off-by: Michal Marek <mmarek@suse.cz>
> 
> Good catch, thanks! Pushed to ubifs-2.6.git, thanks!

There is a similar issue in UBI - just fixed it. I'll send this to Linus
soon, as this is a regression (blown-up binaries even though debugging
is disabled).

-- 
Best Regards,
Artem Bityutskiy
