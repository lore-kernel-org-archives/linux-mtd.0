Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bzUw-0004fI-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 08:10:50 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.0-24 #47347)
 id <0GIT00B01IVVC3@asu.edu> for linux-mtd@lists.infradead.org; Wed,
 29 Aug 2001 00:16:44 -0700 (MST)
Date: Wed, 29 Aug 2001 00:17:08 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly	slow	:(
In-reply-to: <3B8C86BD.5C4FBCF9@dgt-lab.com.pl>
To: Wojciech Kromer <krom@dgt-lab.com.pl>
Cc: mtd <linux-mtd@lists.infradead.org>
Message-id: <999069428.31681.12.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ>
 <3B8C86BD.5C4FBCF9@dgt-lab.com.pl>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 29 Aug 2001 08:07:57 +0200, Wojciech Kromer wrote:
> 
> 
> >
> > It will take longer than a ramdisk because of the way jffs2 works, but
> > it looks like you might not be setting your flash timings
> 
> Do You mean 'wait wtates' on MPC chip-select configuration?
> Or trere are some time settings in MTD

I don't know what an "MDC" is, mut whatever changes your bus timings
