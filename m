Received: from mx1.mail.ru ([194.67.23.121])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CGHBO-0004dZ-GN
	for linux-mtd@lists.infradead.org; Sat, 09 Oct 2004 09:23:18 -0400
Message-ID: <4167E618.6030503@mail.ru>
Date: Sat, 09 Oct 2004 17:22:32 +0400
From: "Artem B. Bityuckiy" <dedekind@mail.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <416122A1.4060302@oktetlabs.ru>		<1096885344.30942.559.camel@hades.cambridge.redhat.com>		<416127B7.3070505@yandex.ru>		<1096893242.22034.5.camel@weaponx.rchland.ibm.com>		<41614B2F.8060901@yandex.ru>		<1096895892.30942.614.camel@hades.cambridge.redhat.com>		<41615BA7.60801@yandex.ru>		<1096899817.30942.618.camel@hades.cambridge.redhat.com>		<4162AABC.9060809@yandex.ru>		<1096994744.30942.905.camel@hades.cambridge.redhat.com>	<1096996838.24013.3.camel@weaponx.rchland.ibm.com>
	<4167CF42.3030506@yandex.ru>
In-Reply-To: <4167CF42.3030506@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Hello Guys.
> 
> Unfortunately, I hit on very painful trouble while trying to 
> design/implement checkpoints (ICP) ...
> 
> Obviously, ICP must contain all information, which is required to build 
> the inode cache. These are: offset, size and *version*. The problem is 
> in version.
> 
> At first I thought that in order to create ICP for some regfile inode, 
> we just need to be sure that the inode cache for this regfile exists. 
> But! I've overseen the fact that *there is no versions in the inode 
> cache* :-(
> 
> The inode cache (struct jffs2_inode_info) contains fragtree which has 
> struct jffs2_full_dnode objects. But these objects have no version field...
> 
> So, I see two ways out:
> 
> 1. Add the version field to the struct jffs2_full_dnode objects.
> This also means that the struct jffs2_tmp_dnode_info structure won't be 
> needed anymore.
> 
> The advantage of such approach is that the JFFS2 will be more simple 
> since one data structure will be removed. I like the KISS principle.
Ok, guys, sorry, I've hurried saying that the struct 
jffs2_tmp_dnode_info won't be needed... It is needed to construct lists 
of struct jffs2_full_dnode objects...

Anyway, my problem is still actual.

> 
> The drawback is that the inode cache will eat more memory. But this 
> isn't in-core object, just cache, so I don't think this is a big 
> disadvantage.
> 
> 2. Don't use the inode cache at all. This is bad because in order to 
> build the inode cache we'll need to read *all* the node headers, even if 
> there is existing inode cache.
> 
> I believe this approach is bad and too heavyweight. Moreover, just 
> imagine the situation when the GC has fount an ICP ant wants to 
> determine if it valid or obsolete. Obsolete means that (1) there is 
> newer ICP with higher version (simple case) or (2) all (or most) the 
> nodes which are described by the ICP aren't valid anymore (complicated 
> case). The second case means that we must read the ICPs lowest_version 
> and highest_version and count how many valid nodes with versions within 
> this interval exist. But we have NO versions even if the inode cache is 
> present. I don't think it is a good idea if the GC will head all the 
> node's headers...
> 
> What do you guys think? Any advices/ideas?
> 
> Thanks.
> 

-- 
Best Regards
Artem B. Bityckiy
