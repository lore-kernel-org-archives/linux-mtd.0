Received: from e5.ny.us.ibm.com ([32.97.182.105])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CETel-00084o-TA
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 10:17:41 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <416158D4.4050903@yandex.ru>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<4161379C.3070109@oktetlabs.ru>
	<1096893405.22034.9.camel@weaponx.rchland.ibm.com>
	<41614F6B.6050802@yandex.ru>
	<1096897195.22034.23.camel@weaponx.rchland.ibm.com>
	<4161568D.3060605@oktetlabs.ru>  <416158D4.4050903@yandex.ru>
Content-Type: text/plain
Message-Id: <1096899449.22034.28.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 09:17:35 -0500
Content-Transfer-Encoding: 7bit
Cc: dedekind@oktetlabs.ru, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 09:06, Artem B. Bityuckiy wrote:
> Sorry:
> > But I believe the NOR ICPs shouldn't be implemented together with NAND 
> > ICPs since NOR ICPs are much simpler. For example, they need much simpler 
> > data structures, algorithms, etc. I don't think it is a good idea to have 
> > hunderds of #ifdefs ... It's better to implement NOR ICPs as distinct thing...
>  > Don't you think so?
> 

Ok, good point.  #ifdefs are evil :).  But maybe the functions to access
them could be commonly named with different implementations depending on
the config options.  I'm thinking along the lines of how the wbuf stuff
is handled for NOR in os-linux.h.

Or maybe that doesn't make sense.  I think I should just wait and see
what you come up with :).

josh
