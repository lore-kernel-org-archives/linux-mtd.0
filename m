Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMRgZ-0008Qz-P9
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 09:48:29 -0400
Message-ID: <417E5694.20202@inf.u-szeged.hu>
Date: Tue, 26 Oct 2004 15:52:20 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: dedekind@oktetlabs.ru
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>	<41781683.3020602@inf.u-szeged.hu>
	<4179009D.8010409@oktetlabs.ru>	<417CC91D.6060002@inf.u-szeged.hu>
	<417CDBDD.1010004@oktetlabs.ru> <417D1C0C.7080709@inf.u-szeged.hu>
	<417E1FFF.7030902@oktetlabs.ru> <417E2518.4010007@inf.u-szeged.hu>
	<417E2F8E.7050502@oktetlabs.ru>
In-Reply-To: <417E2F8E.7050502@oktetlabs.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	jffs-dev@axis.com
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

> Also, please, take into account that there may be checkpoint nodes (I'm 
> implementing this). So, I think you need to have a generic mechanism to 
> add new node types to your summary.
 >
> Also, I think it is good to have a generic mechanism to just refer some 
> nodes from summaries (for example, direntries with long names or 
> something else).

Yes, it will be easy to extend.

We also need a this general support - because we will introduce a new 
node type, too, becauseof the model file support, which will start to 
commit when David finishes his patch for Linus.

Bye,
Ferenc
