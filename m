Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKitN-0002mc-BZ
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 15:46:34 -0400
Message-ID: <417812F3.9070508@inf.u-szeged.hu>
Date: Thu, 21 Oct 2004 21:50:11 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <41767593.9030004@inf.u-szeged.hu> <41775737.9080203@yandex.ru>
	<41775D17.9050508@inf.u-szeged.hu> <41776231.3060803@yandex.ru>
In-Reply-To: <41776231.3060803@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> Unfortunately, you can not mark entries as obsoleted in your summary 
> node in case of NAND.
> 
> If you write your summary only for *full* blocks, you will not need to 
> mark entries obsoleted, even if you have NOR flash (but you can on NOR). 
> The partially filled blocks must not have the summary node (you can 
> introduce special marker and write it to OOB of the last page of 
> NAND/last word of sector on NOR which tells if there is the summary node 
> present).

Really, you are right.

So we only have to solve this problem on NOR. I think the easiest 
solution is to set jffs2_can_mark_obsolete() to false if the summary 
support is enabled.

Bye,
Ferenc
