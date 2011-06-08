Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJcT-0005Su-Um
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:20:30 +0000
Received: by fxm14 with SMTP id 14so470459fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:20:27 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: optionally return partial LEB scan results
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1307479967-3909-1-git-send-email-mlcreech@gmail.com>
References: <1307479967-3909-1-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 17:16:09 +0300
Message-ID: <1307542569.31223.101.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 16:52 -0400, Matthew L. Creech wrote:
> ubifs_scan() currently returns -EUCLEAN when it encounters corrupted data
> while scanning a LEB.  This is usually the right thing to do, but it prevents
> us from debugging certain kinds of corruption, since ubifs_scan() is called
> from dbg_dump_leb().
> 
> Add a flag which makes ubifs_scan() return partial node data when corruption
> is encountered, and use that flag in dbg_dump_leb().
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
> ---
>  fs/ubifs/debug.c      |    2 +-
>  fs/ubifs/gc.c         |    2 +-
>  fs/ubifs/log.c        |    2 +-
>  fs/ubifs/lprops.c     |    2 +-
>  fs/ubifs/master.c     |    4 ++--
>  fs/ubifs/orphan.c     |    4 ++--
>  fs/ubifs/recovery.c   |    2 +-
>  fs/ubifs/replay.c     |    4 ++--
>  fs/ubifs/scan.c       |   16 ++++++++++++----
>  fs/ubifs/tnc_commit.c |    2 +-
>  fs/ubifs/ubifs.h      |    2 +-
>  11 files changed, 25 insertions(+), 17 deletions(-)

Thanks, but I think I'll do it differently. If the ubifs_scan() quiet
parameter is 0, then I can notice that this mean that the caller expects
corruptions and will fix it up. In which case current code will re-scan
the LEB. And I will make it so that if quiet == 0, then the scanned
buffer is not destroyed.

This will first of all make sure we do not read the same LEB 2 times
when recovering. And second of all - this is anyway needed to handle
unstable bits. So I'll be working on this change myself.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
