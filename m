Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl6fZ-0000JK-Mo
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:03:52 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060530155001.GA26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 30 May 2006 20:01:33 +0400
Message-Id: <1149004893.32620.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-30 at 17:50 +0200, Jörn Engel wrote:
> Until recently, we had four different variants of jffs2 wbuf code,
> depending on the flash type.  I fail to see the difference between
> those four and have already merged two of them.  Unless I am missing
> something important, the other three can also be combined into one.
> 
> But doing so would result in something like
> 	if ((mtd->type == MTD_NAND) || (mtd->type == MTD_SIBLEY) ||
> 			(mtd->type == MTD_ECCNOR) ||
> 			(mtd->type == MTD_DATAFLASH))
> 
> Or, more realistically, in something like the recent situation, where
> each one of those cases had its own copy of special code because
> people don't realize that their type is no different from another
> long-merged type.  Note that Nico didn't notice and copied the ECC_NOR
> code almost verbatim.  Considering that he is a solid developer
> otherwise, what would an average or below-average hacker come up with?

I'm absolutely against this trend. You'll soon make all flashes of
MTD_GENERIC_TYPE, then you'll remove mtd->type altogether.

We debated about this a lot. And you still didn't explain why I have no
right to know the  flash type.

Please, introduce your capabilities stuff, but please, stop removing
mtd->type implicitly or explicitly. 

AFAICS, what you're doing now is you're introducing reasonable
"capabilities" stuff, and slowly removing the mtd->type stuff. Please,
do one thing.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
