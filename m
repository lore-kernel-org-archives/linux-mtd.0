Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEdsN-0007d9-2p
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 08:44:07 +0000
Received: by ewy3 with SMTP id 3so128885ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 01:44:04 -0700 (PDT)
Subject: Re: [PATCH 2/2] UBIFS: seek journal heads to the latest bud in replay
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
In-Reply-To: <1303750531-13800-2-git-send-email-dedekind1@gmail.com>
References: <1303750531-13800-1-git-send-email-dedekind1@gmail.com>
	<1303750531-13800-2-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 11:40:30 +0300
Message-ID: <1303807230.2778.46.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-25 at 19:55 +0300, Artem Bityutskiy wrote:
> This patch teaches the replay to initialize the GC heads exactly to the latest
> buds, i.e. the buds which have the greatest sequence number in corresponding
> log reference nodes. This makes things simpler and more predictable. This does
> not fix all 'ubifs_rcvry_gc_commit()' issues, but make it fail much much less
> often. I do not know the other reasons why it fails so far, though.

Actually I cannot reproduce 'ubifs_rcvry_gc_commit()' failures with this
patch so far.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
