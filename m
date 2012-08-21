Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3uvU-00036o-Oc
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 20:19:50 +0000
Received: by wgbez12 with SMTP id ez12so132288wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 13:19:45 -0700 (PDT)
Date: Tue, 21 Aug 2012 23:19:33 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 3/7] UBI: accept empty string for vid_hdr_offs parameter
Message-ID: <20120821231933.722f5be4@halley>
In-Reply-To: <1345467898.2848.29.camel@sauron.fi.intel.com>
References: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
 <1345464561-24464-4-git-send-email-richard.genoud@gmail.com>
 <20120820155210.64d64803@pixies.home.jungo.com>
 <1345467898.2848.29.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 20 Aug 2012 16:04:58 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Please, let's not over-engineer this, do not bother with ",,", use ",0,"
> instead. Just do amend the documentation properly.

Artem, you are probably right, but it was really a one-liner:

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 2c5ed5c..1745764 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1333,7 +1333,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	p = &mtd_dev_param[mtd_devs];
 	strcpy(&p->name[0], tokens[0]);
 
-	if (tokens[1])
+	if (tokens[1] && *tokens[1] != '\0')
 		p->vid_hdr_offs = bytes_str_to_int(tokens[1]);
 
 	if (p->vid_hdr_offs < 0)


But either case, I guess the user will probably still need to take a
look at the description to understand how to "avoid specifying" the
vid_hdr_offs ;-)
So no real benefit supporting ",,"
Bit more intuitive, though.

Anyways, saw you already pushed, thanks.

Shmulik
