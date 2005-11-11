Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EaZKg-0002jm-Jc
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2005 08:52:49 -0500
Message-ID: <4374A209.8070403@yandex.ru>
Date: Fri, 11 Nov 2005 16:52:09 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Pierre.Ricadat@UTBM.fr" <Pierre.Ricadat@utbm.fr>
References: <1131701962.437466ca80ccc@webmail2.utbm.fr>
In-Reply-To: <1131701962.437466ca80ccc@webmail2.utbm.fr>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [JFFS2]remove totlen from jffs2_raw_node_ref
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pierre.Ricadat@UTBM.fr wrote:
> Hi'
> 
> I'm trying to remove totlen from jffs2_raw_node_ref structure.
> 
> Could you confirm (or not) the following changes are needed? I understood that
> from http://lists.infradead.org/pipermail/linux-mtd/2003-October/008689.html
> 
> - create a jffs2_raw_node_ref structure even for the dirty nodes (in scan.c :
> case JFFS2_NODETYPE_CLEANMARKER, line 632)
> 
> - create a jffs2_raw_node_ref for the obsolete nodes we add to wasted (in
> scan.c, line 729)
> 
> - then modify the calls to totlen in the other files and use
> ref_totlen()instead.
Hi, I implemented this once and AFAIR, yes, it was enough.


-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
