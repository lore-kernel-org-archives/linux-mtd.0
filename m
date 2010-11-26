Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0NF-00010a-BY
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:38:12 +0000
Received: by fxm16 with SMTP id 16so1070859fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 07:38:01 -0800 (PST)
Subject: Re: [PATCH] mtd/fsmc.h: including linux/io.h for definition of readl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viresh Kumar <viresh.kumar@st.com>
In-Reply-To: <ae7281ab5364fe0c2b1a7375d5d53ddfc12172d6.1289194908.git.viresh.kumar@st.com>
References: <ae7281ab5364fe0c2b1a7375d5d53ddfc12172d6.1289194908.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:37:28 +0200
Message-ID: <1290785848.2552.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-11-08 at 11:17 +0530, Viresh Kumar wrote:
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> ---
>  include/linux/mtd/fsmc.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
