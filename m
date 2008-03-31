Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgLr6-0007Zz-SL
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 15:23:29 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1594829wff.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Mar 2008 08:23:27 -0700 (PDT)
Message-ID: <679044850803310823x10ac1f9dg7de6ed531c7d01b6@mail.gmail.com>
Date: Mon, 31 Mar 2008 19:23:27 +0400
From: "Damir Shayhutdinov" <lost404@gmail.com>
To: "Martin Creutziger" <martin.creutziger@barco.com>
Subject: Re: JFFS2: Kernel 2.6.24.2 Ooops during excessive write test
In-Reply-To: <1206973072.6190.16.camel@KARCLT0275>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1206973072.6190.16.camel@KARCLT0275>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

2008/3/31, Martin Creutziger wrote:
>  I did some searching in the archive already and did not find anything,
>  so I just post it myself in the hope that somebody can help me.
>
>  I am doing some excessive write tests on a PPC405EP running kernel
>  2.6.24.2 at the moment. At irregular intervals, the "space accounting
>  superblock info" gets "screwed" and I'd like to know why this happens
>  and if it is fixable. And if not, that information might help me to
>  decide whether or not this affects the planned application.
>
>  Thanks for the help,

Can you test this patch with your system?
http://lists.infradead.org/pipermail/linux-mtd/2007-November/019866.html
