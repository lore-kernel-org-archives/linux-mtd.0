Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMgn-0000Su-KR
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:11:34 +0000
Received: by ewy3 with SMTP id 3so1123189ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 08:11:32 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: share the next_log_lnum helper
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1304694805-32335-1-git-send-email-dedekind1@gmail.com>
References: <1304694805-32335-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 18:08:01 +0300
Message-ID: <1304694481.7222.69.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 18:13 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> We'll need to use the 'next_log_lnum()' helper function from log.c in the fixup
> code, so let's move it to misc.h. IOW, this is a preparation to the following
> free space fixup changes.
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Matthew,

this is an additional preparation patch, I've pushed it to the
ubifs-2.6.git tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
